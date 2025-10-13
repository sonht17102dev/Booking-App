package com.sonht.controller.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonht.controller.admin.BaseController;
import com.sonht.model.Tour;

@WebServlet("/HomeController")
public class HomeController extends BaseController {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			List<Tour> listTours = getTourDAO().getAllTours();
			request.setAttribute("list_tours", listTours);
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


}
