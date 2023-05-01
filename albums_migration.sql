USE codeup_test_db;

drop table if exists albums;

create table albums (
                       album_id int unsigned not null auto_increment,
                       artist varchar(35) not null,
                       record_name varchar(65) not null,
                       release_date int(10) not null,
                       sales decimal(10, 2) not null,
                       genre varchar(65) not null,
                       primary key (album_id)
);