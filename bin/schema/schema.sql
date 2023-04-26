CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL
	last_name VARCHAR(100) NOT NULL
)

CREATE TABLE games (
    id SERIAL PRIMARY KEY,
	publish_date DATE NOT NULL,
	archived BOOLEAN NOT NULL,
	multiplayer BOOLEAN NOT NULL,
	last_played DATE NOT NULL
	author_id INT REFERENCES Author(ID)
)