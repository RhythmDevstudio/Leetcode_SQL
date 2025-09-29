/*
Problem: 175 - Combine Two Tables
Difficulty: Easy
Source: https://leetcode.com/problems/combine-two-tables/
Date Solved: 2024-09-29

Problem Statement:
Write a SQL query for a report that provides the following information for each person in the Person table, regardless if there is an address for the person or not:
- FirstName, LastName, City, State

Table Schema:
Table: Person
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| PersonId    | int     |
| FirstName   | varchar |
| LastName    | varchar |
+-------------+---------+
PersonId is the primary key column for this table.

Table: Address
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| AddressId   | int     |
| PersonId    | int     |
| City        | varchar |
| State       | varchar |
+-------------+---------+
AddressId is the primary key column for this table.

Example:
Input:
Person table:
+----------+----------+-----------+
| PersonId | FirstName| LastName  |
+----------+----------+-----------+
| 1        | Wang     | Allen     |
| 2        | Alice    | Bob       |
+----------+----------+-----------+

Address table:
+----------+----------+---------------+----------+
| AddressId| PersonId | City          | State    |
+----------+----------+---------------+----------+
| 1        | 2        | New York City | New York |
| 2        | 3        | Leetcode      | California|
+----------+----------+---------------+----------+

Output:
+-----------+----------+---------------+----------+
| FirstName | LastName | City          | State    |
+-----------+----------+---------------+----------+
| Allen     | Wang     | Null          | Null     |
| Bob       | Alice    | New York City | New York |
+-----------+----------+---------------+----------+

Constraints:
- Some people may not have address information
- We want information for ALL people in Person table
*/

-- Solution:
-- Use LEFT JOIN to include all people from Person table, even if they don't have an address

SELECT 
    p.FirstName,
    p.LastName,
    a.City,
    a.State
FROM 
    Person p
    LEFT JOIN Address a ON p.PersonId = a.PersonId;

/*
Explanation:
This problem requires a LEFT JOIN because we need to include ALL people from the Person table,
regardless of whether they have a corresponding address in the Address table.

- LEFT JOIN ensures all rows from the left table (Person) are included
- If there's no matching address, the City and State will be NULL
- INNER JOIN would exclude people without addresses (incorrect for this problem)
- RIGHT JOIN would exclude people with addresses but include orphaned addresses (also incorrect)

Time complexity: O(n + m) where n is number of people and m is number of addresses
Space complexity: O(1) - no additional space needed for the join operation

Alternative Solutions:
This is the most straightforward approach. You could also use:
- A subquery approach, but it would be less efficient
- UNION with conditional logic, but it's unnecessarily complex

Notes:
- This is a classic example of when to use LEFT JOIN vs INNER JOIN
- The key insight is understanding the requirement "regardless if there is an address"
- Always read problem requirements carefully to determine the correct JOIN type
*/