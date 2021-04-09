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
@RequestMapping("/api")
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
	
	
	
	@RequestMapping( value = "/comics/save", method = RequestMethod.POST)
	public void addComic(@RequestBody ComicBook comic) {
		comicBookDAO.saveComic(comic);
	}
	
	
	@RequestMapping(value = "/comics", method = RequestMethod.GET)
	public List<ComicBook> listAllComics(){
		return comicBookDAO.listAllComicBooks();
	}
	
	@RequestMapping(value = "/comics/collection/{collectionId}", method = RequestMethod.GET)
	public List<ComicBook> getComicsByCollectionId(@PathVariable int collectionId){
		List<ComicBook> collection = comicBookDAO.listComicsByCollectionId(collectionId);
		return collection;
	}
	
	
	@RequestMapping(value = "/comics/{comicId}", method = RequestMethod.GET)
	public ComicBook getComicById(@PathVariable int comicId) {
		ComicBook comic = comicBookDAO.getComicById(comicId);
		return comic;
	}
	
	
	@RequestMapping(value = "/comics/{comicId}", method = RequestMethod.DELETE)
	public void deleteComic(@PathVariable int comicId) {
		comicBookDAO.deleteComic(comicId);
	}
	
	
	@RequestMapping (value = "/comics/{comicId}", method = RequestMethod.PUT)
	public void updateComic(@RequestBody ComicBook comic) {
		comicBookDAO.updateComic(comic);
	}
	
	
	
	
}
