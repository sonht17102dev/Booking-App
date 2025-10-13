package com.sonht.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.sonht.model.User;


@WebServlet("/admin/customer")
public class CustomerController extends BaseController {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String command = request.getParameter("command");
			if (command == null) {
				command = "LIST";
			}
			switch (command) {
				case "LIST" -> listUsers(request, response);
				default -> loadUser(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// read the "command" parameter
			String command = request.getParameter("command");
			// if the command is missing, then default to listing users
			if (command == null) {
				command = "LIST";
			}
			// route to the appropriate method
			switch (command) {
				case "ADD" -> addUser(request, response, command);
				case "UPDATE" -> updateUser(request, response, command);
				case "LOCK" -> lockUser(request, response);
				case "OPEN" -> openUser(request, response);
				case "DELETE" -> deleteUser(request, response);
				default -> listUsers(request, response);
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}
	
	private void lockUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// get id from form data modal lock
		String id = request.getParameter("userId");
		if (id != null) {
			getUserDAO().lockUser(id); 
			// send message to customer page
			request.setAttribute("messagesSuccess", "LOCK");
			// return to customer page
			listUsers(request, response); // return customer page
		} else {
			// send message to customer page
			request.setAttribute("messagesError", "fail");
			// return to customer page
			listUsers(request, response); // return customer page
		}
	}
	
	private void openUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// get id from form data modal open
		String id = request.getParameter("userId");
		
		if (id != null) {
			getUserDAO().openUser(id); 
			// send message to customer page
			request.setAttribute("messagesSuccess", "OPEN");
			// return to customer page
			listUsers(request, response); // return customer page
		} else {
			// send message to customer page
			request.setAttribute("messagesError", "fail");
			// return to customer page
			listUsers(request, response); // return customer page
		}
		
	}

	
	private void updateUser(HttpServletRequest request, HttpServletResponse response, String command) throws Exception {
		// read user info from form data and then create a new user object
		int id =Integer.parseInt(request.getParameter("userId"));
		String username = request.getParameter("usernameUp");
		String fullname = request.getParameter("fullnameUp");
		String email = request.getParameter("emailUp");
		String phone = request.getParameter("phoneNumberUp");
		String address = request.getParameter("addressUp");
		int role = Integer.parseInt(request.getParameter("roleUp"));
		User user = new User(id, username,fullname,email,phone,address,role);
		//System.out.println(user);
		User existUser = getUserDAO().getUserById(request.getParameter("userId"));
		List<String> messageErrors = validateUser(user, command);
		// check if admin change email and username 
		if (!email.equals(existUser.getEmail()) || !username.equals(existUser.getUsername())) {
			messageErrors.add("Cannot change email or username of this user!");
		}
		
		if (messageErrors.size() != 0) {
			request.setAttribute("messagesError", messageErrors); // send message fail to jsp
			listUsers(request, response); // return customer page

		} else {
			getUserDAO().updateUser(user); // update User into database
			request.setAttribute("messagesSuccess", "UPDATE"); // send message success to jsp
			listUsers(request, response); // return customer page
		}
	}

	private void addUser(HttpServletRequest request, HttpServletResponse response, String command) throws Exception {
		// get data and create a User
		User user = new User(request.getParameter("usernameAdd"), request.getParameter("passwordAdd"), request.getParameter("fullnameAdd"),
				request.getParameter("emailAdd"), request.getParameter("phoneNumberAdd"), request.getParameter("addressAdd"), "active",
				Integer.parseInt(request.getParameter("roleAdd")));
		List<String> messageErrors = validateUser(user, command);
		
		if (messageErrors.size() != 0) {
			request.setAttribute("messagesError", messageErrors); // send message fail to jsp
			listUsers(request, response); // return customer page

		} else {
			getUserDAO().addUser(user); // add new User into database
			request.setAttribute("messagesSuccess", "ADD"); // send message success to jsp
			listUsers(request, response); // return customer page
		}
	}

	private void listUsers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<User> listUsers = getUserDAO().getAllUsers();
		request.setAttribute("list_users", listUsers);
		request.getRequestDispatcher("/views/admin/pages/customer/manageCustomer.jsp").forward(request, response);
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// get id from form data modal lock
		String id = request.getParameter("userId");
		if (id != null) {
			getUserDAO().deleteUser(id); 
			// send message to customer page
			request.setAttribute("messagesSuccess", "DELETE");
			// return to customer page
			listUsers(request, response); // return customer page
		} else {
			// send message to customer page
			request.setAttribute("messagesError", "fail");
			// return to customer page
			listUsers(request, response); // return customer page
		}
	}

	private void loadUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		// read user id from form data
		String userId = request.getParameter("userId");
		// get user from db
		User userFromDB = getUserDAO().getUserById(userId);
		// create JSON string convert object to JSON
		String json = new Gson().toJson(userFromDB);
		// return JSON data
		response.getWriter().write(json);

	}

	
}