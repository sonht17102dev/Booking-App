package com.sonht.dto;

public class BookingAdminDTO {
	private String tourName;
	private int adultsQuantity;
	private int childrenQuantity;
	private String customerName;
	private double price;
	private String createdDate;

	public BookingAdminDTO(String tourName, int adultsQuantity, int childrenQuantity, String customerName, double price,
			String createdDate) {
		this.tourName = tourName;
		this.adultsQuantity = adultsQuantity;
		this.childrenQuantity = childrenQuantity;
		this.customerName = customerName;
		this.price = price;
		this.createdDate = createdDate;
	}

	public String getTourName() {
		return tourName;
	}

	public int getAdultsQuantity() {
		return adultsQuantity;
	}

	public int getChildrenQuantity() {
		return childrenQuantity;
	}

	public String getCustomerName() {
		return customerName;
	}

	public double getPrice() {
		return price;
	}

	public String getCreatedDate() {
		return createdDate;
	}

	@Override
	public String toString() {
		return "BookingAdminDTO [tourName=" + tourName + ", adultsQuantity=" + adultsQuantity + ", childrenQuantity="
				+ childrenQuantity + ", customerName=" + customerName + ", price=" + price + ", createdDate="
				+ createdDate + "]";
	}

}
