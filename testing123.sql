create database testing123;

show databases;

use testing123;

drop database testing123;

show databases;

drop database if exists testing123;

create database codeup_test_db;

CREATE USER 'codeup_test_user'@'localhost' IDENTIFIED BY '12345';

GRANT ALL ON codeup_test_db.* TO 'codeup_test_user'@'localhost';

