<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>
<div class="modal fade"  tabindex="-1" id="modalUpdate${tour.id}" 
     aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg ">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabell">Update</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<form method="POST" action="${pageContext.servletContext.contextPath}/admin/tour" 
		enctype="multipart/form-data">
			
			<input type="hidden" name="tourId" id="tourIdUp" value="${tour.id}">
			<input type="hidden" name="commandTour" value="UPDATE">
			<div class="col">
				<div class="row">
					<div class="col-6">
						<label for="tournameUp" class="col-form-label">Tour name:</label> 
						<input type="text" class="form-control" id="tournameUp" name="tournameUp${tour.id}" value="${tour.name}">
					</div>
					<div class="col-6">
						<label for="priceUp" class="col-form-label">Price (USD):</label> 
						<input type="number" class="form-control" id="priceUp" name="priceUp${tour.id}"  value="${tour.price}">
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<label for="startDateUp" class="col-form-label">Start date:</label> 
						<input type="date" class="form-control" id="startDateUp" name="startDateUp${tour.id}" value="${tour.formatTourDate()}" >
					</div>
					<div class="col-6">
						<label for="duetimeUp" class="col-form-label">End date:</label> 
						<input type="date" class="form-control" id="duetimeUp" name="duetimeUp${tour.id}" value="${tour.formatDueTime()}">
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<label for="addressUp" class="col-form-label">Tour address:</label> 
						<input type="text" class="form-control" id="addressUp" name="addressUp${tour.id}" value="${tour.address}">
					</div>
					<div class="col-6">
						<label for="fileUp" class="col-form-label">Description photo:</label> 
						<input type="file" class="form-control" id="fileUp${tour.id}" name="fileUp${tour.id}" onchange="onChangeHandler()">
						<label for="fileName" class="col-form-label">File name:</label> 
						<input type="text" class="form-control" name = "filename${tour.id}" id="filename${tour.id}" value="${tour.image}" >
					</div>
				</div>
				<div class="row">
					<div class="col-12  ">
						<label for="editorUp${tour.id}" class="col-form-label">Description:</label>
						<textarea name="editorUp${tour.id}" id="editorUp${tour.id}" cols="30" rows="30" >${tour.description}</textarea>
					</div>
				</div>
			</div>
		
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<button type="submit" class="btn btn-primary">Save
					changes</button>
			</div>
		</form>
      </div>

    </div>
  </div>
</div>
<!-- Modal Update-->

<script>
	function onChangeHandler() {
		var filename  = document.querySelector("#filename"+ ${tour.id});
		var fileInput = document.getElementById("fileUp"+${tour.id}); 
		var filenameUpLoad = fileInput.files[0].name;
		filename.value = filenameUpLoad;
	}
  
	ClassicEditor.create(document.querySelector('#editorUp' + ${tour.id}))
	.then(edit => {
		const content = document.querySelector('#editorUp' + ${tour.id}).value;
		edit.setData(content);
	})	
</script>