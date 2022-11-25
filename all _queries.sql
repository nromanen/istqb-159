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