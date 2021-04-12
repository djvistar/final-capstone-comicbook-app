--insert into collections (inventory_id, collection_id)
--values(1,1)
--insert into user_collections(collection_id, user_id) 
--values(4,1);
--join users u on uc.user_id = u.user_id
--Where u.user_id =1;

--add to collection to user_collections
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



--GETS
--get by collection_id
select * from issue
Join collections on issue.issue_id = collections.issue_id
--Join user_collections on collections.collection_id =user_collections.collection_id;
where collection_id = 4;

--get all by user_id
select * from issue
Join collections on issue.issue_id = collections.issue_id
Join user_collections on collections.collection_id =user_collections.collection_id
where user_id = 2;

INSERT INTO user_collections(collection_id, user_id, collection_name) VALUES (9999,3, 'Blases Test') 

SELECT issue.issue_id, issue_name, issue_number, cover_url, volume_name FROM issue JOIN collections on issue.issue_id = collections.issue_id WHERE collections.collection_id = 3  