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
                <h1 class="mt-4">List Customer Management</h1>
                <div class="card mb-4">
                    <div class="card-header">
						<c:if test='${messagesSuccess != null}'>
							<c:choose>
								<c:when test='${messagesSuccess.equals("ADD")}'>
									<div class="alert alert-success">
									<strong>Add New User Success!</strong>
									</div>
								</c:when>
								<c:when test='${messagesSuccess.equals("UPDATE")}'>
									<div class="alert alert-success">
									<strong>Update User Success!</strong>
									</div>
								</c:when>
								<c:when test='${messagesSuccess.equals("DELETE")}'>
									<div class="alert alert-success">
									<strong>Delete User Success!</strong>
									</div>
								</c:when>
								<c:when test='${messagesSuccess.equals("LOCK")}'>
									<div class="alert alert-success">
									<strong>Lock User Success!</strong>
									</div>
								</c:when>
								<c:when test='${messagesSuccess.equals("OPEN")}'>
									<div class="alert alert-success">
									<strong>Open User Success!</strong>
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
							data-bs-toggle="modal" data-bs-target="#modalAdd">
							Add new</button>
						<!-- Modal Add-->
						<%@ include file="/views/admin/pages/customer/addModalCustomer.jsp" %>
						<!-- Modal Add-->
					</div>
                    <div class="card-body">
                        <table id="datatablesSimple">
                            <thead>
                            <tr>
                            	<th>Id</th>
                                <th>Full Name</th>
                                <th>Email</th>
                                <th>Phone Number</th>
                                <th>UserName</th>
                                <th>Role</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            
                            <tbody>
                            <c:forEach var="tempUser" items="${list_users}">
                                <tr>
                                	<td>${tempUser.id}</td>
                                    <td>${tempUser.fullname}</td>
                                    <td>${tempUser.email}</td>
                                    <td>${tempUser.phoneNumber}</td>
                                    <td>${tempUser.username}</td>
                                    <td>${tempUser.roleId == 0 ? "Admin" : "User"}</td>
                                    <td class='fw-bold text-${tempUser.status.equals("active") ? "success" : "danger"}'>
                                    	${tempUser.status.equals("active") ? "Active" : "Locked"}
                                    </td>
                                    <td>
	                                    <button type="button" class="btn btn-success update-btn" data-bs-toggle="modal"
	                                        data-bs-target="#modalUpdate${tempUser.id}" onclick="handlerUpdateButton(${tempUser.id})">
	                                        Update</button>
	                                    <button type="button" class="btn btn-warning " data-bs-toggle="modal"
	                                        data-bs-target="#modalDetail">Detail</button>
                                        <button type="button" class="btn btn-danger " data-bs-toggle="modal"
	                                        data-bs-target="#modalDelete${tempUser.id}" onclick="handlerDeleteButton(${tempUser.id})">Delete</button>
	                                    <c:choose>
	                                    	<c:when test='${tempUser.status.equals("active")}'>
		                                        <button type="button" class="btn btn-danger " data-bs-toggle="modal"
			                                        data-bs-target="#modalLock${tempUser.id}" onclick="handlerLockButton(${tempUser.id})">Lock</button>
	                                    	</c:when>
	                                    	<c:otherwise>
		                                        <button type="button" class="btn btn-success" data-bs-toggle="modal"
			                                        data-bs-target="#modalOpen${tempUser.id}" onclick="handlerOpenButton(${tempUser.id})">Open</button>
	                                        </c:otherwise>
	                                    </c:choose>
                                    </td>
                                </tr>
	                            <!-- Modal update start -->
	                            <%@ include file="/views/admin/pages/customer/updateModalCustomer.jsp" %>
	                            <!-- Modal update end -->
                            	<!-- Modal lock start-->
                            	<div class="modal fade" tabindex="-1" id="modalLock${tempUser.id}"
			                         aria-labelledby="exampleModalLabel" aria-hidden="true">
			                      <div class="modal-dialog">
			                        <div class="modal-content">
			                          <div class="modal-header">
			                            <h5 class="modal-title title-lock" id="exampleModalLabel"></h5>
			                            <button type="button" class="btn-close" data-bs-dismiss="modal"
			                                    aria-label="Close"></button>
			                          </div>
			                          <div class="modal-body">
			                          	<p id="content-lock${tempUser.id}"></p>
			                            <form  method="post" 
			                            	action="${pageContext.servletContext.contextPath}/admin/customer">
			                              <input type="hidden" class="form-control" name="userId" id="userIdLock" value="${tempUser.id}">
			                              <input type="hidden" class="form-control" name="command" value="LOCK">
			                              <div class="modal-footer" style="margin-top: 20px">
			                                <button type="button" class="btn btn-secondary"
			                                        data-bs-dismiss="modal">
			                                  Close
			                                </button>
			                                <button type="submit" class="btn btn-danger">Lock</button>
			
			                              </div>
			                            </form>
			                          </div>
			
			                        </div>
			                      </div>
			                    </div>
                            	<!-- Modal lock end-->
                            	<!-- Modal open start-->
                            	<div class="modal fade" tabindex="-1" id="modalOpen${tempUser.id}"
			                         aria-labelledby="exampleModalLabel" aria-hidden="true">
			                      <div class="modal-dialog">
			                        <div class="modal-content">
			                          <div class="modal-header">
			                            <h5 class="modal-title title-open" id="exampleModalLabel"></h5>
			                            <button type="button" class="btn-close" data-bs-dismiss="modal"
			                                    aria-label="Close"></button>
			                          </div>
			                          <div class="modal-body">
			                          	<p id="content-open${tempUser.id}"></p>
			                            <form  method="post" 
			                            	action="${pageContext.servletContext.contextPath}/admin/customer">
			                              <input type="hidden" class="form-control" name="userId" id="userIdOpen" value="${tempUser.id}">
			                              <input type="hidden" class="form-control" name="command" value="OPEN">
			                              <div class="modal-footer" style="margin-top: 20px">
			                                <button type="button" class="btn btn-secondary"
			                                        data-bs-dismiss="modal">
			                                  Close
			                                </button>
			                                <button type="submit" class="btn btn-primary">Save</button>
			
			                              </div>
			                            </form>
			                          </div>
			
			                        </div>
			                      </div>
			                    </div>
                            	<!-- Modal open end-->
                            	<!-- Modal Delete start-->
                            	<div class="modal fade" tabindex="-1" id="modalDelete${tempUser.id}"
			                         aria-labelledby="exampleModalLabel" aria-hidden="true">
			                      <div class="modal-dialog">
			                        <div class="modal-content">
			                          <div class="modal-header">
			                            <h5 class="modal-title title-delete" id="exampleModalLabel"></h5>
			                            <button type="button" class="btn-close" data-bs-dismiss="modal"
			                                    aria-label="Close"></button>
			                          </div>
			                          <div class="modal-body">
			                          	<p id="content-delete${tempUser.id}"></p>
			                            <form  method="post" 
			                            	action="${pageContext.servletContext.contextPath}/admin/customer">
			                              <input type="hidden" class="form-control" name="userId" id="userIdDelete" value="${tempUser.id}">
			                              <input type="hidden" class="form-control" name="command" value="DELETE">
			                              <div class="modal-footer" style="margin-top: 20px">
			                                <button type="button" class="btn btn-secondary"
			                                        data-bs-dismiss="modal">
			                                  Close
			                                </button>
			                                <button type="submit" class="btn btn-primary">Delete</button>
			
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

	function handlerUpdateButton(id) {
		// call api to get user data from BE
		fetch("${pageContext.servletContext.contextPath}/admin/customer?command=LOAD&userId=" + parseInt(id))
	    .then(response => response.json())
	    .then(data => {
	    	console.log(data)
			// Display data get from BE to form update
			document.getElementById("fullnameUp"+id).value = data.fullname;
			document.getElementById("emailUp"+id).value = data.email;
			document.getElementById("phoneNumberUp"+id).value = data.phoneNumber ? data.phoneNumber : '';
			document.getElementById("addressUp"+id).value = data.address ? data.address : '';
			document.getElementById("usernameUp"+id).value = data.username;
			document.getElementById("roleUp"+id).value = data.roleId;
			document.getElementById("userId").value = data.id;
	    });
	}
	
	function handlerLockButton(id) {
		fetch("${pageContext.servletContext.contextPath}/admin/customer?command=LOCK&userId=" + parseInt(id))
	    .then(response => response.json())
	    .then(data => {
			//console.log(data)
			// Display data get from BE to form lock
	    	document.getElementById("userIdLock").value = data.id;
	    	document.getElementById("content-lock"+id).textContent = data.username + ' will be locked by the system!';
	    	document.querySelector(".title-lock").textContent = 'Are you sure to lock ' + data.username + ' User ?';
	    	
	    });
	}
	
	function handlerOpenButton(id) {
		fetch("${pageContext.servletContext.contextPath}/admin/customer?command=OPEN&userId=" + parseInt(id))
	    .then(response => response.json())
	    .then(data => {
			//console.log(data)
			// Display data get from BE to form open
	    	document.getElementById("userIdOpen").value = data.id;
	    	document.getElementById("content-open"+id).textContent = data.username + ' will be opened by the system!';
	    	document.querySelector(".title-open").textContent = 'Are you sure to open ' + data.username + ' User ?';
	    	
	    });
	}
	function handlerDeleteButton(id) {
		fetch("${pageContext.servletContext.contextPath}/admin/customer?command=DELETE&userId=" + parseInt(id))
	    .then(response => response.json())
	    .then(data => {
			//console.log(data)
			// Display data get from BE to form open
	    	document.getElementById("userIdDelete").value = data.id;
	    	document.getElementById("content-delete"+id).textContent = data.username + ' will be deleted by the system!';
	    	document.querySelector(".title-delete").textContent = 'Are you sure to delete ' + data.username + ' User ?';
	    	
	    });
	}
	
	
</script>
<%@include file="/views/admin/layouts/footer.jsp"%>