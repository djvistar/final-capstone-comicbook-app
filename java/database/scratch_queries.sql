insert into collections (collection_id)
values(4)
insert into user_collections(collection_id, user_id) 
values(4,1);
join users u on uc.user_id = u.user_id
Where u.user_id =1;

--COLLECTION DAO
--creates collection
insert into collections (collection_id)
values(1)

--adds issue to collection
update collections set issue_id = 502
where collection_id = 4

Select * from issue i
JOIN collection
where collection_id = 4

--COMIC DAO
--inserts issue into db
insert into issue(issue_id, issue_number, issue_name, volume_id, volume_name, cover_url)
values(503, 12345, 'Fake Comic', 54321, 'fake volume', 'https://picsum.photos/id/237/200/300')



