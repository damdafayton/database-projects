alter table animals
add column species varchar;

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
delete from animals where date_of_birth>'2022-01-01';
savepoint beforeWeightUpdate;
update animals
set weight_kg = weight_kg * -1;
rollback to savepoint beforeWeightUpdate;
update animals
set weight_kg = weight_kg * -1 where weight_kg < 0;
commit;