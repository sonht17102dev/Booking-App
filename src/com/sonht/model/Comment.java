package com.sonht.model;

public class Comment {
	private int id;
	private int userId;
	private int postId;
	private String createdDate;
	private String commentMessage;
	private int rate;

	public Comment(int id, int userId, int postId, String createdDate, String commentMessage, int rate) {
		this(userId, postId, createdDate, commentMessage, rate);
		this.id = id;
	}

	public Comment(int userId, int postId, String createdDate, String commentMessage, int rate) {
		this.userId = userId;
		this.postId = postId;
		this.createdDate = createdDate;
		this.commentMessage = commentMessage;
		this.rate = rate;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", userId=" + userId + ", postId=" + postId + ", createdDate=" + createdDate
				+ ", commentMessage=" + commentMessage + ", rate=" + rate + "]";
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

}
