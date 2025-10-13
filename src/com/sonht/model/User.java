package com.sonht.model;

public class User {
	private int id;
	private String username;
	private String password;
	private String fullname;
	private String email;
	private String phoneNumber;
	private String address;
	private String status;
	private int roleId;

	public User(String username, String password, String fullname, String email, String phoneNumber, String address,
			String status, int roleId) {
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.status = status;
		this.roleId = roleId;
	}

	public User(int id, String username, String password, String fullname, String email, String phoneNumber,
			String address, String status, int roleId) {
		this(username, password, fullname, email, phoneNumber, address, status, roleId);
		this.id = id;
	}

	public User(int id, String username, String fullname, String email, String phoneNumber, String address, int roleId) {
		this.id = id;
		this.username = username;
		this.fullname = fullname;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.roleId = roleId;
	}

	public int getId() {
		return id;
	}


	public String getUsername() {
		return username;
	}


	public String getPassword() {
		return password;
	}


	public String getFullname() {
		return fullname;
	}


	public String getEmail() {
		return email;
	}


	public String getPhoneNumber() {
		return phoneNumber;
	}


	public String getStatus() {
		return status;
	}


	public int getRoleId() {
		return roleId;
	}


	public String getAddress() {
		return address;
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", fullname=" + fullname
				+ ", email=" + email + ", phoneNumber=" + phoneNumber + ", address=" + address + ", status=" + status
				+ ", roleId=" + roleId + "]";
	}

}