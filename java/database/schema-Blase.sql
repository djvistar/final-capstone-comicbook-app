BEGIN TRANSACTION;
--original schema file text

DROP TABLE IF EXISTS users;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
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

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

--end of original schema file text
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
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(159233,1 , 'Tasters Choice, Part. 1 of 5', 26611,'Chew','https://comicvine1.cbsistatic.com/uploads/scale_small/0/1867/825226-chew01_cover.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(163075,2 , 'Tasters Choice, Part. 2 of 5', 26611,'Chew','https://comicvine1.cbsistatic.com/uploads/scale_small/0/9116/866103-2.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values( 166274, 3, 'Tasters Choice, Part. 3 of 5', 26611,'Chew','https://comicvine1.cbsistatic.com/uploads/scale_small/4/45797/906153-chew__3___page_1.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values( 169324, 4, 'Tasters Choice, Part. 4 of 5', 26611,'Chew','https://comicvine1.cbsistatic.com/uploads/scale_small/4/48343/941128-178364_20090902003648_large.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(177633,5, 'Tasters Choice, Part. 5 of 5', 26611,'Chew','https://comicvine1.cbsistatic.com/uploads/scale_small/4/48343/999318-num_risation0001.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(184884 , 6, 'International Flavor, Part 1', 26611,'Chew','https://comicvine1.cbsistatic.com/uploads/scale_small/0/9116/1038717-6.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(500342 , 1, 'This One Last Job',84608 ,'','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/5368100-09b.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(503594 , 2, '',84608 ,'Tokyo Ghost','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/4802067-01a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(506230 , 3, '',84608 ,'Tokyo Ghost','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/4872402-02a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values( 508482, 4, '', 84608,'Tokyo Ghost','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/4918796-03a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values( 511557,5 , 'Ill Be Your Poison',84608,'Tokyo Ghost','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/4956193-04a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(526098 , 6, '',84608 ,'Tokyo Ghost','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/5011541-05a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values( 531927, 7, '', 84608,'Tokyo Ghost','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/5160403-06a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values( 538557, 8, '', 84608,'Tokyo Ghost','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/5226320-07a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values( 542657,9 , '',84608 ,'Tokyo Ghost','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/5315412-08a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values( 547318, 10, '',84608 ,'Tokyo Ghost','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/5315412-08a.jpg');



insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(450114,1 , '',72941 ,'Lumberjanes','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3855006-01a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(452901,2 , '', 72941,'Lumberjanes','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3817599-02a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(456079, 3, '',72941 ,'Lumberjanes','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3882883-03a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(459214, 4, '',72941 ,'Lumberjanes','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3945963-04a.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(464045,5 , '', 72941,'Lumberjanes','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/4071801-05a.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(490836, 1, 'Bizarro America: Part 6',82385 ,'Bizarro','https://comicvine1.cbsistatic.com/uploads/scale_small/6/66303/4599889-biz%2001.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(493755, 2, 'Bizarro America: Part 5',82385 ,'Bizarro','https://comicvine1.cbsistatic.com/uploads/scale_small/6/66303/4656618-bizarro.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(497908, 3, 'Bizarro America: Part 4',82385 ,'Bizarro','https://comicvine1.cbsistatic.com/uploads/scale_small/10/103431/4753005-03.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(500265, 4, 'Bizarro America: Part 3: Do You Believe In Cigam?',82385 ,'Bizarro','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/4804791-04.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(503525, 5, 'Bizarro America: Part 2',82385 ,'Bizarro','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/4865184-05.jpg');
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(506142, 6, 'Bizarro America: Part 1: Who Am On Last?',82385 ,'Bizarro','https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/4913031-06.jpg');


insert into collections (collection_id, issue_id )
values(2,490836);
insert into collections (collection_id, issue_id )
values(2,493755);
insert into collections (collection_id, issue_id )
values(2,497908);
insert into collections (collection_id, issue_id )
values(2,500265);
insert into collections (collection_id, issue_id )
values(2,503525);

insert into collections (collection_id, issue_id )
values(2,506142);
insert into collections (collection_id, issue_id )
values(1,450114);
insert into collections (collection_id, issue_id )
values(1,452901);
insert into collections (collection_id, issue_id )
values(1,456079);
insert into collections (collection_id, issue_id )
values(1,459214);
insert into collections (collection_id, issue_id )
values(1,464045);

insert into collections (collection_id, issue_id )
values(3,500342);
insert into collections (collection_id, issue_id )
values(3,503594);
insert into collections (collection_id, issue_id )
values(3,506230);
insert into collections (collection_id, issue_id )
values(3,508482);
insert into collections (collection_id, issue_id )
values(3,511557);
insert into collections (collection_id, issue_id )
values(3,526098);
insert into collections (collection_id, issue_id )
values(3,531927);
insert into collections (collection_id, issue_id )
values(3,538557);
insert into collections (collection_id, issue_id )
values(3,542657);
insert into collections (collection_id, issue_id )
values(3,547318);
insert into collections (collection_id, issue_id )
values(1,159233);
insert into collections (collection_id, issue_id )
values(1,163075);
insert into collections (collection_id, issue_id )
values(1,166274);
insert into collections (collection_id, issue_id )
values(1,169324);
insert into collections (collection_id, issue_id )
values(1,177633);
insert into collections (collection_id, issue_id )
values(1,184884);

