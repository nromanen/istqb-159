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

Andriy 

Select employees.first_name, employees.last_name, employees.country, SUM(order_details.quantity) AS total_quantity
from orders
left join employees on orders.employee_id = employees.employee_id
left join order_details on orders.order_id = order_details.order_id
GROUP BY employees.first_name, employees.last_name, employees.country

SELECT employees.first_name, employees.last_name, orders.ship_country, SUM(order_details.quantity) AS total_quantity
FROM orders
LEFT join employees on orders.employee_id = employees.employee_id
left join order_details on orders.order_id = order_details.order_id
GROUP BY employees.first_name, employees.last_name, orders.ship_country

Mariia - № 26
Show the total ordering sums calculated for each customer’s country for 
domestic and non-domestic products separately (e.g.: “France – French 
products ordered – Non-french products ordered” and so on for each country). 

For domestic products:
select customers.country, sum(order_details.unit_price*quantity)
from customers join orders on customers.customer_id=orders.customer_id
join order_details on orders.order_id=order_details.order_id
join products on order_details.product_id=products.product_id
join suppliers on products.supplier_id=suppliers.supplier_id
where customers.country= suppliers.country
group by customers.country

For non- domestic products:
select customers.country, sum(order_details.unit_price*quantity)
from customers join orders on customers.customer_id=orders.customer_id
join order_details on orders.order_id=order_details.order_id
join products on order_details.product_id=products.product_id
join suppliers on products.supplier_id=suppliers.supplier_id
where customers.country<> suppliers.country
group by customers.country