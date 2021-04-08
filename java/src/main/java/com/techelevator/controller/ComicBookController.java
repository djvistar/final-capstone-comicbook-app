package com.techelevator.controller;

import java.util.List;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.techelevator.dao.CollectionDAO;
import com.techelevator.dao.ComicBookDAO;
import com.techelevator.dao.UserDAO;
import com.techelevator.model.ComicBook;

@RestController
@RequestMapping("/comics")
@CrossOrigin
public class ComicBookController {

	
	private CollectionDAO collectionDAO;
	private ComicBookDAO comicBookDAO;
	private UserDAO userDAO;
	
	
	public ComicBookController(CollectionDAO collectionDAO, ComicBookDAO comicBookDAO, UserDAO userDAO) {
		
		this.collectionDAO = collectionDAO;
		this.comicBookDAO = comicBookDAO;
		this.userDAO = userDAO;
	}
	
	
	
	@RequestMapping( value = "/save", method = RequestMethod.POST)
	public void addComic(@RequestBody ComicBook comic) {
		comicBookDAO.saveComic(comic);
	}
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public List<ComicBook> listAllComics(){
		return comicBookDAO.listAllComicBooks();
	}
	
	@RequestMapping(value = "/collection/{collectionId}", method = RequestMethod.GET)
	public List<ComicBook> getComicsByCollectionId(@PathVariable int collectionId){
		List<ComicBook> collection = comicBookDAO.listComicsByCollectionId(collectionId);
		return collection;
	}
	
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ComicBook getComicById(@PathVariable int comicId) {
		ComicBook comic = comicBookDAO.getComicById(comicId);
		return comic;
	}
	
	
	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public void deleteComic(@PathVariable int comicId) {
		comicBookDAO.deleteComic(comicId);
	}
	
	
	@RequestMapping (value = "/{id}", method = RequestMethod.PUT)
	public void updateComic(@RequestBody ComicBook comic) {
		comicBookDAO.updateComic(comic);
	}
	
	
	
	
}
