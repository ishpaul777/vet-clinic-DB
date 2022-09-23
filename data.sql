/* Populate database with sample data. */
 
 /*--Animals--*/
 
 /*ID GENERATED ALWAYS AS IDENTITY */
 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Agumon', '03-Jan-2020', 0, TRUE, 10.23);

 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Gabumon', '15-Nov-2018', 2, TRUE, 8);
 
 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Pikachu', '07-Jan-2021', 1, FALSE, 15.04);
 
 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Devimon', '12-May-2017', 5, TRUE, 11);
 
 
 /*Adding new data*/
 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Charmander', '08-Feb-2020', FALSE, 0, -11);
 
 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Plantmon', '15-Nov-2021', 2, TRUE, -5.7);
 
 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Squirtle', '02-Apr-1993', 3, FALSE, -12.13);
 
 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Angemon', '12-Jul-2005', 1, TRUE, -45);
 
 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Boarmon', '7-Jun-2005', , TRUE,, 20.4);
 
 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Blossom', '13-Oct-1998', TRUE, 3, 17);
 
 INSERT INTO animals(name, date_of_birth, escape_attempts, neutered, weight_kg)
 VALUES ('Ditto', '14-May-2022', 4, TRUE, 22);
 
/*OWNERS*/ 
INSERT INTO owners(full_name, age) VALUES('Sam Smith', 34);
INSERT INTO owners(full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners(full_name, age) VALUES('Bob', 45);
INSERT INTO owners(full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners(full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners(full_name, age) VALUES('Jodie Whittaker', 38);

/* species */
INSERT INTO species(name) VALUES('Digimon');
INSERT INTO species(name) VALUES('Pokemon');

/*Adding species_id*/
UPDATE animals
   SET species_id = (SELECT id FROM species WHERE name = 'Digimon')
   WHERE name LIKE '%mon';
UPDATE animals
   SET species_id = (SELECT id FROM species WHERE name = 'Pokemon')
   WHERE name NOT LIKE '%mon'
   

/*Adding owner_id*/  
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name = 'Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id = 3 WHERE name = 'Devimon' OR name = 'Plantmon';
UPDATE animals SET owner_id = 4 WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id = 5 WHERE name = 'Angemon' OR name = 'Boarmon';


/* vets */
INSERT INTO vets(name, age, date_of_graduation) VALUES('William Tatcher', 45, '23-Apr-2000');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Maisy Smith', 26, '17-Jan-2019');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Stephanie Mendez', 64, '04-May-1981');
INSERT INTO vets(name, age, date_of_graduation) VALUES('Jack Harkness', 38, '08-Jun-2008');


/*Specialiazation data*/
 INSERT INTO specialization VALUES (
  (SELECT id FROM species WHERE name = 'Pokemon'),
  (SELECT id FROM vets WHERE name = 'William Tatcher')
);

 INSERT INTO specialization VALUES (
  (SELECT id FROM species WHERE name = 'Pokemon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
);

 INSERT INTO specialization VALUES (
  (SELECT id FROM species WHERE name = 'Digimon'),
  (SELECT id FROM vets WHERE name = 'Stephanie Mendez')
);

 INSERT INTO specialization VALUES (
  (SELECT id FROM species WHERE name = 'Digimon'),
  (SELECT id FROM vets WHERE name = 'Jack Harkness')
);

