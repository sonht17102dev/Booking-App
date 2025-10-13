<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Booking Travel</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="<c:url value="/views/admin/css/bootstrap.min.css"/>">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Alex+Brush" rel="stylesheet">

    <link rel="stylesheet" href="<c:url value="/views/client/css/open-iconic-bootstrap.min.css"/>">
    <link rel="stylesheet" href="<c:url value="/views/client/css/animate.css"/>">
    
    <link rel="stylesheet" href="<c:url value="/views/client/css/owl.carousel.min.css" />">
    <link rel="stylesheet" href="<c:url value="/views/client/css/owl.theme.default.min.css" />">
    <link rel="stylesheet" href="<c:url value="/views/client/css/magnific-popup.css" />">

    <link rel="stylesheet" href="<c:url value="/views/client/css/aos.css" />"> 

    <link rel="stylesheet" href="<c:url value="/views/client/css/ionicons.min.css" />">

    <link rel="stylesheet" href="<c:url value="/views/client/css/bootstrap-datepicker.css"/>">
    <link rel="stylesheet" href="<c:url value="/views/client/css/jquery.timepicker.css"/>">

    
    <link rel="stylesheet" href="<c:url value="/views/client/css/flaticon.css"/>">
    <link rel="stylesheet" href="<c:url value="/views/client/css/icomoon.css"/>">
    <link rel="stylesheet" href="<c:url value="/views/client/css/style.css"/>">
    <link rel="stylesheet" href="<c:url value="/views/client/css/rate.css"/>">
    <style>
 
    </style>
  </head>
  <body>
    
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.servletContext.contextPath}">BookingTravel</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item"><a href="${pageContext.servletContext.contextPath}" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="${pageContext.servletContext.contextPath}/news" class="nav-link">News</a></li>
          <c:if test='${userLogin == null}'>
	          <li class="nav-item "><a href="${pageContext.servletContext.contextPath}/login" class="nav-link">Log In</a></li>
	      </c:if>
	       <c:if test='${userLogin != null}'>
	          <li class="nav-item "><a href="${pageContext.servletContext.contextPath}/booking" class="nav-link">Booking</a></li>
	          <li class="nav-item "><a href="${pageContext.servletContext.contextPath}/logout" class="nav-link">Log Out</a></li>
	      </c:if>
		 <li class="nav-item "><a href="${pageContext.servletContext.contextPath}/signup" class="nav-link">Sign Up</a></li>
        </ul>
      </div>
    </div>
  
  </nav>
    <!-- END nav -->