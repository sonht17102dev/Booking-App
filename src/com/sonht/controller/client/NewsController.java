package com.sonht.controller.client;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonht.controller.admin.BaseController;
import com.sonht.dto.CommentDTO;
import com.sonht.model.Comment;
import com.sonht.model.Post;
import com.sonht.model.Tour;

/**
 * Servlet implementation class NewsController
 */
@WebServlet("/news")
public class NewsController extends BaseController {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String command = request.getParameter("command");
		if (command == null) {
			command = "LIST";
		}
		try {
			switch (command) {
			case "DETAILS" -> detailNews(request, response);
			default -> listNews(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void listNews(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<Post> listPosts = getPostDAO().getAllPosts();
		request.setAttribute("list_posts", listPosts);
		request.getRequestDispatcher("/views/client/pages/news.jsp").forward(request, response);
	}

	private void detailNews(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		Post post = getPostDAO().getPostById(id);
		List<CommentDTO> comments = getCommentDAO().getCommentOfPost(id);

		request.setAttribute("post", post);
		request.setAttribute("list_comments", comments);
		request.getRequestDispatcher("/views/client/pages/detailNews.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String postId = request.getParameter("postId");
		String message = request.getParameter("comment");
		String rate = request.getParameter("rating");
		LocalDate currentDate = LocalDate.now();
		System.out.println(postId);
		if (rate != null && isValidInput(message)) {
			Comment comment = new Comment(Integer.parseInt(userId), Integer.parseInt(postId), currentDate.toString(),
					message, Integer.parseInt(rate));
			try {
				getCommentDAO().createComment(comment);
				response.sendRedirect(request.getContextPath() + "/news?id=" + postId + "&command=DETAILS");

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			response.sendRedirect(request.getContextPath() + "/news?id=" + postId + "&command=DETAILS");
		}
	}
}
