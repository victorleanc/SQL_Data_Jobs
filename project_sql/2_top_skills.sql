/*
Question: What skills are required for the top-paying data engineer jobs?
- Use the top 10 highest-paying Data Engineer jobs from 1_top_paying_jobs
- Add specific skills required for theses roles
- It provides a detailed look at the most demanded skills, helping job seekers filter their developing skills considering their goals.
*/

WITH top_paying AS (
  SELECT
    job_id,
    job_title_short,
    salary_year_avg,
    name AS company_name
  FROM
    job_postings_fact AS job_postings
  JOIN 
    company_dim ON job_postings.company_id = company_dim.company_id
  WHERE 
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
  ORDER BY
    salary_year_avg DESC
)

SELECT
  top_paying.*,
  skills_dim.skills
FROM top_paying
INNER JOIN
  skills_job_dim ON top_paying.job_id = skills_job_dim.job_id
INNER JOIN
  skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
LIMIT 10

/*
Most In-Demand Skills for Data Engineers at Engtal
Python: Appears in all job listings, making it the most critical skill. Python is widely used in data engineering for tasks like data manipulation, automation, and integration with other tools.
Spark: Also appears in all job listings, indicating its importance for distributed data processing and handling large-scale datasets.
Pandas and NumPy: Both are Python libraries essential for data manipulation and numerical computations, respectively. Their inclusion suggests a strong focus on data preprocessing and analysis.

Programming Languages: Python is the dominant language, reflecting its versatility and widespread adoption in data engineering.
Big Data Technologies: Spark, Hadoop, and Kafka are essential for handling large-scale data processing and real-time streaming.
Data Manipulation Libraries: Pandas and NumPy are critical for data cleaning, transformation, and analysis.
Cloud/DevOps Tools: Kubernetes suggests a focus on modern infrastructure and deployment practices, likely in cloud environments.

[
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "spark"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pandas"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "numpy"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "pyspark"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "hadoop"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kafka"
  },
  {
    "job_id": 157003,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "kubernetes"
  },
  {
    "job_id": 21321,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "python"
  },
  {
    "job_id": 21321,
    "job_title_short": "Data Engineer",
    "salary_year_avg": "325000.0",
    "company_name": "Engtal",
    "skills": "spark"
  }
]
*/


