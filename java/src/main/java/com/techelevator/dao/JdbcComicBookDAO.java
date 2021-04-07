package com.techelevator.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

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
		return null;
	}

	@Override
	public List<ComicBook> listAllComicByCollectionId(int collectionId) {
		// TODO Auto-generated method stub
		return null;
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
	
	
	
	
	

}
