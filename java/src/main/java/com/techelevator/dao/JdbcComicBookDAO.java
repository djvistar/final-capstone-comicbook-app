package com.techelevator.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.ComicBook;
@Component
public class JdbcComicBookDAO implements ComicBookDAO {
	
	
	
	private JdbcTemplate jdbcTemplate;
	
	public JdbcComicBookDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	};
	
	
	

	@Override
	public void saveComic(ComicBook comic) {		
		String sqlSaveComic= "INSERT INTO issue(issue_id, issue_number, issue_name, volume_name, cover_url) " + //need to add volume ID to model
                "VALUES (?, ?, ?, ?, ?, ?)";
		
		jdbcTemplate.update(sqlSaveComic, comic.getComicId(), comic.getIssueNumber(), comic.getTitle(), comic.getVolumeName(), comic.getImage()); //comic.getIssueTitle(),, comic.getComicDescription(),comic.getPublisher(),
		
	}
	

	@Override //works to list ALL issues in DB -- query in postman-- http://localhost:8080/comics
	public List<ComicBook> listAllComicBooks() { 
		List<ComicBook> allComics = new ArrayList<>();
		String sqlGetAllComics = "SELECT issue_id AS issueId, issue_name AS title, issue_number AS issue_number  FROM issue ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAllComics);
		while(results.next()) {
			allComics.add(mapRowToComicBook(results));
			
		}
		return allComics;
	}




	@Override
	public List<ComicBook> listComicsByCollectionId(int collectionId) {
		List<ComicBook> comicBooks = new ArrayList<>();
		
		String sqlGetComicsByCollectionId = "select * from issue " + 
				"Join collections on issue.issue_id = collections.issue_id " + 
				"where collection_id = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetComicsByCollectionId, collectionId);
		while(results.next()) {
			comicBooks.add(mapRowToComicBook(results));
			
		}
		
		return comicBooks;
	}
	
	

	@Override
	public void deleteComic(int comicId) {	
		String sqlDeleteComic = "DELETE FROM issue WHERE issue_id = ? ";
		jdbcTemplate.update(sqlDeleteComic, comicId);
		
	}
	
	

	@Override
	public void updateComic(ComicBook comic) {//reworked, but don't think we need to update info for the indiv issues as that info will be coming straight from API
		String sqlUpdateComic = "UPDATE issue " +
		"SET issue_id = ?, issue_name = ?, issue_number = ?,  cover_url= ? "+ //publisher = ?,volume_name = ?  comic_description = ? " +volume_name = ?,volume_id = ?,
				"WHERE comic_id = ? ";
		jdbcTemplate.update(sqlUpdateComic,comic.getComicId(),comic.getTitle(), comic.getIssueNumber(),comic.getImage()//comic.getPublisher(), comic.getComicDescription(),comic.getIssueTitle(),
				);
		
	}
	

	@Override
	public ComicBook getComicById(int comicId) {
		ComicBook comic = new ComicBook();
		String sql = "SELECT issue_id AS issueId, issue_name AS title, issue_number AS issue_number FROM issue WHERE issue_id = ? ";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, comicId);
		if(results.next()) {
			comic = mapRowToComicBook(results);
			
		}else {
			
			System.out.println("Comic not found!");
		}
		
		
		return comic;
		
	}
	
	
	private ComicBook mapRowToComicBook(SqlRowSet results) { // will need to revisit for further functionality once DB updated
		ComicBook comicBook = new ComicBook();
		
		comicBook.setComicId(results.getInt("issueId"));
		comicBook.setTitle(results.getString("title"));
		//comicBook.setIssueTitle(results.getString("issue_title"));
		comicBook.setIssueNumber(results.getInt("issue_number"));
//		comicBook.setPublisher(results.getString("publisher"));
//		comicBook.setComicDescription(results.getString("comic_description"));
		//"SELECT issue_id AS issueId, issue_name AS title, issue_number AS issue_number  FROM issue ";
		return comicBook;
	}
	
	
	

}
