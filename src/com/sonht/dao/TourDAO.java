package com.sonht.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sonht.config.DatabaseContext;
import com.sonht.model.Post;
import com.sonht.model.Tour;
import com.sonht.model.User;

public class TourDAO {
	

	public List<Tour> getAllTours() throws SQLException {
		Connection connection = null;
		Statement statement = null;
		ResultSet rs = null;
		List<Tour> list = new ArrayList<Tour>();
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "select * from tour where status='active' ";
			statement = connection.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				// retrieve data from result set row and create new student object
				Tour tour = new Tour(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
						rs.getString("description"), rs.getString("start_date"), rs.getString("duetime"),
						rs.getDouble("price"), rs.getString("address"), rs.getString("status"));

				// add it to the students
				list.add(tour);
			}
			return list;
		} finally {
			close(connection, statement, null, rs);
		}
	}

	private void close(Connection con, Statement stm, PreparedStatement pre, ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
			if (stm != null)
				stm.close();
			if (pre != null)
				pre.close();
			if (con != null)
				con.close(); // doesn't really close it... just puts back in connection pool

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void addTour(Tour tour) throws SQLException {
		Connection connection = null;
		PreparedStatement preStatement = null;
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "insert into tour "
					+ " (name, image, description, start_date, duetime, address, price, status) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?) ";
			preStatement = connection.prepareStatement(sql);
			preStatement.setString(1, tour.getName());
			preStatement.setString(2, tour.getImage());
			preStatement.setString(3, tour.getDescription());
			preStatement.setString(4, tour.getStartDate());
			preStatement.setString(5, tour.getDuetime());
			preStatement.setString(6, tour.getAddress());
			preStatement.setDouble(7, tour.getPrice());
			preStatement.setString(8, tour.getStatus());
			preStatement.execute();
		} finally {
			close(connection, null, preStatement, null);
		}

	}

	public Tour getTourById(String tourId) throws Exception {
		Connection connection = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		int id;
		Tour tourById = null;
		try {
			// convert user id to int
			id = Integer.parseInt(tourId);
			// get connection to db
			connection = new DatabaseContext().getConnection();
			// create sql to get user by id
			String sql = "select * from tour where id=? ";

			// create prepare statement
			preStatement = connection.prepareStatement(sql);

			// set params
			preStatement.setInt(1, id);

			// excute
			rs = preStatement.executeQuery();

			// get data save in result set
			if (rs.next()) {
				tourById = new Tour(id, rs.getString("name"), rs.getString("image"), rs.getString("description"),
						rs.getString("start_date"), rs.getString("duetime"), rs.getDouble("price"),
						rs.getString("address"), rs.getString("status"));
			} else {
				throw new Exception("Could not find tour id: " + tourId);
			}

			return tourById;
		} finally {
			close(connection, null, preStatement, rs);
		}
	}

	public void updateTour(int id, Tour tour) throws SQLException {
		Connection connection = null;
		PreparedStatement preStatement = null;
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "update tour " + "set name=?, image=?, description=?, start_date=?, "
					+ "duetime=?, address=?, price=? " + "where id=? ";
			preStatement = connection.prepareStatement(sql);
			preStatement.setString(1, tour.getName());
			preStatement.setString(2, tour.getImage());
			preStatement.setString(3, tour.getDescription());
			preStatement.setString(4, tour.getStartDate());
			preStatement.setString(5, tour.getDuetime());
			preStatement.setString(6, tour.getAddress());
			preStatement.setDouble(7, tour.getPrice());
			preStatement.setInt(8, id);
			preStatement.execute();
		} finally {
			close(connection, null, preStatement, null);
		}

	}

	public void deleteTour(String id) throws SQLException {
		Connection connection = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "update tour set status=? where id=? ";
			preStatement = connection.prepareStatement(sql);
			preStatement.setString(1, "inactive");
			preStatement.setInt(2, Integer.parseInt(id));
			preStatement.execute();

		} finally {
			close(connection, null, preStatement, null);
		}
	}

	public List<Tour> searchByKeyWord(String keyword) throws SQLException {
		Connection connection = null;
		Statement statement = null;
		ResultSet rs = null;
		List<Tour> tours = new ArrayList<Tour>();
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "select * from tour where status='active' and name like '%"+ keyword +"%' ";
			statement = connection.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				// retrieve data from result set row and create new student object
				Tour tour = new Tour(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
						rs.getString("description"), rs.getString("start_date"), rs.getString("duetime"),
						rs.getDouble("price"), rs.getString("address"), rs.getString("status"));

				// add it to the students
				tours.add(tour);
			}
			return tours;
		} finally {
			close(connection, statement, null, rs);
		}
	}

	public List<Tour> searchByDate(String date) throws SQLException {
		Connection connection = null;
		Statement statement = null;
		ResultSet rs = null;
		List<Tour> tours = new ArrayList<Tour>();
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "SELECT * FROM web_booking_travel.tour WHERE status='active'"
					+ " and STR_TO_DATE(start_date, '%Y-%m-%d') >= '"+date+"'; ";
			statement = connection.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				// retrieve data from result set row and create new student object
				Tour tour = new Tour(rs.getInt("id"), rs.getString("name"), rs.getString("image"),
						rs.getString("description"), rs.getString("start_date"), rs.getString("duetime"),
						rs.getDouble("price"), rs.getString("address"), rs.getString("status"));

				// add it to the students
				tours.add(tour);
			}
			return tours;
		} finally {
			close(connection, statement, null, rs);
		}
	}

}