package com.techelevator.model;

public class ComicBook {

	
	private int comicId;
	private String title;
	private String issueTitle;
	private int issueNumber;
	private String publisher;
	private String image;
	private String description;
	private int volumeNumber;
	
	//constructor
	public ComicBook(int comicId, String title, String issueTitle, int issueNumber, 
			String publisher, String image, String description, int volumeNumber) {
		this.comicId = comicId;
		this.title = title;
		this.issueTitle = issueTitle;
		this.issueNumber = issueNumber;
		this.publisher = publisher;
		this.image = image;
		this.description = description;
		this.volumeNumber = volumeNumber;
	}
	
	//getters and setters
	
	public int getComicId() {
		return comicId;
	}
	public void setComicId(int comicId) {
		this.comicId = comicId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIssueTitle() {
		return issueTitle;
	}
	public void setIssueTitle(String issueTitle) {
		this.issueTitle = issueTitle;
	}
	public int getIssueNumber() {
		return issueNumber;
	}
	public void setIssueNumber(int issueNumber) {
		this.issueNumber = issueNumber;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getVolumeNumber() {
		return volumeNumber;
	}
	public void setVolumeNumber(int volumeNumber) {
		this.volumeNumber = volumeNumber;
	}
	
	
	
	
}
