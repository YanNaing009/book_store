package com.hostmdy.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class BuyHistoryDAO {
	private DataSource dataSource;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;

	public BuyHistoryDAO(DataSource dataSource) {
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
	
	// show History list 
		public List<BuyHistory> showBuyHistroy() {
			List<BuyHistory> buyHistory = new ArrayList<>();
			
			try {
				connection = dataSource.getConnection();
				stmt = connection.createStatement();
				rs = stmt.executeQuery("select * from buy_history;");
				
				while(rs.next()) {
					buyHistory.add(new BuyHistory(
							rs.getLong("id"),
							rs.getString("bookName"),
							rs.getString("authorName"),
							rs.getString("userName"),
							rs.getDate("date").toLocalDate()));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return buyHistory;
		}
		
		// get request book by id
		public List<BuyHistory> getBuyHistoryByUserName(String userName) {
			List<BuyHistory> buyHistory = new ArrayList<>();
			try {
				connection = dataSource.getConnection();
				stmt = connection.createStatement();
				rs = stmt.executeQuery("select * from buy_history where userName='"+userName+"';");
				while (rs.next()) {
					buyHistory.add(new BuyHistory(
							rs.getLong("id"),
							rs.getString("bookName"),
							rs.getString("authorName"),
							rs.getString("userName"),
							rs.getDate("date").toLocalDate()));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			return buyHistory;
		}
		
		//create Request Book
			public boolean createOrder(BuyHistory buyHistory) {
				boolean success = false;
				
				try {
					connection = dataSource.getConnection();
					pstmt = connection.prepareStatement("insert into buy_history "
					        + "(bookName,authorName,userName,date) values(?,?,?,?);");

					pstmt.setString(1,buyHistory.getBookName());
					pstmt.setString(2,buyHistory.getAuthorName());
					pstmt.setString(3,buyHistory.getUserName());
					pstmt.setDate(4,Date.valueOf(buyHistory.getDate()));
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
					pstmt = connection.prepareStatement("delete from buy_history where id=?;");
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
