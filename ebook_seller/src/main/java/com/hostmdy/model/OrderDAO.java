package com.hostmdy.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class OrderDAO {
	
	private DataSource dataSource;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;

	public OrderDAO(DataSource dataSource) {
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
	
	// show Order list 
		public List<Order> showOrder() {
			List<Order> orderList = new ArrayList<>();
			
			try {
				connection = dataSource.getConnection();
				stmt = connection.createStatement();
				rs = stmt.executeQuery("select * from order_book;");
				
				while(rs.next()) {
					orderList.add(new Order(
							rs.getLong("id"),
							rs.getLong("bookId"),
							rs.getLong("userId"),
							rs.getString("userName"),
							rs.getString("bookName"),
							rs.getString("authorName"),
							rs.getDate("date").toLocalDate(),
							rs.getDouble("price")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return orderList;
		}
		
		// get request book by id
		public List<Order> getOrderUserById(Long id) {
			List<Order> OrderBook = new ArrayList<>();
			try {
				connection = dataSource.getConnection();
				stmt = connection.createStatement();
				rs = stmt.executeQuery("select * from order_book where userId='"+id+"';");
				while (rs.next()) {
					OrderBook.add(new Order(
							rs.getLong("id"),
							rs.getLong("bookId"),
							rs.getLong("userId"),
							rs.getString("userName"),
							rs.getString("bookName"),
							rs.getString("authorName"),
							rs.getDate("date").toLocalDate(),
							rs.getDouble("price")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return OrderBook;
		}
		
		//create Request Book
			public boolean createOrder(Order order) {
				boolean success = false;
				
				try {
					connection = dataSource.getConnection();
					pstmt = connection.prepareStatement("insert into order_book "
					        + "(bookId,userId,userName,bookName,authorName,date,price) values(?,?,?,?,?,?,?);");
					pstmt.setLong(1,order.getBookId());
					pstmt.setLong(2,order.getUserId());
					pstmt.setString(3,order.getUserName());
					pstmt.setString(4,order.getBookName());
					pstmt.setString(5,order.getAuthorName());
					pstmt.setDate(6,Date.valueOf(order.getDate()));
					pstmt.setDouble(7,order.getPrice());
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
			
		// create history
			public boolean createHistory(Order order) {
				boolean success = false;
				
				try {
					connection = dataSource.getConnection();
					pstmt = connection.prepareStatement("insert into buy_history "
					        + "(bookName,authorName,userName,date) values(?,?,?,?);");
					pstmt.setString(1,order.getBookName());
					pstmt.setString(2,order.getAuthorName());
					pstmt.setString(3,order.getUserName());
					pstmt.setDate(4,Date.valueOf(order.getDate()));
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
			public boolean deleteOrder(Long id) {
				boolean success = false;
				try {
					connection = dataSource.getConnection();
					pstmt = connection.prepareStatement("delete from order_book where id=?;");
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
