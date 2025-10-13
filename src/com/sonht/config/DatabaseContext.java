package com.sonht.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseContext {
	private static final String DB_URL = "jdbc:mysql://localhost:3306/web_booking_travel?useSSL=false";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

	// test connected to Database
	public static void main(String[] args) {
		DatabaseContext dbContext = new DatabaseContext();
		try {
			System.out.println(dbContext.getConnection());
		} catch (Exception e) {
			System.out.println("something went wrong");
		}
	}
}