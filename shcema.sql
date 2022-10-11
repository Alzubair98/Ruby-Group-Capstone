CREATE DATABASE catalog_of_things;

CREATE TABLE Genre(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100)
);

CREATE TABLE MusicAlbum(
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    genre_id      INT,
    author_id     INT,
    label_id      INT,
    publish_date  DATE,
    archived      BOOLEAN,
    on_spotify VARCHAR(100),
    name VARCHAR(100),

    CONSTRAINT fk_genre_id
        FOREIGN KEY(genre_id)
            REFERENCES Genre(id),

    CONSTRAINT fk_author_id
        FOREIGN KEY(author_id)
            REFERENCES Author(id),

    CONSTRAINT fk_label_id
        FOREIGN KEY(label_id)
            REFERENCES Label(id)
);