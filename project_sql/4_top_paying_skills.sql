/*
QUESTION: What are the top skills based on salary?
- Look for the average salary associated with each skill
- Focuses on roles with specified salaries.
*/

SELECT
  skills,
  ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN
  skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN
  skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
  job_postings_fact.job_title_short = 'Data Engineer'
  AND salary_year_avg IS NOT NULL
GROUP BY
  skills
ORDER BY
  avg_salary DESC
LIMIT 25

/*
Breakdown:

The top five highest-paying skills for data engineers highlight a mix of backend development, database management, and data visualization expertise. At the top is Node.js, with an average salary of $181,862, reflecting the growing demand for backend frameworks in data-driven applications. Close behind is MongoDB at $179,403, emphasizing the importance of NoSQL databases in handling large-scale, unstructured data. ggplot2, a powerful data visualization package in R, follows with $176,250, showing that strong visualization skills are highly valued, particularly in analytics-heavy roles. Solidity, at $166,250, stands out as a blockchain-specific skill, suggesting that data engineers working with decentralized applications are in high demand. Finally, Vue.js, earning an average of $159,375, indicates that frontend expertise combined with data engineering knowledge can also command strong salaries, especially in roles that require building interactive data dashboards or applications.

[
  {
    "skills": "node",
    "avg_salary": "181862"
  },
  {
    "skills": "mongo",
    "avg_salary": "179403"
  },
  {
    "skills": "ggplot2",
    "avg_salary": "176250"
  },
  {
    "skills": "solidity",
    "avg_salary": "166250"
  },
  {
    "skills": "vue",
    "avg_salary": "159375"
  },
  {
    "skills": "codecommit",
    "avg_salary": "155000"
  },
  {
    "skills": "ubuntu",
    "avg_salary": "154455"
  },
  {
    "skills": "clojure",
    "avg_salary": "153663"
  },
  {
    "skills": "cassandra",
    "avg_salary": "150255"
  },
  {
    "skills": "rust",
    "avg_salary": "147771"
  },
  {
    "skills": "drupal",
    "avg_salary": "147500"
  },
  {
    "skills": "perl",
    "avg_salary": "145540"
  },
  {
    "skills": "next.js",
    "avg_salary": "145000"
  },
  {
    "skills": "angular",
    "avg_salary": "143319"
  },
  {
    "skills": "scala",
    "avg_salary": "143161"
  },
  {
    "skills": "kafka",
    "avg_salary": "143086"
  },
  {
    "skills": "gdpr",
    "avg_salary": "142369"
  },
  {
    "skills": "shell",
    "avg_salary": "141725"
  },
  {
    "skills": "macos",
    "avg_salary": "141617"
  },
  {
    "skills": "numpy",
    "avg_salary": "141605"
  },
  {
    "skills": "opencv",
    "avg_salary": "141250"
  },
  {
    "skills": "atlassian",
    "avg_salary": "140644"
  },
  {
    "skills": "ibm cloud",
    "avg_salary": "140547"
  },
  {
    "skills": "splunk",
    "avg_salary": "140156"
  },
  {
    "skills": "kubernetes",
    "avg_salary": "140092"
  }
]
*/