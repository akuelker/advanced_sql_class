CREATE TABLE absent (
	id char (5) NOT NULL ,
	absdate smalldatetime NOT NULL ,
	hours numeric(3, 1) NOT NULL ,
	excused char (1) NOT NULL 
)
GO

CREATE TABLE atrans (
	invoice char (5) NOT NULL ,
	invdate datetime NOT NULL ,
	cusid char (4) NOT NULL ,
	sales numeric(5, 2) NULL ,
	salesid char (2) NOT NULL ,
	mfgid char (3) NOT NULL 
)
GO


CREATE TABLE burgers (
	week char (1) NOT NULL ,
	empname char (4) NOT NULL ,
	hours numeric(4, 1) NOT NULL 
)
GO



CREATE TABLE course (
	semcode char (5) NOT NULL ,
	progcode char (5) NOT NULL ,
	sdate datetime NOT NULL ,
	location char (15) NOT NULL 
)
GO


CREATE TABLE dependents (
	empid char (5) NOT NULL ,
	depname char (15) NOT NULL ,
	birthday datetime NOT NULL 
)
GO

CREATE TABLE employee (
	id char (5) NOT NULL ,
	ssn char (11) NOT NULL ,
	lastname char (20) NOT NULL ,
	firstname char (20) NOT NULL ,
	add1 char (50) NOT NULL ,
	add2 char (50) NULL ,
	city char (20) NOT NULL ,
	statecode char (2) NOT NULL ,
	zip char (10) NOT NULL ,
	phone char (12) NOT NULL ,
	deptcode char (2) NOT NULL ,
	hiredate smalldatetime NOT NULL ,
	jobcode char (3) NOT NULL ,
	comment char (255) NULL 
)
GO


CREATE TABLE maillist (
	firstname char (18) NOT NULL ,
	lastname char (18) NOT NULL ,
	add1 char (30) NULL ,
	add2 char (30) NULL ,
	city char (20) NOT NULL ,
	statecode char (2) NOT NULL ,
	zip char (10) NOT NULL 
)
GO


CREATE TABLE mydust (
	partnum char (6) NOT NULL ,
	descrip char (15) NOT NULL ,
	automake char (4) NOT NULL ,
	quantity int NOT NULL ,
	price numeric(5, 2) NOT NULL 
)
GO


CREATE TABLE mysales (
	partnum char (6) NOT NULL ,
	qty_sold int NOT NULL ,
	customer char (30) NOT NULL ,
	saledate datetime NOT NULL 
)
GO


CREATE TABLE oldsales (
	partnum char(6) NOT NULL,
	qty_sold int NOT NULL,
	customer char(30) NOT NULL,
	saledate datetime NOT NULL
)
GO


CREATE TABLE register (
	ssn char (11) NOT NULL ,
	progcode char (5) NOT NULL 
)
GO


CREATE TABLE repsales (
	salesrep_code char (4) NOT NULL ,
	customer char (30) NOT NULL ,
	amount numeric(6, 2) NOT NULL ,
	saledate datetime NOT NULL 
)
GO


CREATE TABLE sales (
	empnum char (3) NOT NULL ,
	amount numeric(5, 1) NOT NULL 
)
GO


CREATE TABLE salesrep (
	empnum char (3) NOT NULL ,
	fname char (10) NOT NULL 
)
GO


CREATE TABLE seminar (
	semcode char (5) NOT NULL ,
	title char (40) NOT NULL 
)
GO


CREATE TABLE south (
	partnum char (6) NOT NULL ,
	descrip char (15) NOT NULL ,
	automake char (4) NOT NULL ,
	quantity int NOT NULL ,
	price numeric(5, 2) NOT NULL 
)
GO


CREATE TABLE staff (
	empnum char (3) NOT NULL ,
	empname char (20) NOT NULL ,
	manager char (3) NULL 
)
GO


CREATE TABLE students (
	ssn char (11) NOT NULL ,
	firstname char (18) NOT NULL ,
	lastname char (18) NOT NULL ,
	addr1 char (30) NULL ,
	addr2 char (30) NULL ,
	addr3 char (30) NULL ,
	city char (20) NOT NULL ,
	statecode char (2) NOT NULL ,
	zip char (10) NOT NULL 
)
GO


CREATE TABLE vanity (
	title char (32) NOT NULL ,
	firstname char (15) NOT NULL ,
	lastname char (25) NOT NULL ,
	hquan int NOT NULL ,
	pquan int NOT NULL ,
	hprice numeric(5, 2) NOT NULL ,
	pprice numeric(5, 2) NOT NULL ,
	pubdate datetime NOT NULL 
)
GO

