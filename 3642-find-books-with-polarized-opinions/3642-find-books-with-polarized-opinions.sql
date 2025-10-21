# Write your MySQL query statement below
-- select * from books JOIN (
--     select book_id, 
--     max(session_rating) - min(session_rating) as rating_spread, 
--     ROUND(sum(session_rating != 3)/count(*), 2) as polarization_score
--     from reading_sessions group by book_id 
--     having count(*) >= 5 and max(session_rating) >= 4 and min(session_rating) <= 2
-- )T
-- using(book_id) where polarization_score >= 0.6
-- order by polarization_score desc, title desc;

-- with book_stats as(
--     select book_id,
--     count(*)total_session,
--     min(session_rating)minrating,
--     max(session_rating)maxrating,
--     sum(case when session_rating>3 then 1 else 0 end)highrating,
--     sum(case when session_rating<3 then 1 else 0 end )lowrating,
--     sum(case when session_rating>3 or session_rating<3 then 1 else 0 end) extremes
--     from reading_sessions 
--     group by 1
-- )
-- select book_id,title,author,genre,pages,
-- maxrating-minrating rating_spread ,
-- round(extremes*1.0/total_session,2)polarization_score 
--  from book_stats
-- join books
-- using(book_id)
-- where total_session >4
-- and highrating>0
-- and lowrating>0
-- having polarization_score>=0.6
-- order by polarization_score desc,title desc;

# Write your MySQL query statement below
SELECT  r.book_id, b.title, b.author, b.genre, b.pages, MAX(r.session_rating) - MIN(r.session_rating) rating_spread, 
round( (SUM( CASE WHEN r.session_rating < 3 THEN 1 ELSE 0 END + CASE WHEN r.session_rating > 3 THEN 1 ELSE 0 END)) / COUNT(r.session_id) , 2) polarization_score
FROM reading_sessions r
INNER JOIN books b USING(book_id)
GROUP BY r.book_id, b.title, b.author, b.genre, b.pages
HAVING COUNT(r.session_id) > 4 AND MAX(r.session_rating) > 3 AND MIN(r.session_rating) < 3 AND
polarization_score >= 0.6
ORDER BY polarization_score DESC, b.title DESC;