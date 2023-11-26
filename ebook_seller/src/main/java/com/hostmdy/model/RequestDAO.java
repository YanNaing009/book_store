package com.hostmdy.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class RequestDAO {
	private DataSource dataSource;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public RequestDAO(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}
	
	private void close() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// show request list 
	public List<Request> showRequest() {
		List<Request> requestList = new ArrayList<>();
		
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from request_book;");
			
			while(rs.next()) {
				requestList.add(new Request(
						rs.getLong("id"),
						rs.getString("bookName"),
						rs.getString("authorName"),
						rs.getString("userName"),
						rs.getString("note")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return requestList;
	}
	
	// get request book by id
	public Request getRequestBookById(Long id) {
		Request reqBook = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from request_book where id='"+id+"';");
			while (rs.next()) {
				reqBook = new Request(
						rs.getLong("id"),
						rs.getString("bookName"),
						rs.getString("authorName"),
						rs.getString("userName"),
						rs.getString("note"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return reqBook;
	}
	
	//create Request Book
		public boolean createRequestBook(Request request) {
			boolean success = false;
			
			try {
				connection = dataSource.getConnection();
				pstmt = connection.prepareStatement("insert into request_book "
						+ "(bookName,authorName,note,userName) values(?,?,?,?);");
				pstmt.setString(1,request.getBookName());
				pstmt.setString(2,request.getAuthorName());
				pstmt.setString(3,request.getNote());
				pstmt.setString(4,request.getUserName());
				int rowEffected = pstmt.executeUpdate();
				success = rowEffected > 0 ? true : false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return success;
		}
		
	// Delete Request Book
		public boolean deleteRequestBook(Long id) {
			boolean success = false;
			try {
				connection = dataSource.getConnection();
				pstmt = connection.prepareStatement("delete from request_book where id=?;");
				pstmt.setLong(1,id);
				int rowEffected = pstmt.executeUpdate();
				success = rowEffected > 0 ? true : false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return success;
			
		}
}
