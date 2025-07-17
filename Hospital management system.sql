-- Create Database
CREATE DATABASE hospital_management;

-- Departments Table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(300) NOT NULL UNIQUE,
    location VARCHAR(300),
);

INSERT INTO Departments (dept_id, dept_name, location) VALUES
(1, 'Cardiology', 'Block A'),
(2, 'Neurology', 'Block B'),
(3, 'Orthopedics', 'Block C'),
(4, 'Emergency', 'Block D'),
(5, 'Radiology', 'Block E'),
(6, 'Pathology', 'Block F'),
(7, 'Pediatrics', 'Block G'),
(8, 'Oncology', 'Block H'),
(9, 'Dermatology', 'Block I'),
(10, 'Gastroenterology', 'Block J'),
(11, 'Ophthalmology', 'Block K'),
(12, 'ENT', 'Block L'),
(13, 'Psychiatry', 'Block M'),
(14, 'Urology', 'Block N'),
(15, 'Nephrology', 'Block O'),
(16, 'Rheumatology', 'Block P'),
(17, 'Endocrinology', 'Block Q'),
(18, 'Hematology', 'Block R'),
(19, 'Pulmonology', 'Block S'),
(20, 'General Surgery', 'Block T');

/*QUERIES*/

SELECT * FROM Departments;

SELECT * FROM Departments
WHERE dept_name = 'Cardiology';

SELECT * FROM Departments
ORDER BY dept_name ASC;

SELECT * FROM Departments
WHERE location = 'Block A';

SELECT COUNT(*) AS total_departments FROM Departments;

UPDATE Departments
SET location = 'Block Z'
WHERE dept_name = 'Neurology';

DELETE FROM Departments
WHERE dept_name = 'Rheumatology';

SELECT COUNT(*) AS total_departments FROM Departments;

SELECT location, COUNT(*) AS dept_count FROM Departments GROUP BY location;

SELECT * FROM Departments WHERE dept_name LIKE 'P%';

UPDATE Departments SET location = 'Building Z' WHERE dept_id = 10;


SELECT * FROM Departments WHERE location IS NULL;

UPDATE Departments SET dept_name = 'Emergency Services' WHERE dept_id = 8;



-- Doctors Table
CREATE TABLE Doctors (
    doc_id INT PRIMARY KEY,
    doc_name VARCHAR(300) NOT NULL,
    dept_id INT NOT NULL,
    specialization VARCHAR(100),
    phone VARCHAR(300) UNIQUE,
    email VARCHAR(300) UNIQUE ,
    hire_date DATE,
    status varchar(300),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);


INSERT INTO Doctors (doc_id, doc_name, dept_id, specialization, phone, email, hire_date, status) VALUES
(1, 'Dr. Aamir Khan', 1, 'Cardiologist', '+923001111111', 'aamir.khan@hospital.com', '2015-05-10', 'Active'),
(2, 'Dr. Sana Iqbal', 2, 'Neurologist', '+923002222222', 'sana.iqbal@hospital.com', '2017-03-15', 'Active'),
(3, 'Dr. Ali Hassan', 3, 'Orthopedic Surgeon', '+923003333333', 'ali.hassan@hospital.com', '2018-11-20', 'Active'),
(4, 'Dr. Maryam Noor', 4, 'Emergency Medicine', '+923004444444', 'maryam.noor@hospital.com', '2019-06-30', 'Active'),
(5, 'Dr. Imran Shah', 5, 'Radiologist', '+923005555555', 'imran.shah@hospital.com', '2016-12-05', 'Active'),
(6, 'Dr. Nadia Saeed', 6, 'Pathologist', '+923006666666', 'nadia.saeed@hospital.com', '2020-01-10', 'Active'),
(7, 'Dr. Bilal Raza', 7, 'Pediatrician', '+923007777777', 'bilal.raza@hospital.com', '2021-04-25', 'Active'),
(8, 'Dr. Faisal Qureshi', 8, 'Oncologist', '+923008888888', 'faisal.qureshi@hospital.com', '2014-08-19', 'Active'),
(9, 'Dr. Zara Malik', 9, 'Dermatologist', '+923009999999', 'zara.malik@hospital.com', '2013-02-11', 'Active'),
(10, 'Dr. Hamid Raza', 10, 'Gastroenterologist', '+923010101010', 'hamid.raza@hospital.com', '2012-10-21', 'Active');
/*Queries*/
SELECT * FROM Doctors;

SELECT doc_name, specialization FROM Doctors;

SELECT * FROM Doctors WHERE status = 'Active' AND dept_id = 1;

SELECT * FROM Doctors WHERE status = 'Inactive' OR dept_id = 5;

SELECT COUNT(*) AS total_doctors FROM Doctors;

SELECT dept_id, COUNT(*) AS doctor_count FROM Doctors GROUP BY dept_id;

SELECT * FROM Doctors WHERE hire_date > '2017-01-01' AND specialization LIKE '%Surgeon%';

