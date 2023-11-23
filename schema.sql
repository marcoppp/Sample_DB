CREATE TABLE movies (
  id               SERIAL PRIMARY KEY,
  title            TEXT NOT NULL,
  director TEXT NOT NULL,
  lead_cast TEXT NOT NULL,
  year_released    INT NOT NULL,
  country          TEXT NOT NULL,
  genre            TEXT NOT NULL,
  avg_user_rating  INT
);

CREATE TABLE cast_members (
  id SERIAL PRIMARY KEY,
  cast_name TEXT NOT NULL
);

CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  user_name VARCHAR (50) UNIQUE NOT NULL,
  user_password VARCHAR (50) NOT NULL
);

CREATE TABLE user_ratings (
  id SERIAL PRIMARY KEY,
  rating INT NOT NULL,
  user_id INT NOT NULL REFERENCES users,
  movie_id INT NOT NULL REFERENCES movies,
  reviews TEXT,
  date_of_review TIMESTAMPTZ
);



--Create a junction view of cast member and movies
CREATE VIEW movie_cast AS (
SELECT 
  movies.id as movie_id,
  title as movie_title, 
  cast_members.id as cast_id, 
  cast_name,
CASE
  WHEN lead_cast = director THEN 'LEAD_CAST_AND_DIRECTOR'
  WHEN lead_cast = cast_members.cast_name THEN 'LEAD_CAST'
  WHEN director = cast_members.cast_name THEN 'DIRECTOR'
END AS role_in_movie
FROM movies, cast_members
WHERE lead_cast = cast_members.cast_name OR director = cast_members.cast_name
ORDER BY title);

--Create a junction view of movies and users rating
CREATE VIEW movie_rating AS (
SELECT DISTINCT
  m.movie_id,
  m.movie_title,
  AVG(r.rating) OVER (PARTITION BY r.movie_id) AS avg_movie_rating
FROM
  user_ratings AS r 
FULL OUTER JOIN (
	SELECT 
	  movies.id as movie_id,
	  title as movie_title
	FROM movies) AS m
ON (m.movie_id = r.movie_id)
);
