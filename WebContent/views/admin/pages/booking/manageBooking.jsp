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
            <div class="container-fluid px-4">
                <h1 class="mt-4">Travel Booking List</h1>
                <div class="card mb-4">
                    <div class="card-header">
					</div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
	                            <tr style="background-color: gray !important;">
	                                <th>Tour Name</th>
	                                <th>Number of adults</th>
	                                <th>Number of kids</th>
	                                <th>Customer name</th>
	                                <th>Total (USD)</th>
	                                <th>Booking date</th>
	                                <th>Action</th>
	                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="booking" items="${list_bookings}">
                                <tr>
                                    <td>${booking.tourName}</td>
                                    <td>${booking.adultsQuantity}</td>
                                    <td>${booking.childrenQuantity}</td>
                                    <td>${booking.customerName}</td>
                                    <td>${booking.price}</td>
                                    <td>${booking.createdDate}</td>
                                    <td>
	                                    <button type="button" class="btn btn-primary update-btn" data-bs-toggle="modal"
	                                        data-bs-target="#modalApprove" >Approve</button>
                                        <button type="button" class="btn btn-danger " data-bs-toggle="modal"
	                                        data-bs-target="#modalCancel" >Cancel</button>
                                    </td>
                                </tr>
	                           
                         	</c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
       	</main>
		<footer class="py-4 bg-light mt-auto"> </footer>
	</div>
</div>
<%@include file="/views/admin/layouts/footer.jsp"%>