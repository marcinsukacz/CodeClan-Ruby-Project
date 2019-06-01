DROP TABLE exibitions;
DROP TABLE artists;

CREATE TABLE artists (
  id SERIAL8 primary key,
  alias VARCHAR(255)
);

CREATE TABLE exibitions (
  id SERIAL8 primary key,
  title VARCHAR(255),
  category VARCHAR(255),
  artist_id INT8 REFERENCES artists(id)
);
