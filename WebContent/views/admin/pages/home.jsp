<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>


<%@include file="/views/admin/layouts/header.jsp"%>
<%@include file="/views/admin/layouts/navbar.jsp"%>

	<%-- User sidebar jsp page --%>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@include file="/views/admin/layouts/sidebar.jsp"%>
		</div>

		<div id="layoutSidenav_content">
			<main>
				<h1>Welcome to Administrator ${adminLogin.username} Tour Page</h1>
			</main>
			<footer class="py-4 bg-light mt-auto"> </footer>
		</div>
	</div>

	<%@include file="/views/admin/layouts/footer.jsp"%>