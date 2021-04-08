package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.model.ComicBook;

public class JdbcComicBookDAO implements ComicBookDAO {
	
	
	
	private JdbcTemplate jdbcTemplate;
	
	public JdbcComicBookDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	};
	
	
	

	@Override
	public void saveComic(ComicBook comic) {
		// TODO Auto-generated method stub
		
		String sqlSaveComic= "INSERT INTO comic () " +
		                       "VALUES () ";
		
		jdbcTemplate.update(sqlSaveComic, comic.getTitle(), comic.getIssueTitle(),
				comic.getIssueNumber(), comic.getPublisher(), comic.getImage(), comic.getComicDescription());
		
	}
	

	@Override
	public List<ComicBook> listAllComicBooks() {
		// TODO Auto-generated method stub
		List<ComicBook> allComics = new ArrayList<>();
		String sqlGetAllComics = "SELECT * FROM comic ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllComics);
		while(results.next()) {
			allComics.add(mapRowToComicBook(results));
			
		}
		return allComics;
	}




	@Override
	public List<ComicBook> listComicsByCollectionId(int collectionId) {
		// TODO Auto-generated method stub
		List<ComicBook> comicBooks = new ArrayList<>();
		
		String sqlGetComicsByCollectionId = "SELECT ";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetComicsByCollectionId, collectionId);
		while(results.next()) {
			comicBooks.add(mapRowToComicBook(results));
			
		}
		
		return comicBooks;
	}

	@Override
	public void deleteComic(int comicId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateComic(ComicBook comicBook) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getComicById(int comicId) {
		// TODO Auto-generated method stub
		
	}
	
	
	private ComicBook mapRowToComicBook(SqlRowSet results) {
		ComicBook comicBook = new ComicBook();
		
		comicBook.setComicId(results.getInt("comic_id"));
		comicBook.setTitle(results.getString("title"));
		comicBook.setIssueTitle(results.getString("issue_title"));
		comicBook.setIssueNumber(results.getInt("issue_number"));
		comicBook.setPublisher(results.getString("publisher"));
		comicBook.setComicDescription(results.getString("comic_description"));
		
		return comicBook;
	}
	
	
	

}
