package com.sonht.model;

public class Post {
	private int id;
	private String name;
	private String image;
	private String description;
	private String createdDate;
	private String status;
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public String getImage() {
		return image;
	}
	public String getDescription() {
		return description;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public String getStatus() {
		return status;
	}
	public Post(int id, String name, String image, String description, String createdDate, String status) {
		this.id = id;
		this.name = name;
		this.image = image;
		this.description = description;
		this.createdDate = createdDate;
		this.status = status;
	}
	public Post(String name, String image, String description, String createdDate, String status) {
		this.name = name;
		this.image = image;
		this.description = description;
		this.createdDate = createdDate;
		this.status = status;
	}
	
	
	public Post(int id, String name, String description, String createdDate, String status) {
		this.id = id;
		this.name = name;
		this.description = description;
		this.createdDate = createdDate;
		this.status = status;
	}
	@Override
	public String toString() {
		return "Post [id=" + id + ", name=" + name + ", image=" + image + ", description=" + description
				+ ", createdDate=" + createdDate + ", status=" + status + "]";
	}
	public void setImage(String fileName) {
		this.image = fileName;
	}

	
}
