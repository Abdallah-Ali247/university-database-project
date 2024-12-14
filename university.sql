create database university;
use university;

# create Student table 
CREATE TABLE Student
(
  Stu_ID INT NOT NULL,
  Stu_Name VARCHAR(100) NOT NULL,
  Email VARCHAR(100) NOT NULL,
  UserName VARCHAR(50) NOT NULL UNIQUE,
  Password VARCHAR(100) NOT NULL,
  Phone VARCHAR(11) NOT NULL,
  Address VARCHAR(100) NOT NULL,
  Major VARCHAR(50) NOT NULL,
  Faculty VARCHAR(50) NOT NULL,
  Status ENUM('post', 'graduate') NOT NULL,
  PRIMARY KEY (Stu_ID)
);

# Insert Students data
INSERT INTO Student (Stu_ID, Stu_Name, Email, UserName, Password, Phone, Address, Major, Faculty, Status) 
VALUES 
(1, 'Ahmed Hassan', 'ahmed.hassan@email.com', 'ahmed123', 'password1', '01012345678', 'Cairo, Egypt', 'Computer Science', 'Engineering', 'post'),
(2, 'Mona Ali', 'mona.ali@email.com', 'mona456', 'password2', '01098765432', 'Giza, Egypt', 'Civil Engineering', 'Engineering', 'graduate'),
(3, 'Tarek Mohamed', 'tarek.mohamed@email.com', 'tarek789', 'password3', '01123456789', 'Alexandria, Egypt', 'Mechanical Engineering', 'Engineering', 'post'),
(4, 'Fatma Youssef', 'fatma.youssef@email.com', 'fatma123', 'password4', '01234567890', 'Mansoura, Egypt', 'Architecture', 'Engineering', 'graduate'),
(5, 'Mohamed Salah', 'mohamed.salah@email.com', 'salah456', 'password5', '01067890123', 'Aswan, Egypt', 'Electrical Engineering', 'Engineering', 'post'),
(6, 'Laila Samy', 'laila.samy@email.com', 'laila789', 'password6', '01156789012', 'Tanta, Egypt', 'Computer Science', 'Engineering', 'graduate'),
(7, 'Omar Sherif', 'omar.sherif@email.com', 'omar101', 'password7', '01234567801', 'Hurghada, Egypt', 'Mechanical Engineering', 'Engineering', 'post'),
(8, 'Salma Hassan', 'salma.hassan@email.com', 'salma202', 'password8', '01045678901', 'Port Said, Egypt', 'Civil Engineering', 'Engineering', 'graduate'),
(9, 'Khaled Fathy', 'khaled.fathy@email.com', 'khaled303', 'password9', '01123457890', 'Luxor, Egypt', 'Electrical Engineering', 'Engineering', 'post'),
(10, 'Nadia Ibrahim', 'nadia.ibrahim@email.com', 'nadia404', 'password10', '01087654321', 'Sharm El Sheikh, Egypt', 'Architecture', 'Engineering', 'graduate');


# create student degrees table
CREATE TABLE Student_degrees
(
  degrees_ VARCHAR(100) NOT NULL,
  Stu_ID INT NOT NULL,
  PRIMARY KEY (degrees_, Stu_ID),
  FOREIGN KEY (Stu_ID) REFERENCES Student(Stu_ID)
);

# insert students degrees data
INSERT INTO Student_degrees (degrees_, Stu_ID) 
VALUES 
('Bachelor of Science in Computer Science', 1),
('Bachelor of Science in Civil Engineering', 2),
('Bachelor of Science in Mechanical Engineering', 3),
('Bachelor of Science in Architecture', 4),
('Bachelor of Science in Electrical Engineering', 5),
('Master of Science in Computer Science', 6),
('Master of Science in Mechanical Engineering', 7),
('Master of Science in Civil Engineering', 8),
('Master of Science in Electrical Engineering', 9),
('Master of Science in Architecture', 10);


