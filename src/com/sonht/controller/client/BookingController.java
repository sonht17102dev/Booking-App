package com.sonht.controller.client;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonht.controller.admin.BaseController;
import com.sonht.dto.BookingDTO;
import com.sonht.model.Booking;
import com.sonht.model.User;

/**
 * Servlet implementation class BookingController
 */
@WebServlet("/booking")
public class BookingController extends BaseController {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User userLogin = (User) session.getAttribute("userLogin");
		int id = userLogin.getId();
		try {
			List<BookingDTO> listBookingsByUserId = getBookingDAO().getBookingsByUserId(id);
			request.setAttribute("listBookings", listBookingsByUserId);
			request.getRequestDispatcher("/views/client/booking.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String tourId = request.getParameter("tourId");
		String quantityAdults = request.getParameter("adults");
		String quantityChildren = request.getParameter("children");
		HttpSession session = request.getSession();
		List<String> errors = validateBooking(userId, tourId, quantityAdults, quantityChildren);
		if(errors.isEmpty()) {
			Booking booking = new Booking(Integer.parseInt(userId), Integer.parseInt(tourId), Integer.parseInt(quantityAdults),
					Integer.parseInt(quantityChildren), "2024-07-31", "active");
			try {
				getBookingDAO().addNewBooking(booking);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.setAttribute("message", "success");
			session.setMaxInactiveInterval(60);
			response.sendRedirect(request.getContextPath() + "/booking");
		} else {
			session.setAttribute("messagesError", errors);
			session.setMaxInactiveInterval(60);
			response.sendRedirect(request.getContextPath() + "/tour?id=" + tourId);
		}
		
	}

}
