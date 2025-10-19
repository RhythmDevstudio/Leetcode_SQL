/* Write your T-SQL query statement below */
with cte as (
select buyer_id,count(*) as orders_in_2019
from orders 
where year(order_date)=2019
group by buyer_id )



select user_id as buyer_id ,join_date,coalesce(orders_in_2019 ,0) as orders_in_2019
from cte c right join users u 
on u.user_id =c.buyer_id 