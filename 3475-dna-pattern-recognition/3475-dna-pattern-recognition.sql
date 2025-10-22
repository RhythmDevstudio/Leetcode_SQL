# Write your MySQL query statement below
-- select  sample_id, dna_sequence, species, 
--    (case when dna_sequence like "ATG%" then 1  else 0 end) as has_start,
--    (case when regexp_like (dna_sequence,"TAA$|TAG$|TGA$") then 1 else 0 end) as has_stop,
--    (case when dna_sequence like "%ATAT%" then 1 else 0 end) as has_atat,
--    (case when dna_sequence like "%GGG%" then 1 else 0 end) as has_ggg
-- from Samples
-- group by sample_id;

# Write your MySQL query statement below
-- SELECT
--     *,
--     dna_sequence REGEXP '^ATG' AS has_start,
--     dna_sequence REGEXP 'TAA$|TAG$|TGA$' AS has_stop,
--     dna_sequence REGEXP 'ATAT' AS has_atat,
--     dna_sequence REGEXP 'GGG' AS has_ggg
-- FROM samples
-- ORDER BY sample_id;

# Write your MySQL query statement below
select sample_id, dna_sequence, species,
case when dna_sequence like 'ATG%' then 1 else 0 end as has_start,
case when dna_sequence like '%TAA' then 1
     when dna_sequence like '%TAG' then 1
     when dna_sequence like '%TGA' then 1
     else 0 end as has_stop,
case when dna_sequence like '%ATAT%' then 1 else 0 end as has_atat,
case when dna_sequence like '%GGG%' then 1 else 0 end as has_ggg
from samples;
