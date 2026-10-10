/*
Question:What are the highest paying skills for Data Engineers?
-Calculate the median salary for each skillls required for Data Engineers.
-Focus on remote locations with specified salary.
-Include skills frquency to identify both skills and demand.

WHY?
-Helps identify which skills command the highest compensation while also showing how common those skils are,
 providing a more complete picture for skills developement priorities.
-Median is used instead of average to reduce the impact of outliers. 
*/

SELECT
sd.skills,
ROUND (MEDIAN(jpf.salary_year_avg),0) AS Median_salary,
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
HAVING
    count(jpf.*) >100
ORDER BY Median_salary DESC
LIMIT 20;

/*
Key Insights:
- Rust has the highest median salary at $210K , but its demand is relatively low at 232 postings.

- Golang has a high median salary of $184K with 912 job postings, showing good salary and moderate demand.

- Terraform stands out with $184K median salary and 3,248 postings, indicating strong demand.

- Kubernetes has 4,202 postings and a $150.5K median salary, making it one of the most in-demand skills.

- Airflow  has the  highest demand in the table with 9,996 postings and a $150K median salary.

- Spring and Neo4j have relatively high median salaries ($175.5K and $170K) but much lower demand than Airflow or Kubernetes.

- FastAPI, Django, and Mongo have moderate demand and median salaries between $155K and $162.25K.

- Overall, Airflow, Kubernetes, and Terraform show the strongest combination of high demand and high median salary among the listed skills.







┌────────────┬───────────────┬──────────────┐
│   skills   │ Median_salary │ Demand_count │
│  varchar   │    double     │    int64     │
├────────────┼───────────────┼──────────────┤
│ rust       │      210000.0 │          232 │
│ golang     │      184000.0 │          912 │
│ terraform  │      184000.0 │         3248 │
│ spring     │      175500.0 │          364 │
│ neo4j      │      170000.0 │          277 │
│ gdpr       │      169616.0 │          582 │
│ zoom       │      168438.0 │          127 │
│ graphql    │      167500.0 │          445 │
│ mongo      │      162250.0 │          265 │
│ fastapi    │      157500.0 │          204 │
│ django     │      155000.0 │          265 │
│ bitbucket  │      155000.0 │          478 │
│ crystal    │      154224.0 │          129 │
│ c          │      151500.0 │          444 │
│ atlassian  │      151500.0 │          249 │
│ typescript │      151000.0 │          388 │
│ kubernetes │      150500.0 │         4202 │
│ airflow    │      150000.0 │         9996 │
│ node       │      150000.0 │          179 │
│ ruby       │      150000.0 │          736 │
└────────────┴───────────────┴──────────────┘
  20 rows                         3 columns
*/