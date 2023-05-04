use codeup_test_db;

alter table albums
    add unique index unique_artist_album (record_name, artist);

show indexes from albums;