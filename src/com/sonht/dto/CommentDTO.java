package com.sonht.dto;

public class CommentDTO {
	private int id;
	private int userId;
	private int postId;
	private String createdDate;
	private String commentMessage;
	private int rate;
	private String name;

	public CommentDTO(int id, int userId, int postId, String createdDate, String commentMessage, int rate,
			String name) {
		this.id = id;
		this.userId = userId;
		this.postId = postId;
		this.createdDate = createdDate;
		this.commentMessage = commentMessage;
		this.rate = rate;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public int getUserId() {
		return userId;
	}

	public int getPostId() {
		return postId;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public String getCommentMessage() {
		return commentMessage;
	}

	public int getRate() {
		return rate;
	}

	public String getName() {
		return name;
	}

}
