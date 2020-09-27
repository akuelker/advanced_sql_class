--Adv SQL Ex5
select * from burgers

--Part 1
SELECT empname, hours
FROM burgers
UNION
select empname+' Total', SUM(hours)
FROM burgers
GROUP BY empname
ORDER BY empname

--Extra
SELECT empname, hours
FROM burgers
UNION
select empname+' Total', SUM(hours)
FROM burgers
GROUP BY empname
UNION
SELECT 'Total Total', SUM(hours)
FROM burgers
ORDER BY empname

--Extra Extra
SELECT week, empname, hours
FROM burgers
UNION
SELECT week, empname+' Total',SUM(hours)
FROM burgers
GROUP BY week, empname
UNION
SELECT week, 'WEEK TOTAL', SUM(hours)
FROM burgers
GROUP BY week
ORDER BY week, empname

--Part 2
SELECT mfgid, SUM(sales) AS Total_Sales
FROM Atrans
GROUP BY mfgid WITH ROLLUP

--Part 3
SELECT mfgid, salesid, SUM(sales) AS Total_Sales
FROM Atrans
GROUP BY mfgid, salesid WITH CUBE

