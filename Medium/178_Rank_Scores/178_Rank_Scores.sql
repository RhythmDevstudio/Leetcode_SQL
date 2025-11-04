/*
Problem: 178 - Rank Scores
Difficulty: Medium
Source: https://leetcode.com/problems/rank-scores/
Date Solved: 2024-09-29

Problem Statement:
Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking. Note that after a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no "holes" between ranks.

Return the result table ordered by score in descending order.

Table Schema:
Table: Scores
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| score       | decimal |
+-------------+---------+
id is the primary key for this table.
Each row of this table contains the score of a game. Score is a floating point value with two decimal places.

Example:
Input:
Scores table:
+----+-------+
| id | score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+

Output:
+-------+------+
| score | rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+

Constraints:
- 1 <= Scores table rows <= 10^5
*/

-- Solution:
-- Use DENSE_RANK() window function to handle ties properly without gaps

SELECT 
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) as rank
FROM 
    Scores
ORDER BY 
    score DESC;

/*
Explanation:
This problem requires understanding of ranking functions in SQL:

1. DENSE_RANK() vs RANK() vs ROW_NUMBER():
   - ROW_NUMBER(): Always gives unique sequential numbers (1,2,3,4,5,6)
   - RANK(): Gives same rank for ties but leaves gaps (1,1,3,4,4,6)  
   - DENSE_RANK(): Gives same rank for ties without gaps (1,1,2,3,3,4) ✓

2. The key requirement is "no holes between ranks", which means we need DENSE_RANK()

3. ORDER BY score DESC in the window function ranks highest scores first
4. Final ORDER BY ensures output is sorted by score descending

Time complexity: O(n log n) due to sorting for ranking
Space complexity: O(n) for the result set

Alternative Solutions:
1. Subquery approach (less efficient):
   SELECT 
       score,
       (SELECT COUNT(DISTINCT score) FROM Scores s2 WHERE s2.score >= s1.score) as rank
   FROM Scores s1
   ORDER BY score DESC;

2. Using variables (MySQL specific):
   SELECT 
       score,
       @rank := CASE 
           WHEN @prev_score = score THEN @rank
           WHEN @prev_score := score THEN @rank + 1
       END as rank
   FROM Scores, (SELECT @rank := 0, @prev_score := NULL) r
   ORDER BY score DESC;

Notes:
- DENSE_RANK() is the most readable and standard solution
- Window functions are powerful for ranking and analytical queries
- Always consider the specific ranking requirements (gaps vs no gaps)
- This pattern appears frequently in SQL interview questions
*/