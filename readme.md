# Sample Movie Review DB
This database is consist of 2 SQL files.
- schema.sql
- sample_sql.sql

It can store simple movies data and user's review. And we can easily query the cast members of the highest rated movie.
```
select movie_title, cast_name, role_in_movie from movie_cast where movie_id = 
(select movie_id from movie_rating order by avg_movie_rating limit 1);
```

## ER Diagram
![ER Diagram](https://drive.google.com/uc?id=1r6mH8yXi4VAprR10oRkI4V6LsRi4GoZv "ER Diagram")
