<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
      <div class="sb-sidenav-menu">
          <div class="nav">

              <a class="nav-link" href="${pageContext.servletContext.contextPath}/admin/tour">
                  <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                  Bảng điều khiển
              </a>
              <a class="nav-link"  href="${pageContext.servletContext.contextPath}/admin/tour">
                  <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                  Tour Management
              </a>
              <a class="nav-link"  href="${pageContext.servletContext.contextPath}/admin/post">
                  <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                  News Management
              </a>
              <a class="nav-link" href="${pageContext.servletContext.contextPath}/admin/customer">
                  <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                  Customer Management
              </a>
              <a class="nav-link" href="${pageContext.servletContext.contextPath}/admin/booking">
                  <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                  Booking Management
              </a>
              <%-- <a class="nav-link" href="${pageContext.servletContext.contextPath}/admin/comment">
                  <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                  Comment Management
              </a> --%>
          </div>
      </div>
  </nav>