package com.hostmdy.model;

public class Request {
	private Long id;
	private String bookName;
	private String authorName;
	private String note;
	private String userName;
	
	public Request() {
		// TODO Auto-generated constructor stub
	}

	public Request(String bookName, String authorName ,String note,String userName) {
		super();
		this.bookName = bookName;
		this.authorName = authorName;
		this.note = note;
		this.userName = userName;
	}

	public Request(Long id, String bookName, String authorName, String note,String userName) {
		super();
		this.id = id;
		this.bookName = bookName;
		this.authorName = authorName;
		this.note = note;
		this.userName = userName;
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
	

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Override
	public String toString() {
		return "Request [id=" + id + ", bookName=" + bookName + ", authorName=" + authorName + ", note=" + note
				+ ", userName=" + userName + "]";
	}

}
