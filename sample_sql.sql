--sample data
INSERT INTO cast_members (cast_name)
VALUES ('Elijah Wood') UNION
VALUES ('Wong Kar-wai') UNION
VALUES ('Peter Jackson') UNION
VALUES ('Maggie Cheung') UNION
VALUES ('Mike Newell') UNION
VALUES ('Gore Verbinski') UNION
VALUES ('Steven Spielberg') UNION
VALUES ('Gore Verbinski') UNION
VALUES ('Daniel Radcliffe') UNION
VALUES ('Johnny Depp') UNION
VALUES ('Clint Eastwood') UNION
VALUES ('Sergio Leone');

INSERT INTO movies (title, director, lead_cast, year_released, country, genre)
VALUES ('Pirates of the Caribbean: The Curse of the Black Pearl', 'Gore Verbinski', 'Johnny Depp', 2003, 'USA', 'fantasy') UNION
VALUES ('Harry Potter and Goblet of Fire', 'Mike Newell', 'Daniel Radcliffe', 2005, 'UK', 'fantasy') UNION
VALUES ('The Lord of the Rings: The Return of the King', 'Peter Jackson', 'Elijah Wood', 2003, 'USA', 'fantasy') UNION
VALUES ('The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 'Elijah Wood', 2001, 'USA', 'fantasy') UNION
VALUES ('The Lord of the Rings: The Two Towers', 'Peter Jackson', 'Elijah Wood', 2002, 'USA', 'fantasy') UNION
VALUES ('In the Mood for Love', 'Wong Kar-wai', 'Maggie Cheung', 2000, 'Hong Kong', 'romantic drama') UNION
VALUES ('Million Dollar Baby', 'Clint Eastwood', 'Clint Eastwood', 2004, 'USA', 'sports drama') UNION
VALUES ('A Fistful of Dollars', 'Sergio Leone', 'Clint Eastwood', 1964, 'Italy', 'western');

INSERT INTO users (user_name, user_password)
VALUES ('test', '1234') UNION
VALUES ('Adam Smith', 'pencil') UNION
VALUES ('Karl Marx', 'hammer');

INSERT INTO user_ratings (rating, user_id, movie_id, reviews, date_of_review)
VALUES (10, 2, 5, 'Greatest movie ever!', NOW()) UNION
VALUES (7, 2, 8, 'Meh.. Pirates..', NOW()) UNION
VALUES (10, 3, 5, '10/10', NOW()) UNION
VALUES (0, 3, 8, NULL, NOW());


--Find all the directors and their directed movies
select movie_title, cast_name as director from movie_cast where role_in_movie like '%DIRECTOR%';

--Find cast members who has been in the highest rated movie 
select movie_title, cast_name, role_in_movie from movie_cast where movie_id = 
(select movie_id from movie_rating order by avg_movie_rating limit 1);

