CREATE DATABASE veterinary;

CREATE TABLE owners(
    ownerid INT PRIMARY KEY,
    ofirstname VARCHAR(50),
    olastname VARCHAR(50),
    address VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    dfirstname VARCHAR(50),
    dlastname VARCHAR(50),
    specialization VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100)
);

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10,2),
    paymentdate TIME,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    visitdate DATE,
    diagnosis VARCHAR(255),
    treatment VARCHAR(255),
    doctorid INT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (owner_id, first_name, last_name, address, contact_number)
VALUES
(1, 'Maria', 'Reyes', 'Lipa City, Batangas', '09171234567'),
(2, 'John', 'Cruz', 'Tanauan City, Batangas', '09281234568'),
(3, 'Andrea', 'Villanueva', 'Sto. Tomas, Batangas', '09391234569'),
(4, 'Paolo', 'Santos', 'Batangas City, Batangas', '09451234570'),
(5, 'Angela', 'Dela Cruz', 'Malvar, Batangas', '09561234571'),
(6, 'Michael', 'Ramos', 'Rosario, Batangas', '09671234572'),
(7, 'Jessa', 'Lopez', 'San Jose, Batangas', '09781234573'),
(8, 'Patrick', 'Garcia', 'Cuenca, Batangas', '09891234574'),
(9, 'Sofia', 'Torres', 'Padre Garcia, Batangas', '09901234575'),
(10, 'Kevin', 'Mendoza', 'Ibaan, Batangas', '09181234576');