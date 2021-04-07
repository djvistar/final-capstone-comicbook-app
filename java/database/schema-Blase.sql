BEGIN TRANSACTION;

DROP SEQUENCE IF EXISTS seq_user_id;
DROP SEQUENCE IF EXISTS seq_collection_id;
DROP TABLE IF EXISTS user_collections;
DROP TABLE IF EXISTS collections;
DROP TABLE IF EXISTS issue;
DROP TABLE IF EXISTS users;

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


CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);
CREATE TABLE issue (
issue_id int NOT NULL,
issue_number int Not Null,
issue_name varchar(200),
volume_id int NOT NULL,
volume_name varchar(200),
cover_url varchar,
Constraint PK_issue PRIMARY KEY (issue_id)
 
);

CREATE TABLE collections(
collection_id int DEFAULT nextval('seq_collection_id'::regclass) NOT NULL,
issue_id int NOT NULL,
Constraint PK_Collections PRIMARY KEY (collection_id),
Constraint FK_collections Foreign Key (issue_id) REFERENCES issue(issue_id)     
);

CREATE TABLE user_collections (
        collection_id int NOT NULL,
        user_id int NOT NULL,
        Constraint PK_userCollection PRIMARY KEY (user_id, collection_id),
        CONSTRAINT FK_user FOREIGN KEY(user_id) REFERENCES users(user_id),
        CONSTRAINT FK_collectionid FOREIGN KEY (collection_id) references collections(collection_id)  
);

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

COMMIT TRANSACTION;