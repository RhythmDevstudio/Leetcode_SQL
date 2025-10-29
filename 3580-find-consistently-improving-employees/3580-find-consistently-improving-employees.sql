-- Employee with 3 or more ratings
WITH valid_employee AS (
    SELECT employee_id
    FROM performance_reviews
    GROUP BY employee_id
    HAVING COUNT(*) >= 3

-- Most recent reviews
), date_ordered AS (  
    SELECT employee_id,
           rating,
           RANK() OVER (PARTITION BY employee_id ORDER BY review_date DESC) AS date_rnk
    FROM performance_reviews  
    WHERE employee_id IN (SELECT employee_id FROM valid_employee)

-- Top 3 ratings, ranked by rating
), rating_ordered AS (
    SELECT employee_id,
           rating,
           date_rnk,
           DENSE_RANK() OVER (PARTITION BY employee_id ORDER BY rating DESC) AS rating_rnk
    FROM date_ordered
    WHERE date_rnk <= 3

-- Downward performance (rating ranking != time ranking)
), down_performance_employee AS (
    SELECT DISTINCT employee_id
    FROM rating_ordered
    WHERE date_rnk != rating_rnk

-- Upward performance (exclude downward cases)
), upward_performance_employee AS (
    SELECT employee_id, MAX(rating) - MIN(rating) AS improvement_score
    FROM rating_ordered
    WHERE employee_id NOT IN (SELECT employee_id FROM down_performance_employee)
    GROUP BY employee_id
)

-- Final selection
SELECT u.employee_id, e.name, u.improvement_score
FROM upward_performance_employee u
INNER JOIN employees e USING(employee_Id)
ORDER BY 3 DESC, 2;