/*Queries that provide answers to the questions from all projects.*/

select * from animals where name ~ '.*(mon)';
select * from animals where date_of_birth between '2016-01-01' and '2018-31-31';
select * from animals where neutered = true and escape_attempts < 3;
select date_of_birth from animals where name = 'Pikachu' or name= 'Agumon';
select name, escape_attempts from animals where weight_kg > 10.5;
select * from animals where neutered =true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg between 10.4 and 17.3;

begin;
update animals;
set species = 'unspecified';
select * from animals;
rollback;
select * from animals;

begin;
update animals 
set species = 'digimon' where name ~ '.*(mon)';
commit;

begin;
delete from animals;
rollback;

begin;
delete from animals where date_of_birth>'2022-01-01';
savepoint beforeWeightUpdate;
update animals
set weight_kg = weight_kg * -1;
rollback to savepoint beforeWeightUpdate;
update animals
set weight_kg = weight_kg * -1 where weight_kg < 0;
commit;

select count(*) from animals;
select count(*) from animals where escape_attempts = 0;
select avg(weight_kg) from animals;
select neutered, max(escape_attempts) as max_escape from animals group by neutered;
select neutered from animals where escape_attempts = (select max(escape_attempts) from animals);
select min(weight_kg), max(weight_kg), species from animals group by species;
select species, avg(escape_attempts) from animals where date_of_birth between '1990-01-1' and '1999-12-31' group by species;

-- new exercise starts

select * from animals where owners_id = (select id from owners where full_name = 'Melody Pond');
select * from animals where species_id = (select id from species where name = 'Pokemon');
select full_name, name from owners full outer join animals on owners.id = animals.owners_id;
select count(*), species.name from animals join species on animals.species_id = species.id group by species.name;
select name from animals where (species_id = (select id from species where name = 'Digimon') and (owners_id = (select id from owners where full_name = 'Jennifer Orwell')));
select * from animals where (escape_attempts < 1) and (owners_id = (select id from owners where full_name = 'Dean Winchester'));
select count(*), full_name from animals join owners on animals.owners_id = owners.id group by full_name;
select count(*) as total, full_name from animals join owners on animals.owners_id = owners.id group by full_name order by total desc limit 1;