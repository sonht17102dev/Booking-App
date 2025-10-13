package com.sonht.dto;

public class BookingDTO {
	private String tourName;
	private String image;
	private double price;
	private int adultsQuantity;
	private int childrenQuantity;
	private String created_date;
	private String status;

	public BookingDTO(String tourName, String image, double price, int adultsQuantity, int childrenQuantity,
			String created_date, String status) {
		this.tourName = tourName;
		this.image = image;
		this.price = price;
		this.adultsQuantity = adultsQuantity;
		this.childrenQuantity = childrenQuantity;
		this.created_date = created_date;
		this.status = status;
	}

	public String getImage() {
		return image;
	}

	public String getTourName() {
		return tourName;
	}

	public String getCreated_date() {
		return created_date;
	}

	public double getPrice() {
		return price;
	}

	public int getAdultsQuantity() {
		return adultsQuantity;
	}

	public int getChildrenQuantity() {
		return childrenQuantity;
	}

	public double getTotalPrice() {
		return price * adultsQuantity + price * childrenQuantity;
	}

	public String getStatus() {
		return status;
	}
}
