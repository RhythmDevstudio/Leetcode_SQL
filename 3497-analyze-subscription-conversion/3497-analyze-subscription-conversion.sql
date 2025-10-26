# Write your MySQL query statement below
with free_trial_avg as 
(
    select user_id, ROUND(AVG(activity_duration), 2) as trial_avg_duration
    from UserActivity
    where activity_type = 'free_trial'
    group by user_id
),
paid_avg as 
(
    select user_id, ROUND(AVG(activity_duration), 2) as paid_avg_duration
    from UserActivity
    where activity_type = 'paid'
    group by user_id
)
select F.user_id, trial_avg_duration, paid_avg_duration
from free_trial_avg as F join paid_avg as P
on F.user_id = P.user_id
order by user_id asc;