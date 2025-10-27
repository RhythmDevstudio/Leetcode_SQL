WITH A AS (
    SELECT product_id, sale_date, quantity, price,
        CASE 
            WHEN MONTH(sale_date) BETWEEN 3 AND 5 THEN 'Spring'
            WHEN MONTH(sale_date) BETWEEN 6 AND 8 THEN 'Summer'
            WHEN MONTH(sale_date) BETWEEN 9 AND 11 THEN 'Fall'
            ELSE 'Winter'
        END AS season
    FROM sales
),

B AS (
    SELECT 
        season, 
        category, 
        SUM(quantity) AS total_quantity, 
        SUM(quantity * price) AS total_revenue 
    FROM A 
    JOIN products ON A.product_id = products.product_id 
    GROUP BY season, category 
),

C AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY season ORDER BY total_quantity DESC, total_revenue DESC) AS rn
    FROM B
)

SELECT season, category, total_quantity, total_revenue
FROM C
WHERE rn = 1;
 