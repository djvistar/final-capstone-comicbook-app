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
		
		String sqlDeleteComic = "DELETE FROM comic WHERE comic_id = ? ";
		jdbcTemplate.update(sqlDeleteComic, comicId);
		
	}
	
	

	@Override
	public void updateComic(ComicBook comic) {
		// TODO Auto-generated method stub
		String sqlUpdateComic = "UPDATE comic " +
		"SET title = ?, issue_title = ?, issue_number = ?, publisher = ?, comic_description = ? " +
				"WHERE comic_id = ? ";
		jdbcTemplate.update(sqlUpdateComic, comic.getTitle(), comic.getIssueTitle(), comic.getIssueNumber(),
				comic.getPublisher(), comic.getComicDescription(),comic.getComicId());
		
	}
	

	@Override
	public ComicBook getComicById(int comicId) {
		ComicBook comic = new ComicBook();
		String sql = "SELECT * FROM comic WHERE comic_id = ? ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, comicId);
		if(results.next()) {
			comic = mapRowToComicBook(results);
			
		}else {
			
			System.out.println("Comic not found!");
		}
		
		
		return comic;
		
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
