-- select u.name, sum(t.amount) as balance 
-- from Users u
-- join Transactions t on u.account = t.account
-- group by u.name,u.account
-- having sum(t.amount) > 10000;

# Write your MySQL query statement below
-- SELECT u.name,
--     SUM(t.amount) AS balance
-- FROM Users u
--     JOIN Transactions t ON u.account = t.account
-- GROUP BY u.account
-- HAVING balance > 10000

with tmp as(
select t.account, u.name, sum(amount) as balance
from Transactions t
left join Users u on t.account = u.account
group by account )

select name, balance
from tmp
where balance > 10000