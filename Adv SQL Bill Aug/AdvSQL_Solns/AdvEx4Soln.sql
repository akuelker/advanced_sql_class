--Exercise 4

--Part 1 (114 records)
SELECT firstname, lastname, addr1, addr2, city, statecode, zip
from students
union all
SELECT firstname, lastname, add1, add2, city, statecode, zip
from employee
order by zip

--extra (131 records)
SELECT firstname, lastname, addr1, addr2, city, statecode, zip
from students
union
SELECT firstname, lastname, add1, add2, city, statecode, zip
from employee
union
SELECT firstname, lastname, add1, add2, city, statecode, zip
from maillist
order by zip


--Part 2 (16 records)
select invdate, salesid, sales
from atrans
union
select saledate, salesrep_code,amount
from repsales

--Part 3 (6 records - both parts)
select partnum, descrip, automake
from mydust
except
select partnum, descrip, automake
from south

select partnum, descrip, automake
from mydust
intersect
select partnum, descrip, automake
from south

--Part 4 (54 records)
select id from employee
except
select id from absent

--Extra  ----correct in handout
select id from employee
where  id not in (select id from absent where id is not null)

--alternate
select * from employee
left join absent
on employee.id = absent.id
where absent.id is null