SELECT * FROM Doctors WHERE phone LIKE '+92300%' OR status = 'Inactive';

UPDATE Doctors SET status = 'Inactive' WHERE doc_id = 3;


SELECT * FROM Doctors WHERE email IS NULL OR email = '';

SELECT * FROM Doctors 
WHERE (dept_id = 1 AND status = 'Active') OR specialization LIKE '%Radiologist%';

SELECT status, dept_id, COUNT(*) AS count 
FROM Doctors
GROUP BY status, dept_id;


-- Patients Table
CREATE TABLE Patients (
    p_id INT PRIMARY KEY,
    p_name VARCHAR(100) NOT NULL,
    dob DATE,
    gender varchar(200),
    contact VARCHAR(200),
    email VARCHAR(100) UNIQUE,
    address VARCHAR(255),
    emergency_contact VARCHAR(20),
    blood_group VARCHAR(3),
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Patients (p_id, p_name, dob, gender, contact, email, address, emergency_contact, blood_group, registration_date) VALUES
(1, 'Fatima Malik', '1985-03-22', 'Female', '+923011111111', 'fatima.malik@example.com', '123 Street, City', '+923099999999', 'A+', GETDATE()),
(2, 'Omar Sheikh', '1990-07-15', 'Male', '+923022222222', 'omar.sheikh@example.com', '456 Avenue, City', '+923088888888', 'B-', GETDATE()),
(3, 'Zainab Qureshi', '2002-11-05', 'Female', '+923033333333', 'zainab.qureshi@example.com', '789 Road, City', '+923077777777', 'O+', GETDATE()),
(4, 'Ahmed Riaz', '1978-02-28', 'Male', '+923044444444', 'ahmed.riaz@example.com', '101 Lane, City', '+923066666666', 'AB+', GETDATE()),
(5, 'Sara Khan', '1995-06-10', 'Female', '+923055555555', 'sara.khan@example.com', '202 Street, City', '+923055555555', 'A-', GETDATE()),
(6, 'Hassan Ali', '1982-09-17', 'Male', '+923066666666', 'hassan.ali@example.com', '303 Boulevard, City', '+923044444444', 'B+', GETDATE()),
(7, 'Amna Tariq', '1975-12-24', 'Female', '+923077777777', 'amna.tariq@example.com', '404 Park, City', '+923033333333', 'O-', GETDATE()),
(8, 'Usman Iqbal', '1998-05-05', 'Male', '+923088888888', 'usman.iqbal@example.com', '505 Drive, City', '+923022222222', 'A+', GETDATE()),
(9, 'Nadia Javed', '1989-11-30', 'Female', '+923099999999', 'nadia.javed@example.com', '606 Circle, City', '+923011111111', 'B-', GETDATE()),
(10, 'Zeeshan Butt', '1970-01-15', 'Male', '+923010101010', 'zeeshan.butt@example.com', '707 Square, City', '+923099999999', 'AB-', GETDATE()),
(11, 'Iqra Shah', '2000-08-21', 'Female', '+923020202020', 'iqra.shah@example.com', '808 Way, City', '+923088888888', 'O+', GETDATE()),
(12, 'Bilal Ahmed', '1993-03-14', 'Male', '+923030303030', 'bilal.ahmed@example.com', '909 Lane, City', '+923077777777', 'A-', GETDATE()),
(13, 'Mahnoor Ali', '1997-07-07', 'Female', '+923040404040', 'mahnoor.ali@example.com', '1010 Road, City', '+923066666666', 'B+', GETDATE()),
(14, 'Saad Khalid', '1984-10-10', 'Male', '+923050505050', 'saad.khalid@example.com', '1111 Street, City', '+923055555555', 'O-', GETDATE()),
(15, 'Hina Aslam', '1991-06-06', 'Female', '+923060606060', 'hina.aslam@example.com', '1212 Avenue, City', '+923044444444', 'A+', GETDATE()),
(16, 'Ali Raza', '1979-12-12', 'Male', '+923070707070', 'ali.raza@example.com', '1313 Drive, City', '+923033333333', 'B-', GETDATE()),
(17, 'Saba Noor', '1987-08-08', 'Female', '+923080808080', 'saba.noor@example.com', '1414 Boulevard, City', '+923022222222', 'O+', GETDATE()),
(18, 'Khalid Hussain', '1994-04-04', 'Male', '+923090909090', 'khalid.hussain@example.com', '1515 Circle, City', '+923011111111', 'AB+', GETDATE()),
(19, 'Maria Tariq', '1988-09-09', 'Female', '+923011111112', 'maria.tariq@example.com', '1616 Park, City', '+923022222223', 'A-', GETDATE()),
(20, 'Faisal Javed', '1996-02-02', 'Male', '+923022222223', 'faisal.javed@example.com', '1717 Way, City', '+923033333334', 'B+', GETDATE());
/*Queries*/
SELECT * FROM Patients;

SELECT p_name, dob, email, blood_group FROM Patients;

SELECT * FROM Patients WHERE gender = 'Female' AND address LIKE '%City%';

SELECT * FROM Patients WHERE gender = 'Female' AND address LIKE '%City%';

SELECT COUNT(*) AS total_patients FROM Patients;

SELECT gender, COUNT(*) AS count FROM Patients GROUP BY gender;

SELECT * FROM Patients
WHERE registration_date >= DATEADD(MONTH, -3, GETDATE());

SELECT * FROM Patients WHERE contact = emergency_contact;

SELECT * FROM Patients WHERE email IS NULL OR email = '';

SELECT * FROM Patients ORDER BY registration_date DESC;

SELECT * FROM Patients
WHERE (gender = 'Male' AND blood_group = 'B+')
   OR (gender = 'Female' AND registration_date > '2023-01-01');



-- Staff Table (nurses, technicians, admin, etc.)
CREATE TABLE Staff (
    staff_id INT IDENTITY(1,1) PRIMARY KEY,
    staff_name VARCHAR(100) NOT NULL,
    role VARCHAR(50),
    dept_id INT NULL,
    phone VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    status VARCHAR(20) CHECK (status IN ('Active', 'On Leave', 'Terminated')) DEFAULT 'Active',
    CONSTRAINT FK_Staff_Departments FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Staff (staff_name, role, dept_id, phone, email, hire_date, status) VALUES
('Nurse Ayesha', 'Nurse', 1, '+923100000001', 'ayesha.nurse@hospital.com', '2016-09-12', 'Active'),
('Technician Bilal', 'Lab Technician', 6, '+923100000002', 'bilal.tech@hospital.com', '2018-01-23', 'Active'),
('Receptionist Sana', 'Receptionist', NULL, '+923100000003', 'sana.reception@hospital.com', '2019-04-30', 'Active'),
('Cleaner Ali', 'Cleaner', NULL, '+923100000004', 'ali.cleaner@hospital.com', '2015-07-01', 'Active'),
('Nurse Zara', 'Nurse', 2, '+923100000005', 'zara.nurse@hospital.com', '2017-08-14', 'Active'),
('Technician Omar', 'Lab Technician', 7, '+923100000006', 'omar.tech@hospital.com', '2020-10-10', 'Active'),
('Receptionist Maryam', 'Receptionist', NULL, '+923100000007', 'maryam.reception@hospital.com', '2021-05-25', 'Active'),
('Cleaner Faizan', 'Cleaner', NULL, '+923100000008', 'faizan.cleaner@hospital.com', '2014-03-19', 'Active'),
('Nurse Sana', 'Nurse', 3, '+923100000009', 'sana.nurse3@hospital.com', '2015-11-23', 'Active'),
('Technician Ali', 'Lab Technician', 8, '+923100000010', 'ali.tech8@hospital.com', '2017-01-17', 'Active'),
('Receptionist Amina', 'Receptionist', NULL, '+923100000011', 'amina.reception@hospital.com', '2018-06-05', 'Active'),
('Cleaner Rehan', 'Cleaner', NULL, '+923100000012', 'rehan.cleaner@hospital.com', '2019-09-01', 'Active'),
('Nurse Hina', 'Nurse', 4, '+923100000013', 'hina.nurse4@hospital.com', '2013-02-02', 'Active'),
('Technician Iqbal', 'Lab Technician', 9, '+923100000014', 'iqbal.tech9@hospital.com', '2016-12-20', 'Active'),
('Receptionist Nadia', 'Receptionist', NULL, '+923100000015', 'nadia.reception@hospital.com', '2017-07-07', 'Active'),
('Cleaner Kamran', 'Cleaner', NULL, '+923100000016', 'kamran.cleaner@hospital.com', '2015-05-10', 'Active'),
('Nurse Faisal', 'Nurse', 5, '+923100000017', 'faisal.nurse5@hospital.com', '2018-08-30', 'Active'),
('Technician Asad', 'Lab Technician', 10, '+923100000018', 'asad.tech10@hospital.com', '2020-11-22', 'Active'),
('Receptionist Kiran', 'Receptionist', NULL, '+923100000019', 'kiran.reception@hospital.com', '2019-12-15', 'Active'),
('Cleaner Zain', 'Cleaner', NULL, '+923100000020', 'zain.cleaner@hospital.com', '2016-04-14', 'Active');


CREATE TABLE Rooms (
    room_id INT IDENTITY(1,1) PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    dept_id INT NULL,
    room_type VARCHAR(20) CHECK (room_type IN ('General', 'Private', 'ICU', 'Operation Theater')),
    capacity INT DEFAULT 1,
    CONSTRAINT FK_Rooms_Departments FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
INSERT INTO Rooms (room_number, dept_id, room_type, capacity) VALUES
('101', 1, 'General', 4),
('102', 2, 'Private', 1),
('103', 3, 'ICU', 2),
('104', 4, 'Operation Theater', 1),
('201', 5, 'General', 3),
('202', 6, 'Private', 2),
('203', 7, 'ICU', 1),
('204', 8, 'General', 5),
('301', 9, 'Private', 1),
('302', 10, 'General', 2);

/*BED*/
CREATE TABLE Beds (
    bed_id INT IDENTITY(1,1) PRIMARY KEY,
    room_id INT NOT NULL,
    bed_number VARCHAR(10) NOT NULL,
    is_occupied BIT DEFAULT 0,
    CONSTRAINT FK_Beds_Rooms FOREIGN KEY (room_id) REFERENCES Rooms(room_id),
    CONSTRAINT UQ_Bed_Room UNIQUE (room_id, bed_number)
);
INSERT INTO Beds (room_id, bed_number, is_occupied) VALUES
(1, '1A', 0),
(1, '1B', 0),
(1, '1C', 1),
(1, '1D', 0),
(2, '2A', 0),
(3, '3A', 1),
(3, '3B', 0),
(4, '4A', 0),
(5, '5A', 0),
(5, '5B', 0),
(5, '5C', 1),
(6, '6A', 0),
(6, '6B', 1),
(7, '7A', 0),
(8, '8A', 1),
(8, '8B', 0),
(8, '8C', 0),
(8, '8D', 1),
(8, '8E', 0),
(9, '9A', 0),
(10, '10A', 0),
(10, '10B', 0);

/*Appointments*/
CREATE TABLE Appointments (
    app_id INT IDENTITY(1,1) PRIMARY KEY,
    p_id INT NOT NULL,
    doc_id INT NOT NULL,
    app_datetime DATETIME NOT NULL,
    status VARCHAR(20) CHECK (status IN ('Scheduled', 'Completed', 'Cancelled')) DEFAULT 'Scheduled',
    remarks VARCHAR(MAX) NULL,
    CONSTRAINT FK_Appointments_Patients FOREIGN KEY (p_id) REFERENCES Patients(p_id),
    CONSTRAINT FK_Appointments_Doctors FOREIGN KEY (doc_id) REFERENCES Doctors(doc_id)
);

INSERT INTO Appointments (p_id, doc_id, app_datetime, status, remarks) VALUES
(1, 1, '2025-07-20 10:00:00', 'Scheduled', 'Routine checkup'),
(2, 2, '2025-07-21 15:30:00', 'Scheduled', 'Neurological evaluation'),
(3, 3, '2025-07-22 09:00:00', 'Completed', 'Fracture consultation'),
(4, 4, '2025-07-23 11:15:00', 'Cancelled', 'Emergency follow-up'),
(5, 5, '2025-07-24 14:00:00', 'Scheduled', 'Radiology scan'),
(6, 6, '2025-07-25 08:30:00', 'Scheduled', 'Pathology tests'),
(7, 7, '2025-07-26 10:45:00', 'Scheduled', 'Pediatric checkup'),
(8, 8, '2025-07-27 13:15:00', 'Completed', 'Cancer screening'),
(9, 9, '2025-07-28 09:30:00', 'Scheduled', 'Skin allergy test'),
(10, 10, '2025-07-29 15:00:00', 'Scheduled', 'Gastrointestinal consultation'),
(11, 1, '2025-07-30 10:00:00', 'Scheduled', 'Follow-up appointment'),
(12, 2, '2025-07-31 11:00:00', 'Scheduled', 'Neurological MRI review'),
(13, 3, '2025-08-01 14:30:00', 'Scheduled', 'Orthopedic surgery consult'),
(14, 4, '2025-08-02 08:00:00', 'Scheduled', 'Emergency trauma'),
(15, 5, '2025-08-03 09:00:00', 'Completed', 'X-ray review'),
(16, 6, '2025-08-04 10:30:00', 'Scheduled', 'Lab test follow-up'),
(17, 7, '2025-08-05 13:00:00', 'Scheduled', 'Child vaccination'),
(18, 8, '2025-08-06 09:00:00', 'Scheduled', 'Chemotherapy session'),
(19, 9, '2025-08-07 14:00:00', 'Cancelled', 'Dermatology consult'),
(20, 10, '2025-08-08 16:00:00', 'Scheduled', 'GI tract examination');


/*Treatement*/
CREATE TABLE Treatments (
    treat_id INT IDENTITY(1,1) PRIMARY KEY,
    app_id INT NOT NULL,
    diagnosis VARCHAR(255) NULL,
    treatment_desc VARCHAR(MAX) NULL,
    treatment_date DATE NULL,
    CONSTRAINT FK_Treatments_Appointments FOREIGN KEY (app_id) REFERENCES Appointments(app_id)
);

INSERT INTO Treatments (app_id, diagnosis, treatment_desc, treatment_date) VALUES
(1, 'Hypertension', 'Prescribed medication and lifestyle changes', '2025-07-20'),
(2, 'Migraine', 'Pain relief medication prescribed', '2025-07-21'),
(3, 'Fractured arm', 'Cast applied, physiotherapy advised', '2025-07-22'),
(4, 'Follow-up Emergency', 'Monitoring recovery', '2025-07-23'),
(5, 'Lung infection', 'Antibiotics prescribed', '2025-07-24'),
(6, 'Blood disorder', 'Further blood tests ordered', '2025-07-25'),
(7, 'Seasonal flu', 'Rest and antiviral medication', '2025-07-26'),
(8, 'Breast cancer', 'Chemotherapy started', '2025-07-27'),
(9, 'Eczema', 'Topical steroids applied', '2025-07-28'),
(10, 'Gastritis', 'Antacids prescribed', '2025-07-29'),
(11, 'Hypertension follow-up', 'Medication dosage adjusted', '2025-07-30'),
(12, 'Neurological MRI Review', 'Medication prescribed', '2025-07-31'),
(13, 'Orthopedic consultation', 'Surgery scheduled', '2025-08-01'),
(14, 'Emergency trauma', 'Surgical intervention', '2025-08-02'),
(15, 'X-ray review', 'Physical therapy advised', '2025-08-03'),
(16, 'Lab test follow-up', 'Further tests ordered', '2025-08-04'),
(17, 'Child vaccination', 'Vaccines administered', '2025-08-05'),
(18, 'Chemotherapy session', 'Continued treatment', '2025-08-06'),
(19, 'Dermatology consultation', 'Medication prescribed', '2025-08-07'),
(20, 'GI tract examination', 'Dietary changes recommended', '2025-08-08');

/*Medicine*/

CREATE TABLE Medicines (
    med_id INT IDENTITY(1,1) PRIMARY KEY,
    med_name VARCHAR(100) NOT NULL UNIQUE,
    med_description VARCHAR(MAX) NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0
);

INSERT INTO Medicines (med_name, med_description, price, stock) VALUES
('Amlodipine', 'Used to treat high blood pressure', 5.50, 100),
('Paracetamol', 'Pain reliever and fever reducer', 1.00, 500),
('Ibuprofen', 'Anti-inflammatory medicine', 2.00, 300),
('Amoxicillin', 'Antibiotic for bacterial infections', 3.00, 200),
('Metformin', 'Used for diabetes management', 4.00, 150),
('Omeprazole', 'Reduces stomach acid', 6.00, 120),
('Atorvastatin', 'Lowers cholesterol', 7.50, 80),
('Cetirizine', 'Antihistamine for allergies', 1.50, 350),
('Salbutamol', 'Used for asthma relief', 3.50, 90),
('Clindamycin', 'Antibiotic for infections', 5.00, 75),
('Levothyroxine', 'Thyroid hormone replacement', 8.00, 60),
('Lisinopril', 'Treats high blood pressure', 4.50, 110),
('Azithromycin', 'Antibiotic for respiratory infections', 6.50, 130),
('Hydrochlorothiazide', 'Diuretic for blood pressure', 3.75, 95),
('Prednisone', 'Anti-inflammatory corticosteroid', 4.25, 70),
('Fluoxetine', 'Antidepressant medication', 7.00, 50),
('Ranitidine', 'Reduces stomach acid', 2.25, 140),
('Doxycycline', 'Antibiotic for bacterial infections', 5.75, 85),
('Gabapentin', 'Used to treat nerve pain', 9.00, 45),
('Warfarin', 'Blood thinner to prevent clots', 10.00, 40);


CREATE TABLE Prescriptions (
    presc_id INT IDENTITY(1,1) PRIMARY KEY,
    treat_id INT NOT NULL,
    med_id INT NOT NULL,
    dosage VARCHAR(100) NULL,
    duration VARCHAR(50) NULL,
    CONSTRAINT FK_Prescriptions_Treatments FOREIGN KEY (treat_id) REFERENCES Treatments(treat_id),
    CONSTRAINT FK_Prescriptions_Medicines FOREIGN KEY (med_id) REFERENCES Medicines(med_id)
);

INSERT INTO Prescriptions (treat_id, med_id, dosage, duration) VALUES
(1, 1, '5mg once daily', '30 days'),
(2, 2, '500mg every 6 hours', '5 days'),
(3, 3, '400mg every 8 hours', '10 days'),
(4, 4, '250mg three times daily', '7 days'),
(5, 5, '500mg twice daily', '60 days'),
(6, 6, '20mg once daily', '30 days'),
(7, 7, '10mg daily', '45 days'),
(8, 8, '10mg once daily', '14 days'),
(9, 9, '2 puffs as needed', 'as required'),
(10, 10, '300mg twice daily', '14 days'),
(11, 11, '50mcg daily', '90 days'),
(12, 12, '10mg once daily', '60 days'),
(13, 13, '500mg daily', '10 days'),
(14, 14, '25mg once daily', '30 days'),
(15, 15, '10mg daily', '7 days'),
(16, 16, '20mg daily', '30 days'),
(17, 17, '150mg daily', '10 days'),
(18, 18, '100mg twice daily', '14 days'),
(19, 19, '300mg daily', '30 days'),
(20, 20, '5mg daily', 'Indefinite');


CREATE TABLE LabTests (
    test_id INT IDENTITY(1,1) PRIMARY KEY,
    test_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(MAX) NULL,
    price DECIMAL(10,2) NULL
);

INSERT INTO LabTests (test_name, description, price) VALUES
('Complete Blood Count', 'Measures components of blood', 20.00),
('MRI Scan', 'Magnetic resonance imaging', 150.00),
('X-Ray', 'Radiographic imaging for bones', 50.00),
('Blood Sugar Test', 'Measures glucose levels', 15.00),
('Skin Allergy Test', 'Detects allergic reactions', 30.00),
('Urine Analysis', 'Tests urine components', 12.00),
('Liver Function Test', 'Assesses liver health', 40.00),
('Kidney Function Test', 'Assesses kidney health', 35.00),
('Electrocardiogram (ECG)', 'Heart electrical activity', 60.00),
('Chest CT Scan', 'Detailed lung imaging', 200.00),
('Thyroid Panel', 'Thyroid hormone levels', 55.00),
('Lipid Profile', 'Cholesterol and fats', 45.00),
('Pregnancy Test', 'Detects pregnancy hormones', 10.00),
('Vitamin D Test', 'Vitamin D level in blood', 25.00),
('HIV Test', 'Detects HIV infection', 30.00),
('COVID-19 PCR Test', 'Detects COVID-19 virus', 80.00),
('Bone Density Scan', 'Measures bone strength', 90.00),
('Stool Test', 'Detects intestinal infections', 20.00),
('Blood Culture', 'Detects infections in blood', 70.00),
('C-Reactive Protein', 'Inflammation marker', 40.00);

CREATE TABLE LabReports (
    report_id INT IDENTITY(1,1) PRIMARY KEY,
    p_id INT NOT NULL,
    test_id INT NOT NULL,
    test_date DATE NULL,
    result VARCHAR(MAX) NULL,
    doctor_comments VARCHAR(MAX) NULL,
    CONSTRAINT FK_LabReports_Patients FOREIGN KEY (p_id) REFERENCES Patients(p_id),
    CONSTRAINT FK_LabReports_LabTests FOREIGN KEY (test_id) REFERENCES LabTests(test_id)
);
INSERT INTO LabReports (p_id, test_id, test_date, result, doctor_comments) VALUES
(1, 1, '2025-07-20', 'Normal levels', 'No concerns'),
(2, 2, '2025-07-21', 'No abnormalities', 'MRI clear'),
(3, 3, '2025-07-22', 'Fracture detected', 'Apply cast'),
(4, 4, '2025-07-23', 'Elevated sugar', 'Monitor diet'),
(5, 5, '2025-07-24', 'Mild reaction', 'Prescribed antihistamines'),
(6, 6, '2025-07-25', 'Normal', 'No action required'),
(7, 7, '2025-07-26', 'Slight elevation', 'Monitor liver function'),
(8, 8, '2025-07-27', 'Kidney normal', 'Continue current meds'),
(9, 9, '2025-07-28', 'Normal sinus rhythm', 'Good heart health'),
(10, 10, '2025-07-29', 'Minor inflammation', 'Follow-up advised'),
(11, 11, '2025-07-30', 'Thyroid normal', 'No treatment needed'),
(12, 12, '2025-07-31', 'Borderline cholesterol', 'Lifestyle changes advised'),
(13, 13, '2025-08-01', 'Negative', 'No pregnancy'),
(14, 14, '2025-08-02', 'Low vitamin D', 'Supplements recommended'),
(15, 15, '2025-08-03', 'Negative', 'No infection'),
(16, 16, '2025-08-04', 'Negative', 'No COVID detected'),
(17, 17, '2025-08-05', 'Normal bone density', 'Good condition'),
(18, 18, '2025-08-06', 'No infection', 'Healthy'),
(19, 19, '2025-08-07', 'No growth', 'No blood infection'),
(20, 20, '2025-08-08', 'Low inflammation', 'Monitor CRP levels');


CREATE TABLE Billing (
    bill_id INT IDENTITY(1,1) PRIMARY KEY,
    p_id INT NOT NULL,
    bill_date DATE NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    paid_amount DECIMAL(10,2) DEFAULT 0,
    payment_status VARCHAR(20) CHECK (payment_status IN ('Paid', 'Pending', 'Cancelled')) DEFAULT 'Pending',
    payment_mode VARCHAR(20) CHECK (payment_mode IN ('Cash', 'Card', 'Insurance', 'Online')) DEFAULT 'Cash',
    CONSTRAINT FK_Billing_Patients FOREIGN KEY (p_id) REFERENCES Patients(p_id)
);

INSERT INTO Billing (p_id, bill_date, amount, paid_amount, payment_status, payment_mode) VALUES
(1, '2025-07-20', 150.00, 150.00, 'Paid', 'Card'),
(2, '2025-07-21', 200.00, 0.00, 'Pending', 'Cash'),
(3, '2025-07-22', 300.00, 300.00, 'Paid', 'Insurance'),
(4, '2025-07-23', 100.00, 0.00, 'Pending', 'Online'),
(5, '2025-07-24', 250.00, 250.00, 'Paid', 'Card'),
(6, '2025-07-25', 180.00, 0.00, 'Pending', 'Cash'),
(7, '2025-07-26', 120.00, 120.00, 'Paid', 'Card'),
(8, '2025-07-27', 350.00, 350.00, 'Paid', 'Insurance'),
(9, '2025-07-28', 90.00, 0.00, 'Pending', 'Online'),
(10, '2025-07-29', 400.00, 400.00, 'Paid', 'Cash'),
(11, '2025-07-30', 230.00, 230.00, 'Paid', 'Card'),
(12, '2025-07-31', 210.00, 0.00, 'Pending', 'Cash'),
(13, '2025-08-01', 190.00, 190.00, 'Paid', 'Card'),
(14, '2025-08-02', 310.00, 0.00, 'Pending', 'Online'),
(15, '2025-08-03', 150.00, 150.00, 'Paid', 'Card'),
(16, '2025-08-04', 400.00, 400.00, 'Paid', 'Insurance'),
(17, '2025-08-05', 100.00, 0.00, 'Pending', 'Cash'),
(18, '2025-08-06', 270.00, 270.00, 'Paid', 'Card'),
(19, '2025-08-07', 220.00, 0.00, 'Pending', 'Online'),
(20, '2025-08-08', 320.00, 320.00, 'Paid', 'Card');


CREATE TABLE StaffSchedules (
    schedule_id INT IDENTITY(1,1) PRIMARY KEY,
    staff_id INT NOT NULL,
    work_date DATE NOT NULL,
    shift VARCHAR(20) CHECK (shift IN ('Morning', 'Afternoon', 'Night')) NOT NULL,
    CONSTRAINT FK_StaffSchedules_Staff FOREIGN KEY (staff_id) REFERENCES Staff(staff_id),
    CONSTRAINT UQ_StaffSchedules UNIQUE (staff_id, work_date, shift)
);

INSERT INTO StaffSchedules (staff_id, work_date, shift) VALUES
(1, '2025-07-20', 'Morning'),
(2, '2025-07-20', 'Afternoon'),
(3, '2025-07-20', 'Night'),
(4, '2025-07-21', 'Morning'),
(5, '2025-07-21', 'Afternoon'),
(6, '2025-07-21', 'Night'),
(7, '2025-07-22', 'Morning'),
(8, '2025-07-22', 'Afternoon'),
(9, '2025-07-22', 'Night'),
(10, '2025-07-23', 'Morning'),
(11, '2025-07-23', 'Afternoon'),
(12, '2025-07-23', 'Night'),
(13, '2025-07-24', 'Morning'),
(14, '2025-07-24', 'Afternoon'),
(15, '2025-07-24', 'Night'),
(16, '2025-07-25', 'Morning'),
(17, '2025-07-25', 'Afternoon'),
(18, '2025-07-25', 'Night'),
(19, '2025-07-26', 'Morning'),
(20, '2025-07-26', 'Afternoon');



/* Patient Details with Appointments and Doctors*/

SELECT
    p.p_id,
    p.p_name,
    p.gender,
    p.contact,
    a.app_datetime,
    a.status AS appointment_status,
    d.doc_name,
    d.specialization
FROM
    Patients p
LEFT JOIN
    Appointments a ON p.p_id = a.p_id
LEFT JOIN
    Doctors d ON a.doc_id = d.doc_id
ORDER BY
    p.p_name, a.app_datetime;


/*Patient Treatment and Prescribed Medicines*/

SELECT TOP 10
    p.p_name,
    t.diagnosis,
    t.treatment_desc,
    t.treatment_date,
    m.med_name,
    pr.dosage,
    pr.duration
FROM
    Patients p
JOIN
    Appointments a ON p.p_id = a.p_id
JOIN
    Treatments t ON a.app_id = t.app_id
JOIN
    Prescriptions pr ON t.treat_id = pr.treat_id
JOIN
    Medicines m ON pr.med_id = m.med_id
ORDER BY
    t.treatment_date DESC;

/*Lab Reports for a Patient*/
SELECT
    p.p_name,
    lt.test_name,
    lr.test_date,
    lr.result,
    lr.doctor_comments
FROM
    LabReports lr
JOIN
    Patients p ON lr.p_id = p.p_id
JOIN
    LabTests lt ON lr.test_id = lt.test_id
WHERE
    p.p_id = 6 -- Change patient id as needed
ORDER BY
    lr.test_date DESC;


/*Billing Summary per Patient*/
SELECT
    p.p_name,
    b.bill_date,
    b.amount,
    b.paid_amount,
    b.payment_status,
    b.payment_mode
FROM
    Billing b
JOIN
    Patients p ON b.p_id = p.p_id
WHERE
    p.p_id = 1 -- specific patient
ORDER BY
    b.bill_date DESC;

/*Staff Schedules for a Specific Date*/

SELECT
    s.staff_name,
    s.role,
    ss.work_date,
    ss.shift,
    d.dept_name
FROM
    StaffSchedules ss
JOIN
    Staff s ON ss.staff_id = s.staff_id
LEFT JOIN
    Departments d ON s.dept_id = d.dept_id
WHERE
    ss.work_date = '2025-07-20'
ORDER BY
    ss.shift, s.staff_name;

/*Room and Bed Occupancy Status*/
SELECT
    r.room_number,
    r.room_type,
    b.bed_number,
    CASE WHEN b.is_occupied = 1 THEN 'Occupied' ELSE 'Available' END AS bed_status,
    d.dept_name
FROM
    Rooms r
JOIN
    Beds b ON r.room_id = b.room_id
LEFT JOIN
    Departments d ON r.dept_id = d.dept_id
ORDER BY
    r.room_number, b.bed_number;

/*Doctor Quries*/
/*Doctor Details with Appointments and Patient Info*/
SELECT
    d.doc_id,
    d.doc_name,
    d.specialization,
    d.phone,
    a.app_datetime,
    a.status AS appointment_status,
    p.p_name AS patient_name,
    p.gender
FROM
    Doctors d
LEFT JOIN
    Appointments a ON d.doc_id = a.doc_id
LEFT JOIN
    Patients p ON a.p_id = p.p_id
ORDER BY
    d.doc_name, a.app_datetime;
/*Doctor’s Treated Patients and Prescribed Medicines*/
SELECT TOP 10
    d.doc_name,
    d.specialization,
    p.p_name,
    t.diagnosis,
    t.treatment_desc,
    t.treatment_date,
    m.med_name,
    pr.dosage,
    pr.duration
FROM
    Doctors d
JOIN
    Appointments a ON d.doc_id = a.doc_id
JOIN
    Patients p ON a.p_id = p.p_id
JOIN
    Treatments t ON a.app_id = t.app_id
JOIN
    Prescriptions pr ON t.treat_id = pr.treat_id
JOIN
    Medicines m ON pr.med_id = m.med_id
ORDER BY
    t.treatment_date DESC;
/*Doctor’s Treated Patients and Prescribed Medicines*/
SELECT
    d.doc_name,
    p.p_name,
    lt.test_name,
    lr.test_date,
    lr.result,
    lr.doctor_comments
FROM
    Doctors d
JOIN
    Appointments a ON d.doc_id = a.doc_id
JOIN
    Patients p ON a.p_id = p.p_id
JOIN
    LabReports lr ON p.p_id = lr.p_id
JOIN
    LabTests lt ON lr.test_id = lt.test_id
WHERE
    d.doc_id = 1 
ORDER BY
    lr.test_date DESC;

/*Lab Reports Ordered by a Doctor's Patients*/
SELECT
    d.doc_name,
    p.p_name,
    b.bill_date,
    b.amount,
    b.paid_amount,
    b.payment_status,
    b.payment_mode
FROM
    Doctors d
JOIN
    Appointments a ON d.doc_id = a.doc_id
JOIN
    Patients p ON a.p_id = p.p_id
JOIN
    Billing b ON p.p_id = b.p_id
WHERE
    d.doc_id = 2
ORDER BY
    b.bill_date DESC;

/*Billing Summary for Patients Seen by a Doctor*/
SELECT
    s.staff_name,
    s.role,
    ss.work_date,
    ss.shift,
    d1.dept_name AS department_of_staff,
    d2.doc_name AS doctor
FROM
    StaffSchedules ss
JOIN
    Staff s ON ss.staff_id = s.staff_id
JOIN
    Departments d1 ON s.dept_id = d1.dept_id
JOIN
    Doctors d2 ON d1.dept_id = d2.dept_id
WHERE
    ss.work_date = '2025-07-20'
ORDER BY
    ss.shift, s.staff_name;

/*Room & Bed Occupancy in Doctor's Department*/
SELECT
    d.doc_name,
    d.specialization,
    r.room_number,
    r.room_type,
    b.bed_number,
    CASE WHEN b.is_occupied = 1 THEN 'Occupied' ELSE 'Available' END AS bed_status,
    dept.dept_name
FROM
    Doctors d
JOIN
    Departments dept ON d.dept_id = dept.dept_id
JOIN
    Rooms r ON dept.dept_id = r.dept_id
JOIN
    Beds b ON r.room_id = b.room_id
ORDER BY
    d.doc_name, r.room_number, b.bed_number;


