with cte as(
    select case
    when month(a.sale_date) in (12,1,2) then 'Winter'
    when month(a.sale_date) in (3,4,5) then 'Spring'
    when month(a.sale_date) in (6,7,8) then 'Summer'
    else 'Fall'
    end as season,
    b.category,
    sum(a.quantity) as total_quantity,
    sum(a.quantity*a.price) as total_revenue
    from sales a join products b on a.product_id=b.product_id 
    group by season,b.category
),
ctes as (
    select *, row_number() over (partition by season order by total_quantity desc,total_revenue desc ) as rn from cte
)
select season,category,total_quantity,total_revenue from ctes where rn=1;