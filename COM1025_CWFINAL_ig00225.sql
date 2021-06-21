CREATE TABLE Current_Residents(
URN INT UNSIGNED NOT NULL,
FName VARCHAR(255) NOT NULL,
LName VARCHAR(255) NOT NULL,
Campus_Name VARCHAR(255) NOT NULL,
Room_Type ENUM ('Band_A', 'Band_B', 'Band_C', 'Band_D', 'Band_E', 'Band_F'),
Rent_Per_Week INT UNSIGNED NOT NULL,
Resident_Type ENUM ('Student', 'Academic'),
PRIMARY KEY (URN),
FOREIGN KEY (Campus_Name) REFERENCES Campus_Details (Campus_Name)
);

INSERT INTO Current_Residents VALUES
(0001, 'Tony', 'Stark', 'Manor Park', 'Band_B', 151, 'Academic'),
(0002, 'Hulk', 'Hogan', 'Manor Park', 'Band_A', 155, 'Student'),
(0003, 'Bruce', 'Banner', 'Stag Hill', 'Band_D', 132, 'Academic'),
(0004, 'Illidan', 'Stormrage', 'Stag Hill', 'Band_D', 132, 'Academic'),
(0005, 'Peter', 'Parker', 'Hazel Farm', 'Band_F', 101, 'Student'),
(0006, 'Bruce', 'Lee', 'Stag Hill', 'Band_C', 126, 'Academic'),
(0007, 'Todd', 'Howard', 'Hazel Farm', 'Band_E', 108, 'Student'),
(0008, 'Hugh', 'Jackman', 'Manor Park', 'Band_B', 151, 'Student'),
(0009, 'Michael', 'Jordan', 'Stag Hill', 'Band_D', 132, 'Student'),
(0010, 'Thomas', 'Shelby', 'Manor Park', 'Band_A', 151, 'Academic'),
(0011, 'Jackie', 'Chan', 'Hazle Farm', 'Band_F', 101, 'Academic'),
(0012, 'Liam', 'Neeson', 'Stag Hill', 'Band_B', 151, 'Academic'),
(0013, 'Nicolas', 'Cage', 'Hazel Farm', 'Band_E', 108, 'Academic'),
(0014, 'Kurt', 'Russell', 'Stag Hill', 'Band_C', 126, 'Student'),
(0015, 'Christopher', 'Nolan', 'Hazel Farm', 'Band_E', 108, 'Academic'),
(0016, 'Bob', 'Ross', 'Stag Hill', 'Band_C', 126, 'Student'),
(0017, 'Harry', 'Potter', 'Hazel Farm', 'Band_F', 101, 'Student');


CREATE TABLE Resident_Email(
URN INT UNSIGNED NOT NULL,
Email VARCHAR(255) NOT NULL UNIQUE,
PRIMARY KEY (URN, Email),
FOREIGN KEY (URN) REFERENCES Current_Residents (URN)
ON DELETE CASCADE
);

INSERT INTO Resident_Email VALUES
(0001, 'ts0001@surrey.ac.uk'),
(0002, 'hh0002@surrey.ac.uk'),
(0003, 'bb0003@surrey.ac.uk'),
(0004, 'is0004@surrey.ac.uk'),
(0005, 'pp0005@surrey.ac.uk'),
(0006, 'bl0006@surrey.ac.uk'),
(0007, 'th0007@surrey.ac.uk'),
(0008, 'hj0008@surrey.ac.uk'),
(0009, 'mj0009@surrey.ac.uk'),
(0010, 'ts0010@surrey.ac.uk'),
(0011, 'jc0011@surrey.ac.uk'),
(0012, 'ln0012@surrey.ac.uk'),
(0013, 'nc0013@surrey.ac.uk'),
(0014, 'kr0014@surrey.ac.uk'),
(0015, 'cn0015@surrey.ac.uk'),
(0016, 'br0016@surrey.ac.uk'),
(0017, 'hp0017@surrey.ac.uk');


CREATE TABLE Academic (
Acad_URN INT NOT NULL,
Hire_Start_Date Date,
Dept_Name Varchar(255) NOT NULL,
PRIMARY KEY (Acad_URN),
FOREIGN KEY (Acad_URN) REFERENCES Current_Residents (URN)
ON DELETE CASCADE
);

INSERT INTO Academic VALUES
(0001, '2020-08-15', 'Physical and Engineering Sciences'),
(0003, '2020-06-21', 'Chemical Engineering'),
(0004, '2020-07-11', 'Business and Management'),
(0006, '2020-06-13', ' Chemical Engineering'),
(0010, '2020-09-28', 'Business and Managemen'),
(0011, '2020-10-02', 'Physical and Engineering Sciences'),
(0012, '2020-08-10', 'Physical and Engineering Sciences'),
(0013, '2020-09-24', 'Chemical Engineering'),
(0015, '2020-07-21', 'Business and Managemen');


