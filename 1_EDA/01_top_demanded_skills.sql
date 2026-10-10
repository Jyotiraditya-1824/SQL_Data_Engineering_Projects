/*
Question: What are the most in-demand skills for data engineer?
-Identify the top 10 in_demand skills for Data engineers.
-Focus on remote job postings.
WHY? Retrive the top 10 skills with highest demand in remote job market,providing
 insghts into the most valuable skills for data engineers seeking remote work.
*/

SELECT
sd.skills,
count(jpf.*) AS Demand_count
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND
    jpf.job_work_from_home = TRUE
GROUP BY 
    sd.skills
ORDER BY Demand_count DESC
LIMIT 10;


/*
Here is the breakdown fro most in-demand skills for Data Engineers:
SQL and Python are by far the most in-demand skills , with 29,000 job posting each - nearly double the count of other cloud 
platforms listed over such as AWS , Azure and Apache spark completing the top 5 list with around  13,000 job postings.


Key Takeaways:
-SQL and Python remains the foundational skills from Data Engineers
-Cloud platforms (AWS , Azure) are critical for modern Data Engineering
-Big data tool like spark continue to be highly valued
-Data pipeline tools (airflow,snowflake,databricks) show growing demand
-java and gcp round out the top 10 most demanded skills
┌────────────┬──────────────┐
│   skills   │ Demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        29221 │
│ python     │        28776 │
│ aws        │        17823 │
│ azure      │        14143 │
│ spark      │        12799 │
│ airflow    │         9996 │
│ snowflake  │         8639 │
│ databricks │         8183 │
│ java       │         7267 │
│ gcp        │         6446 │
└────────────┴──────────────┘
  10 rows         2 columns
*/

