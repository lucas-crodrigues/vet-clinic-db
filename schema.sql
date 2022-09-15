/* Database schema to keep the structure of entire database. */

CREATE DATABASE vet_clinic;

CREATE TABLE animals (
	id serial PRIMARY KEY,
	name varchar(100) NOT NULL,
	date_of_birth date NOT NULL,
	escape_attempts int DEFAULT 0,
	neutered BOOLEAN NOT NULL,
	weight_kg NUMERIC(10,2) NOT NULL
);

ALTER TABLE animals ADD species varchar(100);

CREATE TABLE owners (
	id serial PRIMARY KEY,
	full_name varchar(100) NOT NULL,
	age INT
);

CREATE TABLE species (
	id serial PRIMARY KEY,
	name varchar(100) NOT NULL
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT, ADD CONSTRAINT f_species_id FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;

ALTER TABLE animals ADD COLUMN owners_id INT, ADD CONSTRAINT f_owners_id FOREIGN KEY (owners_id) REFERENCES owners(id) ON DELETE CASCADE;
