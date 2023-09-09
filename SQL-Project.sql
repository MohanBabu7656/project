create database project;
use project;

/*----Create the Students table-----*/
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    age int CHECK(age>=22),
    email VARCHAR(100) UNIQUE
    /*-- Add more fields as needed------*/
);
/*----- Create the Courses table-----*/
CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(255) NOT NULL,
    department VARCHAR(100),
    credit_hours INT
    /*---- Add more fields as needed-----*/
    
);

/*---- Create the Professors table------*/
CREATE TABLE Professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE,
    department VARCHAR(100),
    /*---- Add more fields as needed-------*/
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

/*------ Create the Assignments table to track course assignments------*/
CREATE TABLE Assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id int,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    due_date DATE,
    /*----- Add more fields as needed------*/
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


/*----- Create the Enrollments table to track student enrollments in courses----*/
CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    professor_id INT,
    student_id INT,
    enrollment_date DATE NOT NULL,
    /*------ Add more fields as needed-----*/
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id)
);

/*------ Create the Grades table to store student grades for assignments------*/
CREATE TABLE Grades (
    grade_id INT AUTO_INCREMENT PRIMARY KEY,
    enrollment_id INT,
    assignment_id INT,
    score DECIMAL(5, 2),
    /*------ Add more fields as needed------*/
    FOREIGN KEY (enrollment_id) REFERENCES Enrollments(enrollment_id),
    FOREIGN KEY (assignment_id) REFERENCES Assignments(assignment_id)
);
show tables;


