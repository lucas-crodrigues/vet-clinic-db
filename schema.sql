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
