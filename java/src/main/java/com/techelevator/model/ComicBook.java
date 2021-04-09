package com.techelevator.model;

public class ComicBook {

	
	private int comicId; //db table issue, 			column issue_id
	private String title; //db table issue,  DUPLICATE?					********
	private String issueTitle; //db table issue,    column issue_name
	private int issueNumber;//db table issue,		issue_number
	private String publisher;//not in DB YET     						********
	private String image;//db table issue,    		cover_url
	private String comicDescription;// NOT IN DB YET 					********
	private int volumeNumber;//db we have volume name Not volume number,********    
	
	//constructor
	public ComicBook(int comicId, String title, String issueTitle, int issueNumber, 
			String publisher, String image, String comicDescription, int volumeNumber) {
		this.comicId = comicId;
		this.title = title;
		this.issueTitle = issueTitle;
		this.issueNumber = issueNumber;
		this.publisher = publisher;
		this.image = image;
		this.comicDescription = comicDescription;
		this.volumeNumber = volumeNumber;
	}
	
	//getters and setters
	
	public ComicBook() {
		// TODO Auto-generated constructor stub
	}

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
	public String getComicDescription() {
		return comicDescription;
	}
	public void setComicDescription(String comicDescription) {
		this.comicDescription = comicDescription;
	}
	public int getVolumeNumber() {
		return volumeNumber;
	}
	public void setVolumeNumber(int volumeNumber) {
		this.volumeNumber = volumeNumber;
	}
	
	
	
	
}
