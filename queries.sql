/*Queries that provide answers to the questions from all projects.*/

--SELECT * from animals WHERE name LIKE '%mon';

--SELECT name FROM animals WHERE date_of_birth BETWEEN '01-01-2016' AND '31-12-2019';

SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
