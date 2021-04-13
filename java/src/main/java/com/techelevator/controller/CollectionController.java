package com.techelevator.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.techelevator.dao.CollectionDAO;
import com.techelevator.dao.ComicBookDAO;
import com.techelevator.dao.UserDAO;
import com.techelevator.model.Collection;
import com.techelevator.model.ComicBook;
import com.techelevator.model.User;

@RestController

//@RequestMapping("/api")
@CrossOrigin

public class CollectionController {
	@Autowired
	public CollectionDAO collectionDAO;
	@Autowired
	public ComicBookDAO comicBookDAO;
	@Autowired
	public UserDAO userDAO;

	// RETURN LIST OF COLLECTION OBJECTS FOR USER REQUESTING THEM
	@RequestMapping(value = "/collections", method = RequestMethod.GET)
	public List<Collection> getCollectionByUser(Principal principal) {
		List<Collection> collections = collectionDAO.listCollectionByUsername(principal.getName());
		return collections;
	}

	// RETURNS COLLECTION OBJECT BASED ON GIVEN ID
	@RequestMapping(value = "/collections/{collectionId}", method = RequestMethod.GET)
	public Collection getCollectionById(@PathVariable int collectionId) {
		Collection collection = collectionDAO.getCollectionById(collectionId);
		return collection;
	}

	// RETURNS LIST OF COMICS BASED ON COLLECTION ID
	@RequestMapping(value = "/collections/{collectionId}/issues", method = RequestMethod.GET)
	public List<ComicBook> getCollectionContentsById(@PathVariable int collectionId) {
		List<ComicBook> collectionContents = collectionDAO.listCollectionContentsById(collectionId);
		return collectionContents;
	}

	// CREATES A COLLECTION GIVEN A COLLECTION OBJECT WITH A NAME
	@PreAuthorize("isAuthenticated()")
	@ResponseStatus(HttpStatus.CREATED)
	@RequestMapping(value = "/collections", method = RequestMethod.POST) // removing /create from url
	public void addCollection(@RequestBody Collection newCollection, Principal principal) {//
//		if (newCollection != null) {
//			System.out.println("Attempting to create collection " + newCollection.getName() + " with values:\nuserId: "
//					+ newCollection.getUserId());
//			}
//
//		if (newCollection == null || newCollection.getName() == null) {
//			throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Empty Request");
//		}
		int id = userDAO.findIdByUsername(principal.getName());
		newCollection.setUser_id(id);
		newCollection.setUsername(principal.getName());
		collectionDAO.saveCollection(newCollection);
	}

	@PreAuthorize("isAuthenticated()")
	@ResponseStatus(HttpStatus.CREATED)
	@RequestMapping(value = "/collections/{collectionId}", method = RequestMethod.POST)
	public void addComicToCollection(@RequestBody ComicBook comic, @PathVariable int collectionId) {
		collectionDAO.addComicToCollection(comic, collectionId);
	}

	/*
	 * METHODS BELOW ARE NOT FINISHED
	 */

	@RequestMapping(value = "/collections/user/{username}", method = RequestMethod.GET) // returns empty array
	public List<Collection> getCollectionsByUsername(@PathVariable String username) {
		List<Collection> collections = collectionDAO.listCollectionByUsername(username);
		for (Collection collection : collections) {
			List<ComicBook> comicsInCollection = comicBookDAO.listComicsByCollectionId(collection.getCollection_id());
		}
		return collections;
	}

	@RequestMapping(value = "/collections/{collectionId}", method = RequestMethod.PUT)
	public void updateCollection(@RequestBody Collection collection) {
		collectionDAO.updateCollection(collection);
	}

	@RequestMapping(value = "/collections/{collectionId}", method = RequestMethod.DELETE)
	public void deleteCollection(@PathVariable int collectionId) {
		collectionDAO.deleteCollection(collectionId);
	}

	@RequestMapping(value = "/collections/{collectionId}/{comicId}", method = RequestMethod.DELETE)
	public void deleteComicFromCollection(@PathVariable int collectionId, @PathVariable int comicId) {
		collectionDAO.deleteComicFromCollection(comicId, collectionId);
	}

	@RequestMapping(value = "/users", method = RequestMethod.GET)
	public List<User> getAllUsers() {
		List<User> users = userDAO.findAll();
		return users;
	}

	@RequestMapping(value = "/users/single/{userId}", method = RequestMethod.GET)
	public User getUserById(@PathVariable long userId) {
		User user = userDAO.getUserById((long) userId);
		return user;
	}

	@RequestMapping(value = "/users/{username}", method = RequestMethod.GET)
	public User getUserByName(@PathVariable String username) {
		User user = userDAO.findByUsername(username);
		return user;
	}
}

//	@RequestMapping(value = "/collections/create", method = RequestMethod.POST)
//	public void addCollection(@RequestBody int userId, int collectionId, String collectionName) {
//		if(  userId < 1  ) {//||  collectionId = null) {
//			throw new ResponseStatusException(
//					HttpStatus.BAD_REQUEST, "Bad Request"); // create is getting to this point in post man
// Error From Postman, looking into it.			
//			{
//			    "timestamp": "2021-04-10T14:18:56.289+00:00",
//			    "status": 500,
//			    "error": "Internal Server Error",
//			    "message": "PreparedStatementCallback; SQL [INSERT INTO user_collections(collection_id, user_id, collection_name) VALUES (?,?,?) ]; ERROR: null value in column \"user_id\" violates not-null constraint\n  Detail: Failing row contains (0, null, null).; nested exception is org.postgresql.util.PSQLException: ERROR: null value in column \"user_id\" violates not-null constraint\n  Detail: Failing row contains (0, null, null).",
//			    "path": "/collections/create"
//			}
//		} else {
//			collectionDAO.saveCollection( userId, collectionId, collectionName);
//			// collectionDAO.saveCollection(collection);
//		}
//	}
//
//public CollectionController(CollectionDAO collectionDAO, ComicBookDAO comicBookDAO, UserDAO userDAO) {
//	this.collectionDAO = collectionDAO;
//	this.comicBookDAO = comicBookDAO;
//	this.userDAO = userDAO;
//}

//@RequestMapping(value = "/collections/create", method = RequestMethod.POST)
//    public void addCollection(@RequestBody Collection collection, Principal principal) {
//	
//	if(collection == null || collection.getName() == null) {
//		throw new ResponseStatusException(
//  	          HttpStatus.BAD_REQUEST, "Empty Request");
//	}
//	else {
//    	collectionDAO.saveCollection(collection.setUserId(userDAO.findIdByUsername((principal.getName()))));
//    }
//}
