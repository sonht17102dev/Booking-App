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
                <h1 class="mt-4">List Post Management</h1>
                <div class="card mb-4">
                    <div class="card-header">
						<c:if test='${messagesSuccess != null}'>
							<c:choose>
								<c:when test='${messagesSuccess.equals("ADD")}'>
									<div class="alert alert-success">
									<strong>Add new Post Success!</strong>
									</div>
								</c:when>
								<c:when test='${messagesSuccess.equals("UPDATE")}'>
									<div class="alert alert-success">
									<strong>Update Post Success!</strong>
									</div>
								</c:when>
								<c:when test='${messagesSuccess.equals("DELETE")}'>
									<div class="alert alert-success">
									<strong>Delete Post Success!</strong>
									</div>
								</c:when>
							
							</c:choose>
						</c:if>
						<c:if test='${messagesError != null}'>
							<div class="alert alert-danger">
								<c:forEach var="tempMess" items="${messagesError}">
									<strong>${tempMess }</strong><br>
								</c:forEach>
							</div>
						</c:if>
						
						<button type="button" class="btn btn-success "
							data-bs-toggle="modal" data-bs-target="#modalAddPost">
							Add new</button>
						<!-- Modal Add-->
						<%@ include file="/views/admin/pages/post/addModalPost.jsp" %>
						<!-- Modal Add-->
					</div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                                <th>Title</th>
                                <th>Image Description</th>
                                <th>Detailed description</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            
                            <tbody>
                            <c:forEach var="post" items="${list_posts}">
                                <tr>
                                    <td>${post.name}</td>
                                    <td style="width:200px"><img style="width:100%;" 
                                    src="${pageContext.servletContext.contextPath}/resources/images/${post.image}"></td>
                                    <td>
                                    <a href="" data-bs-toggle="modal" data-bs-target="#modalDetail"
                                    	onclick="handlerDetailButton(${post.id})">View more</a>
                                    </td>
                                    <td>
	                                    <button type="button" class="btn btn-primary update-btn" data-bs-toggle="modal"
	                                        data-bs-target="#modalUpdate${post.id}" >
	                                        Update</button>
                                        <button type="button" class="btn btn-danger " data-bs-toggle="modal"
	                                        data-bs-target="#modalDelete" onclick="handlerDeleteButton(${post.id})">Delete</button>
                                    </td>
                                </tr>
	                           <!-- Modal update start -->
	                            <%@ include file="/views/admin/pages/post/updateModalPost.jsp" %> 
	                            <!-- Modal update end --> 
	                            
								<!-- Modal Detail start-->
                            	<div class="modal fade" tabindex="-1" id="modalDetail"
			                         aria-labelledby="exampleModalLabel" aria-hidden="true">
			                      <div class="modal-dialog modal-dialog-scrollable modal-xl">
			                        <div class="modal-content">
			                          <div class="modal-header">
			                            <h5 class="modal-title title-delete" id="exampleModalLabel">Detailed description of the post</h5>
			                            <button type="button" class="btn-close" data-bs-dismiss="modal"
			                                    aria-label="Close"></button>
			                          </div>
			                          <div class="modal-body">
			                          	<section id="content-detail"></section>
			                          	
			                          	<button type="button" class="btn btn-secondary"
			                                        data-bs-dismiss="modal">
		                                  Close
		                                </button>
			                          </div>
			
			                        </div>
			                      </div>
			                    </div>
                            	<!-- Modal Detail end-->
                            	<!-- Modal Delete start-->
                            	<div class="modal fade" tabindex="-1" id="modalDelete"
			                         aria-labelledby="exampleModalLabel" aria-hidden="true">
			                      <div class="modal-dialog">
			                        <div class="modal-content">
			                          <div class="modal-header">
			                            <h5 class="modal-title title-delete" id="exampleModalLabel">Are you sure you want to delete?</h5>
			                            <button type="button" class="btn-close" data-bs-dismiss="modal"
			                                    aria-label="Close"></button>
			                          </div>
			                          <div class="modal-body">
			                          	<p id="content-delete"></p>
			                            <form  method="post" 
			                            	action="${pageContext.servletContext.contextPath}/admin/post">
			                              <input type="hidden" class="form-control" name="postId" id="postIdDelete" value="${post.id}">
			                              <input type="hidden" class="form-control" name="commandPost" value="DELETE">
			                              <div class="modal-footer" style="margin-top: 20px">
			                                <button type="button" class="btn btn-secondary"
			                                        data-bs-dismiss="modal">
			                                  Close
			                                </button>
			                                <button type="submit" class="btn btn-danger">Delete</button>
			
			                              </div>
			                            </form>
			                          </div>
			
			                        </div>
			                      </div>
			                    </div>
                            	<!-- Modal Delete end-->
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
<script>
	/* ClassicEditor.create(document.querySelector('#editorUp'))
	.then(edit => {
		const content = document.querySelector('#editorUp').value;
		//edit.setData(content.substring(3, content.length - 6));
		edit.setData(content);
	})	 */
	

	function handlerDetailButton(id) {
		event.preventDefault();
		fetch("/PRJ321x_Project1_BookingTravel/admin/post?commandPost=LOAD&postId=" + parseInt(id))
	    .then(response => response.json())
	    .then(data => {
			// Display data get from BE to form open
	    	document.getElementById("content-detail").innerHTML = data.description;
	    });
	}
	
	function handlerDeleteButton(id) {
		fetch("/PRJ321x_Project1_BookingTravel/admin/post?commandPost=LOAD&postId=" + parseInt(id))
	    .then(response => response.json())
	    .then(data => {
			//console.log(data)
			// Display data get from BE to form open
	    	document.getElementById("postIdDelete").value = data.id;
	    	document.getElementById("content-delete").textContent = data.name + ' will be deleted by the system!';
	    	
	    });
	}
	
	
</script>
<%@include file="/views/admin/layouts/footer.jsp"%>