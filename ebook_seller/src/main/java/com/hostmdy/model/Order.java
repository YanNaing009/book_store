package com.hostmdy.model;

import java.time.LocalDate;

public class Order {
	private Long id;
	private Long bookId;
	private Long userId;
	private String userName;
	private String bookName;
	private String authorName;
	private LocalDate date;
	private Double price;
	
	public Order() {
		// TODO Auto-generated constructor stub
	}

	public Order(Long bookId, Long userId, String userName, String bookName, String authorName, LocalDate date,
			Double price) {
		super();
		this.bookId = bookId;
		this.userId = userId;
		this.userName = userName;
		this.bookName = bookName;
		this.authorName = authorName;
		this.date = date;
		this.price = price;
	}

	public Order(Long id, Long bookId, Long userId, String userName, String bookName, String authorName, LocalDate date,
			Double price) {
		super();
		this.id = id;
		this.bookId = bookId;
		this.userId = userId;
		this.userName = userName;
		this.bookName = bookName;
		this.authorName = authorName;
		this.date = date;
		this.price = price;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", bookId=" + bookId + ", userId=" + userId + ", userName=" + userName
				+ ", bookName=" + bookName + ", authorName=" + authorName + ", date=" + date + ", price=" + price + "]";
	}

	
}
