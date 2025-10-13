package com.sonht.controller.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sonht.controller.admin.BaseController;
import com.sonht.model.Booking;
import com.sonht.model.Tour;

/**
 * Servlet implementation class TourController
 */
@WebServlet("/tour")
public class TourController extends BaseController {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		try {
			List<Tour> list = getTourDAO().getAllTours();
			Tour tour = getTourDAO().getTourById(id);
			request.setAttribute("tour", tour);
			request.setAttribute("list_tours", list);
			request.getRequestDispatcher("/views/client/tourDetails.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
