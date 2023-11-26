package com.hostmdy.model;

import java.sql.Date;
import java.time.LocalDate;

public class Books {
	private Long id;
	private String name;
	private String author;
	private String review;
	private Double price;
	private Double rating;
	private LocalDate releaseDate;
	private String image;
	private String status;
	private String genres;
	
	public Books() {}

	public Books(String name, String author, String review, Double price, Double rating, LocalDate releaseDate,
			String image, String status, String genres) {
		super();
		this.name = name;
		this.author = author;
		this.review = review;
		this.price = price;
		this.rating = rating;
		this.releaseDate = releaseDate;
		this.image = image;
		this.status = status;
		this.genres = genres;
	}

	public Books(Long id, String name, String author, String review, Double price, Double rating, LocalDate releaseDate,
			String image, String status, String genres) {
		super();
		this.id = id;
		this.name = name;
		this.author = author;
		this.review = review;
		this.price = price;
		this.rating = rating;
		this.releaseDate = releaseDate;
		this.image = image;
		this.status = status;
		this.genres = genres;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getRating() {
		return rating;
	}

	public void setRating(Double rating) {
		this.rating = rating;
	}

	public LocalDate getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(LocalDate releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getGenres() {
		return genres;
	}

	public void setGenres(String genres) {
		this.genres = genres;
	}

	@Override
	public String toString() {
		return "Books [id=" + id + ", name=" + name + ", author=" + author + ", review=" + review + ", price=" + price
				+ ", rating=" + rating + ", releaseDate=" + releaseDate + ", image=" + image + ", status=" + status
				+ ", genres=" + genres + "]";
	}


}
