/* Database schema to keep the structure of entire database. */

 CREATE TABLE animals(
     id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
     name TEXT NOT NULL,
     date_of_birth DATE NOT NULL,
     escape_attempts INT NOT NULL,
     neutered BOOLEAN NOT NULL,
     weight_kg DECIMAL NOT NULL,
     PRIMARY KEY(id)
 );

 /* inserted new column species*/
ALTER TABLE animals
ADD COLUMN species VARCHAR(250);

/* added owners table */
 CREATE TABLE owners(
 id INT GENERATED ALWAYS AS IDENTITY,
 full_name TEXT,
 age INT,
 PRIMARY KEY(id),
 );

/* added species table */
 CREATE TABLE species(
 id INT GENERATED ALWAYS AS IDENTITY,
 name TEXT,
 PRIMARY KEY(id)
 );

/*Remove column species*/
ALTER TABLE animals DROP COLUMN species;

/*Add column species_id which is a foreign key referencing species table*/
ALTER TABLE animals ADD COLUMN species_id INT;
ALTER TABLE animals ADD CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species (id)
/*Add column owner_id which is a foreign key referencing the owners table*/
ALTER TABLE animals ADD COLUMN owner_id INT;
ALTER TABLE animals ADD CONSTRAINT owner_fk FOREIGN KEY (owner_id) REFERENCES owner (id)

/*Vets*/
CREATE TABLE vets (
    id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
    name TEXT, 
    age INT, 
    date_of_graduation DATE
);

/*SPECIALIZATION*/
CREATE TABLE specialization (
    species_id INT, 
    vet_id INT
);
ALTER TABLE specialization ADD PRIMARY KEY (species_id, vet_id);
ALTER TABLE specialization ADD CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE specialization ADD CONSTRAINT vets_fk FOREIGN KEY (vet_id) REFERENCES vets (id);

/*Visits*/
CREATE TABLE visits (
    animal_id INT, 
    vet_id INT,
    date_of_visit DATE
);
ALTER TABLE visits ADD PRIMARY KEY (animal_id, vet_id, date_of_visit);
ALTER TABLE visits ADD CONSTRAINT animals_fk FOREIGN KEY (animal_id) REFERENCES animals (id);
ALTER TABLE visits ADD CONSTRAINT vets_k FOREIGN KEY (vet_id) REFERENCES vets (id);


ALTER TABLE owners ADD COLUMN email VARCHAR(120);
ALTER TABLE visits ALTER COLUMN date_of_visit TYPE timestamp;

ALTER TABLE visits DROP CONSTRAINT visits_pkey;


/*INDEXING*/
CREATE INDEX animals_desc ON visits(animal_id DESC);
CREATE INDEX vets_id_desc ON visits(vets_id DESC);
CREATE INDEX email_desc ON owners(email DESC);

