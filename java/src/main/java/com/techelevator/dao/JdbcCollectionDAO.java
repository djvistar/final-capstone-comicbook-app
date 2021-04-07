package com.techelevator.dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.model.Collection;
import com.techelevator.model.User;



public class JdbcCollectionDAO implements CollectionDAO {
	
	
	
	private JdbcTemplate jdbcTemplate;
	
	public JdbcCollectionDAO(DataSource datasource) {	
		this.jdbcTemplate = new JdbcTemplate(datasource);
	};
	
	
	
	
	
	

	@Override
	public void saveCollection(Collection collection) {
		// TODO Auto-generated method stub
		String sqlSaveCollection = "INSERT INTO collection() " +
		                           "VALUES () ";
		
		jdbcTemplate.update(sqlSaveCollection, collection.getUserId(),
				collection.getName(), collection.getCollectionDescription());	
		
	}

	@Override
	public void getCollectionById(int collectionId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Collection> listAllCollectionsByUserId(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Collection> listCollectionByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addComicToCollection(User user, int comicId, int collectionId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComicFromCollection(int comicId, int collectionId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteCollection(int CollectionId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateCollection(Collection collection) {
		// TODO Auto-generated method stub
		
	}

	
	
	
}