CREATE TABLE Postgraduate
(
  Graduation_Year INT NOT NULL,
  GPA float NOT NULL,
  Military_Service enum("exempyion","completed","not finished") NOT NULL,
  Graduation_project varchar(150),
  Stu_ID INT NOT NULL,
  FOREIGN KEY (Stu_ID) REFERENCES Student(Stu_ID)
);

INSERT INTO Postgraduate (Graduation_Year, GPA, Military_Service, Graduation_project, Stu_ID)
VALUES
(2024, 3.9, 'completed', 'AI-based Image Recognition', 1),
(2023, 3.7, 'exempyion', 'Smart City Development', 6),
(2024, 3.8, 'not finished', 'Robotics in Construction', 7),
(2023, 3.6, 'completed', 'Renewable Energy Systems', 9);


CREATE TABLE Undergraduate
(
  Start_Year INT NOT NULL,
  Current_Year INT NOT NULL,
  Stu_ID INT NOT NULL,
  FOREIGN KEY (Stu_ID) REFERENCES Student(Stu_ID)
);

INSERT INTO Undergraduate (Start_Year, Current_Year, Stu_ID)
VALUES
(2020, 2024, 2),  
(2021, 2024, 3),  
(2022, 2024, 4),  
(2023, 2024, 5),  
(2020, 2024, 8),  
(2021, 2024, 10); 


CREATE TABLE QuestionBank
(
  Ques_ID INT NOT NULL,
  Ques_Year INT NOT NULL,
  Ques_Type enum("mcq","say"),
  PRIMARY KEY (Ques_ID)
);

INSERT INTO QuestionBank (Ques_ID, Ques_Year, Ques_Type)
VALUES
(1, 2024, 'mcq'),
(2, 2024, 'say'),
(3, 2023, 'mcq'),
(4, 2023, 'say'),
(5, 2022, 'mcq'),
(6, 2022, 'say'),
(7, 2021, 'mcq'),
(8, 2021, 'say'),
(9, 2020, 'mcq'),
(10, 2020, 'say');


CREATE TABLE Department
(
  Dept_ID INT primary key,
  Dept_Name varchar(50) NOT NULL
);

INSERT INTO Department (Dept_ID, Dept_Name)
VALUES
(1, 'Computer Science'),
(2, 'Civil Engineering'),
(3, 'Mechanical Engineering'),
(4, 'Architecture'),
(5, 'Electrical Engineering');


CREATE TABLE Professor
(
  Prof_ID INT PRIMARY KEY,
  Prof_Name VARCHAR(100) NOT NULL,
  UserName VARCHAR(100) NOT NULL UNIQUE,
  Password INT NOT NULL,
  Email VARCHAR(100) NOT NULL
);

INSERT INTO Professor (Prof_ID, Prof_Name, UserName, Password, Email)
VALUES
(1, 'Dr. Ahmed Ali', 'ahmed.prof', 123456, 'ahmed.ali@university.com'),
(2, 'Dr. Mona Fathy', 'mona.prof', 654321, 'mona.fathy@university.com'),
(3, 'Dr. Tarek Sherif', 'tarek.prof', 112233, 'tarek.sherif@university.com'),
(4, 'Dr. Fatma Samy', 'fatma.prof', 223344, 'fatma.samy@university.com'),
(5, 'Dr. Mohamed Salah', 'salah.prof', 556677, 'mohamed.salah@university.com');

# alter deparmtment to add manger id
ALTER TABLE Department
ADD COLUMN mgr_id INT,
ADD FOREIGN KEY (mgr_id) REFERENCES Professor(Prof_ID);

# set manager to each department
UPDATE Department
SET mgr_id = 1 WHERE Dept_ID = 1;  
UPDATE Department
SET mgr_id = 2 WHERE Dept_ID = 2;  
UPDATE Department
SET mgr_id = 3 WHERE Dept_ID = 3;  
UPDATE Department
SET mgr_id = 4 WHERE Dept_ID = 4;  
UPDATE Department
SET mgr_id = 5 WHERE Dept_ID = 5;  

