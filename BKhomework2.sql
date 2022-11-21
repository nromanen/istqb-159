4.Show the list of first, last names and ages of the employees whose age is greater than 55. The result should be sorted by last name.

5.Calculate the count of employees from London
select count(*) from employees where city = 'London'
6.Calculate the greatest, the smallest and the average age among the employees from London.
select max(extract(year from age(birth_date))) from employees where city = 'London'
select min(extract(year from age(birth_date))) from employees where city = 'London'
select avg(extract(year from age(birth_date))) from employees where city = 'London'

7.Calculate the greatest, the smallest and the average age of the employees for each city.
select city, max(extract(year from age(birth_date))) as age from employees group by city
select city, min(extract(year from age(birth_date))) as age from employees group by city
select city, avg(extract(year from age(birth_date))) as age from employees group by city

8.    Show the list of cities in which the average age of employees is greater than 60 (the average age is also to be shown)
9.    Show the first and last name(s) of the eldest employee(s). Use a subquery.

10.    Show first, last names and ages of 3 eldest employees.
11.    Show the list of all cities where the employees are from.
12.    Show first, last names and dates of birth of the employees who celebrate their birthdays this month.
13.    Show first and last names of the employees who used to serve orders shipped to Madrid.