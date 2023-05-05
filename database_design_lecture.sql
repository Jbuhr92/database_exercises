use bigfoot_test_db;

drop table if exists quotes;
create table quotes (
                        id int not null auto_increment,
                        content varchar(250) not null,
                        author varchar(79),
                        primary key (id)

);

INSERT INTO quotes (content, author) VALUES ('It''s a dangerous business, Frodo, going out your door.', 'Bilbo Baggins');
INSERT INTO quotes (content, author) VALUES ('May the Force be with you.', 'Obi-Wan Kenobi');
INSERT INTO quotes (content, author) VALUES ('Even the smallest person can change the course of the future.', 'Galadriel');
INSERT INTO quotes (content, author) VALUES ('Do. Or do not. There is no try.', 'Yoda');
INSERT INTO quotes (content, author) VALUES ('One ring to rule them all, one ring to find them, one ring to bring them all and in the darkness bind them.', 'J.R.R. Tolkien');
INSERT INTO quotes (content, author) VALUES ('I find your lack of faith disturbing.', 'Darth Vader');
INSERT INTO quotes (content, author) VALUES ('All we have to decide is what to do with the time that is given us.', 'Gandalf');
INSERT INTO quotes (content, author) VALUES ('I am your father.', 'Darth Vader');
INSERT INTO quotes (content, author) VALUES ('Not all those who wander are lost.', 'J.R.R. Tolkien');
INSERT INTO quotes (content, author) VALUES ('Help me, Obi-Wan Kenobi. You''re my only hope.', 'Princess Leia');
INSERT INTO quotes (content, author) VALUES ('I can''t carry it for you, but I can carry you.', 'Samwise Gamgee');
INSERT INTO quotes (content, author) VALUES ('The Force will be with you, always.', 'Obi-Wan Kenobi');
INSERT INTO quotes (content, author) VALUES ('There is some good in this world, and it''s worth fighting for.', 'Samwise Gamgee');
INSERT INTO quotes (content, author) VALUES ('Fear is the path to the dark side. Fear leads to anger, anger leads to hate, hate leads to suffering.', 'Yoda');
INSERT INTO quotes (content, author) VALUES ('The world is indeed full of peril, and in it there are many dark places.', 'Haldir');
INSERT INTO quotes (content, author) VALUES ('Never tell me the odds!', 'Han Solo');
INSERT INTO quotes (content, author) VALUES ('A wizard is never late, nor is he early. He arrives precisely when he means to.', 'Gandalf');
INSERT INTO quotes (content, author) VALUES ('No, I am your father.', 'Darth Vader');
INSERT INTO quotes (content, author) VALUES ('In a hole in the ground there lived a hobbit.', 'J.R.R. Tolkien');
INSERT INTO quotes (content, author) VALUES ('Remember, the Force will be with you, always.', 'Obi-Wan Kenobi');

drop table if exists authors;

create table authors (
                         id int not null auto_increment,
                         name varchar(70) not null,
                         primary key (id)
);

INSERT INTO authors (name) VALUES ('Bilbo Baggins');
INSERT INTO authors (name) VALUES ('Obi-Wan Kenobi');
INSERT INTO authors (name) VALUES ('Galadriel');
INSERT INTO authors (name) VALUES ('Yoda');
INSERT INTO authors (name) VALUES ('J.R.R. Tolkien');
INSERT INTO authors (name) VALUES ('Darth Vader');
INSERT INTO authors (name) VALUES ('Gandalf');
INSERT INTO authors (name) VALUES ('Princess Leia');
INSERT INTO authors (name) VALUES ('Samwise Gamgee');
INSERT INTO authors (name) VALUES ('Haldir');
INSERT INTO authors (name) VALUES ('Han Solo');


ALTER TABLE quotes
    ADD COLUMN author_id INT not null;

update quotes
set author_id = (
    select id
    from authors
    where authors.name = quotes.author
);

alter table quotes
    add constraint fk_author
        foreign key (author_id)
            references authors (id);

alter table quotes
    drop foreign key fk_author,
    add constraint quotes_author_id_fk
        foreign key (author_id)
            references authors (id);

create table topics (
  id int not null auto_increment,
  topic varchar(70) not null,
  primary key (id)
);

INSERT INTO topics (topic) VALUES ('Adventure');
INSERT INTO topics (topic) VALUES ('Courage');
INSERT INTO topics (topic) VALUES ('Wisdom');
INSERT INTO topics (topic) VALUES ('Friendship');
INSERT INTO topics (topic) VALUES ('Power');
INSERT INTO topics (topic) VALUES ('Faith');
INSERT INTO topics (topic) VALUES ('Destiny');
INSERT INTO topics (topic) VALUES ('Time');
INSERT INTO topics (topic) VALUES ('Fear');
INSERT INTO topics (topic) VALUES ('Perseverance');
INSERT INTO topics (topic) VALUES ('Good vs. Evil');

create table quotes_topics (
    quote_id int not null,
    topic_id int not null,
    constraint quotes_topics_id_fk foreign key (quote_id) references quotes (id),
    constraint authors_topics_id_fk foreign key (topic_id) references topics(id)
);

INSERT INTO quotes_topics (quote_id, topic_id) VALUES
   (1, 1), (1, 2),
   (2, 7), (2, 11),
   (3, 2), (3, 4),
   (4, 3), (4, 9),
   (5, 5), (5, 11),
   (6, 6), (6, 11),
   (7, 8), (7, 3),
   (8, 7), (8, 11),
   (9, 1), (9, 4),
   (10, 7), (10, 4),
   (11, 4), (11, 10),
   (12, 7), (12, 11),
   (13, 2), (13, 10),
   (14, 3), (14, 9),
   (15, 1), (15, 5),
   (16, 8), (16, 11),
   (17, 3), (17, 8),
   (18, 7), (18, 11),
   (19, 1), (19, 4),
   (20, 7), (20, 11);

select content, topic from quotes q join quotes_topics qt on q.id = qt.quote_id join topics t on t.id = qt.topic_id order by content;
