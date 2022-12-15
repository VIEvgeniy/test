CREATE TABLE IF NOT EXISTS singer (
	id SERIAL PRIMARY KEY,
	pseudonym VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_of_singer (
	singer_id INTEGER REFERENCES singer(id),
	genre_id INTEGER REFERENCES genre(id),
	CONSTRAINT pk_genre_of_singer PRIMARY KEY (singer_id, genre_id)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null,
	release_yeare date
);

CREATE TABLE IF NOT EXISTS albums_of_singer (
	singer_id INTEGER REFERENCES singer(id),
	album_id INTEGER REFERENCES album(id),
	CONSTRAINT pk_albums_of_singer PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS track (
	id SERIAL PRIMARY KEY,
	length INTEGER NOT null,
	album_id INTEGER REFERENCES album(id)
);


CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT null,
	release_yeare date
);

CREATE TABLE IF NOT EXISTS collection_of_track (
	collection_id INTEGER REFERENCES collection(id),
	track_id INTEGER REFERENCES track(id),
	CONSTRAINT pk_collection_of_track PRIMARY KEY (collection_id, track_id)
);

