package com.hostmdy.model;

import java.time.LocalDate;

public class BuyHistory {
	private Long id;
	private String bookName;
	private String authorName;
	private String userName;
	private LocalDate date;
	
	public BuyHistory() {
		// TODO Auto-generated constructor stub
	}

	public BuyHistory(String bookName, String authorName, String userName, LocalDate date) {
		super();
		this.bookName = bookName;
		this.authorName = authorName;
		this.userName = userName;
		this.date = date;
	}

	public BuyHistory(Long id, String bookName, String authorName, String userName, LocalDate date) {
		super();
		this.id = id;
		this.bookName = bookName;
		this.authorName = authorName;
		this.userName = userName;
		this.date = date;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public LocalDate getDate() {
		return date;
	}

	public void setDate(LocalDate date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "BuyHistory [id=" + id + ", bookName=" + bookName + ", authorName=" + authorName + ", userName="
				+ userName + ", date=" + date + "]";
	}
	
	
}
