select count(order_id), customer_id from orders 
where customer_id in
(select customer_id from customers where country='France') 
group by customer_id having count(order_id)>1