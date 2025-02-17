/*
QUESTION: What are the most optimal skills to learn?
- Identify the skills in high demand and associated with the average salaries
*/

SELECT
  skills_dim.skill_id,
  skills_dim.skills,
  COUNT(skills_job_dim.job_id) AS demand_count,
  ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_title_short = 'Data Engineer'
  AND salary_year_avg IS NOT NULL
GROUP BY
  skills_dim.skill_id
HAVING
  COUNT(skills_job_dim.job_id) > 10
ORDER BY
  avg_salary DESC,
  demand_count DESC
LIMIT 25;

/*
The top five highest-paying skills for data engineers show a mix of backend development, database management, and systems programming. Node.js leads with an average salary of $181,862, though its demand is relatively low at 29 job postings, suggesting it is a specialized but lucrative skill. MongoDB, with a salary of $179,403 and a demand count of 120, highlights the continued importance of NoSQL databases in handling large-scale, unstructured data. Cassandra, a highly scalable NoSQL database, has the highest demand among the top five at 269 listings and offers an average salary of $150,255, reinforcing its relevance in big data infrastructure. Rust, at $147,771, remains a niche but well-compensated language, valued for its performance and memory safety, though its demand is relatively low at 15 postings. Lastly, Perl, with a salary of $145,540 and 39 job postings, still holds value in legacy systems and automation, demonstrating that older technologies can still offer strong earning potential.

[
  {
    "skill_id": 154,
    "skills": "node",
    "demand_count": "29",
    "avg_salary": "181862"
  },
  {
    "skill_id": 24,
    "skills": "mongo",
    "demand_count": "120",
    "avg_salary": "179403"
  },
  {
    "skill_id": 63,
    "skills": "cassandra",
    "demand_count": "269",
    "avg_salary": "150255"
  },
  {
    "skill_id": 39,
    "skills": "rust",
    "demand_count": "15",
    "avg_salary": "147771"
  },
  {
    "skill_id": 31,
    "skills": "perl",
    "demand_count": "39",
    "avg_salary": "145540"
  },
  {
    "skill_id": 136,
    "skills": "angular",
    "demand_count": "42",
    "avg_salary": "143319"
  },
  {
    "skill_id": 3,
    "skills": "scala",
    "demand_count": "794",
    "avg_salary": "143161"
  },
  {
    "skill_id": 98,
    "skills": "kafka",
    "demand_count": "872",
    "avg_salary": "143086"
  },
  {
    "skill_id": 105,
    "skills": "gdpr",
    "demand_count": "38",
    "avg_salary": "142369"
  },
  {
    "skill_id": 6,
    "skills": "shell",
    "demand_count": "365",
    "avg_salary": "141725"
  },
  {
    "skill_id": 94,
    "skills": "numpy",
    "demand_count": "59",
    "avg_salary": "141605"
  },
  {
    "skill_id": 219,
    "skills": "atlassian",
    "demand_count": "33",
    "avg_salary": "140644"
  },
  {
    "skill_id": 84,
    "skills": "ibm cloud",
    "demand_count": "15",
    "avg_salary": "140547"
  },
  {
    "skill_id": 193,
    "skills": "splunk",
    "demand_count": "50",
    "avg_salary": "140156"
  },
  {
    "skill_id": 213,
    "skills": "kubernetes",
    "demand_count": "371",
    "avg_salary": "140092"
  },
  {
    "skill_id": 27,
    "skills": "golang",
    "demand_count": "40",
    "avg_salary": "139885"
  },
  {
    "skill_id": 78,
    "skills": "redshift",
    "demand_count": "780",
    "avg_salary": "139527"
  },
  {
    "skill_id": 56,
    "skills": "mysql",
    "demand_count": "408",
    "avg_salary": "138613"
  },
  {
    "skill_id": 28,
    "skills": "no-sql",
    "demand_count": "55",
    "avg_salary": "137941"
  },
  {
    "skill_id": 80,
    "skills": "snowflake",
    "demand_count": "1072",
    "avg_salary": "137426"
  },
  {
    "skill_id": 143,
    "skills": "fastapi",
    "demand_count": "13",
    "avg_salary": "137405"
  },
  {
    "skill_id": 4,
    "skills": "java",
    "demand_count": "1154",
    "avg_salary": "137307"
  },
  {
    "skill_id": 96,
    "skills": "airflow",
    "demand_count": "737",
    "avg_salary": "137262"
  },
  {
    "skill_id": 59,
    "skills": "elasticsearch",
    "demand_count": "122",
    "avg_salary": "136744"
  },
  {
    "skill_id": 2,
    "skills": "nosql",
    "demand_count": "822",
    "avg_salary": "136547"
  }
]
*/