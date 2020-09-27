select * from mydust
select * from mysales

select * from salesrep
select * from sales

select * from seminar
select * from course
select * from register
select * from students

select * from vanity

--Indexes (p11)
create index lastnameind on employee (lastname)

create index qtyind on mydust (quantity desc)

select * from employee

create unique index corpind on employee (corpid)

--test (won't work due to dups)
--create unique index pnind on mysales (partnum)

create  index pnind on mysales (partnum)

--composite (multi-field) index
create index nameind on employee (lastname, firstname)

sp_help employee
sp_helpindex mydust

select * from sysindexes

drop index employee.corpind

--add PK at create table stage
create table Inventory
(
Partnum char(6) primary key,
Descrip char(13),
Automake char(4),
Quantity smallint,
Price numeric(6,2)
)

create table Inventory2
(
Partnum char(6)    constraint PK_partnum      primary key,
Descrip char(13),
Automake char(4),
Quantity smallint,
Price numeric(6,2)
)

sp_help partsales

create table PartSales
(
Partnum char(6),
Qty_sold smallint,
Customer char(30),
Saledate smalldatetime,
constraint PK_sales primary key (saledate, partnum)
)

--using alter table to add PK to existing tables

select * from salesrep
select * from sales

select empnum, count(empnum)
from salesrep
group by empnum
having count(empnum) > 1

--how about sales table
/*
select empnum, count(empnum)
from sales
group by empnum
having count(empnum) > 1
*/

sp_help salesrep

alter table salesrep
add constraint PK_empnum primary key (empnum)

--Foreign Keys (p18)

create table PartSales2
(
Partnum char(6) constraint FK_PartSales2_partnum references inventory (partnum),
Qty_sold smallint,
Customer char(30),
Saledate smalldatetime,
constraint PK_sales2 primary key (saledate, partnum)
)

--fails first due to orphan record of emp 004
alter table sales
add constraint FK_sales_empnum foreign key (empnum) references salesrep (empnum)

--clean up the data
delete from sales
where empnum = '004'

--works now
alter table sales
add constraint FK_sales_empnum foreign key (empnum) references salesrep (empnum)

select * from salesrep
select * from sales

--Ex 2 (p22)

select * from employee
select * from dependents

select * from mydust
select * from mysales


select * from salesrep
select * from sales

--can't insert orphan directly
insert into sales values ('004', 66)

---trouble (p21)
alter table sales
nocheck constraint FK_sales_empnum

alter table sales
check constraint FK_sales_empnum




--Referential Integrity (p23)


--can't insert orphan directly
insert into sales values ('004', 66)

--can't delete parent if child exists
delete from salesrep where empnum = '001'

--can't modify a parent/child to disconnect one from another
update salesrep set empnum = '009' where empnum = '001'

select * from employee
select * from absent

sp_help dependents

--connect absent to employee
alter table absent
add constraint FK_absent_id foreign key (id)
references employee (id)
on delete cascade

select * from employee
select * from absent

delete from employee where id = 'A0020'

--disconnect FK from absent and employee
alter table absent drop constraint fk_absent_id

sp_help absent

--make sure child field is nullable = yes
alter table absent alter column id char(5) null

--reconnect absent to employee with null not delete
alter table absent
add constraint FK_absent_id foreign key (id)
references employee (id)
on delete set null

--test by deleting emp 19 from employee
select * from employee
select * from absent

delete from employee where id = 'A0019'

--disconnect one more time
alter table absent drop constraint fk_absent_id

--reconnect absent to employee with null not delete
alter table absent
add constraint FK_absent_id foreign key (id)
references employee (id)
on update cascade
on delete cascade

sp_help absent

--test
select * from employee
select * from absent

update employee set id = 'A9999' where id = 'A0002'

--Ex 3 (p29)


--Union, Except & Intersect (p30)
select saledate, partnum, customer
from mysales
union all
select saledate, partnum, customer
from oldsales


--bad queries
--*********************************
select saledate, partnum
from mysales
union all
select saledate, partnum, customer
from oldsales

select customer, saledate, partnum
from mysales
union all
select saledate, partnum, customer
from oldsales

select  saledate,customer, partnum
from mysales
union all
select saledate, partnum, customer
from oldsales
--*********************************

select saledate, partnum, customer
from mysales
union all
select saledate, partnum, customer
from oldsales
order by saledate desc

--p32
select saledate, partnum, customer
from mysales
where customer = 'smith''s auto repair'
union all
select saledate, partnum, customer
from oldsales
where customer = 'smith''s auto repair'
order by saledate desc

--p33
select saledate, partnum, customer into AllSales
from mysales
union all
select saledate, partnum, customer
from oldsales

select * from allsales

--Except

select firstname, lastname, add1, add2, city, statecode, zip
into NotStudents
from maillist
except
select firstname, lastname, addr1, addr2, city, statecode, zip
from students

select * from notstudents
--flip
select firstname, lastname, addr1, addr2, city, statecode, zip
from students
except
select firstname, lastname, add1, add2, city, statecode, zip
from maillist


--Intersect
select firstname, lastname, add1, add2, city, statecode, zip
from maillist
intersect
select firstname, lastname, addr1, addr2, city, statecode, zip
from students



--no name
(
select firstname, lastname, add1, add2, city, statecode, zip
from maillist
union 
select firstname, lastname, addr1, addr2, city, statecode, zip
from students
)
except
(
select firstname, lastname, add1, add2, city, statecode, zip
from maillist
intersect 
select firstname, lastname, addr1, addr2, city, statecode, zip
from students
)



select  descrip, quantity
from mydust
union
select rtrim(descrip) + ' TOTAL' , sum(quantity)
from mydust
group by descrip
union
select 'Z TOTAL' , sum(quantity)
from mydust
order by descrip


--Union, Rollup & CUBE
select descrip, sum(quantity)
from mydust
group by descrip with rollup

select automake, descrip, sum(quantity)
from mydust
group by automake, descrip with rollup

select automake, descrip, sum(quantity)
from mydust
group by automake, descrip with cube