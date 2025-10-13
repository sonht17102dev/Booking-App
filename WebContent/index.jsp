<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>

<%@ include file="/views/client/layouts/header.jsp" %> 

   <!-- Form search start -->
    <div class="hero-wrap js-fullheight" style="background-image: url('<c:url value="/views/client/images/bg_1.jpg"/>');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-md-9 ftco-animate" data-scrollax=" properties: { translateY: '70%' }">
          	<c:if test="${userLogin != null || adminLogin != null}">
            	<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
            	<strong>Welcome back <br></strong> ${userLogin.username} ${adminLogin.username}
            	</h1>
          	</c:if>
          	<c:if test="${userLogin == null && adminLogin == null}">
            	<h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
            	<strong>Explore <br></strong> your amazing city</h1>
            </c:if>
            <p data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Find great places to stay, eat, shop, or visit from local experts</p>
            <div class="block-17 my-4">
              <form action="${pageContext.servletContext.contextPath}/search" method="post" class="d-block d-flex">
                <div class="fields d-block d-flex">
                  <div class="textfield-search one-third">
                  	<input type="text" class="form-control" placeholder="Ex: food, service, hotel" name="searchText" id="searchText">
                  </div>
                </div>
                <input type="hidden" name="action" value="keyword">
                <input type="submit" class="search-submit btn btn-primary" value="Search">  
              </form>
            </div>
            <p>Or start time</p>
            <div class="block-17 my-4">
              <form action="${pageContext.servletContext.contextPath}/search" method="post" class="d-block d-flex">
                <div class="fields d-block d-flex">
                  <div class="textfield-search one-third">
                  	<input type="date" class="form-control" name="date">
                  </div>
                </div>
                <input type="hidden" name="action" value="searchDate">
                <input type="submit" class="search-submit btn btn-primary" value="Search">  
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
	<!-- Form search end -->
    <section class="ftco-section services-section bg-light">
      <div class="container">
        <div class="row d-flex">
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-guarantee"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Best Price Guarantee</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-like"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Travellers Love Us</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>    
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-detective"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Best Travel Agent</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon"><span class="flaticon-support"></span></div></div>
              <div class="media-body p-2 mt-2">
                <h3 class="heading mb-3">Our Dedicated Support</h3>
                <p>A small river named Duden flows by their place and supplies.</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>
    <!-- carousel start -->
    <!-- 
    <section class="ftco-section ftco-destination">
    	<div class="container">
    		<div class="row justify-content-start mb-5 pb-3">
	          <div class="col-md-7 heading-section ftco-animate">
	          	<span class="subheading">Featured</span>
	            <h2 class="mb-4"><strong>Featured</strong> Destination</h2>
	          </div>
	        </div>
    		<div class="row">
    			<div class="col-md-12">
    				<div class="destination-slider owl-carousel ftco-animate">
    					<c:forEach var="index" begin="1" end="5">
    					<div class="item">
		    				<div class="destination">
		    					<a href="#" class="img d-flex justify-content-center align-items-center" 
		    					style="background-image: url('<c:url value="/views/client/images/destination-${index}.jpg"/>')" >
		    						<div class="icon d-flex justify-content-center align-items-center">
		    							<span class="icon-search2"></span>
		    						</div>
		    					</a>
		    					<div class="text p-3">
		    						<h3><a href="#">Paris, Italy</a></h3>
		    						<span class="listing">15 Listing</span>
		    					</div>
		    				</div>
	    				</div>
	    				</c:forEach>
    				</div>
    			</div>
    		</div>
    	</div>
    </section>
     -->
	<!-- carousel end -->
	
 	<!--  top tour start -->
    <section class="ftco-section bg-light">
    	<div class="container">
			<div class="row justify-content-start mb-5 pb-3">
	           <div class="col-md-7 heading-section ftco-animate">
	          	  <span class="subheading">Special Offers</span>
	              <h2 class="mb-4"><strong>Top</strong> Tour Packages</h2>
	           </div>
      		</div>    		
    	</div>
    	<div class="container-fluid">
    		<div class="row">
    		
    		<c:forEach var="tour" items="${list_tours}">
    			<div class="col-sm col-md-6 col-lg-4 ftco-animate">
    				<div class="destination">
    					<a href="#" class="img img-2 d-flex justify-content-center align-items-center" 
    					style='background-image: url("<c:url value="/resources/images/${tour.image}" />") '>
    						<div class="icon d-flex justify-content-center align-items-center">
    							<span class="icon-search2"></span>
    						</div>
    					</a>
    					<div class="text p-3">
    						<div class="d-flex">
    							<div class="one">
		    						<h3><a href="#">${tour.name}</a></h3>
		    						<p class="rate">
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star"></i>
		    							<i class="icon-star-o"></i>
		    							<span>8 Rating</span>
		    						</p>
	    						</div>
	    						<div class="two">
	    							<span class="price">$${tour.price}</span>
    							</div>
    						</div>
    						<%-- <p>${tour.description}</p> --%>
    						<p class="days"><span>from ${tour.startDate} to ${tour.duetime}</span></p>
    						<hr>
    						<p class="bottom-area d-flex">
    							<span><i class="icon-map-o"></i> ${tour.address}</span> 
    							<span class="ml-auto"><a href="${pageContext.servletContext.contextPath}/tour?id=${tour.id}">Discover</a></span>
    						</p>
    					</div>
    				</div>
    			</div>
    		</c:forEach>
    		
    		</div>
    	</div>
    </section>
 	<!--  top tour end -->
 
	
	<!-- Footer start -->   
	<%@ include file="/views/client/layouts/footer.jsp" %> 
	<!-- Footer end -->    