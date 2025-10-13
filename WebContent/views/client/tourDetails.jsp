<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>

<%@ include file="/views/client/layouts/header.jsp"%>
<!-- Form search start -->
<div class="hero-wrap js-fullheight"
	style="background-image: url('<c:url value="/views/client/images/bg_2.jpg"/>');">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
			data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate"
				data-scrollax=" properties: { translateY: '70%' }">
				<h1 class="mb-4 text-center"
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
					<strong>${tour.name} <br></strong>
				</h1>
			</div>
		</div>
	</div>
</div>
<!-- Form search end -->
<section>
	<div class="container">
		<div class="w-75 my-4">
			<img style="width: 100%;"
				src='<c:url value="/resources/images/${tour.image}"/>'
				alt="${tour.name}">
		</div>
		<div class="content">
			<p>
				<span>from ${tour.startDate} to ${tour.duetime}</span>
			</p>
			<div class="d-flex">
				<div class="one">
					<h3>
						<a href="#">${tour.name}</a>
					</h3>
					<h3 class="price">$${tour.price}</h3>
					<p class="rate">
						<span><i class="icon-map-o"></i> ${tour.address}</span> <i
							class="icon-star"></i> <i class="icon-star"></i> <i
							class="icon-star"></i> <i class="icon-star"></i> <i
							class="icon-star-o"></i> <span>8 Rating</span>
					</p>
				</div>
			</div>
			<p>${tour.description}</p>
		</div>
		<div>
			<c:if test="${sessionScope.messagesError != null}">
				<c:forEach var="error" items="${messagesError}">
					<p class="text-danger ">${error}</p>
				</c:forEach>
			</c:if>
		</div>
		<form action="${pageContext.servletContext.contextPath}/booking" class="w-100" method="POST">
			<input type="hidden" value="${tour.id}" name="tourId">
			<input type="hidden" value="${sessionScope.userLogin.id}" name="userId">
			<div class="row">
				<div class="col-md-6 pr-md-5">
					<div class="form-group">
						<label for="adults">Quantity Adults (${tour.price}$ / people)</label>
						<input type="text" class="form-control" name="adults" placeholder="Quantity Adults">
					</div>
				</div>
				<div class="col-md-6 pr-md-5">
					<div class="form-group">
						<label for="children">Quantity Children (${tour.price}$ / people)</label>
						<input type="text" class="form-control"  name="children" placeholder="Quantity Child">
					</div>
				</div>
				<div class="col-md-12 pr-md-5 d-flex justify-content-center w-100">
					<div class="form-group">
						<input type="submit" value="Booking" 
							class="btn btn-primary py-3 px-5">
					</div>
				</div>
			</div>
		</form>
	</div>
</section>
<section class="ftco-section bg-light">
	<div class="container">
		<div class="row justify-content-start mb-5 pb-3">
			<div class="col-md-7 heading-section ftco-animate">
				<h2 class="mb-4">
					<strong>Related</strong> Tours
				</h2>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<c:forEach var="tour" items="${list_tours}">
				<div class="col-sm col-md-6 col-lg-4 ftco-animate">
					<div class="destination">
						<a href="#"
							class="img img-2 d-flex justify-content-center align-items-center"
							style='background-image: url("<c:url value="/resources/images/${tour.image}" />") '>
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<div class="d-flex">
								<div class="one">
									<h3>
										<a href="#">${tour.name}</a>
									</h3>
									<p class="rate">
										<i class="icon-star"></i> <i class="icon-star"></i> <i
											class="icon-star"></i> <i class="icon-star"></i> <i
											class="icon-star-o"></i> <span>8 Rating</span>
									</p>
								</div>
								<div class="two">
									<span class="price">$${tour.price}</span>
								</div>
							</div>
							<p class="days">
								<span>from ${tour.startDate} to ${tour.duetime}</span>
							</p>
							<hr>
							<p class="bottom-area d-flex">
								<span><i class="icon-map-o"></i> ${tour.address}</span> <span
									class="ml-auto"><a
									href="${pageContext.servletContext.contextPath}/tour?id=${tour.id}">Discover</a></span>
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>


<!-- Footer start -->
<%@ include file="/views/client/layouts/footer.jsp"%>
<!-- Footer end -->
