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
//@RequestMapping("/api")
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
	
	
	@RequestMapping(value = "/collections/create", method = RequestMethod.POST)
	public void addCollection(@RequestBody Collection collection, Principal principal) {
		if( /* collection == null  || */ collection.getName() == null) {
			throw new ResponseStatusException(
					HttpStatus.BAD_REQUEST, "Bad Request"); // create is getting to this point in post man
// Error From Postman, looking into it.			
//			{
//			    "timestamp": "2021-04-10T14:18:56.289+00:00",
//			    "status": 500,
//			    "error": "Internal Server Error",
//			    "message": "PreparedStatementCallback; SQL [INSERT INTO user_collections(collection_id, user_id, collection_name) VALUES (?,?,?) ]; ERROR: null value in column \"user_id\" violates not-null constraint\n  Detail: Failing row contains (0, null, null).; nested exception is org.postgresql.util.PSQLException: ERROR: null value in column \"user_id\" violates not-null constraint\n  Detail: Failing row contains (0, null, null).",
//			    "path": "/collections/create"
//			}
			
		} else {
			collectionDAO.saveCollection(collection);
		}
		
	}
	
	@RequestMapping(value = "/collections/user/{username}", method = RequestMethod.GET)
	public List<Collection> getCollectionsByUsername(@PathVariable String username){
		List<Collection> collections = collectionDAO.listCollectionByUsername(username);
		for (Collection collection: collections) {
			List<ComicBook> comicsInCollection = comicBookDAO.listComicsByCollectionId(collection.getCollectionId());
			collection.setComicsInCollection(comicsInCollection);
		}
		return collections;
	}
	
	
	@RequestMapping(value = "/collections/{collectionId}", method = RequestMethod.GET)
	public Collection getCollectionById(@PathVariable int collectionId) {
		Collection collection = collectionDAO.getCollectionById(collectionId);
	List<ComicBook> comics = comicBookDAO.listComicsByCollectionId(collectionId);
	collection.setComicsInCollection(comics);
	return collection;
	}
	
	@RequestMapping(value = "/collections/{collectionId}", method = RequestMethod.PUT)
	public void updateCollection(@RequestBody Collection collection) {
		collectionDAO.updateCollection(collection);
	}
	
	
	@RequestMapping(value = "/collections/{collectionId}", method = RequestMethod.DELETE)
	public void deleteCollection(@PathVariable int collectionId) {
		collectionDAO.deleteCollection(collectionId);
	}
	
	@RequestMapping(value = "/collections/{collectionId}/{comicId}/save", method = RequestMethod.POST)
	public void addComicToCollection(@PathVariable int collectionId, @PathVariable int comicId) {
		collectionDAO.addComicToCollection(comicId, collectionId);
	}
	
	@RequestMapping(value = "/collections/{collectionId}/{comicId}", method = RequestMethod.DELETE)
	public void deleteComicFromCollection(@PathVariable int collectionId, @PathVariable int comicId) {
		collectionDAO.deleteComicFromCollection(comicId, collectionId);
	}
	
	
	
	
}
