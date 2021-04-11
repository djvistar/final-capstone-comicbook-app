package com.techelevator.model;

import java.util.List;

public class Collection {

	private int collectionId; 					// user_collections.collection_id
	private int userId;							// users.user_id
	private String name;						//added to schema user_collections.collection_name       ********
	private String collectionDescription;		//Not IN DB 			*********
	private String username;					//
	private List<ComicBook> comicsInCollection;
	private int issueId;
	private int inventoryId;//query built
	
	//constructor
	public Collection (int collectionId, int userId, String name, int issueId, int inventoryId) /*, String description, String username )*/ {
		this.collectionId = collectionId;
		this.userId = userId;
		this.name = name;
		this.issueId = issueId;
		this.inventoryId = inventoryId;
		//this.collectionDescription = collectionDescription;
		//this.username = username;
	}
	
	

	public Collection() {
		// TODO Auto-generated constructor stub
	}



	//getters and setters
	public int getCollectionId() {
		return collectionId;
	}
	public void setCollectionId(int collectionId) {
		this.collectionId = collectionId;
	}
	public int getIssueId() {
		return issueId;
	}
	public void setIssueId(int issueId) {
		this.issueId = issueId;
	}
	public int getInventoryId() {
		return inventoryId;
	}
	public void setInventoryId(int inventoryId) {
		this.inventoryId = inventoryId;
	}
	public int getUserId() {
		return userId;
	}
	public Collection setUserId(int userId) {
		this.userId = userId;
		return this;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCollectionDescription() {
		return collectionDescription;
	}
	public void setCollectionDescription(String collectionDescription) {
		this.collectionDescription= collectionDescription;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}



	public List<ComicBook> getComicsInCollection() {
		return comicsInCollection;
	}



	public void setComicsInCollection(List<ComicBook> comicsInCollection) {
		this.comicsInCollection = comicsInCollection;
	}




	
	
	
	
	
}
