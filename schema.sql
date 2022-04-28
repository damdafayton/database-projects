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

-- new exercies starts

create table owners (
    id serial primary key, 
    full_name varchar(50), 
    age int
    );

create table species (id 
    serial primary key, 
    name varchar(50)
    );

begin;
update animals
set id = 1;
commit;
create sequence sek;
select setval('sek', max(id)) from animals;
update animals
set id = nextval('sek') where name !~ 'Pikachu';
commit;
alter table animals
alter id set not null;
commit;
alter table animals
alter column id set default nextval('sek');
commit;
alter table animals
add primary key(id); 
commit;
abort;

alter table animals 
drop column species;

alter table animals
add column species_id int references species(id);

alter table animals
add column owners_id int references owners(id);

