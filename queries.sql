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