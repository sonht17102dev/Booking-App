package com.sonht.model;

public class Tour {
	private int id;
	private String name;
	private String image;
	private String description;
	private String startDate;
	private String duetime;
	private double price;
	private String address;
	private String status;

	public Tour(int id, String name, String image, String description, String startDate, String duetime, double price,
			String address, String status) {
		this(name, image, description, startDate, duetime, price, address, status);
		this.id = id;
	}

	public Tour(String name, String image, String description, String startDate, String duetime, double price,
			String address, String status) {
		this.name = name;
		this.image = image;
		this.description = description;
		this.startDate = startDate;
		this.duetime = duetime;
		this.price = price;
		this.address = address;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getStartDate() {
		return startDate;
	}

	public String getDuetime() {
		return duetime;
	}

	public double getPrice() {
		return price;
	}

	public String getAddress() {
		return address;
	}

	public String getStatus() {
		return status;
	}

	public String formatTourDate() {
		return this.startDate.substring(0, 10);
	}
	
	public String formatDueTime() {
		return this.duetime.substring(0, 10);
	}
	@Override
	public String toString() {
		return "Tour [id=" + id + ", name=" + name + ", image=" + image + ", description=" + description
				+ ", startDate=" + startDate + ", duetime=" + duetime + ", price=" + price + ", address=" + address
				+ ", status=" + status + "]";
	}


}
