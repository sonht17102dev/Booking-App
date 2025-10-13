<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/admin/layouts/taglib.jsp"%>
<div class="modal fade"  tabindex="-1" id="modalUpdate${post.id}" 
     aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg ">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabell">Update</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<form method="POST" action="${pageContext.servletContext.contextPath}/admin/post" 
		enctype="multipart/form-data">
			
			<input type="hidden" name="postId" id="postIdUp" value="${post.id}">
			<input type="hidden" name="commandPost" value="UPDATE">
			<div class="col">
				<div class="row">
					<div class="col-6">
						<label for="postnameUp" class="col-form-label">post name:</label> 
						<input type="text" class="form-control" id="postnameUp" name="postnameUp" value="${post.name}">
					</div>
					<div class="col-6">
						<label for="createdDateUp" class="col-form-label">Start date:</label> 
						<input type="date" class="form-control" id="createdDateUp" name="createdDateUp" value="${post.createdDate}" >
					</div>
				</div>
				<div class="row">
					<div class="col-6">
						<label for="fileUp" class="col-form-label">Description photo:</label> 
						<input type="file" class="form-control" id="fileUp${post.id}" name="fileUp${post.id}" onchange="onChangeHandler()" >
						<label for="fileName" class="col-form-label">File name:</label> 
						<input type="text" class="form-control" name = "filename${post.id}" id="filename${post.id}" value="${post.image}" readonly>
					</div>
				</div>
				<div class="row">
					<div class="col-12  ">
						<label for="editorUp${post.id}" class="col-form-label">Description:</label>
						<textarea name="editorUp${post.id}" id="editorUp${post.id}" cols="30" rows="30" >${post.description}</textarea>
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
		var filename  = document.querySelector("#filename"+ ${post.id});
		var fileInput = document.getElementById("fileUp"+${post.id}); 
		var filenameUpLoad = fileInput.files[0].name;
		filename.value = filenameUpLoad;
	}
  
	ClassicEditor.create(document.querySelector('#editorUp' + ${post.id}))
	.then(edit => {
		const content = document.querySelector('#editorUp' + ${post.id}).value;
		edit.setData(content);
	})	
</script>