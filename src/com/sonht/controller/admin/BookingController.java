package com.sonht.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonht.dto.BookingAdminDTO;

/**
 * Servlet implementation class BookingController
 */
@WebServlet("/admin/booking")
public class BookingController extends BaseController {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String command = request.getParameter("command");
			if (command == null) {
				command = "LIST";
			}
			switch (command) {
			case "LOAD" -> loadBooking(request, response);
			default -> listBookings(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	private Object loadBooking(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}

	private void listBookings(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		List<BookingAdminDTO> listBookings = getBookingDAO().getAllBookings();
		request.setAttribute("list_bookings", listBookings);
		request.getRequestDispatcher("/views/admin/pages/booking/manageBooking.jsp").forward(request, response);
	}

}
