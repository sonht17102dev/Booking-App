package com.sonht.controller.admin;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;
import com.sonht.model.Post;
import com.sonht.model.Tour;

/**
 * Servlet implementation class PostController
 */
@WebServlet("/admin/post")
@MultipartConfig
public class PostController extends BaseController {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String command = request.getParameter("commandPost");
			if (command == null) {
				command = "LIST";
			}
			switch (command) {
				case "LOAD" -> loadPost(request, response);
				default -> listPosts(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String command = request.getParameter("commandPost");
			if (command == null) {
				command = "LIST";
			}
			switch (command) {
				case "ADD" -> addPost(request, response);
				case "UPDATE" -> updatePost(request, response);
				case "DELETE" -> deletePost(request, response);
				default -> listPosts(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void listPosts(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		List<Post> listPosts = getPostDAO().getAllPosts();
		request.setAttribute("list_posts", listPosts);
		request.getRequestDispatcher("/views/admin/pages/post/managePost.jsp").forward(request, response);
	}

	private void loadPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// read post id from form data
		String postId = request.getParameter("postId");
		// get post from db
		Post postFromDB = getPostDAO().getPostById(postId);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		// create JSON string convert object to JSON
		String json = new Gson().toJson(postFromDB);
		// return JSON data
		response.getWriter().write(json);
	}
	public void deletePost(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, ServletException, IOException {
		String id = request.getParameter("postId");
		if (id != null) {
			getPostDAO().deletePost(id);
			// send message to post page
			request.setAttribute("messagesSuccess", "DELETE");
			// return to post page
			listPosts(request, response); // return post page
		} else {
			// send message to post page
			request.setAttribute("messagesError", "Delete fail");
			// return to customer page
			listPosts(request, response); // return post page
		}
	}

	public void updatePost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException, SQLException {
		int id = Integer.parseInt(request.getParameter("postId"));
		String postName = request.getParameter("postnameUp");
		String created = request.getParameter("createdDateUp");
		String content = request.getParameter("editorUp" + id);
		
		Post post = new Post(id, postName, content, created, "active");
		System.out.println(content);
		List<String> messageErrors = validatePost(post);

		Part filePart = request.getPart("fileUp"+ id);
		String fileName = null;
		if(filePart == null || filePart.getSize() == 0) {
			messageErrors.add("Please select a file to upload.");
		} else {
			fileName = getFileName(filePart);
			try (InputStream fileContent = filePart.getInputStream();) {
				File uploads = new File(getServletContext().getRealPath("/resources/images"));
				if (!uploads.exists()) {
					uploads.mkdir();
				}

				File file = new File(uploads, fileName);
				Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (messageErrors.size() != 0) {
			request.setAttribute("messagesError", messageErrors); // send message fail to jsp
			listPosts(request, response); // return post page
		} else {
			post.setImage(fileName);
			// send message to post page
			request.setAttribute("messagesSuccess", "UPDATE");
			getPostDAO().updatePost(post);
			listPosts(request, response);
		}
	}

	public void addPost(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
		String postName = request.getParameter("postnameAdd");
		String created = request.getParameter("createdDateAdd");
		String content = request.getParameter("editor");
		String photoName = request.getParameter("filename");
		
		Post post = new Post(postName, photoName, content, created, "active");
		
		List<String> messageErrors = validatePost(post);
		
		Part filePart = request.getPart("file");
		String fileName = null;
		if(filePart == null || filePart.getSize() == 0) {
			messageErrors.add("Please select a file to upload.");
		} else {
			fileName = getFileName(filePart);
			try (InputStream fileContent = filePart.getInputStream();) {
				File uploads = new File(getServletContext().getRealPath("/resources/images"));
				if (!uploads.exists()) {
					uploads.mkdir();
				}

				File file = new File(uploads, fileName);
				Files.copy(fileContent, file.toPath(), StandardCopyOption.REPLACE_EXISTING);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (messageErrors.size() != 0) {
			request.setAttribute("messagesError", messageErrors); // send message fail to jsp
			listPosts(request, response); // return customer page
		} else {
			post.setImage(fileName);
			// send message to tour page
			request.setAttribute("messagesSuccess", "ADD");
			getPostDAO().addPost(post);
			listPosts(request, response);
		}
	}

}
