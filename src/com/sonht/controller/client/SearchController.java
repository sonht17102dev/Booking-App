package com.sonht.controller.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sonht.controller.admin.BaseController;
import com.sonht.model.Tour;

/**
 * Servlet implementation class SearchController
 */
@WebServlet("/search")
public class SearchController extends BaseController {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword = request.getParameter("searchText");
		String action = request.getParameter("action");
		String date = request.getParameter("date");
		System.out.println(date);
		switch (action) {
			case "keyword" -> {
				if(keyword != null && !keyword.trim().isEmpty()) {
					try {
						List<Tour> tours = getTourDAO().searchByKeyWord(keyword);
						request.setAttribute("list_tours", tours);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					request.setAttribute("messagesError", "Input your keyword here to find your tour!");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			}
			case "searchDate" -> {
				if(isValidStartDate(date)) {
					try {
						List<Tour> tours = getTourDAO().searchByDate(date);
						request.setAttribute("list_tours", tours);
						request.getRequestDispatcher("index.jsp").forward(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				} else {
					request.setAttribute("messagesError", "Select your date here to find your tour!");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			}
		}
	}
}
