/* Database schema to keep the structure of entire database. */
-- HELLO HELLO HELLO

Create Table animals (
    id int, 
    name char(40), 
    date_of_birth date, 
    escape_attempts int, 
    neutered bool, 
    weight_kg numeric(5,2)
    );

alter table animals
add column species varchar;