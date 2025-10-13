<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>

<!-- Modal Add-->
<div class="modal fade" id="modalAdd" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	
	<div class="modal-dialog modal-lg ">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabelll">Insert new User</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form method="post" action="${pageContext.servletContext.contextPath}/admin/customer">
					<input type="hidden" name="command" value="ADD">
					<div class="col">
						<div class="row">
							<div class="col-6  ">
								<label for="fullnameAdd" class="col-form-label">Fullname:</label> <input
									type="text" class="form-control" id="fullnameAdd" name="fullnameAdd"
									>
							</div>
							<div class="col-6  ">
								<label for="emailAdd" class="col-form-label">Email:</label> <input
									type="text" class="form-control" id="emailAdd" name="emailAdd"
									>
							</div>
							<div class="col-6  ">
								<label for="phoneNumberAdd" class="col-form-label">Phone number:</label> <input
									type="text" class="form-control" id="phoneNumberAdd" name="phoneNumberAdd"
									>
							</div>
							<div class="col-6  ">
								<label for="addressAdd" class="col-form-label">Address:</label> <input
									type="text" class="form-control" id="addressAdd" name="addressAdd"
									>
							</div>
							<div class="col-6  ">
								<label for="usernameAdd" class="col-form-label">User name:</label> <input
									type="text" class="form-control" id="usernameAdd" name="usernameAdd"
									>
							</div>
							<div class="col-6  ">
								<label for="passwordAdd" class="col-form-label">Password:</label> <input
									type="password" class="form-control" id="passwordAdd" name="passwordAdd"
									>
							</div>
							<div class="col-12  ">
								<label for="roleAdd" class="col-form-label">Role:</label> 
								<div >
									<select name="roleAdd" class="form-select">
										<option value="-1">Choose type role</option>
										<option value="0">Admin</option>
										<option value="1">User</option>
									</select>
								</div>
							</div>
						</div>
						
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Save</button>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>
<!-- Modal Add-->