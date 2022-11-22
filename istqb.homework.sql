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