/*
Question: What are the most in_demand_skills for data engineers?
- Join job postings to query 2
- Identify the top 5 in-demand skills for a data engineer.
- Focus on all job postings.
*/

SELECT
  skills,
  COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN
  skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
  skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_postings_fact.job_title_short = 'Data Engineer'
GROUP BY
  skills
ORDER BY
  demand_count DESC
LIMIT 5

/*
Breakdown:
SQL (113,375) – Essential for querying and managing databases, a core skill for data engineers.
Python (108,265) – Widely used for data processing, ETL, and automation in data engineering.
AWS (62,174) – Indicates strong demand for cloud-based data engineering, particularly in AWS environments.
Azure (60,823) – Similar demand for Microsoft’s cloud, showing the need for multi-cloud expertise.
Spark (53,789) – Highlights the importance of big data processing, especially for handling large-scale distributed data.
These skills reflect key industry trends in cloud computing, big data, and database management for data engineers. 

[
  {
    "skills": "sql",
    "demand_count": "113375"
  },
  {
    "skills": "python",
    "demand_count": "108265"
  },
  {
    "skills": "aws",
    "demand_count": "62174"
  },
  {
    "skills": "azure",
    "demand_count": "60823"
  },
  {
    "skills": "spark",
    "demand_count": "53789"
  }
]
*/
