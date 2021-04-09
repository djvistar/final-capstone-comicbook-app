package com.techelevator.model;

import java.util.List;

public class Collection {

	private int collectionId; 					// user_collections.collection_id
	private int userId;							// users.user_id
	private String name;						//Not named in DB        ********
	private String collectionDescription;		//Not IN DB 			*********
	private String username;					//
	private List<ComicBook> comicsInCollection;	//query built
	
	//constructor
	public Collection (int collectionId, int userId, String name, String description, String username) {
		this.collectionId = collectionId;
		this.userId = userId;
		this.name = name;
		this.collectionDescription = collectionDescription;
		this.username = username;
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