# add work on department to prof
ALTER TABLE Professor
ADD COLUMN work_on INT,
ADD FOREIGN KEY (work_on) REFERENCES Department(Dept_ID);

# set workson for each prof
UPDATE Professor
SET work_on = 1 WHERE Prof_ID = 1;   
UPDATE Professor
SET work_on = 2 WHERE Prof_ID = 2;  
UPDATE Professor
SET work_on = 3 WHERE Prof_ID = 3;   
UPDATE Professor
SET work_on = 4 WHERE Prof_ID = 4;   
UPDATE Professor
SET work_on = 5 WHERE Prof_ID = 5;  

# add data to prof after update
INSERT INTO Professor (Prof_ID, Prof_Name, UserName, Password, Email,work_on)
VALUES
(6, 'Dr. Sarah Khaled', 'sarah.prof', 123789, 'sarah.khaled@university.com', 2 ),
(7, 'Dr. Ahmed Youssef', 'ahmed.y.prof', 987654, 'ahmed.youssef@university.com', 4);

# add data to department after update
INSERT INTO Department (Dept_ID, Dept_Name, mgr_id)
VALUES
(6, 'Information Technology', 6),  
(7, 'Environmental Engineering', 7);   


CREATE TABLE Course
(
  Course_ID INT primary key,
  Course_Name varchar(100) NOT NULL,
  Post_Under_Graduate enum("post","under") NOT NULL,
  Level enum("beginner","intermid","advanced"),
  Super_Dept INT,
  FOREIGN KEY (Super_Dept) REFERENCES Department(Dept_ID)
);

INSERT INTO Course (Course_ID, Course_Name, Post_Under_Graduate, Level, Super_Dept)
VALUES
(1, 'Data Structures', 'under', 'beginner', 1),
(2, 'Introduction to Civil Engineering', 'under', 'beginner', 2),
(3, 'Thermodynamics', 'under', 'intermid', 3),
(4, 'Architectural Design', 'under', 'beginner', 4),
(5, 'Circuit Analysis', 'under', 'intermid', 5),
(6, 'Advanced Machine Learning', 'post', 'advanced', 1),
(7, 'Structural Analysis', 'post', 'advanced', 2),
(8, 'Advanced Robotics', 'post', 'advanced', 3),
(9, 'Sustainable Architecture', 'post', 'intermid', 4),
(10, 'Power Systems', 'post', 'intermid', 5);


