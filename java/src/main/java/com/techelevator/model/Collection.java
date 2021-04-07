package com.techelevator.model;

public class Collection {

	private int collectionId;
	private int userId;
	private String name;
	private String description;
	private String username;
	
	//constructor
	public Collection (int collectionId, int userId, String name, String description, String username) {
		this.collectionId = collectionId;
		this.userId = userId;
		this.name = name;
		this.description = description;
		this.username = username;
	}
	
	//getters and setters
	public int getCollectionId() {
		return collectionId;
	}
	public void setCollectionId(int collectionId) {
		this.collectionId = collectionId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	
	
	
	
}
