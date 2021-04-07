package com.techelevator.dao;

import java.util.List;

import com.techelevator.model.ComicBook;
import com.techelevator.model.User;

public interface ComicBookDAO {

	
	public void saveComic(ComicBook comicBook);
	
    List<ComicBook> listAllComicBooks();
	
	List<ComicBook> listAllComicByCollectionId(int collectionId);
	
	public void deleteComic(int comicId);
	
	public void updateComic(ComicBook comicBook);
	
	public void getComicById(int comicId);
	

}
