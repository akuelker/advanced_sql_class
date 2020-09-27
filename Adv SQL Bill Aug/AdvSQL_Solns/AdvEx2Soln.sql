--Exercise 2

select * from employee
select * from dependents

--Part 1
ALTER TABLE Employee
ADD CONSTRAINT PK_id PRIMARY KEY (Id)

--Part 2

sp_help dependents

select * from dependents

ALTER TABLE Dependents
ADD CONSTRAINT PK_dep PRIMARY KEY (Empid,Depname)

ALTER TABLE Dependents
ADD CONSTRAINT FK_dependents_empid FOREIGN KEY (empid)
REFERENCES EMPLOYEE (Id)

--Part 3

sp_help mysales

select * from mydust
select * from mysales

ALTER TABLE Mydust
ADD CONSTRAINT PK_mydust_partnum PRIMARY KEY (Partnum)

ALTER TABLE Mysales
ADD CONSTRAINT FK_mysales_partnum FOREIGN KEY (Partnum)
REFERENCES Mydust (Partnum)


insert into mysales values ('b9000',4, 'AH', 'Oct 14 2014' )
--Part 4
select * from burgers

create table New_Burgers
(
empid char(11),
workdate smalldatetime,
hours numeric(3,1),
week char(1),
primary key (empid, workdate)
)

