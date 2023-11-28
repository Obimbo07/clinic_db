
CREATE TABLE patients(
    id INT PRIMARY KEY,
    name VARCHAR,
    date_of_birth DATE
);

CREATE TABLE invoices(
    id INT PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT
);

CREATE TABLE medical_histories(
    id INT PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(255)
);

CREATE TABLE invoice_items (
    id INT PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT
);

CREATE TABLE treatments (
    id INT PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    name VARCHAR,
    treatment_id INT,
    FOREIGN KEY (treatment_id) REFERENCES Treatments(TreatmentsID),
);

ALTER TABLE medical_histories
ADD CONSTRAINT patient_fk FOREIGN KEY (patient_id) 
REFERENCES patients(id);

ALTER TABLE invoice_items
ADD CONSTRAINT invoice_fk FOREIGN KEY (invoice_id)
REFERENCES invoices(id);