CREATE TABLE teach
(
  Prof_ID INT NOT NULL,
  Course_ID INT NOT NULL,
  PRIMARY KEY (Prof_ID, Course_ID),
  FOREIGN KEY (Prof_ID) REFERENCES Professor(Prof_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

INSERT INTO teach (Prof_ID, Course_ID)
VALUES
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5),(6, 6),(7, 7),(1, 8),(2, 9),(3, 10);


CREATE TABLE Exame_Development
(
  Prof_ID INT NOT NULL,
  Ques_ID INT NOT NULL,
  Course_ID INT NOT NULL,
  Date DATE NOT NULL,
  PRIMARY KEY (Prof_ID, Ques_ID, Course_ID),
  FOREIGN KEY (Prof_ID) REFERENCES Professor(Prof_ID),
  FOREIGN KEY (Ques_ID) REFERENCES QuestionBank(Ques_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

INSERT INTO Exame_Development (Prof_ID, Ques_ID, Course_ID, Date)
VALUES
(1, 1, 1, '2024-01-10'),(2, 2, 2, '2024-01-12'),
(3, 3, 3, '2024-01-15'),(4, 4, 4, '2024-01-20'),
(5, 5, 5, '2024-01-22'),(6, 6, 6, '2024-01-25'),
(7, 7, 7, '2024-01-28'),(1, 8, 8, '2024-02-01'),
(2, 9, 9, '2024-02-05'),(3, 10, 10, '2024-02-10');



CREATE TABLE Exam
(
  Exam_ID INT primary key,
  Exam_Date date,
  Exam_Type enum("mcq","say"),
  Level enum("easy","medium","hard"),
  Duration INT ,
  Prof_ID INT NOT NULL,
  Ques_ID INT NOT NULL,
  Course_ID INT NOT NULL,
  FOREIGN KEY (Prof_ID, Ques_ID, Course_ID) REFERENCES Exame_Development(Prof_ID, Ques_ID, Course_ID)
);

INSERT INTO Exam (Exam_ID, Exam_Date, Exam_Type, Level, Duration, Prof_ID, Ques_ID, Course_ID)
VALUES
(1, '2024-01-15', 'mcq', 'easy', 60, 1, 1, 1),
(2, '2024-01-20', 'mcq', 'medium', 90, 2, 2, 2),
(3, '2024-01-22', 'say', 'hard', 120, 3, 3, 3),
(4, '2024-01-25', 'mcq', 'easy', 60, 4, 4, 4),
(5, '2024-01-28', 'say', 'medium', 90, 5, 5, 5),
(6, '2024-02-01', 'mcq', 'medium', 90, 6, 6, 6),
(7, '2024-02-05', 'say', 'hard', 120, 7, 7, 7),
(8, '2024-02-10', 'mcq', 'easy', 60, 1, 8, 8),
(9, '2024-02-15', 'say', 'medium', 90, 2, 9, 9),
(10, '2024-02-20', 'mcq', 'hard', 120, 3, 10, 10);


CREATE TABLE evaluate
(
  Prof_ID INT NOT NULL,
  Stu_ID INT NOT NULL,
  Course_ID INT NOT NULL,
  prof_feedback VARCHAR(500) NOT NULL,
  cours_feedback VARCHAR(500) NOT NULL,
  PRIMARY KEY (Prof_ID, Stu_ID, Course_ID),
  FOREIGN KEY (Prof_ID) REFERENCES Professor(Prof_ID),
  FOREIGN KEY (Stu_ID) REFERENCES Student(Stu_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

INSERT INTO evaluate (Prof_ID, Stu_ID, Course_ID, prof_feedback, cours_feedback)
VALUES
(1, 1, 1, 'Great understanding of data structures, but needs to focus more on practical examples.', 'Very helpful in understanding the basics of data structures, but sometimes fast-paced.'),
(2, 2, 2, 'Needs to improve clarity in explaining complex concepts, but overall knowledgeable.', 'Good course, but some topics were hard to understand without additional materials.'),
(3, 3, 3, 'Excellent grasp of thermodynamics, but needs to include more real-life examples to enhance learning.', 'Very engaging, but the subject matter was challenging at times.'),
(4, 4, 4, 'Well-organized course, but could benefit from more hands-on design tasks.', 'Great introduction to architecture, but the course material could be more interactive.'),
(5, 5, 5, 'Strong knowledge in circuit analysis, but could provide more visual aids during lectures.', 'Useful course, but the pace was too fast for beginners.');


CREATE TABLE Take
(
  Stu_ID INT NOT NULL,
  Course_ID INT NOT NULL,
  PRIMARY KEY (Stu_ID, Course_ID),
  FOREIGN KEY (Stu_ID) REFERENCES Student(Stu_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

INSERT INTO Take (Stu_ID, Course_ID)
VALUES
(1, 1),(1, 2),(2, 3),(2, 4),(3, 5),(4, 6),(5, 7);



CREATE TABLE result
(
  Stu_ID INT NOT NULL,
  Course_ID INT NOT NULL,
  Exam_ID INT NOT NULL,
  grade INT NOT NULL CHECK (grade >= 0 AND grade <= 100),
  PRIMARY KEY (Stu_ID, Course_ID, Exam_ID),
  FOREIGN KEY (Stu_ID) REFERENCES Student(Stu_ID),
  FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
  FOREIGN KEY (Exam_ID) REFERENCES Exam(Exam_ID)
);


INSERT INTO result (Stu_ID, Course_ID, Exam_ID, grade)
VALUES
(1, 1, 1, 85),(2, 3, 3, 95),(3, 2, 2, 91),(4, 4, 4, 83),(5, 7, 7, 84),
(6, 8, 8, 77),(7, 9, 9, 80),(1, 9, 9, 83),(2, 8, 8, 92),(3, 5, 5, 78),
(4, 6, 6, 82),(5, 3, 3, 76),(6, 4, 4, 88),(7, 2, 2, 74),(1, 7, 7, 75);



# ******************************************************** 
# ************** F  I  N  I  S  H  E  D ******************
# ********************************************************

# 1_ Write a query that enables the students to view their results per course 

SELECT 
    Student.Stu_Name AS Student_Name,
    Course.Course_Name AS Course_Name,
    result.Exam_ID,
    result.grade AS Grade
FROM result JOIN Student 
	ON result.Stu_ID = Student.Stu_ID
JOIN Course 
	ON result.Course_ID = Course.Course_ID
WHERE result.Stu_ID = 5; # write student Id to get his result 


# 2_ Write a query that enables the head of department to see evaluation of each course and professor. 
SELECT 
    d.Dept_Name AS Department_Name,
    p.Prof_Name AS Professor_Name,
    c.Course_Name AS Course_Name,
    e.prof_feedback AS Professor_Feedback,
    e.cours_feedback AS Course_Feedback
FROM evaluate e JOIN Professor p 
	ON e.Prof_ID = p.Prof_ID
JOIN Course c ON e.Course_ID = c.Course_ID
JOIN Department d ON c.Super_Dept = d.Dept_ID;


# 3_ Write a query that enables you to get top 10 high scores per course 

# get top 10 grades over all courses
SELECT Stu_ID, Course_ID, grade
FROM result 
WHERE grade IN (
        SELECT MAX(r.grade) FROM result r
        GROUP BY r.Course_ID )
ORDER BY grade DESC
LIMIT 10;

# top 10 grades in course
select Stu_ID, Course_ID, grade
from result 
where Course_ID = 2  # (set the ID of the Course )
order by grade desc;


# 4_ Write a query to get the highest evaluation professor from the set of professors teaching the same course 
# add column (rate) to evaluate table
ALTER TABLE evaluate
ADD COLUMN rate INT NOT NULL;

# set a rate for each evaluation
UPDATE evaluate SET rate = 4 WHERE Prof_ID = 1 AND Course_ID = 1;
UPDATE evaluate SET rate = 3 WHERE Prof_ID = 2 AND Course_ID = 2;
UPDATE evaluate SET rate = 5 WHERE Prof_ID = 3 AND Course_ID = 3;
UPDATE evaluate SET rate = 4 WHERE Prof_ID = 4 AND Course_ID = 4;
UPDATE evaluate SET rate = 3 WHERE Prof_ID = 5 AND Course_ID = 5;

# make two profs teach the same course
UPDATE teach SET Course_ID = 2 WHERE Prof_ID = 4;
UPDATE evaluate SET Course_ID = 2 WHERE Prof_ID = 4;

# 4_ Write a query to get the highest evaluation professor from the set of professors teaching the same course 

select Prof_Id , Course_ID , rate 
from evaluate
where (Course_ID, rate ) in 
	( select Course_ID, max(rate) 
		from evaluate 
		group by Course_ID );


select e.Prof_Id, p.Prof_Name , c.Course_Name , e.rate 
from evaluate e join Professor p
on e.Prof_ID = p.Prof_ID
join Course c on e.Course_ID = c.Course_ID
where (e.Course_ID, e.rate ) in 
	( select e2.Course_ID, max(e2.rate) 
		from evaluate e2
		group by Course_ID );        
