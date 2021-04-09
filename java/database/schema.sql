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

insert into user_collections (collection_id, user_id)
values(1,1);
insert into user_collections (collection_id, user_id)
values(2,1);
insert into user_collections (collection_id, user_id)
values(3,2);
insert into user_collections (collection_id, user_id)
values(4,2);
insert into user_collections (collection_id, user_id)
values(5,1);
insert into user_collections (collection_id, user_id)
values(6,2);

--COMIC DAO
--inserts issue into db- works fine as long as pk is good
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(501, 123745, 'DuckMan!', 543221, 'USA NETWORK PRESENTS:', 'https://picsum.photos/id/237/200/300');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(502, 123445, 'BrainDrain Goes HayWire', 554321, 'Attack Of The Final Capstone', 'https://picsum.photos/id/237/200/300');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(503, 123345, 'Coach Carmichael is DarkSeid?!', 543321, 'Adventures of JavaGreen', 'https://picsum.photos/id/237/200/300');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(505, 123345, 'Blase VS Lobo', 543321, 'Not a DBA', 'https://picsum.photos/id/237/200/300');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(504, 112345, 'The Incredible Vic', 543421, 'KnockOut DAOs', 'https://picsum.photos/id/237/200/300');


--creates in collections table
insert into collections (inventory_id, collection_id, issue_id )
values(1,1,501);
insert into collections (inventory_id, collection_id, issue_id )
values(2,2,502);
insert into collections (inventory_id, collection_id, issue_id )
values(3,3,503);
insert into collections (inventory_id, collection_id, issue_id )
values(4,4,504);
insert into collections (inventory_id, collection_id, issue_id )
values(5,5,505);
insert into collections (inventory_id, collection_id, issue_id )
values(6,6,501);
insert into collections (inventory_id, collection_id, issue_id )
values(7,1,502);
insert into collections (inventory_id, collection_id, issue_id )
values(8,2,501);
insert into collections (inventory_id, collection_id, issue_id )
values(9,3,502);
insert into collections (inventory_id, collection_id, issue_id )
values(10,4,501);
insert into collections (inventory_id, collection_id, issue_id )
values(11,4,503);
insert into collections (inventory_id, collection_id, issue_id )
values(12,4,505);
insert into collections (inventory_id, collection_id, issue_id )
values(13,5,501);
insert into collections (inventory_id, collection_id, issue_id )
values(14,3,501);


COMMIT TRANSACTION;
