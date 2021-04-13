package com.techelevator.model;

import java.util.List;

public class Collection {

	private int collection_id;
	private int user_id;
	private String collection_name;
	private String username;
	private String collectionDescription;

	// constructor
	public Collection(int collection_id, int user_id, String collection_name) {
		this.collection_id = collection_id;
		this.user_id = user_id;
		this.collection_name = collection_name;

	}

	public Collection() {
		// TODO Auto-generated constructor stub
	}

	// getters and setters

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
}
