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
    speciality VARCHAR(100),
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
    recorddate DATE,
    doctorid INT,
    diagnosis VARCHAR(255),
    prescription VARCHAR(255),
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);

INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email)
VALUES
(1, 'Sophia', 'Turner', '123 Maple Street, Quezon City', '09171234567', 'sophia.turner@example.com'),
(2, 'Daniel', 'Rivera', '45 Oak Avenue, Manila', '09281234567', 'daniel.rivera@example.com'),
(3, 'Hannah', 'Garcia', '78 Pine Road, Cebu City', '09184561234', 'hannah.garcia@example.com'),
(4, 'Jacob', 'Santos', '99 Elm Street, Davao City', '09351239876', 'jacob.santos@example.com'),
(5, 'Olivia', 'Ramirez', '56 Cherry Lane, Pasig City', '09193456782', 'olivia.ramirez@example.com'),
(6, 'Elijah', 'Cruz', '12 Palm Drive, Makati', '09274567891', 'elijah.cruz@example.com'),
(7, 'Mia', 'Reyes', '88 Jasmine Street, Laguna', '09451237890', 'mia.reyes@example.com'),
(8, 'Lucas', 'Flores', '23 Coconut Blvd, Batangas', '09182345679', 'lucas.flores@example.com'),
(9, 'Ava', 'Torres', '67 Mango Street, Baguio City', '09561234578', 'ava.torres@example.com'),
(10, 'Ethan', 'Domingo', '34 Acacia Street, Iloilo City', '09179876543', 'ethan.domingo@example.com');

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Buddy', 'Dog', 'Golden Retriever', '2020-05-14', 'Male', 'Golden', 1),
(2, 'Mittens', 'Cat', 'Persian', '2021-03-22', 'Female', 'White', 2),
(3, 'Chirpy', 'Bird', 'Parakeet', '2022-06-10', 'Male', 'Green', 3),
(4, 'Shadow', 'Dog', 'German Shepherd', '2019-08-19', 'Male', 'Black and Tan', 4),
(5, 'Luna', 'Cat', 'Siamese', '2021-11-05', 'Female', 'Cream', 5),
(6, 'Nibbles', 'Rabbit', 'Netherland Dwarf', '2022-02-14', 'Male', 'Gray', 6),
(7, 'Coco', 'Dog', 'Shih Tzu', '2018-09-09', 'Female', 'Brown and White', 7),
(8, 'Goldie', 'Fish', 'Goldfish', '2023-01-01', 'Female', 'Orange', 8),
(9, 'Spike', 'Dog', 'Bulldog', '2019-07-23', 'Male', 'White', 9),
(10, 'Bella', 'Cat', 'Maine Coon', '2020-12-17', 'Female', 'Gray and White', 10);

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
