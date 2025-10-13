package com.sonht.model;

public class Booking {
	private int id;
	private int userId;
	private int tourId;
	private int adultQuantity;
	private int childQuantity;
	private String createdDate;
	private String status;

	public int getId() {
		return id;
	}

	public int getUserId() {
		return userId;
	}

	public int getTourId() {
		return tourId;
	}

	public int getAdultQuantity() {
		return adultQuantity;
	}

	public int getChildQuantity() {
		return childQuantity;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	public String getStatus() {
		return status;
	}

	public Booking(int id, int userId, int tourId, int adultQuantity, int childQuantity, String createdDate,
			String status) {
		this(userId, tourId, adultQuantity, childQuantity, createdDate, status);
		this.id = id;
	}

	@Override
	public String toString() {
		return "Booking [id=" + id + ", userId=" + userId + ", tourId=" + tourId + ", adultQuantity=" + adultQuantity
				+ ", childQuantity=" + childQuantity + ", createdDate=" + createdDate + ", status=" + status + "]";
	}

	public Booking(int userId, int tourId, int adultQuantity, int childQuantity, String createdDate, String status) {
		this.userId = userId;
		this.tourId = tourId;
		this.adultQuantity = adultQuantity;
		this.childQuantity = childQuantity;
		this.createdDate = createdDate;
		this.status = status;
	}

}
