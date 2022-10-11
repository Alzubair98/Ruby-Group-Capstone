-- creating label table

create table label(
    id int GENEATED ALWAYS AS Identity PRIMARY key,
    title VARCHAR,
    color VARCHAR
);


-- creating book table
create table book(
    id int GENEATED ALWAYS AS Identity PRIMARY key,
    label_id int
    publisher VARCHAR, 
    cover_state VARCHAR, 
    FOREIGN key(label_id) REFERENCES label(id)
)