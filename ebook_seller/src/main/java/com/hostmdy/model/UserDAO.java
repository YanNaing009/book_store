package com.hostmdy.model;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.hostmdy.crypto.PasswordEncoder;
import com.hostmdy.crypto.PasswordValidator;

public class UserDAO {
	private DataSource dataSource;
	private Connection connection;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public UserDAO(DataSource dataSource) {
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
	
	//check Email and Username
	private boolean checkUserExist(String email,String username) {
		if(getUsersByEmail(email) != null || getUsersByUsername(username) != null) {
			return true;
		}else {
			return false;
		}
		
	}
	
	// is Email
	public boolean isEmail(String email) {
		User user = null;
		if(email.contains("@") && email.contains(".")) {
			return true;
		}else {
			return false;
		}
	}
	
	// ValidateUser
	public boolean validateUser(String username,String password) {
		User user = null;
		if(isEmail(username)) {
			user = getUsersByEmail(username);
		}else {
			user = getUsersByUsername(username);
		}
		if(user != null) {
			try {
				if(!PasswordValidator.validatePassword(password,user.getPassword()) ) {
					return false;
				}
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		}else {
			return false;
		}
	}
	
	// Get by Email
	public User getUsersByEmail(String email) {
		User user = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user where email='"+email+"';");
			while (rs.next()) {
				user = new User(
						rs.getLong("id"),
						rs.getString("firstname"),
						rs.getString("lastname"),
						rs.getString("username"),
						rs.getString("email"),
						rs.getString("password"),
						rs.getString("role"),
						rs.getString("address"),
						rs.getString("city"),
						rs.getString("payment"));
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return user;
	}
	
	// Get by Username
	public User getUsersByUsername(String username) {
		User user = null;
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user where username='"+username+"';");
			while (rs.next()) {
				user = new User(
						rs.getLong("id"),
						rs.getString("firstname"),
						rs.getString("lastname"),
						rs.getString("username"),
						rs.getString("email"),
						rs.getString("password"),
						rs.getString("role"),
						rs.getString("address"),
						rs.getString("city"),
						rs.getString("payment"));
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return user;
	}
	
	// Get all User
	public List<User> getAllUsers() {
		List<User> users = new ArrayList<>();
		try {
			connection = dataSource.getConnection();
			stmt = connection.createStatement();
			rs = stmt.executeQuery("select * from user;");
			while (rs.next()) {
				users.add(new User(
						rs.getLong("id"),
						rs.getString("firstname"),
						rs.getString("lastname"),
						rs.getString("username"),
						rs.getString("email"),
						rs.getString("password"),
						rs.getString("role"),
						rs.getString("address"),
						rs.getString("city"),
						rs.getString("payment")));
			}
						
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return users;
	}
	
	// Create User
	public boolean createUser(User user) {
		boolean success = false;
		if(checkUserExist(user.getEmail(), user.getUsername())) {
			return success;
		}
		try {
			connection = dataSource.getConnection();
			pstmt = connection.prepareStatement("insert into user "
					+ "(firstname,lastname,username,email,password,role) value(?,?,?,?,?,?);");
			pstmt.setString(1, user.getFirstname());
			pstmt.setString(2, user.getLastname());
			pstmt.setString(3, user.getUsername());
			pstmt.setString(4, user.getEmail());
			try {
				pstmt.setString(5, PasswordEncoder.encode(user.getPassword()));
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pstmt.setString(6, user.getRole());
			
			int rowEffected = pstmt.executeUpdate();
			success = rowEffected > 0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return success;
	}
	
	// Update User
	public boolean updateUser(User user) {
		boolean success = false;
		try {
			connection = dataSource.getConnection();
			pstmt = connection.prepareStatement("update user set "
					+ "firstname=?,"
					+ "lastname=?,"
					+ "username=?,"
					+ "email=?,"
					+ "password=?,"
					+ "role=? where id=?;");
			pstmt.setString(1, user.getFirstname());
			pstmt.setString(2, user.getLastname());
			pstmt.setString(3, user.getUsername());
			pstmt.setString(4, user.getEmail());
			pstmt.setString(5, user.getPassword());
			pstmt.setString(6, user.getRole());
			pstmt.setLong(7, user.getId());
			int rowEffected = pstmt.executeUpdate();
			success = rowEffected > 0?true:false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return success;
	}
	
	// Update User address
		public boolean updateUserAddress(User user) {
			boolean success = false;
			try {
				connection = dataSource.getConnection();
				pstmt = connection.prepareStatement("update user set "
						+ "address=?,"
						+ "city=?,"
						+ "payment=? where id=?;");
				pstmt.setString(1, user.getAddress());
				pstmt.setString(2, user.getCity());
				pstmt.setString(3, user.getPayment());
				pstmt.setLong(4, user.getId());
				int rowEffected = pstmt.executeUpdate();
				success = rowEffected > 0?true:false;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close();
			}
			return success;
		}
	
}
