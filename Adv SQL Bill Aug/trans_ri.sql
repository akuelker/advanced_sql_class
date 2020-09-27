--commands for setting up referential integrity between SALESMAN, CUSTOMER, and TRANS tables

--create SALESMAN table
CREATE TABLE salesman
 ( salesid CHAR(2) PRIMARY KEY,
   lastname VARCHAR(18),
   firstname VARCHAR(18))

--insert records into SALESMAN table
insert into salesman values ('BW','Whill','Betty')
insert into salesman values ('KW','Watt','Kilo')
insert into salesman values ('MW','Watt','Meagan')
insert into salesman values ('TJ','Juana','Tia')

--create CUSTOMER table
CREATE TABLE customer (
 cusid CHAR(4) CONSTRAINT pk_cusid PRIMARY KEY,
 company varchar(30) not null,
 contact varchar(20),
 address varchar(35) not null,
 city varchar(15) not null,
 statecode char(2) not null,
 zip char(5) not null,
 phone char(8) not null)

--insert records into CUSTOMER table
insert into customer values
  ('BBF1','Bob''s Burger Factory','Tom Smith','3451 Main Street',
   'St. Louis','MO','63122','351-2323')

insert into customer values
  ('CCW1','Carl''s Cloth World','Meagan Jones','5678 Talawami',
   'St. Louis','MO','63102','345-8989')

insert into customer values
  ('NWB1','Northwestern Bell Telephone','Mary Wales',
   '3421 Massapai','St. Louis','MO','63114','678-0909')

insert into customer values
  ('PPP1','Paul''s Pizzeria',null,'8971 Buloshi','St. Louis',
   'MO','63118','789-1212')

insert into customer values
  ('HHH1','Hal''s Haberdashery','Hal Halls','8912 Main',
   'St. Louis','MO','63116','453-0909')

--create TRANS table
CREATE TABLE Trans
( Invoice CHAR(5), 
  Invdate DATETIME,
  Cusid CHAR(4),
  Sales NUMERIC(5,2),
  Salesid CHAR(2))

--set up two foreign keys, using ALTER TABLE statement
ALTER TABLE Trans
ADD
	CONSTRAINT FK_cusid FOREIGN KEY (Cusid) 
REFERENCES Customer (Cusid),
CONSTRAINT FK_salesid FOREIGN KEY (Salesid) 
REFERENCES Salesman (Salesid)

--try to insert records into TRANS table
insert into trans values ('A1001', '12-01-06', 'BBF1', 52.45, 'TJ')
insert into trans values ('A1001', '12-01-06', 'BBF2', 52.45, 'TJ')
insert into trans values ('A1001', '12-01-06', 'BBF1', 52.45, 'TW')

