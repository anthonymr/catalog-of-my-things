CREATE TABLE IF NOT EXISTS authors (
id              SERIAL PRIMARY KEY,
first_name      VARCHAR(50)
last_name       VARCHAR(50)
);


CREATE TABLE IF NOT EXISTS games (
	id              SERIAL PRIMARY KEY,
	publish_date    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	archived        BOOLEAN NOT NULL DEFAULT FALSE,
	multiplayer     BOOLEAN NOT NULL,
	last_played     TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	author_id       INT


  CONSTRAINT fk_genre
    FOREIGN KEY(genre_id)
	  REFERENCES genres(id),
  CONSTRAINT fk_author
    FOREIGN KEY(author_id)
    REFERENCES authors(id),
  CONSTRAINT fk_source
    FOREIGN KEY(source_id)
    REFERENCES sources(id),
  CONSTRAINT fk_label
    FOREIGN KEY(label_id)
    REFERENCES labels(id)
);
