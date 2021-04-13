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

	// Collection collection = new Collection();
	ComicBook comic = new ComicBook();

//	@Override
//	public void saveCollection(int collectionId, int userId, String collectionName) {
//		String sqlSaveCollection = "INSERT INTO user_collections(collection_id, user_id, collection_name) "
//				+ "VALUES (?,?,?) ";
//
//		jdbcTemplate.update(sqlSaveCollection, collection.getUserId(), collection.getCollectionDescription(),
//				collection.getName());
//
//	}
	// RETURNS LIST OF COLLECTION OBJECTS BASED ON USERNAME
	@Override
	public List<Collection> listCollectionByUsername(String username) {
		List<Collection> collections = new ArrayList<>();

		String sqlGetCollectionsByUsername = "SELECT collection_name, collection_id, users.user_id, users.username FROM user_collections JOIN users on user_collections.user_id = users.user_id WHERE users.username = ?";
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

//
//***************************** works as of 4/10 1:58pm
//	@Override
//	public List<ComicBook> getCollectionById(int collectionId) {
//		List<ComicBook> issuesInCollection = new ArrayList<ComicBook>();
//
//		String sql = "SELECT issue.issue_id AS comicId, issue.issue_name AS title, issue.issue_number AS issue_number, issue.cover_url AS cover_image, issue.volume_name AS volume_name "
//				+ " FROM issue JOIN collections on issue.issue_id = collections.issue_id WHERE collections.collection_id = ?  ";
//
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sql, collectionId);
//		while (results.next()) {
//			ComicBook comic = mapRowToComicBook(results);
//			issuesInCollection.add(comic);
//
//		}
//		return issuesInCollection;
	// Collection collection = new Collection(); moved to top-Blase
//		String sql = "SELECT * FROM collections WHERE collection_id = ? ";
	// String sql = "SELECT issue.issue_id, issue_name, issue_number, cover_url,
	// volume_name FROM issue JOIN collections on issue.issue_id =
	// collections.issue_id WHERE collections.collection_id = ? ";

	// , issue_name, issue_number, cover_url, volume_name */

//	}

//	@Override
//	public Collection getCollectionInfoByID(int collectionId) {
//		String sqlQuery = "SELECT collection_name AS collectionname, collection_id AS collectionid FROM user_collections WHERE collection_id = ?";
//		Collection collection = new Collection();
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlQuery, collectionId);
//		while (results.next()) {
//			collection = mapRowToCollection(results);
//		}
//		return collection;
//	}

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

//	@Override
//	public List<Collection> listCollectionByUsername(String username) {
//		List<Collection> collections = new ArrayList<>();
//
//		String sqlGetCollectionsByUsername = "SELECT collection_name AS collectionName, collection_id AS collectionId FROM user_collections JOIN users on user_collections.user_id = users.user_id WHERE users.username = ?";
//		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetCollectionsByUsername, username);
//		while (results.next()) {
//			collections.add(mapRowToCollection(results));
//
//		}
//
//		return collections;
//	}

	@Override
	public void addComicToCollection(ComicBook comic, int collectionId) {// (issue need to update arguments // save
																			// comic id, add id to collection, pass
																			// whole comic
		// String sqlAddComicToCollection = "select issue_id from issue where issue_id =
		// ?";
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
	// jdbcTemplate.update(sqlSaveCollection, newCollection.getUser_id(),//pull id
	// from principal
	// newCollection.getCollection_name());
	// do this regardless
	// + "insert into collections (inventory_id, collection_id, issue_id ) "
	// +"values(?,?,?);"; // use coll_id and issue.issue_id, remove inv id

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

	private Collection mapRowToCollection(SqlRowSet results) {

		Collection newCollection = new Collection();
		newCollection.setCollection_name(results.getString("collection_name"));
		newCollection.setCollection_id(results.getInt("collection_id"));
		newCollection.setUser_id(results.getInt("user_id"));
		newCollection.setUsername(results.getString("username"));
		return newCollection;
	}

	// ***************************** works as of 4/10 1:58pm
	private ComicBook mapRowToComicBook(SqlRowSet results) {
		ComicBook newComic = new ComicBook();

		// Collection collection = new Collection();

//		collection.setCollectionId(results.getInt("collections.collection_id"));
//		collection.setInventoryId(results.getInt("inventory_id"));
		newComic.setComicId(results.getInt("comicid"));
		newComic.setTitle(results.getString("title"));
		newComic.setIssueNumber(results.getInt("issue_number"));
		newComic.setImage(results.getString("cover_image"));
		newComic.setVolumeName(results.getString("volume_name"));
//		collection.setCollectionDescription(results.getString("collection_description"));
//		collection.setUsername(results.getString("username"));

		return newComic;
// issue.volume_name AS volume_name
	}

}
