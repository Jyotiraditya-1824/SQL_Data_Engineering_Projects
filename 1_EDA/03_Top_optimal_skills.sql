/*
Question:What are the most Optimal Skills for Data Engineers balancing 
        both demand and salary?
-Create a ranking table that combines both median salary and demand count to identify the most valuable skills.
-Focus only on remote data engineer positions with specified annual salaries.
WHY?
This approach highlights the skills that balance market demand and financial reward. .It weights core skills aappropriately rather than,letting rare outllier skills distort the result.
*/


SELECT
sd.skills,
ROUND(LN(COUNT(JPF.*)),1) AS Demand_count,
ROUND(MEDIAN(jpf.salary_year_avg),0) AS Median_salary,
ROUND((MEDIAN(jpf.salary_year_avg) * LN(COUNT(JPF.*)))/1_000_000, 2) AS Optimal_score
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE
    jpf.job_title_short = 'Data Engineer'
    AND
    jpf.job_work_from_home = TRUE
    AND 
    salary_year_avg IS NOT NULL
GROUP BY 
    sd.skills
HAVING
    count(jpf.*) >100
ORDER BY Optimal_score DESC
LIMIT 20;


/*
Key Insights:
-Terraform has the highest Optimal Score (0.97) and highest median salary ($184K).
-Python and SQL have the highest demand (7.0), making them the most in-demand skills in the dataset.
-AWS has higher demand, salary, and Optimal Score than Azure.
-Airflow and Spark have strong salary potential ($150K and $140K) with high Optimal Scores (0.89 and 0.87).
-Kafka, Snowflake, and Databricks show good demand and salary, making them valuable Data Engineering skills.
-Kubernetes and Docker have relatively lower demand, while skills like Python, SQL, AWS, and Airflow show stronger overall demand and scores.

┌────────────┬──────────────┬───────────────┬───────────────┐
│   skills   │ Demand_count │ Median_salary │ Optimal_score │
│  varchar   │    double    │    double     │    double     │
├────────────┼──────────────┼───────────────┼───────────────┤
│ terraform  │          5.3 │      184000.0 │          0.97 │
│ python     │          7.0 │      135000.0 │          0.95 │
│ sql        │          7.0 │      130000.0 │          0.91 │
│ aws        │          6.7 │      137320.0 │          0.91 │
│ airflow    │          6.0 │      150000.0 │          0.89 │
│ spark      │          6.2 │      140000.0 │          0.87 │
│ snowflake  │          6.1 │      135500.0 │          0.82 │
│ kafka      │          5.7 │      145000.0 │          0.82 │
│ azure      │          6.2 │      128000.0 │          0.79 │
│ java       │          5.7 │      135000.0 │          0.77 │
│ scala      │          5.5 │      137290.0 │          0.76 │
│ kubernetes │          5.0 │      150500.0 │          0.75 │
│ git        │          5.3 │      140000.0 │          0.75 │
│ databricks │          5.6 │      132750.0 │          0.74 │
│ redshift   │          5.6 │      130000.0 │          0.73 │
│ gcp        │          5.3 │      136000.0 │          0.72 │
│ hadoop     │          5.3 │      135000.0 │          0.71 │
│ nosql      │          5.3 │      134415.0 │          0.71 │
│ pyspark    │          5.0 │      140000.0 │           0.7 │
│ docker     │          5.0 │      135000.0 │          0.67 │
└────────────┴──────────────┴───────────────┴───────────────┘
  20 rows                                         4 columns
*/
