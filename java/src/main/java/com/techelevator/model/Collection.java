package com.techelevator.model;

import java.util.List;

public class Collection {

	// user_collections.collection_id, automatically added by DB
	private int collection_id;

	// users.user_id
	private int user_id;

	// user_collections.collection_name
	private String collection_name;

	// users.username
	private String username;
	
	private String collectionDescription;
	
//	private List<ComicBook> comicsInCollection;
//	private int issueId;
//	private int inventoryId;// query built

	public int getCollection_id() {
		return collection_id;
	}

	public void setCollection_id(int collection_id) {
		this.collection_id = collection_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}

	public String getCollection_name() {
		return collection_name;
	}

	public void setCollection_name(String collection_name) {
		this.collection_name = collection_name;
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getCollectionDescription() {
		return collectionDescription;
	}

	public void setCollectionDescription(String collectionDescription) {
		this.collectionDescription = collectionDescription;
	}

	// constructor
	public Collection(int collection_id, int user_id,
			String collection_name) /* , String description,, int issueId, int inventoryId String username ) */ {
		this.collection_id = collection_id;
		this.user_id = user_id;
		this.collection_name = collection_name;
		// this.issueId = issueId;
		// this.inventoryId = inventoryId;
		// this.collectionDescription = collectionDescription;
		// this.username = username;
	}

	public Collection() {
		// TODO Auto-generated constructor stub
	}

	// getters and setters

//	public int getIssueId() {
//		return issueId;
//	}
//
//	public void setIssueId(int issueId) {
//		this.issueId = issueId;
//	}
//
//	public int getInventoryId() {
//		return inventoryId;
//	}
//
//	public void setInventoryId(int inventoryId) {
//		this.inventoryId = inventoryId;
//	}
//

//

//
//	public List<ComicBook> getComicsInCollection() {
//		return comicsInCollection;
//	}
//
//	public void setComicsInCollection(List<ComicBook> comicsInCollection) {
//		this.comicsInCollection = comicsInCollection;
//	}

}
