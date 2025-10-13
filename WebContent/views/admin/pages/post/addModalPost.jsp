<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>

<!-- Modal Add-->
<div class="modal fade" id="modalAddPost" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg ">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabelll">Add new post</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form method="POST" 
				action="${pageContext.servletContext.contextPath}/admin/post" enctype="multipart/form-data">
					<input type="hidden" name="commandPost" value="ADD">
					<div class="col">
						<div class="row">
							<div class="col-6">
								<label for="postnameAdd" class="col-form-label">Title:</label> 
								<input type="text" class="form-control" id="postnameAdd" name="postnameAdd">
							</div>
							<div class="col-6">
								<label for="createdDateAdd" class="col-form-label">Created Date:</label> 
								<input type="date" class="form-control" id="createdDateAdd" name="createdDateAdd" >
							</div>
							
						</div>
						<div class="row">
							<div class="col-12">
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