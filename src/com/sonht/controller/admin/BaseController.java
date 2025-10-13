package com.sonht.controller.admin;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.Part;

import com.sonht.dao.BookingDAO;
import com.sonht.dao.CommentDAO;
import com.sonht.dao.PostDAO;
import com.sonht.dao.TourDAO;
import com.sonht.dao.UserDAO;
import com.sonht.model.Comment;
import com.sonht.model.Post;
import com.sonht.model.Tour;
import com.sonht.model.User;

/**
 * Servlet implementation class BaseController
 */
@WebServlet("/BaseController")
public class BaseController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
	protected static final String PHONE_REGEX = "^\\+?[0-9]{10,15}$";
	protected static final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	public UserDAO getUserDAO() {
		return new UserDAO();
	}

	public TourDAO getTourDAO() {
		return new TourDAO();
	}

	public BookingDAO getBookingDAO() {
		return new BookingDAO();
	}
	public PostDAO getPostDAO() {
		return new PostDAO();
	}
	public CommentDAO getCommentDAO() {
		return new CommentDAO();
	}
	
	public List<String> validatePost(Post post) {
		
		List<String> errors = new ArrayList<String>();
		
		if (!isValidInput(post.getName())) {
			errors.add("Title post is required!");
		}
		
		if (!isValidStartDate(post.getCreatedDate())) {
			errors.add("Post creation date is required or cannot be before the current date!");
		}
		if (!isValidInput(post.getDescription())) {
			errors.add("Description is required!");
		}
		
		return errors;
	}
	public List<String> validateBooking(String userId, String postId, String quantityAdults, String quantityChildren) {
		
		List<String> errors = new ArrayList<String>();
		
		if (!isValidInput(userId)) {
			errors.add("You should login before booking a tour!");
		}
		
		if (!isValidInput(postId)) {
			errors.add("Post id is required!");
		}
		if (!isValidInput(quantityAdults)) {
			errors.add("Quantity adults is required!");
		}
		if (!isValidInput(quantityChildren)) {
			errors.add("Quantity children is required!");
		}
		
		return errors;
	}
	public List<String> validateTour(Tour tour) {
		List<String> messagesError = new ArrayList<String>();
		List<String> errors = validateTripDates(tour.getStartDate(), tour.getDuetime());
		if (!errors.isEmpty()) {
			messagesError.addAll(errors);
		}
		if (!isValidInput(tour.getName())) {
			messagesError.add("Tour Name is required!");
		}
		if (tour.getPrice() == 0) {
			messagesError.add("Tour Price is required!");
		}

		if (!isValidInput(tour.getAddress())) {
			messagesError.add("Tour address is required!");
		}
		if (!isValidInput(tour.getDescription())) {
			messagesError.add("Description is required!");
		}
	

		return messagesError;
	}

	public List<String> validateComment(Comment com) {
		List<String> messagesError = new ArrayList<String>();
		
		if(com.getRate() != 0) {
			messagesError.add("Please choose your star to rate the post!");
		}
		
		return messagesError;
	}
	public List<String> validateTripDates(String startDateStr, String endDateStr) {
		List<String> results = new ArrayList<String>();
		
		if ((startDateStr == null || startDateStr.trim().isEmpty()) && (endDateStr == null || endDateStr.trim().isEmpty())) {
			results.add("Start date cannot be empty.");
			results.add("End date cannot be empty.");
			return results;
		}
		if (startDateStr == null || startDateStr.trim().isEmpty()) {
			results.add("Start date cannot be empty.");
			return results;
		}

		if (endDateStr == null || endDateStr.trim().isEmpty()) {
			results.add("End date cannot be empty.");
			return results;
		}

		LocalDate startDate;
		LocalDate endDate;
		LocalDate currentDate = LocalDate.now();

		try {
			startDate = LocalDate.parse(startDateStr, DATE_FORMATTER);
		} catch (DateTimeParseException e) {
			results.add("Invalid start date format. Please use yyyy-MM-dd.");
			return results;
		}

		try {
			endDate = LocalDate.parse(endDateStr, DATE_FORMATTER);
		} catch (DateTimeParseException e) {
			results.add("Invalid end date format. Please use yyyy-MM-dd.");
			return results;
		}

		if (startDate.isBefore(currentDate)) {
			results.add("Start date must be after the current date.");
			return results;
		}

		if (endDate.isBefore(startDate) || endDate.equals(startDate)) {
			results.add("End date must be after the start date.");
			return results;
		}

		return results;
	}
	
	public boolean isValidStartDate(String startDate) {
		if (startDate == null || startDate.trim().isEmpty()) {
			return false;
		}
		LocalDate startDateLocal;
		LocalDate currentDate = LocalDate.now();
		try {
			startDateLocal = LocalDate.parse(startDate, DATE_FORMATTER);
		} catch (DateTimeParseException e) {
			return false;
		}
		if (startDateLocal.isBefore(currentDate)) {
			return false;
		}
		
		
		return true;
	}
	public boolean isValidDueTime(String startDate, String duetime) {
		if (duetime == null || duetime.trim().isEmpty()) {
			return false;
		}
		LocalDate endDateLocal;
		LocalDate startDateLocal;
		try {
			startDateLocal = LocalDate.parse(startDate, DATE_FORMATTER);
		} catch (DateTimeParseException e) {
			return false;
		}
		try {
			endDateLocal = LocalDate.parse(duetime, DATE_FORMATTER);
		} catch (DateTimeParseException e) {
			return false;
		}
		if (endDateLocal.isBefore(startDateLocal) || endDateLocal.equals(startDateLocal)) {
			return false;
		}
		
		
		return true;
	}

	public List<String> validateUser(User user, String command) throws Exception {
		List<String> messagesError = new ArrayList<>();
		
		if (!isValidInput(user.getFullname())) {
			messagesError.add("Please type your full name");
		}
		if (command.equals("ADD") && !isValidEmail(user.getEmail())) {
			messagesError.add("Please type your email or type invalid email");
		}
		if (!isValidPhoneNumber(user.getPhoneNumber())) {
			messagesError.add("Please type your phone number or phone number must have 10 digits");
		}
		if (!isValidInput(user.getAddress())) {
			messagesError.add("Please type your address");
		}
		if (command.equals("ADD") && !isValidInput(user.getUsername())) {
			messagesError.add("Please type your username");
		}
		if (command.equals("ADD") && !isValidInput(user.getPassword())) {
			messagesError.add("Please type your password");
		}
		if (user.getRoleId() == -1) {
			messagesError.add("Please choose your role (Admin or User)");
		}

		return messagesError;
	}
	public boolean isValidInput(String input) {
		return input != null && !input.isEmpty();
	}

	public boolean isValidEmail(String email) {
		return email != null && !email.trim().isEmpty() && email.matches(EMAIL_REGEX);
	}

	public boolean isValidPhoneNumber(String phoneNumber) {
		return phoneNumber != null && !phoneNumber.trim().isEmpty() && phoneNumber.matches(PHONE_REGEX);
	}

	public String getFileName(Part part) {
		String contentDisposition = part.getHeader("content-disposition");
		for (String cd : contentDisposition.split(";")) {
			if (cd.trim().startsWith("filename")) {
				return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
			}
		}
		return null;
	}
}