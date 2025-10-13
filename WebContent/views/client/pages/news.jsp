<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>

<%@ include file="/views/client/layouts/header.jsp"%>
<!-- Form search start -->
<div class="hero-wrap js-fullheight"
	style="background-image: url('<c:url value="/views/client/images/bg_4.jpg"/>');">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
			data-scrollax-parent="true">
			<div class="col-md-9 ftco-animate"
				data-scrollax=" properties: { translateY: '70%' }">
				<h1 class="mb-4 text-center"
					data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
					<strong>${post.name} <br></strong>
				</h1>
			</div>
		</div>
	</div>
</div>
<!-- Form search end -->


<section class="ftco-section bg-light">
	<div class="container">
		<div class="row justify-content-start mb-5 pb-3">
			<div class="col-md-7 heading-section ftco-animate">
				<h2 class="mb-4">
					<strong>Related</strong> Posts
				</h2>
			</div>
		</div>
	</div>
	<div class="container-fluid">
		<div class="row">
			<c:forEach var="post" items="${list_posts}">
				<div class="col-sm col-md-6 col-lg-4 ftco-animate">
					<div class="destination">
						<a href="#"
							class="img img-2 d-flex justify-content-center align-items-center"
							style='background-image: url("<c:url value="/resources/images/${post.image}" />") '>
							<div class="icon d-flex justify-content-center align-items-center">
								<span class="icon-search2"></span>
							</div>
						</a>
						<div class="text p-3">
							<div class="d-flex">
								<div class="one">
									<h3>
										<a href="#">${post.name}</a>
									</h3>
								</div>
							</div>
							<p class="days">
								<span>from ${post.createdDate} to Admin</span>
							</p>
							<hr>
							<p class="bottom-area d-flex">
								<span><i class="icon-chat"></i> </span> <span
									class="ml-auto"><a
									href="${pageContext.servletContext.contextPath}/news?id=${post.id}&command=DETAILS">Discover</a></span>
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
