package com.techelevator.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.techelevator.dao.CollectionDAO;
import com.techelevator.dao.ComicBookDAO;
import com.techelevator.dao.UserDAO;
import com.techelevator.model.Collection;
import com.techelevator.model.ComicBook;





@RestController
@RequestMapping("/collections")
@CrossOrigin
public class CollectionController {

	private CollectionDAO collectionDAO;
	private ComicBookDAO comicBookDAO;
	private UserDAO userDAO;
	
	
	public CollectionController(CollectionDAO collectionDAO, ComicBookDAO comicBookDAO, UserDAO userDAO) {
		this.collectionDAO = collectionDAO;
		this.comicBookDAO = comicBookDAO;
		this.userDAO = userDAO;
	}
	
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public void addCollection(@RequestBody Collection collection, Principal principal) {
		if(collection == null || collection.getName() == null) {
			throw new ResponseStatusException(
					HttpStatus.BAD_REQUEST, "Bad Request");
			
		} else {
			collectionDAO.saveCollection(collection);
		}
		
	}
	
	@RequestMapping(value = "/user/{username}", method = RequestMethod.GET)
	public List<Collection> getCollectionsByUsername(@PathVariable String username){
		List<Collection> collections = collectionDAO.listCollectionByUsername(username);
		for (Collection collection: collections) {
			List<ComicBook> comicsInCollection = comicBookDAO.listComicsByCollectionId(collection.getCollectionId());
			collection.setComicsInCollection(comicsInCollection);
		}
		return collections;
	}
	
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public Collection getCollectionById(@PathVariable int collectionId) {
		Collection collection = collectionDAO.getCollectionById(collectionId);
	List<ComicBook> comics = comicBookDAO.listComicsByCollectionId(collectionId);
	collection.setComicsInCollection(comics);
	return collection;
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.PUT)
	public void updateCollection(@RequestBody Collection collection) {
		collectionDAO.updateCollection(collection);
	}
	
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void deleteCollection(@PathVariable int collectionId) {
		collectionDAO.deleteCollection(collectionId);
	}
	
	
	
	
}
