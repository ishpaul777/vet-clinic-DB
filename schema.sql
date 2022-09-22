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

/*Add column owner_id which is a foreign key referencing the owners table*/
ALTER TABLE animals ADD CONSTRAINT species_fk FOREIGN KEY (species_id) REFERENCES species (id)
