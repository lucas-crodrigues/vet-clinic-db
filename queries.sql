/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '31-12-2019';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Pikachu' OR name = 'Agumon';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species='unspecified';
SELECT * FROM animals;
ROLLBACK;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
SELECT * FROM animals;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '01-01-2022';
SAVEPOINT before2022;
UPDATE animals SET weight_kg = (weight_kg*-1);
ROLLBACK TO before2022;
UPDATE animals SET weight_kg = (weight_kg*-1) WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) from animals;
SELECT COUNT(*) from animals WHERE escape_attempts =0;
SELECT AVG(weight_kg) from animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT species,MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species,AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;

SELECT name FROM animals INNER JOIN owners ON animals.owners_id = owners.id WHERE full_name = 'Melody Pond';
SELECT animals.name FROM animals JOIN species ON animals.species_id = species.id WHERE species.name = 'Pokemon';
SELECT owners.full_name,animals.name as animal_name FROM owners LEFT JOIN animals ON owners.id = animals.owners_id;
SELECT species.name,COUNT(*) FROM animals LEFT JOIN species ON animals.species_id = species.id GROUP BY species.name;
SELECT animals.name FROM animals LEFT JOIN species ON animals.species_id = species.id LEFT JOIN owners ON owners_id = owners.id WHERE species.name = 'Digimon' AND full_name = 'Jennifer Orwell';
SELECT animals.name FROM animals LEFT JOIN owners ON animals.owners_id = owners.id WHERE animals.escape_attempts = 0 AND owners.full_name = 'Dean Winchester';
SELECT full_name, COUNT(*) FROM animals LEFT JOIN owners ON owners_id = owners.id GROUP BY full_name ORDER BY COUNT(*) DESC LIMIT 1;
