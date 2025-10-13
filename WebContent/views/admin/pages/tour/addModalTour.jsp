<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>

<!-- Modal Add-->
<div class="modal fade" id="modalAddTour" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg ">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabelll">Add new tour</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form method="POST" 
				action="${pageContext.servletContext.contextPath}/admin/tour" enctype="multipart/form-data">
					<input type="hidden" name="commandTour" value="ADD">
					<div class="col">
						<div class="row">
							<div class="col-6">
								<label for="tournameAdd" class="col-form-label">Tour name:</label> 
								<input type="text" class="form-control" id="tournameAdd" name="tournameAdd">
							</div>
							<div class="col-6">
								<label for="priceAdd" class="col-form-label">Price (USD):</label> 
								<input type="number" class="form-control" id="priceAdd" name="priceAdd" >
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="startDateAdd" class="col-form-label">Start date:</label> 
								<input type="date" class="form-control" id="startDateAdd" name="startDateAdd" >
							</div>
							<div class="col-6">
								<label for="duetimeAdd" class="col-form-label">End date:</label> 
								<input type="date" class="form-control" id="duetimeAdd" name="duetimeAdd">
							</div>
						</div>
						<div class="row">
							<div class="col-6">
								<label for="addressAdd" class="col-form-label">Tour address:</label> 
								<input type="text" class="form-control" id="addressAdd" name="addressAdd">
							</div>
							<div class="col-6">
								<label for="file" class="col-form-label">Description photo:</label> 
								<input type="file" class="form-control" id="file" name="file" >
							</div>
						</div>
						<div class="row">
							<div class="col-12  ">
								<label for="editor" class="col-form-label">Description:</label>
								<textarea name="editor" id="editor" cols="30" rows="30"></textarea>
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
<script>

	ClassicEditor.create(document.querySelector('#editor')).then(edit => {
		//console.log("da" + edit);
	})
	.catch(error => {
		//console.error(error);
	});
</script>