package com.sonht.controller.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonht.controller.admin.BaseController;
import com.sonht.model.User;

/**
 * Servlet implementation class SignUpController
 */
@WebServlet("/signup")
public class SignUpController extends BaseController {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("action", "signup");
		request.getSession().removeAttribute("message");
		request.getRequestDispatcher("/views/admin/pages/authForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		String repass = request.getParameter("repassword");
		String authenPath = "/views/admin/pages/authForm.jsp";
		// create list String to send error messages to client
		List<String> messagesError = validateSignUp(email, fullname, username, pass, repass);
		if (!messagesError.isEmpty()) {
			request.setAttribute("action", "signup");
			request.setAttribute("messages", messagesError);
			request.getRequestDispatcher(authenPath).forward(request, response);
		} else {
			User user = new User(username, pass, fullname, email, null, null, "active", 1);
			try {
				// if user email is exist
				if (getUserDAO().checkEmailExist(email) != null) {
					request.removeAttribute("messages");
					request.setAttribute("message", "User mail is exist! Try again another email address!");
					request.setAttribute("action", "signup");
					request.getRequestDispatcher(authenPath).forward(request, response);
				} else if (getUserDAO().checkUsernameExist(username) != null) {
					request.removeAttribute("messages");
					request.setAttribute("message", "Username is exist! Try again another username!");
					request.setAttribute("action", "signup");
					request.getRequestDispatcher(authenPath).forward(request, response);
				} else {
					// if pass is not the same as re-password
					if (!pass.equals(repass)) {
						request.setAttribute("message", "Re-Password must be the same as password! Try again!");
						request.setAttribute("action", "signup");
						request.getRequestDispatcher(authenPath).forward(request, response);
					} else {
						// register new user
						getUserDAO().addUser(user);
						// redirect to login page
						request.setAttribute("message", "Sign Up Success");
						request.setAttribute("action", "login"); 
						request.getRequestDispatcher(authenPath).forward(request, response); 
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	private List<String> validateSignUp(String email, String fullname, String username, String pass, String repass) {
		List<String> messagesError = new ArrayList<String>();
		
		if (!isValidEmail(email)) {
			messagesError.add("Please type your email or type invalid email");
		}
		if (!isValidInput(fullname)) {
	        messagesError.add("Please type your full name");
	    }
	    if (!isValidInput(username)) {
	        messagesError.add("Please type your username");
	    }
	    if (!isValidInput(pass)) {
	        messagesError.add("Please type your password");
	    }
	    if (!isValidInput(repass)) {
	        messagesError.add("Please type your Re-Password");
	    }
		
		
		return messagesError;
	}
}
