package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.ComicBook;
import com.techelevator.model.User;

public interface ComicBookDAO {

	
	public void saveComic(ComicBook comic);
	
    List<ComicBook> listAllComicBooks();
	
	List<ComicBook> listComicsByCollectionId(int collectionId);
	
	public void deleteComic(int comicId);
	
	public void updateComic(ComicBook comic);
	
	public ComicBook getComicById(int comicId);
	

}
