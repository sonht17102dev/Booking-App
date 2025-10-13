package com.sonht.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.sonht.config.DatabaseContext;
import com.sonht.dto.CommentDTO;
import com.sonht.model.Comment;

public class CommentDAO {
	public List<CommentDTO> getCommentOfPost(String id) throws SQLException {
		Connection connection = null;
		Statement statement = null;
		ResultSet rs = null;
		List<CommentDTO> list = new ArrayList<CommentDTO>();
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "SELECT \r\n"
					+ "    c.id,\r\n"
					+ "    c.user_id,\r\n"
					+ "    c.post_id,\r\n"
					+ "    c.comment_message,\r\n"
					+ "    c.created_date,\r\n"
					+ "    c.rate,\r\n"
					+ "    u.fullname\r\n"
					+ "FROM \r\n"
					+ "    comment c\r\n"
					+ "JOIN \r\n"
					+ "    user u ON c.user_id = u.id\r\n"
					+ "WHERE c.post_id = "+ Integer.parseInt(id) +"; ";
			statement = connection.createStatement();
			rs = statement.executeQuery(sql);
			while (rs.next()) {
				// retrieve data from result set row and create new student object
				CommentDTO post = new CommentDTO(rs.getInt("id"), rs.getInt("user_id"), rs.getInt("post_id"),
						rs.getString("created_date"), rs.getString("comment_message"), rs.getInt("rate"), rs.getString("fullname"));

				// add it to the students
				list.add(post);
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
				con.close(); 

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void createComment(Comment comment) throws SQLException {
		Connection connection = null;
		PreparedStatement preStatement = null;
		ResultSet rs = null;
		try {
			connection = new DatabaseContext().getConnection();
			String sql = "insert into comment "
					+ " (user_id, post_id, created_date, comment_message, rate) "
					+ "VALUES (?, ?, ?, ?, ?) ";
			preStatement = connection.prepareStatement(sql);
			preStatement.setInt(1, comment.getUserId());
			preStatement.setInt(2, comment.getPostId());
			preStatement.setString(3, comment.getCreatedDate());
			preStatement.setString(4, comment.getCommentMessage());
			preStatement.setInt(5, comment.getRate());
			preStatement.execute();
		} finally {
			close(connection, null, preStatement, null);
		}
		
	}
}
