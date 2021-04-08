insert into collections (collection_id)
values(1)
insert into user_collections(collection_id, user_id) 
values(1,1);
join users u on uc.user_id = u.user_id
Where u.user_id =1;




