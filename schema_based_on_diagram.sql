/*patients*/
CREATE TABLE patients(
  id INT,
  name VARCHAR,
  date_of_birth DATE,
  PRIMARY KEY(id)
);

/*Medical histories*/
CREATE TABLE medical_histories(
  id INT,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES patients (id),
  status VARCHAR,
  PRIMARY KEY(id)
);

/*TREATMENTS*/
CREATE TABLE treatments(
  id SERIAL PRIMARY KEY,
  type VARCHAR(50),
  name VARCHAR(100)
);

/*TREATMENTS - Medical History*/
/*MANY-TO-MANY*/
CREATE TABLE treatment_histories(
  treatment_id INT REFERENCES treatments(id),
  medical_history_id INT REFERENCES medical_histories(id)
);

/*Invoices*/
CREATE TABLE invoices(
  id INT,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP;
  medical_history_id INT REFERENCES medical_histories (id),
  PRIMARY KEY(id)
)

CREATE TABLE invoice_items(
  id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT REFERENCES invoices(id),
  treatment_id INT REFERENCES treatments(id)
);
