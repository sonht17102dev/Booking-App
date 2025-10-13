package com.sonht.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sonht.config.DatabaseContext;
import com.sonht.dto.BookingAdminDTO;
import com.sonht.dto.BookingDTO;
import com.sonht.model.Booking;

public class BookingDAO {
	
	
	public List<BookingDTO> getBookingsByUserId(int userId) throws SQLException {
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		List<BookingDTO> list = new ArrayList<BookingDTO>();
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "SELECT "
					+ "    t.name, "
					+ "    t.image, "
					+ "    t.price, "
					+ "    b.adults_quantity, "
					+ "    b.children_quantity, "
					+ "    b.created_date, "
					+ "    b.status "
					+ "FROM "
					+ "booking b "
					+ "JOIN "
					+ "tour t ON b.tour_id = t.id "
					+ "where b.user_id=? and b.status='active'  ";
			preStatement = connection.prepareStatement(sql);
			preStatement.setInt(1, userId);
			
			rs = preStatement.executeQuery();
			while (rs.next()) {
				// retrieve data from result set row and create new student object
				BookingDTO booking = new BookingDTO(rs.getString("name"), rs.getString("image"), rs.getDouble("price"), 
						rs.getInt("adults_quantity"), rs.getInt("children_quantity"), rs.getString("created_date"), rs.getString("status"));

				// add it to the students
				list.add(booking);
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


	public void addNewBooking(Booking booking) throws SQLException {
		Connection connection = null;
		PreparedStatement preStatement = null;
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "insert into booking  "
					+ " (user_id, tour_id, adults_quantity, children_quantity, created_date, status) values "
					+ " (?, ?, ?, ?, ?, ? ) ";
			
			preStatement = connection.prepareStatement(sql);
			preStatement.setInt(1, booking.getUserId());
			preStatement.setInt(2, booking.getTourId());
			preStatement.setInt(3, booking.getAdultQuantity());
			preStatement.setInt(4, booking.getChildQuantity());
			preStatement.setString(5, booking.getCreatedDate());
			preStatement.setString(6, booking.getStatus());
			
			preStatement.execute();
		} finally {
			close(connection, null, preStatement, null);
		}
		
	}


	public List<BookingAdminDTO> getAllBookings() throws SQLException {
		Connection connection = null;
		Statement statement = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		List<BookingAdminDTO> list = new ArrayList<BookingAdminDTO>();
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "SELECT \r\n"
					+ "    t.name AS tour_name,\r\n"
					+ "    b.adults_quantity,\r\n"
					+ "    b.children_quantity,\r\n"
					+ "    u.fullname as customer_name,\r\n"
					+ "    t.price AS tour_price,\r\n"
					+ "    b.created_date\r\n"
					+ "FROM \r\n"
					+ "    booking b\r\n"
					+ "JOIN \r\n"
					+ "    tour t ON b.tour_id = t.id\r\n"
					+ "JOIN \r\n"
					+ "    user u ON b.user_id = u.id\r\n"
					+ "WHERE\r\n"
					+ "	b.status = 'active';";
			preStatement = connection.prepareStatement(sql);
			
			rs = preStatement.executeQuery();
			while (rs.next()) {
				// retrieve data from result set row and create new booking object
				BookingAdminDTO booking = new BookingAdminDTO(rs.getString("tour_name"), rs.getInt("adults_quantity"), rs.getInt("children_quantity"),
						rs.getString("customer_name"), rs.getDouble("tour_price"), rs.getString("created_date"));

				// add it to the bookings
				list.add(booking);
			}
			return list;
			
		} finally {
			close(connection, statement, null, rs);
		}
	}
}
