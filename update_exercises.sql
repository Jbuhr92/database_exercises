use codeup_test_db;

SELECT 'All Albums' AS 'Albums';
select record_name from albums;

select 'Albums released before 1980' AS 'Albums';

select record_name from albums where release_date < 1980;

select 'Albums released by michael jackson' as 'Albums';

select record_name from albums where artist = 'Michael Jackson';

select 'Current sales' as 'Album Sales';
select sales from albums;

update albums
set sales = sales * 10;

select 'updated sales' as 'Album Sales';
select sales from Albums;

update albums
set release_date = 1800
where release_date <= 1989;

select 'updated release date' as 'Album release dates';
select * from albums where release_date <= 1989;

select 'Michael Jackson Name change' as 'update artist name';
select * from albums where artist = 'Michael Jackson';

update albums
set artist = 'Peter Jackson'
where artist = 'Michael Jackson';

select 'Michael Jackson Name change' as 'update artist name';
select * from albums where artist = 'Peter Jackson';