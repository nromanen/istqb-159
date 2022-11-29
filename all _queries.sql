Bozhena.
Show the count of orders made by each customer from France.
select country, customers.customer_id, count(orders.order_id)
from
	orders
	join customers on customers.customer_id=orders.customer_id
where
	customers.country='France'
group by
	customers.customer_id
	
Mariia varian 19
Show the list of french customers’ 
names who have made more than one order (use a subquery)

select count(order_id), customer_id from orders 
where customer_id in
(select customer_id from customers where country='France') 
group by customer_id having count(order_id)>1

Andriy 14
Show first and last names of the employees as well as the count
of orders each of them have received during the year 1997 (use a subquery).

Select employees.first_name, employees.last_name, SUM(order_details.quantity) AS total_quantity
from orders
left join employees on orders.employee_id = employees.employee_id
left join order_details on orders.order_id = order_details.order_id
WHERE date_part('year', orders.order_date) = 1997
GROUP BY employees.first_name, employees.last_name

Kateryna Goncharova 
Show first and last names of the employees as well as the count of their orders shipped after required date during the year 1997 (use left join).

SELECT LAST_NAME, FIRST_NAME, COUNT(*)
FROM EMPLOYEES
LEFT JOIN ORDERS ON EMPLOYEES.EMPLOYEE_ID = ORDERS.EMPLOYEE_ID
WHERE EXTRACT (YEAR FROM (REQUIRED_DATE)) = '1997' 
AND EXTRACT (YEAR FROM (SHIPPED_DATE)) = '1997'
AND REQUIRED_DATE < SHIPPED_DATE
GROUP BY EMPLOYEES.EMPLOYEE_ID
