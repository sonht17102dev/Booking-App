<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>${action == 'login' ? 'Login' : 'Sign Up'}</title>
    <link rel="stylesheet" href="<c:url value="views/admin/css/styles.css" />">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">

<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header">
                            	<h3 class="text-center font-weight-light my-4">${action == 'login' ? 'Login' : 'Sign Up'}</h3>
                            	<p class="text-danger fw-bold">${message}</p>	
                            	<c:if test="${messages != null }">
	                            	<c:forEach var="error" items="${messages}">
	                            		<p class="text-danger fw-bold">${error}</p>	
	                            	</c:forEach>
                            	</c:if>
                            </div>
                            <div class="card-body">
                                <form action="${pageContext.servletContext.contextPath}/${action == 'login' ? 'login' : 'signup'}" method='POST'>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputEmail" name="email" type="text" />
                                        <label for="inputEmail">Email address</label>
                                    </div>
									<c:if test="${action == 'signup'}">
					                    <div class="form-floating mb-3">
					                        <input type="text" class="form-control" id="fullname" name="fullname" >
					                        <label for="fullname" class="form-label">Full Name</label>
					                    </div>
					                    <div class="form-floating mb-3">
					                        <input type="text" class="form-control" id="username" name="username" >
					                        <label for="username" class="form-label">User name</label>
					                    </div>
					                </c:if>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputPassword" name="password" type="password"  />
                                        <label for="inputPassword">Password</label>
                                    </div>
                                    <c:if test="${action == 'signup'}">
					                    <div class="form-floating mb-3">
                                        <input class="form-control" id="inputRePassword" name="repassword" type="password"  />
                                        <label for="inputRePassword">Re-Password</label>
                                    </div>
					                </c:if>
                                    <div class="d-flex align-items-center justify-content-evenly m-4 ">
                                        <button class="btn btn-success" type="submit" >${action == 'login' ? 'Login' : 'Sign Up'}</button>
                                        <button class="btn btn-primary" type="button" 
                                        	onclick="window.location.href='${pageContext.servletContext.contextPath}/home'; return false;"
                                        >Return Home</button>
                                    </div>
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<c:url value="views/admin/js/scripts.js"/>"></script>
</body>
</html>