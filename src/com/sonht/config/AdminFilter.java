package com.sonht.config;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter("/admin/*")
public class AdminFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;
	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        // Giả sử role được lưu trong session với key "role"
        String role = (session != null) ? (String) session.getAttribute("role") : null;

        if (role == null || !role.equals("admin")) {
            // Nếu user không có role là admin, chuyển hướng về trang login
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login");
        } else {
            // Nếu user có role là admin, cho phép tiếp tục truy cập
            chain.doFilter(request, response);
        }
	}

	public void destroy() {
		// TODO Auto-generated method stub
	}

}
