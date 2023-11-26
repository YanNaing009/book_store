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

public class BookDAO {
	private DataSource dataSource;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public BookDAO(DataSource dataSource) {
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
	
	// get all books
	public List<Books> getAllBooks() {
		List<Books> books = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from books where status='active' order by id desc;");
			while (rs.next()) {
				books.add(new Books(
						rs.getLong("id"),
						rs.getString("name"),
						rs.getString("author"),
						rs.getString("review"),
						rs.getDouble("price"),
						rs.getDouble("rating"),
						rs.getDate("releaseDate").toLocalDate(),
						rs.getString("image"),
						rs.getString("status"),
						rs.getString("genres")
					));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return books;
	}
	
	// get book by id
	public Books getBookById(Long id) {
		Books books = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from books where id='"+id+"' and status='active';");
			while (rs.next()) {
				books = new Books(
						rs.getLong("id"),
						rs.getString("name"),
						rs.getString("author"),
						rs.getString("review"),
						rs.getDouble("price"),
						rs.getDouble("rating"),
						rs.getDate("releaseDate").toLocalDate(),
						rs.getString("image"),
						rs.getString("status"),
						rs.getString("genres")
					);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return books;
	}
	
	//create book
	public boolean createBook(Books book) {
		boolean success = false;
		
		try {
			connection = dataSource.getConnection();
			pstmt = connection.prepareStatement("insert into books "
					+ "(name,author,review,price,rating,releaseDate,image,status,genres) values(?,?,?,?,?,?,?,?,?);");
			pstmt.setString(1,book.getName());
			pstmt.setString(2,book.getAuthor());
			pstmt.setString(3,book.getReview());
			pstmt.setDouble(4,book.getPrice());
			pstmt.setDouble(5,book.getRating());
			pstmt.setDate(6,Date.valueOf(book.getReleaseDate()));
			pstmt.setString(7,book.getImage());
			pstmt.setString(8,book.getStatus());
			pstmt.setString(9,book.getGenres());
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
	
	//update book
	public boolean updateBook(Books book) {
		boolean success = false;
		
		try {
			connection = dataSource.getConnection();
			pstmt = connection.prepareStatement("update books set "
					+ "name=?,"
					+ "author=?,"
					+ "review=?,"
					+ "price=?,"
					+ "rating=?,"
					+ "releaseDate=?,"
					+ "image=?,"
					+ "genres=? where id=?;");
			pstmt.setString(1,book.getName());
			pstmt.setString(2,book.getAuthor());
			pstmt.setString(3,book.getReview());
			pstmt.setDouble(4,book.getPrice());
			pstmt.setDouble(5,book.getRating());
			pstmt.setDate(6,Date.valueOf(book.getReleaseDate()));
			pstmt.setString(7,book.getImage());
			pstmt.setString(8,book.getGenres());
			pstmt.setLong(9,book.getId());
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
	
	//delete flash
	public boolean deleteFlash(Long id) {
		boolean success = false;
		try {
			connection = dataSource.getConnection();
			pstmt = connection.prepareStatement("update books set status=? where id=?;");
			pstmt.setString(1,"deleted");
			pstmt.setLong(2,id);
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
	
	//search book
	public List<Books> searchBook(String search) {
	    List<Books> books = new ArrayList<>();

	    try {
	    	connection = dataSource.getConnection();
	        pstmt = connection.prepareStatement("select * from books where name like ? or author like ? or genres like ? and status = ?");
	        pstmt.setString(1, "%" + search + "%");
	        pstmt.setString(2, "%" + search + "%");
	        pstmt.setString(3, "%" + search + "%");
	        pstmt.setString(4, "active");
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            books.add(new Books(
	                rs.getLong("id"),
	                rs.getString("name"),
	                rs.getString("author"),
	                rs.getString("review"),
	                rs.getDouble("price"),
	                rs.getDouble("rating"),
	                rs.getDate("releaseDate").toLocalDate(),
	                rs.getString("image"),
	                rs.getString("status"),
	                rs.getString("genres")
	            ));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    return books;
	}

}
