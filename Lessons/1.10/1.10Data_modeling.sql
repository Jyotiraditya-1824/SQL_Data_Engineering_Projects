select job_id,job_location,salary_year_avg,job_title_short,company_id
from job_postings_fact
limit 10;

select * from company_dim
limit 10;

--to get the info about tables
select * from information_schema.tables
where table_catalog='data_jobs';

select * from information_schema.table_constraints
where table_catalog='data_jobs';

--the keywords will be helpful ony for DuckDb
PRAGMA show_tables;

describe job_postings_fact;