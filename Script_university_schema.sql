CREATE DATABASE db_university_schema;
USE db_university_schema;

CREATE TABLE courses (
    `id` INT AUTO_INCREMENT,
    `degree_id` INT,
    `name`  VARCHAR(255),
    `description` VARCHAR(255),
    `period` DATE,
    `year` YEAR,
    `cfu` INT,
    PRIMARY KEY(id)
);

CREATE TABLE students (
    `id` INT  AUTO_INCREMENT,
    `degree_id` INT,
    `name` VARCHAR(255),
    `surname` VARCHAR(255),
    `date_of_birth` DATE,
    `fiscal_code` VARCHAR(16),
    `enrolment_date` DATE,
    `registration_number` INT,
    `email` VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE degrees (
    `id` INT AUTO_INCREMENT,
    `departmant_id` INT,
    `level` INT,
    `name` VARCHAR(255),
    `website` VARCHAR(255),
    `email` VARCHAR(255),
    PRIMARY KEY(id)
);

CREATE TABLE departments (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255),
    `address` VARCHAR(255),
    `phone` VARCHAR(20),
    `email` VARCHAR(255),
    `website` VARCHAR(255),
    `head_of_department` VARCHAR(100),
    PRIMARY KEY(id)
);

CREATE TABLE teachers (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(255),
    `surname` VARCHAR(255),
    `phone` VARCHAR(20),
    `email` VARCHAR(255),
    `office_address` VARCHAR(255),
    `office_number` INT,
    PRIMARY KEY(id)
);

CREATE TABLE exams (
    `id` INT AUTO_INCREMENT,
    `student_id` INT,
    `course_id` INT,
    `date` DATE,
    `hour` TIME,
    `address` VARCHAR(255),
     PRIMARY KEY(id)
);


-- Aggiungo le colenne per le secondary key 
ALTER table courses ADD FOREIGN KEY (degree_id) REFERENCES degrees(id);
ALTER table exams ADD FOREIGN KEY (course_id) REFERENCES courses(id);
ALTER table students ADD FOREIGN KEY (degree_id) REFERENCES degrees(id);
ALTER table degrees ADD FOREIGN KEY (departmant_id) REFERENCES departments(id);




-- Departments
INSERT INTO departments (name, address, phone, email, website, head_of_department)
VALUES ('Dipartimento di Informatica', 'Via delle Tre case 1, Milano', '+39 02 1234567', 'informatica@unimib.it', 'https://www.unimib.it', 'Prof. Giuseppe Bianchi');
-- Teachers
INSERT INTO teachers (name, surname, phone, email, office_address, office_number)
VALUES ('Giuseppe', 'Bianchi', '+39 333 1234567', 'giuseppe.bianchi@example.com', 'Via delle Tre case 1, Milano', 21);
-- Degrees
INSERT INTO degrees (departmant_id, level, name, website, email)
VALUES (1, 1, 'Informatica', 'https://www.unimib.it/informatica', 'info@unimib.it');
-- Students
INSERT INTO students (degree_id, name, surname, date_of_birth, fiscal_code, enrolment_date, registration_number, email)
VALUES (1, 'Mario', 'Rossi', '1995-05-25', 'RSSMRA95C15E001X', '2018-09-01', 12345, 'mario.rossi@example.com');
-- Courses
INSERT INTO courses (degree_id, name, description, period, year, cfu)
VALUES (1, 'Algoritmi e Strutture Dati', 'Corsi di Algoritmi e Strutture Dati.', '2020-09-01', 2020, 6);
-- Exams
INSERT INTO exams (student_id, course_id, date, hour, address)
VALUES (1, 1, '2020-12-25', '14:00:00', 'Via San Francesco 123, Roma');



