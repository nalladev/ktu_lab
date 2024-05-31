CREATE TABLE Department (
    Dept_no NUMBER PRIMARY KEY,
    Dept_name VARCHAR(20) NOT NULL,
    Dept_HOD VARCHAR(15) CHECK (Dept_HOD LIKE 'Prof%')
);

CREATE TABLE Student (
    Roll_no NUMBER PRIMARY KEY,
    Stud_name VARCHAR(15) CHECK (Stud_name LIKE 'B%' OR Stud_name LIKE 'S%' OR Stud_name LIKE 'E%' OR Stud_name LIKE 'P%'),
    Marks NUMBER,
    Dept_no NUMBER REFERENCES Department(Dept_no),
    City VARCHAR(15) CHECK(City IN ('cochin', 'Bombay', 'madras', 'delhi')),
    Date_of_joining DATE
);
