package com.sonht.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sonht.config.DatabaseContext;
import com.sonht.controller.admin.BaseController;
import com.sonht.model.User;

public class UserDAO {

	public List<User> getAllUsers() throws SQLException {
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		
		List<User> list = new ArrayList<User>();
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "select * from user";
			statement = connection.createStatement();
			rs = statement.executeQuery(sql);
			while(rs.next()) {
				// retrieve data from result set row and create new student object
				User user = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), 
						rs.getString("fullname"), rs.getString("email"), rs.getString("phone_number"), 
						rs.getString("address"), rs.getString("status"), rs.getInt("role_id"));
				
				// add it to the students
				list.add(user);
			}
			return list;
		} finally {
			close(connection, statement, null, rs);
		}
	}
	
	private void close(Connection con, Statement stm, PreparedStatement pre,ResultSet rs) {
		try {
			if (rs != null) rs.close();
			if (stm != null) stm.close();
			if (pre != null) pre.close();
			if (con != null) con.close();  // doesn't really close it... just puts back in connection pool
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addUser(User user) throws Exception {
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		
		try {
			connection = new DatabaseContext().getConnection();
			
			String sql = "insert into user "
					+ "(username, password, fullname, email, phone_number, address, status, role_id) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ? ) ";
			preStatement = connection.prepareStatement(sql);
			preStatement.setString(1, user.getUsername());
			preStatement.setString(2, user.getPassword());
			preStatement.setString(3, user.getFullname());
			preStatement.setString(4, user.getEmail());
			preStatement.setString(5, user.getPhoneNumber());
			preStatement.setString(6, user.getAddress());
			preStatement.setString(7, user.getStatus());
			preStatement.setInt(8, user.getRoleId());
			preStatement.execute();
		} finally {
			close(connection, null, preStatement, null);
		}
		
	}

	public User getUserById(String userId) throws Exception {
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		
		int id;
		User userById = null;
		try {
			// convert user id to int
			id = Integer.parseInt(userId);
			// get connection to db
			connection = new DatabaseContext().getConnection();
			// create sql to get user by id
			String sql = "select * from user where id=? ";
			
			// create prepare statement
			preStatement = connection.prepareStatement(sql);
			
			// set params
			preStatement.setInt(1, id);
			
			// excute
			rs = preStatement.executeQuery();
			
			// get data save in result set
			if(rs.next()) {
				userById = new User(id, rs.getString("username"), rs.getString("password"), rs.getString("fullname"),
						rs.getString("email"), rs.getString("phone_number"), rs.getString("address"),rs.getString("status"),
						rs.getInt("role_id"));
			} else {
				throw new Exception("Could not find user id: " + userById);
			}
			
			return userById;
		} finally {
			close(connection, null, preStatement, rs);
		}
	}

	public void updateUser(User user) throws SQLException {
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "update user "
					+ "set fullname = ?, phone_number = ?, "
					+ "address = ?, role_id = ? "
					+ "where id = ? ";
			
			preStatement = connection.prepareStatement(sql);
			preStatement.setString(1, user.getFullname());
			preStatement.setString(2, user.getPhoneNumber());
			preStatement.setString(3, user.getAddress());
			preStatement.setInt(4, user.getRoleId());
			preStatement.setInt(5, user.getId());
			System.out.println(user);
			preStatement.execute();
		} finally {
			close(connection, null, preStatement, null);
		}
		
	}

	public void lockUser(String id) throws SQLException {
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		
		try {
			connection = new DatabaseContext().getConnection();
			int idd = Integer.parseInt(id);
			String sql = "update user "
					+ "set status = ? "
					+ "where id = ? ";
			preStatement = connection.prepareStatement(sql);
			preStatement.setString(1, "inactive");
			preStatement.setInt(2, idd);
			
			preStatement.execute();
			
		} finally {
			close(connection, null, preStatement, null);
		}
	}

	public void openUser(String id) throws SQLException {
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		
		try {
			connection = new DatabaseContext().getConnection();
			int idd = Integer.parseInt(id);
			String sql = "update user "
					+ "set status = ? "
					+ "where id = ? ";
			preStatement = connection.prepareStatement(sql);
			preStatement.setString(1, "active");
			preStatement.setInt(2, idd);
			
			preStatement.execute();
			
		} finally {
			close(connection, null, preStatement, null);
		}
		
	}

	public void deleteUser(String id) throws SQLException {
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		
		try {
			connection = new DatabaseContext().getConnection();
			int idd = Integer.parseInt(id);
			String sql = "delete from user where id=? ";
			preStatement = connection.prepareStatement(sql);
			preStatement.setInt(1, idd);
			
			preStatement.execute();
			
		} finally {
			close(connection, null, preStatement, null);
		}
	}
	
	public User checkEmailExist(String userMail) throws Exception {
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		
		try {
			String query = "select * from user where email = ?";
			connection = new DatabaseContext().getConnection();
			preStatement = connection.prepareStatement(query);
			preStatement.setString(1, userMail);
			
			rs = preStatement.executeQuery();
			User userByEmail = null;
			if(rs.next()) {
				userByEmail = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"),
						rs.getString("email"), rs.getString("phone_number"), rs.getString("address"),rs.getString("status"),
						rs.getInt("role_id"));
			} 
			return userByEmail;
		} finally {
			close(connection, null, preStatement, rs);
		}
	}
	public User checkUsernameExist(String username) throws Exception {
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		
		try {
			String query = "select * from user where username = ?";
			connection = new DatabaseContext().getConnection();
			preStatement = connection.prepareStatement(query);
			preStatement.setString(1, username);
			
			rs = preStatement.executeQuery();
			User userByUsername = null;
			if(rs.next()) {
				userByUsername = new User(rs.getInt("id"), rs.getString("username"), rs.getString("password"), rs.getString("fullname"),
						rs.getString("email"), rs.getString("phone_number"), rs.getString("address"),rs.getString("status"),
						rs.getInt("role_id"));
			} 
			return userByUsername;
		} finally {
			close(connection, null, preStatement, rs);
		}
	}
}