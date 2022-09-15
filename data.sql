/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES('Agumon', '03-02-2020', 0, true, 10.23),
		('Gabumon', '15-11-2018', 2, true, 8),
		('Pikachu', '07-01-2021', 1, false, 15.04),
		('Devimon', '12-05-2017', 5, true, 11);

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
VALUES('Charmander', '08-02-2020', 0, false, -11),
		('Plantmon', '15-11-2021', 2, true, -5.7),
		('Squirtle', '02-04-1993', 3, false, -12.13),
		('Angemon', '12-06-2005', 1, true, -45),
		('Boarmon', '07-06-2005', 7, true, 20.4),
		('Blossom', '13-10-1998', 3, true, 17),
		('Ditto', '14-05-2022', 4, true, 22);

INSERT INTO owners (full_name, age)
VALUES('Sam Smith', 34 ),
		('Jennifer Orwell', 19),
		('Bob ', 45),
		('Melody Pond', 77),
		('Dean Winchester', 14),
		('Jodie Whittaker', 38);

INSERT INTO species (name)
VALUES('Pokemon'),
		('Digimon');

UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE species_id IS NULL;
UPDATE animals SET owners_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owners_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owners_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owners_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owners_id = 5 WHERE name IN ('Angemon', 'Boarmon');