CREATE TABLE Student (
Stu_URN INT NOT NULL,
Stu_Type ENUM ('UG', 'PG'),
Stu_Course VARCHAR(255),
Course_Hours INT UNSIGNED NOT NULL,
Lives_With INT,
PRIMARY KEY(Stu_URN),
FOREIGN KEY (Stu_URN) REFERENCES Current_Residents (URN)
ON DELETE CASCADE
);

INSERT INTO Student VALUES
(0002, 'UG', 'Mechanical Engineering', 25, null),
(0005, 'UG', 'Accounting and Finance', 29, 0017),
(0007, 'PG', 'Computer Science', 24, null),
(0008, 'UG', 'Organic Chemestry', 28, null),
(0009, 'PG', 'Mechanical Engineering', 28, null),
(0014, 'UG', 'Computer Science', 26, 0016),
(0016, 'UG', 'Organic Chemestry', 28, 0014),
(0017, 'PG', 'Accounting and Finance', 26, 0005);


CREATE TABLE Campus_Details (
Campus_Name VARCHAR(255),
Rooms_Available_In_Campus ENUM('Band_A', 'Band_B', 'Band_C', 'Band_D', 'Band_E', 'Band_F'),
Zip_Code INT UNSIGNED NOT NULL,
PRIMARY KEY (Campus_Name, Rooms_Available_In_Campus)
);

INSERT INTO Campus_Details VALUES
('Stag Hill', 'Band_C', 1111),
('Stag Hill', 'Band_D', 1111),
('Manor Park', 'Band_A', 2222),
('Manor Park', 'Band_B', 2222),
('Hazel Farm', 'Band_E', 3333),
('Hazel Farm', 'Band_F', 3333);


CREATE TABLE Reception(
Reception_Name VARCHAR(255) NOT NULL,
Campus_Name VARCHAR(255) NOT NULL,
Opening_Hrs VARCHAR(255) NOT NULL,
PRIMARY KEY (Reception_Name),
FOREIGN KEY (Campus_Name) REFERENCES Campus_Details (Campus_Name)
);

INSERT INTO Reception VALUES
('Manor Reception', 'Manor Park', '08:00-10:00'),
('Stag Reception', 'Stag Hill', '06:00-16:00'),
('Hazel Reception', 'Hazel Farm', '07:00-18:00');


CREATE TABLE Staff (
Staff_URN INT UNSIGNED NOT NULL,
Staff_Name VARCHAR(255),
Staff_Email VARCHAR(255),
Supervises INT UNSIGNED,
PRIMARY KEY (Staff_URN) 
);

INSERT INTO Staff VALUES
(1001, 'Tommy', 'tommy@surrey.ac.uk', null),
(1002, 'Virgil', 'virgil@surrey.ac.uk', 1001),
(1003, 'Vicky', 'vicky@surrey.ac.uk', null),
(1004, 'Jack', 'jack@surrey.ac.uk', null),
(1005, 'Nik', 'nik@surrey.ac.uk', 1003),
(1006, 'Ben', 'ben@surrey.ac.uk', 1007),
(1007, 'Monika', 'monika@surrey.ac.uk', null),
(1008, 'Abby', 'abby@surrey.ac.uk', null);


CREATE TABLE Works_In (
Staff_URN INT NOT NULL,
Reception_Name VARCHAR(255) NOT NULL,
PRIMARY KEY (Staff_URN, Reception_Name),
FOREIGN KEY (Staff_URN) REFERENCES Staff (Staff_URN),
FOREIGN KEY (Reception_Name) REFERENCES Reception (Reception_Name)
ON DELETE CASCADE
);

INSERT INTO Works_In VALUES
(1001, 'Stag Hill'),
(1002, 'Manor Park'),
(1003, 'Manor Park'),
(1004, 'Hazel Farm'),
(1005, 'Stag Hill'),
(1006, ' Hazel Farm'),
(1007, 'Stag Hill'),
(1008, 'Hazel Farm');


/*This one references to List of students from Current Residents who have Course Hours more than average*/
SELECT CONCAT(FName, ' ', LName) AS 'Student'
FROM current_residents
where urn in (select stu_urn from student
where course_hours > (select avg(course_hours) from student));


/*The second one references to List of Current Academics*/
SELECT CONCAT(FName, ' ', LName) AS 'academic'
from current_residents
where resident_type = 'academic'
group by FName;


/*The last one references to List of Academic's Hire Start Dates*/
SELECT CONCAT(FName, ' ', LName) AS 'academic', academic.hire_start_date
from current_residents
inner join academic
on current_residents.urn = academic.acad_urn;
