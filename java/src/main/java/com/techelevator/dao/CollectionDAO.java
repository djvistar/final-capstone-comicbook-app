package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.Collection;
import com.techelevator.model.ComicBook;
import com.techelevator.model.User;

public interface CollectionDAO {

	public void saveCollection(Collection collection);
	
	public Collection getCollectionById(int collectionId);
	
	List<Collection> listAllCollectionsByUserId(Long userId);
	
	List<Collection> listCollectionByUsername(String username);
	
	public void  addComicToCollection(int comicId, int collectionId);
	
	public void deleteComicFromCollection(int comicId, int collectionId);
	
	public void deleteCollection(int CollectionId);
	
	public void updateCollection(Collection collection);
	
	
	
	
	
}
