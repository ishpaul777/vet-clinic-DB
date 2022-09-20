/*Queries that provide answers to the questions from all projects.*/

 /*Find all animals whose name ends in "mon"*/
 SELECT * FROM animals WHERE name like '%mon';
 
 /*List the name of all animals born between 2016 and 2019.*/
 SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
 
 /*List the name of all animals that are neutered and have less than 3 escape attempts*/
 SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
 
 /**/
 SELECT date_of_birth FROM animals WHERE name IN ('Pikachu', 'Agumon');
 
 /*List name and escape attempts of animals that weigh more than 10.5kg*/
 
 /*Find all animals that are neutered.*/
 
 /*
Find all animals not named Gabumon.*/
 
 /**/
 
 /**/
