Tasks

SELECT FIRSTNAME, LASTNAME, EXTRACT(year from age(birth_date))
FROM employees
WHERE EXTRACT(YEAR FROM age(CURRENT_DATE, birth_date)) > 55
ORDER BY LASTNAME;

select * 
as count from employees
where city = ('London');

select max(age) As Max, min (age) as min, avg (age) as avg
from employees 
where city = ('London');

select max(age) As Max, min (age) as min, avg (age) as avg
from employees
order by EXTRACT(year from age(birth_date));

select city , avg as "age"
from employees
group by city having avg >60;

select firstname, lastname as age
from employees order by age desc;

select * 
from employees
where city like "city";

select firstname, lastname, birth_date
from employees
where birth_date in (select month(current_timestamp));

select firstname, lastname 
from employees
where Shipcity = 'Madrid'
