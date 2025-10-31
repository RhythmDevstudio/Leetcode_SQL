# Write your MySQL query statement below
WITH high AS (
    SELECT store_id,
        inventory_id,
        product_name,
        quantity AS max_quant,
        price AS max_price,
        ROW_NUMBER() OVER(
            PARTITION BY store_id
            ORDER BY price DESC
        ) AS rn
    FROM inventory
),
low AS (
    SELECT store_id,
        inventory_id,
        product_name,
        quantity AS min_quant,
        price AS min_price,
        ROW_NUMBER() OVER(
            PARTITION BY store_id
            ORDER BY price ASC
        ) AS rn
    FROM inventory
)
SELECT h.store_id,
    s.store_name,
    s.location,
    h.product_name AS most_exp_product,
    l.product_name AS cheapest_product,
    ROUND(min_quant / max_quant, 2) AS imbalance_ratio
FROM high h
    INNER JOIN low l ON h.store_id = l.store_id
    INNER JOIN stores s ON l.store_id = s.store_id
WHERE h.rn = 1
    AND l.rn = 1
    AND max_quant < min_quant
    AND h.store_id IN (
        SELECT store_id
        FROM inventory
        GROUP BY store_id
        HAVING COUNT(inventory_id) >= 3
    )
ORDER BY imbalance_ratio DESC,
    s.store_name ASC;