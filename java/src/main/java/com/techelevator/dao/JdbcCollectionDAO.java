package com.techelevator.dao;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.model.Collection;
import com.techelevator.model.ComicBook;
import com.techelevator.model.User;

@Component
public class JdbcCollectionDAO implements CollectionDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public JdbcCollectionDAO(DataSource datasource) {
		this.jdbcTemplate = new JdbcTemplate(datasource);
	};


	 Collection collection = new Collection();

	ComicBook comic = new ComicBook();

	
	// RETURNS LIST OF COLLECTION OBJECTS BASED ON USERNAME
	@Override
	public List<Collection> listCollectionByUsername(String username) {
		List<Collection> collections = new ArrayList<>();

		String sqlGetCollectionsByUsername = "SELECT user_collections.collection_name AS collectionName, user_collections.collection_id AS collectionId, users.user_id AS userId, users.username AS userName "
				+"FROM user_collections JOIN users on user_collections.user_id = users.user_id WHERE users.username = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetCollectionsByUsername, username);
		while (results.next()) {
			collections.add(mapRowToCollection(results));
		}
		return collections;
	}

	// RETURNS COLLECTION OBJECT BASED ON GIVEN ID
	@Override
	public Collection getCollectionById(int collectionId) {
		Collection collection = new Collection();
		String sql = "SELECT collection_name, user_collections.user_id, collection_id, users.username "
				+ "FROM user_collections "
				+ "JOIN users ON users.user_id = user_collections.user_id WHERE collection_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, collectionId);
		while (results.next()) {
			collection = mapRowToCollection(results);
		}
		return collection;
	}

	// RETURNS LIST OF COMICS BASED ON COLLECTION ID
	public List<ComicBook> listCollectionContentsById(int collectionId) {
		List<ComicBook> collectionContents = new ArrayList<>();
		String sql = "SELECT issue.issue_id AS comicId, issue.issue_name AS title, issue.issue_number AS issue_number, issue.cover_url AS cover_image, issue.volume_name AS volume_name "
				+ "FROM issue JOIN collections on issue.issue_id = collections.issue_id WHERE collections.collection_id = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, collectionId);
		while (results.next()) {
			collectionContents.add(mapRowToComicBook(results));
		}
		return collectionContents;
	}

	@Override
	public void saveCollection(Collection newCollection) {
		String sqlSaveCollection = "INSERT INTO user_collections (user_id, collection_name) " + "VALUES (?, ?) ";

		jdbcTemplate.update(sqlSaveCollection, newCollection.getUser_id(), newCollection.getCollection_name());
	}



	@Override
	public List<Collection> listAllCollectionsByUserId(int userId) {

		List<Collection> collections = new ArrayList<>();

		String sqlGetCollectionsByUserId = "SELECT collection_name FROM user_collections WHERE user_id = ?"; // alias
																												// needed?
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetCollectionsByUserId, userId);
		while (results.next()) {
			collections.add(mapRowToCollection(results));
		}

		return collections;
	}



	@Override
	public void addComicToCollection(ComicBook comic, int collectionId) {
		String sqlResults = "select issue_id from issue where issue_id = ? ";
		Boolean exists = false;
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlResults, comic.getComicId());
		while (results.next()) {
			exists = true;
		}
		if (exists == false) {

			String sqlAddComicToIssue = "INSERT INTO issue(issue_id, issue_number, issue_name, volume_name, cover_url, volume_id) "
					+ "VALUES (?, ?, ?, ?, ?, ?); ";

			jdbcTemplate.update(sqlAddComicToIssue, comic.getComicId(), comic.getIssueNumber(), comic.getTitle(),
					comic.getVolumeName(), comic.getImage(), comic.getVolumeId());
		}

		String sqlAddIssueToCollection = "insert into collections ( collection_id, issue_id ) " + "values(?,?);";
		jdbcTemplate.update(sqlAddIssueToCollection, collectionId, comic.getComicId());
	}
	

	@Override
	public void deleteComicFromCollection(int comicId, int collectionId) {
		String sqlDeleteComicFromCollection = "DELETE FROM collections WHERE (issue_id = ? AND collection_id = ?)  ";
		jdbcTemplate.update(sqlDeleteComicFromCollection, comicId, collectionId);

	}

	@Override
	public void deleteCollection(int collectionId) {
		String sqlDeleteCollection = "DELETE FROM collections WHERE collection_id = ?";
		jdbcTemplate.update(sqlDeleteCollection, collectionId);
		sqlDeleteCollection = "DELETE FROM user_collections WHERE collection_id = ?";
		jdbcTemplate.update(sqlDeleteCollection, collectionId);
	}

	@Override
	public void updateCollection(Collection collection) { // no info in db for this yet
		String sqlUpdateCollection = "UPDATE collection " + "SET user_d =?, name = ?, collection_description = ? "
				+ "WHERE collection_id =? ";
		jdbcTemplate.update(sqlUpdateCollection, collection.getUser_id(), collection.getCollection_name(),
				collection.getCollectionDescription(), collection.getCollection_id());

	}
//"SELECT user_collections.collection_name AS collectionName, user_collections.collection_id AS collectionId, users.user_id AS userId, users.username AS userName "

	private Collection mapRowToCollection(SqlRowSet results) {
		Collection newCollection = new Collection();

		newCollection.setCollection_name(results.getString("collectionName"));//AS collectionName
		newCollection.setCollection_id(results.getInt("collectionId"));
		newCollection.setUser_id(results.getInt("userId"));
		newCollection.setUsername(results.getString("userName"));
//=======
//		
//		newCollection.setCollection_name(results.getString("collection_name"));
//		newCollection.setCollection_id(results.getInt("collection_id"));
//		newCollection.setUser_id(results.getInt("user_id"));
//		newCollection.setUsername(results.getString("username"));
//>>>>>>> 6b50669956d653099083f8ba09287eb0235a4a95
		return newCollection;
	}

	// ***************************** works as of 4/10 1:58pm
	private ComicBook mapRowToComicBook(SqlRowSet results) {
		ComicBook newComic = new ComicBook();


		newComic.setComicId(results.getInt("comicid"));
		newComic.setTitle(results.getString("title"));
		newComic.setIssueNumber(results.getInt("issue_number"));
		newComic.setImage(results.getString("cover_image"));
		newComic.setVolumeName(results.getString("volume_name"));

		return newComic;

	}

}
