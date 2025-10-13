<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>

<%@ include file="/views/client/layouts/header.jsp"%>
<!-- Form search start -->
<div class="hero-wrap js-fullheight"
	style="background-image: url('<c:url value="/views/client/images/bg_3.jpg"/>');">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
			data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate"
				data-scrollax=" properties: { translateY: '70%' }">
				<h1 class="mb-4 text-center"
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
					<strong>Booking <br></strong>
				</h1>
			</div>
		</div>
	</div>
</div>
<!-- Form search end -->
<main>
	<div class="container-fluid px-4">
       <h1 class="mt-4">Travel Booking List</h1>
       <c:if test="${sessionScope.message != null}">
        <h4 class="text-success">Congratulations on your successful tour booking!</h4>   
       </c:if>
        <table class="table">
            <thead class="table-lightgray">
	             <tr style="background-color: lightgray !important;">
				    <th>STT</th>
				    <th>Tour Photo</th>
				    <th>Tour Name</th>
				    <th>Number of adults</th>
				    <th>Number of kids</th>
				    <th>Booking date</th>
				    <th>Total (USD)</th>
				</tr>
			</thead>
			<tbody>
			
			<c:forEach var="booking" items="${listBookings}" varStatus="loop">
				<tr>
					<td>${loop.index + 1}</td>
				    <td style="width:200px">
				     <img style="width:100%;" 
				     	src="${pageContext.servletContext.contextPath}/resources/images/${booking.image}">
				    </td>
				    <td>${booking.tourName}</td>
				    <td>${booking.adultsQuantity }</td>
				    <td>${booking.childrenQuantity }</td>
				    <td>${booking.created_date }</td>
				    <td>${booking.getTotalPrice()}$</td>
				</tr>
				
			</c:forEach> 
	        </tbody>
       </table>
     </div>
       
</main>
<!-- Footer start -->
<%@ include file="/views/client/layouts/footer.jsp"%>
<!-- Footer end -->