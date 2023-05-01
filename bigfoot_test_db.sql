use bigfoot_test_db;

drop table if exists users;

create table users (
   user_id int unsigned not null auto_increment,
   username varchar(35) not null,
   email varchar(65) not null,
   password varchar(255) not null,
   primary key (user_id)
);