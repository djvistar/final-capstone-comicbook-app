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
        collection_id int DEFAULT nextval('seq_collection_id'::regclass) NOT NULL,
        user_id int NOT NULL,
        collection_name varchar(200),
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
INSERT INTO users (username,password_hash,role) VALUES ('Em','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('Blase','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
INSERT INTO users (username,password_hash,role) VALUES ('Vic','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

insert into user_collections (user_id, collection_name)
values(4, 'Food and Forest');
insert into user_collections (user_id, collection_name)
values(4, 'BIZZARO!');
insert into user_collections (user_id, collection_name)
values(4, 'Dystopian');
insert into user_collections (user_id, collection_name)
values(5, 'VIC 1');
insert into user_collections (user_id, collection_name)
values(5, 'VIC 2');
insert into user_collections (user_id, collection_name)
values(5, 'VIC 3');
insert into user_collections (user_id, collection_name)
values(3, 'Fables and Such');
insert into user_collections (user_id, collection_name)
values(3, 'Gritty and Scary');
insert into user_collections (user_id, collection_name)
values(3, 'This and That');

--COMIC DAO
--inserts issue into db- works fine as long as pk is good

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(96119, 19, 'Out of the Woods: Chapter One - March of the Wooden Soldiers', 9723, 'Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2757438-19.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(98170, 31, 'The Long, Hard Fall', 9723, 'Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/65173-9723-98170-1-fables.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(134357, 60, 'The Good Prince, Chapter One: Flycatcher', 9723, 'Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2757465-60.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(248512, 100, 'Single Combat', 9723, 'Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9116/1552525-fables100.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(142226, 78, 'Boxes: Chapter Two Of The Dark Ages', 9723, 'Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2757492-78.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(153431, 82, 'Waiting for the Blues (An Epilogue of Sorts for The Dark Ages); Home From The Jungle, Part Five Of Five', 9723, 'Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9116/733155-fables82.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(235292, 98, 'Red Dawn, Chapter Five of Rose Red', 9723, 'Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9116/1410148-fables98.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(110323, 1, 'Chapter One: Old Tales Revisited', 9723, 'Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9245/283988-9723-110323-3-fables.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(96114, 14, 'The Mouse Police Never Sleep: Storybook Love Part One', 9723, 'Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/63118-9723-96114-1-fables.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(96112, 12, 'A Sharp Operation: Part One of a Two-Part Caper', 9723, 'Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2757433-12.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(195379, 1, 'Volume 13', 31368, 'Fables: The Great Fables Crossover', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3363494-13.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(115169, 15, 'The Bad Prince, Part Four: (Enchanted) Blade Runner', 19141, 'Jack of Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2515057-15.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(132198, 6, 'Jack Frost, Part One of Two', 19141, 'Jack of Fables', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2515048-06.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(241784, 19, 'Leviathan, Part One', 2626, 'The Unwritten', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9116/1501092-u19.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(228842, 16, 'Dead Mans Knock: Conversations', 2626, 'The Unwritten', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9116/1332496-16.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(273144, 26, 'Citizen Taylor, Part Two of Two', 2626, 'The Unwritten', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3548971-26.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(306487, 32, 'Part Two of Tommy Taylor and the War of Words', 2626, 'The Unwritten', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9116/2123043-32.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(106362, 1, 'Part One', 18161, 'Dark Tower: The Gunslinger Born', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2658190-01.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(108000, 3, 'Part Three', 18161, 'Dark Tower: The Gunslinger Born', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2658192-03.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(129697, 3, 'Part Three', 20800, 'Dark Tower: The Long Road Home', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2658209-03a.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(447102, 1, 'Saat der Zerstörung', 72157, 'Hellboy', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/3125/3678598-hell1.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(111926, 4, (null), 18536, 'Hellboy: Darkness Calls', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2185254-04.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(336434, 6, 'Curtain', 41484, 'Locke & Key: Clockworks', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3446623-06.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(300950, 3, 'The Tamers of the Tempest', 41484, 'Locke & Key: Clockworks', 'https://comicvine1.cbsistatic.com/uploads/scale_small/5/57023/2124627-prv10764_cov.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(224931, 6, 'Chapter Six: Beyond Repair', 29689, 'Locke & Key: Crown of Shadows', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9116/1300531-untitled.png');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(157918, 5, 'Head Games: Chapter Four', 25426, 'Locke & Key: Head Games', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9241/808679-001.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(162549, 6, 'Head Games: Chapter Five', 25426, 'Locke & Key: Head Games', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2189050-06.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(387286, 3, 'Chapter 3 - Last Dance', 53936, 'Locke & Key: Omega', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3504189-03.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(367748, 1, 'Chapter One - Our Regrets', 53936, 'Locke & Key: Omega', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3504193-01.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(124110, 1, 'Welcome to Lovecraft, Chapter One', 20701, 'Locke & Key: Welcome to Lovecraft', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2189040-01.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(268782, 9, (null), 34852, 'Morning Glories', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2515272-09.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(324792, 17, 'P.E. Part Five', 34852, 'Morning Glories', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3446836-17.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(399008, 26, 'The Waiting Game', 34852, 'Morning Glories', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3003741-26.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(40691, 1, 'The Time of the Preacher', 5516, 'Preacher', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2032970-01.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(40945, 3, 'And The Horse You Rode In On', 5516, 'Preacher', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/2032962-03.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(676474, 4, 'Part 4; The Most Beautiful Suicide', 109430, 'The Crow: Memento Mori', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/6505828-04a.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(41743, 73, 'The Wake: An Epilogue - Sunday Mourning', 4207, 'The Sandman', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/37283-4207-41743-1-sandman-the.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(41965, 74, 'Exiles', 4207, 'The Sandman', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/37458-4207-41965-1-sandman-the.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(39184, 60, 'The Kindly Ones, Part 4', 4207, 'The Sandman', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/35081-4207-39184-1-sandman-the.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(31296, 6, 'Master of Dreams, Part 6: 24 Hours', 4207, 'The Sandman', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/28199-4207-31296-1-sandman-the.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(138341, 1, 'Captain Trips Part One', 22968, 'The Stand: Captain Trips', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9241/537587-0003.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(142489, 3, 'Captain Trips Part Three', 22968, 'The Stand: Captain Trips', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3183857-03.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(28655, 12, 'A Stronger Loving World', 3622, 'Watchmen', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/25791-3622-28655-1-watchmen.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(27458, 4, 'Watchmaker', 3622, 'Watchmen', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/24683-3622-27458-1-watchmen.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(425982, 20, 'Grocery Time! Part 1', 45728, 'Adventure Time', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/3321317-20a.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(733716, 1, (null), 124261, 'Dragon Age: Blue Wraith', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/7211836-01.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(737809, 2, (null), 124261, 'Dragon Age: Blue Wraith', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/7251364-02.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(742028, 3, (null), 124261, 'Dragon Age: Blue Wraith', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/7283326-03.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(613726, 4, (null), 101387, 'Dragon Age: Knight Errant', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/6012347-04.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(511470, 2, (null), 86686, 'Dragon Age: Magekiller', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/5008806-02.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(516039, 3, (null), 86686, 'Dragon Age: Magekiller', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/5055914-03.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(520157, 4, (null), 86686, 'Dragon Age: Magekiller', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/5102627-04.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(108789, 1, 'Chapter One', 18529, 'Neil Gaimans Neverwhere', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/787/112689-18529-108789-1-neil-gaiman-s-neverw.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(105410, 2, 'Wannabe: Part Two', 17987, 'NYX', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/871/81184-17987-105410-1-nyx.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(105412, 4, 'Wannabe: Part Four', 17987, 'NYX', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/871/81196-17987-105412-4-nyx.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(632577, 9, (null), 98763, 'Steven Universe Ongoing', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/6114151-09.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(655545, 12, (null), 98763, 'Steven Universe Ongoing', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/6250624-12.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(719402, 32, (null), 98763, 'Steven Universe Ongoing', 'https://comicvine1.cbsistatic.com/uploads/scale_small/6/67663/7075822-32a.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(53570, 7, 'Return to Weapon X', 7258, 'Ultimate X-Men', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/46202-7258-53570-1-ultimate-x-men.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(230117, 1, 'Days of Future Past TPB', 34959, 'X-Men: Days of Future Past', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9116/1343490-daysoffuturepast.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(109578, 23, 'Widows Pass: Conclusion', 9419, 'Y: The Last Man', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4053/120901-9419-109578-1-y-the-last-man.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(122053, 60, 'Alas', 9419, 'Y: The Last Man', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9241/292716-9419-122053-1-y-the-last-man.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(109584, 25, 'Tongues of Flame: Part Two of Two', 9419, 'Y: The Last Man', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4053/120910-9419-109584-1-y-the-last-man.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(109571, 16, 'Comedy & Tragedy Act One (of Two)', 9419, 'Y: The Last Man', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4053/120886-9419-109571-1-y-the-last-man.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(101009, 32, 'Girl on Girl', 9419, 'Y: The Last Man', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/68011-9419-101009-1-y-the-last-man.jpg');

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

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(27864, 3, 'Legends from the Darkside', 3816, 'Superman', 'https://comicvine1.cbsistatic.com/uploads/scale_small/11112/111120209/5928963-sm%20%233%20final.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(28085, 5, 'The Mummy Strikes', 3816, 'Superman', 'https://comicvine1.cbsistatic.com/uploads/scale_small/11112/111120209/5928969-sm%20%235%20final.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(153065, 1, 'World of New Krypton Part One', 25900, 'Superman: World of New Krypton', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/9241/726798-00.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(159275, 4, 'World of New Krypton, Part Four', 25900, 'Superman: World of New Krypton', 'https://comicvine1.cbsistatic.com/uploads/scale_small/3/31666/825780-krypton.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(163385, 5, 'World of New Krypton, Part Five', 25900, 'Superman: World of New Krypton', 'https://comicvine1.cbsistatic.com/uploads/scale_small/3/31666/869799-new.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(166116, 6, 'World of New Krypton, Part Six', 25900, 'Superman: World of New Krypton', 'https://comicvine1.cbsistatic.com/uploads/scale_small/3/31666/904520-smwnk_cv6_copy.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(170732, 7, 'World of New Krypton: Part Seven', 25900, 'Superman: World of New Krypton', 'https://comicvine1.cbsistatic.com/uploads/scale_small/2/29350/951304-00.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(181603, 9, 'World of New Krypton, Part Nine', 25900, 'Superman: World of New Krypton', 'https://comicvine1.cbsistatic.com/uploads/scale_small/3/38919/1017402-superman_world_of_new_krypton_9.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(185625, 10, 'World of New Krypton, Part Ten', 25900, 'Superman: World of New Krypton', 'https://comicvine1.cbsistatic.com/uploads/scale_small/3/31666/1047337-smwnk_cv10_ds_copy.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(21795, 5, 'X-Men: God Loves, Man Kills', 3144, 'Marvel Graphic Novel', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/19524-3144-21795-1-marvel-graphic-novel.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(21788, 2, 'Elric: The Dreaming City', 3144, 'Marvel Graphic Novel', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/19517-3144-21788-1-marvel-graphic-novel.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(21782, 1, 'The Death of Captain Marvel', 3144, 'Marvel Graphic Novel', 'https://comicvine1.cbsistatic.com/uploads/scale_small/11/117763/2716684-marvelgraphicnovel01.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(263252, 22, 'The Amazing Spider-Man: Hooky', 3144, 'Marvel Graphic Novel', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/23610-3144-26325-1-marvel-graphic-novel.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(117738, 17, 'Revenge of The Living Monolith', 3144, 'Marvel Graphic Novel', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/1714/230211-3144-117738-1-marvel-graphic-novel.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(123224, 18, 'The Sensational She-Hulk', 3144, 'Marvel Graphic Novel', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/77/309925-3144-123224-1-marvel-graphic-novel.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(123227, 21, 'Marada the She-Wolf', 3144, 'Marvel Graphic Novel', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/77/309928-3144-123227-1-marvel-graphic-novel.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(135287, 38, 'Silver Surfer: Judgment Day', 3144, 'Marvel Graphic Novel', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/77/490721-ssjday.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(743559, 2, null, 126035, 'Web van Spiderman', 'https://comicvine1.cbsistatic.com/uploads/scale_small/11/110017/7295655-img001.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(42970, 1, 'Men of Steel', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/38264-5767-42970-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(43062, 2, 'Be Careful What You Wish For...', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/38339-5767-43062-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(43258, 3, 'Distant Thunder', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/38499-5767-43258-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(43359, 4, 'Eye to Eye', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/38588-5767-43359-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(43568, 6, 'Seonimod', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/38765-5767-43568-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(44068, 11, 'The War Within', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/39185-5767-44068-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(43672, 7, 'All Creatures Great and Small, Part 1', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/38855-5767-43672-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(44176, 12, 'The War Within, Part Two', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/39274-5767-44176-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(43759, 8, 'All Creatures Great and Small, Part 2', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/38930-5767-43759-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(44284, 13, 'Grand Slam', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/39362-5767-44284-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(43864, 9, 'Return of the Hero', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/39019-5767-43864-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(44384, 14, 'Stop the Presses!', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/39448-5767-44384-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(43963, 10, 'Dont Try This at Home', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/39102-5767-43963-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(44553, 15, 'Maximum Effort!', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/39585-5767-44553-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(44667, 16, 'Clark Kent, Youre A Nobody!', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/39688-5767-44667-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71017, 31, 'Family Reunion: Part Two', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/73827-5767-71017-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(48247, 17, 'Supermans Pals Pal', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/42342-5767-48247-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71018, 32, 'Sullivans Girl Friend, Lois Lane', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/73828-5767-71018-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71019, 33, 'Clark Kent Is Superman - And I Can Prove It!', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/74102-5767-71019-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71020, 34, 'Sanctuary', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/74103-5767-71020-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71021, 35, 'Never Play With the Toymans Toys!', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/74104-5767-71021-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(48248, 18, 'Its A Super Life!', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/42343-5767-48248-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(48249, 19, 'The Bodyguard of Steel', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/42344-5767-48249-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71037, 56, 'Poker Face', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/53036-5767-71037-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71023, 40, 'Old Wounds', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/74106-5767-71023-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71038, 57, '4 Point Perspective', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/53037-5767-71038-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71024, 41, '22 Stories in a Single Bound', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/53023-5767-71024-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71039, 58, 'What Lurks Below', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/73829-5767-71039-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71025, 43, 'Are You My Mother Box?', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/53024-5767-71025-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71040, 59, 'Ghost Flowers', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/73830-5767-71040-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71022, 36, 'This Is a Job For Superman', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/74105-5767-71022-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(71026, 44, 'Law and Orders', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/53025-5767-71026-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(99448, 60, 'Roughnecks', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/66451-5767-99448-1-superman-adventures.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(99449, 61, 'Nothing Up My Sleeve!', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/66452-5767-99449-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(99454, 66, 'Power Play, Part Two', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/66457-5767-99454-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(99451, 63, 'Magic Wand', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/66454-5767-99451-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(203199, 52, 'A Death in the Family', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/3/36359/1172747-supadv52.jpg');


insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(99452, 64, 'Brainiac Beyond', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/0/4/66455-5767-99452-1-superman-adventures.jpg');

insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(234910, 22, 'War Games: Part 1', 5767, 'Superman Adventures', 'https://comicvine1.cbsistatic.com/uploads/scale_small/7/74728/1402746-superman_adventures__22__2010____page_1.jpg');
--creates in collections table


insert into collections (collection_id, issue_id)
values(7,96119);

insert into collections (collection_id, issue_id)
values(7,98170);

insert into collections (collection_id, issue_id)
values(7,134357);

insert into collections (collection_id, issue_id)
values(7,248512);

insert into collections (collection_id, issue_id)
values(7,142226);

insert into collections (collection_id, issue_id)
values(7,153431);

insert into collections (collection_id, issue_id)
values(7,235292);

insert into collections (collection_id, issue_id)
values(7,110323);

insert into collections (collection_id, issue_id)
values(7,96114);

insert into collections (collection_id, issue_id)
values(7,96112);

insert into collections (collection_id, issue_id)
values(7,195379);

insert into collections (collection_id, issue_id)
values(7,115169);

insert into collections (collection_id, issue_id)
values(7,132198);

insert into collections (collection_id, issue_id)
values(7,241784);

insert into collections (collection_id, issue_id)
values(7,228842);

insert into collections (collection_id, issue_id)
values(7,273144);

insert into collections (collection_id, issue_id)
values(7,306487);

insert into collections (collection_id, issue_id)
values(8, 106362);

insert into collections (collection_id, issue_id)
values(8, 108000);

insert into collections (collection_id, issue_id)
values(8, 129697);

insert into collections (collection_id, issue_id)
values(8, 447102);

insert into collections (collection_id, issue_id)
values(8, 111926);

insert into collections (collection_id, issue_id)
values(8, 336434);

insert into collections (collection_id, issue_id)
values(8, 300950);

insert into collections (collection_id, issue_id)
values(8, 224931);

insert into collections (collection_id, issue_id)
values(8, 157918);

insert into collections (collection_id, issue_id)
values(8, 162549);

insert into collections (collection_id, issue_id)
values(8, 387286);

insert into collections (collection_id, issue_id)
values(8, 367748);

insert into collections (collection_id, issue_id)
values(8, 124110);

insert into collections (collection_id, issue_id)
values(8, 268782);

insert into collections (collection_id, issue_id)
values(8, 324792);

insert into collections (collection_id, issue_id)
values(8, 399008);

insert into collections (collection_id, issue_id)
values(8, 40691);

insert into collections (collection_id, issue_id)
values(8, 40945);

insert into collections (collection_id, issue_id)
values(8, 676474);

insert into collections (collection_id, issue_id)
values(8, 41743);

insert into collections (collection_id, issue_id)
values(8, 41965);

insert into collections (collection_id, issue_id)
values(8, 39184);

insert into collections (collection_id, issue_id)
values(8, 31296);

insert into collections (collection_id, issue_id)
values(8, 138341);

insert into collections (collection_id, issue_id)
values(8, 142489);

insert into collections (collection_id, issue_id)
values(8, 28655);

insert into collections (collection_id, issue_id)
values(8, 27458);

insert into collections (collection_id, issue_id)
values(9, 425982);

insert into collections (collection_id, issue_id)
values(9, 733716);

insert into collections (collection_id, issue_id)
values(9, 737809);

insert into collections (collection_id, issue_id)
values(9, 742028);

insert into collections (collection_id, issue_id)
values(9, 613726);

insert into collections (collection_id, issue_id)
values(9, 511470);

insert into collections (collection_id, issue_id)
values(9, 516039);

insert into collections (collection_id, issue_id)
values(9, 520157);

insert into collections (collection_id, issue_id)
values(9, 108789);

insert into collections (collection_id, issue_id)
values(9, 105410);

insert into collections (collection_id, issue_id)
values(9, 105412);

insert into collections (collection_id, issue_id)
values(9, 632577);

insert into collections (collection_id, issue_id)
values(9, 655545);

insert into collections (collection_id, issue_id)
values(9, 719402);

insert into collections (collection_id, issue_id)
values(9, 53570);

insert into collections (collection_id, issue_id)
values(9, 230117);

insert into collections (collection_id, issue_id)
values(9, 109578);

insert into collections (collection_id, issue_id)
values(9, 122053);

insert into collections (collection_id, issue_id)
values(9, 109584);

insert into collections (collection_id, issue_id)
values(9, 109571);

insert into collections (collection_id, issue_id)
values(9, 101009);

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

insert into collections (collection_id, issue_id)
values(4,27864);

insert into collections (collection_id, issue_id)
values(5,28085);

insert into collections (collection_id, issue_id)
values(6,153065);

insert into collections (collection_id, issue_id)
values(6,159275);

insert into collections (collection_id, issue_id)
values(5,163385);

insert into collections (collection_id, issue_id)
values(4,166116);

insert into collections (collection_id, issue_id)
values(4,170732);

insert into collections (collection_id, issue_id)
values(5,181603);

insert into collections (collection_id, issue_id)
values(6,185625);

insert into collections (collection_id, issue_id)
values(6,21795);

insert into collections (collection_id, issue_id)
values(5,21788);

insert into collections (collection_id, issue_id)
values(4,21782);

insert into collections (collection_id, issue_id)
values(4,263252);

insert into collections (collection_id, issue_id)
values(5,117738);

insert into collections (collection_id, issue_id)
values(6,123224);

insert into collections (collection_id, issue_id)
values(6,123227);

insert into collections (collection_id, issue_id)
values(5,135287);

insert into collections (collection_id, issue_id)
values(4,743559);

insert into collections (collection_id, issue_id)
values(4,42970);

insert into collections (collection_id, issue_id)
values(5,43062);

insert into collections (collection_id, issue_id)
values(6,43258);

insert into collections (collection_id, issue_id)
values(6,43359);

insert into collections (collection_id, issue_id)
values(5,43568);

insert into collections (collection_id, issue_id)
values(4,44068);

insert into collections (collection_id, issue_id)
values(4,43672);


COMMIT TRANSACTION;
