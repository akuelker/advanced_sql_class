--Exercise 3
select * from seminar
select * from course
select * from register order by progcode
select * from students

--Part 1
--Create PRIMARY KEYS
ALTER TABLE Seminar
ADD CONSTRAINT PK_semcode PRIMARY KEY (Semcode)

ALTER TABLE Course
ADD CONSTRAINT PK_progcode PRIMARY KEY (progcode)

ALTER TABLE Register
ADD CONSTRAINT PK_ssn_prog PRIMARY KEY (stunum,progcode)

ALTER TABLE Students
ADD CONSTRAINT PK_stunum PRIMARY KEY (stunum)


--create FOREIGN KEYS
--Bullet 1
ALTER TABLE Course
ADD CONSTRAINT FK_course_semcode FOREIGN KEY (Semcode)
REFERENCES Seminar (Semcode)

--Bullets 2 & 3
ALTER TABLE Register
ADD CONSTRAINT FK_register_progcode FOREIGN KEY (progcode)
REFERENCES Course (Progcode)
ON DELETE CASCADE
ON UPDATE CASCADE

--Bullets 4 & 5
ALTER TABLE Register
ADD CONSTRAINT FK_register_ssn FOREIGN KEY (stunum)
REFERENCES Students (stunum)
ON DELETE CASCADE
ON UPDATE CASCADE



--Part 2

UPDATE Seminar SET semcode = 'CM999' WHERE semcode = 'CM101'

DELETE FROM Course WHERE progcode = 'A1007'

select * from register order by stunum
select * from students order by stunum

UPDATE Students SET stunum = '111111' WHERE stunum = '331372'

UPDATE Register SET stunum = '222222' WHERE stunum = '371314'

select ssn, count(ssn)
from register
group by ssn
having count(ssn) > 1

--Part Extra

ALTER TABLE Staff
ADD CONSTRAINT PK_staff_empnum PRIMARY KEY (Empnum)


ALTER TABLE Staff
ADD CONSTRAINT FK_staff_mgr FOREIGN KEY (manager)
REFERENCES staff (empnum)

select * from staff

--self join

select s1.empnum, s1.empname as Employee, s1.manager as BossID, s2.empname as Boss
from staff s1
	left outer join staff s2 on s1.manager = s2.empnum
order by s1.empnum