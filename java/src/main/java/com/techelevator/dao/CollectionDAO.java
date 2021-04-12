package com.techelevator.dao;

import java.security.Principal;
import java.util.List;

import com.techelevator.model.Collection;
import com.techelevator.model.ComicBook;
import com.techelevator.model.User;

public interface CollectionDAO {

	//public void saveCollection(int collectionId, int userId, String collectionName);
	 void saveCollection(Collection newCollection);
	
	public List<ComicBook> getCollectionById(int collectionId);
	
	List<Collection> listAllCollectionsByUserId(int userId);
	
	List<Collection> listCollectionByUsername(String username);
		
	public void  addComicToCollection(ComicBook comic, int collectionId);
	
	public void deleteComicFromCollection(int comicId, int collectionId);
	
	public void deleteCollection(int collectionId);
	
	public void updateCollection(Collection collection);

//	Collection getCollectionInfoByID(int collectionId);

	
	


	
	
	
	
	
	
}
