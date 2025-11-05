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

INSERT INTO animals (animal_id, name, species, breed, sex, age, owner_id, date_registered)
VALUES
(1, 'Buddy', 'Dog', 'Golden Retriever', 'Male', 3, 1, '2024-10-01'),
(2, 'Mittens', 'Cat', 'Persian', 'Female', 2, 2, '2024-09-15'),
(3, 'Chirpy', 'Bird', 'Parakeet', 'Male', 1, 3, '2024-11-01'),
(4, 'Shadow', 'Dog', 'German Shepherd', 'Male', 4, 4, '2024-08-20'),
(5, 'Luna', 'Cat', 'Siamese', 'Female', 1, 5, '2024-07-10'),
(6, 'Nibbles', 'Rabbit', 'Netherland Dwarf', 'Male', 2, 6, '2024-10-05'),
(7, 'Coco', 'Dog', 'Shih Tzu', 'Female', 5, 7, '2024-06-25'),
(8, 'Goldie', 'Fish', 'Goldfish', 'Female', 1, 8, '2024-09-30'),
(9, 'Spike', 'Dog', 'Bulldog', 'Male', 6, 9, '2024-08-12'),
(10, 'Bella', 'Cat', 'Maine Coon', 'Female', 3, 10, '2024-07-19');

INSERT INTO appointments (appointid, animalid, appointdate, reason)
VALUES
(1, 1, '2023-01-05', 'Regular Check-up'),
(2, 2, '2023-01-10', 'Vaccination'),
(3, 3, '2023-02-01', 'Injury Check'),
(4, 4, '2023-02-15', 'Dental Cleaning'),
(5, 5, '2023-03-05', 'Skin Problem'),
(6, 6, '2023-03-20', 'Eye Infection'),
(7, 7, '2023-04-10', 'Vaccination'),
(8, 8, '2023-04-25', 'Surgery Consultation'),
(9, 9, '2023-05-01', 'Allergy Treatment'),
(10, 10, '2023-05-18', 'Health Check');

INSERT INTO medicalrecords (recordid, animalid, recorddate, doctorid, diagnosis, prescription, notes)
VALUES 
    (1, 1, '2023-01-05 00:00:00', 1, 'Health check', 'N/A', 'Regular checkup, no issue detected'),
    (2, 2, '2023-01-10 00:00:00', 1, 'Vaccination', 'Vaccine X', 'Administered vaccination X as per schedule'),
    (3, 3, '2023-02-02 00:00:00', 3, 'Sprained leg', 'Pain Medication', 'Rest recommended for two weeks'),
    (4, 4, '2023-02-15 00:00:00', 1, 'Dental cleaning', 'N/A', 'Completed dental cleaning procedure'),
    (5, 5, '2023-03-10 00:00:00', 4, 'Skin infection', 'Antibiotics', 'Prescribed antibiotics for skin infection'),
    (6, 6, '2023-03-10 00:00:00', 2, 'Flea infestation', 'Flea Treatment', 'Administered flea treatment'),
    (7, 7, '2023-04-12 00:00:00', 1, 'Vaccination', 'Vaccine Y', 'Administered vaccination Y as per schedule'),
    (8, 8, '2023-04-18 00:00:00', 5, 'Spaying', 'N/A', 'Successfully performed spaying surgery'),
    (9, 9, '2023-05-02 00:00:00', 4, 'Allergic reaction', 'Antihistamines', 'Allergic reaction due to food prescribed antihistamine'),
    (10, 10, '2023-05-20 00:00:00', 6, 'Conjunctivitis', 'Eye drops', 'Prescribed eye drops for conjunctivitis');

