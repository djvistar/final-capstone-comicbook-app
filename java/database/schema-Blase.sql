BEGIN TRANSACTION;

DROP TABLE IF EXISTS collections;
DROP TABLE IF EXISTS user_collections;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS issue;

DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_collection_id;
DROP SEQUENCE IF EXISTS seq_inventory_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
  CREATE SEQUENCE seq_collection_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;
  
  CREATE SEQUENCE seq_inventory_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;

--users created first, not reliant on other tables
CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

--issues created second, not reliant on other tables
CREATE TABLE issue (
issue_id int NOT NULL,
issue_number int Not Null,
issue_name varchar(200),
volume_id int NOT NULL,
volume_name varchar(200),
cover_url varchar,
Constraint PK_issue PRIMARY KEY (issue_id)
);
--user_collections created third, reliant only on USERS
CREATE TABLE user_collections (
        collection_id int NOT NULL,
        user_id int NOT NULL,
        Constraint PK_userCollection PRIMARY KEY (collection_id),
        CONSTRAINT FK_user FOREIGN KEY(user_id) REFERENCES users(user_id)
        --Constraint fk_collection Foreign key (collection_id) references collections(collection_id)
);
--Collections created 4th reliant on and references both issues and user collections
CREATE TABLE collections(
inventory_id int DEFAULT nextval('seq_inventory_id'::regclass) NOT NULL,
collection_id int NOT NULL,
issue_id int,
Constraint PK_invID Primary Key (inventory_id),
Constraint FK_collectionsissue Foreign Key (issue_id) REFERENCES issue(issue_id),   
Constraint FK_collectionsid Foreign Key (collection_id)references user_collections(collection_id) 
);


INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

COMMIT TRANSACTION;
