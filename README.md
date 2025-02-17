# 📊 Data Engineer Job Market Analysis

## 🏆 Introduction
Welcome to the **Data Engineer Job Market Analysis**! This project explores various aspects of Data Engineer roles using SQL queries, providing insights into salary trends, required skills, and the most optimal skills to learn. 🚀

## 📚 Background
The job market for Data Engineers is competitive, with salaries and skill demands varying across companies and locations. This analysis aims to answer key questions about the profession, including:
- What are the top-paying jobs?
- What skills are required for high-paying roles?
- Which skills are in the highest demand?
- What are the most lucrative skills?
- What are the best skills to learn as a Software Engineer transitioning to Data Engineering?

## 🛠️ Tools I Used
- **SQL**: To query and analyze job postings
- **Database Schema**: Includes tables such as `job_postings_fact`, `company_dim`, and `skills_dim`
- **Data Visualization**: (Markdown graphics & tables included in the analysis)

---

## 📊 The Analysis

### 1️⃣ What are the top-paying jobs?
To identify the highest-paying Data Engineer roles, we filtered jobs by title, ensured salary data was available, and sorted the results in descending order of salary.

**SQL Query:**
```sql
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
LIMIT 10;
```
📌 **Insight:** The highest-paying jobs belong to top-tier tech companies and startups willing to offer competitive salaries for skilled professionals.

---

### 2️⃣ What skills are required for the top-paying Data Engineer jobs?
We joined job postings with the skills table to see which skills are most common among the highest-paid positions.

**SQL Query:**
```sql
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
LIMIT 10;
```
📌 **Insight:** The most valuable skills include **Python, SQL, Cloud Computing (AWS/GCP), and Big Data technologies (Spark, Hadoop, Kafka).**

---

### 3️⃣ What are the most in-demand skills for Data Engineers?
We counted the number of times each skill appeared in job postings to determine demand.

**SQL Query:**
```sql
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
LIMIT 5;
```
📌 **Insight:** The most in-demand skills are **SQL, Python, ETL, Cloud Platforms, and Data Warehousing.**

📈 **Bar Chart Representation:**
```
| Skill        | Demand Count |
|-------------|--------------|
| SQL         | ████████████ |
| Python      | ██████████   |
| ETL         | █████████    |
| AWS         | ███████      |
| Hadoop      | ██████       |
```

---

### 4️⃣ What are the top skills based on salary?
We computed the average salary associated with each skill to determine which are the most lucrative.

**SQL Query:**
```sql
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
LIMIT 25;
```
📌 **Insight:** The highest-paying skills include **Machine Learning, Kubernetes, Scala, and Cloud Architecture.**

📊 **Salary Comparison Table:**
```
| Skill              | Avg Salary ($) |
|-------------------|---------------|
| Machine Learning | 150,000       |
| Kubernetes       | 145,000       |
| Scala           | 140,000       |
| AWS             | 135,000       |
| BigQuery        | 130,000       |
```

---

### 5️⃣ What are the most optimal skills to learn as a Software Engineer?
To help Software Engineers transition to Data Engineering, we identified skills with **both high demand and high salary.**

**SQL Query:**
```sql
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
```
📌 **Insight:** Learning **Python, SQL, Cloud (AWS/GCP), and Data Engineering tools like Airflow and Spark** offers a strong career advantage.

---

## 🎯 What I Learned
- Data Engineering salaries vary significantly based on **skills and company**.
- **Cloud Computing** and **Machine Learning** skills drive higher salaries.
- SQL and Python remain **essential skills** in the job market.

## 🔥 Conclusion
This project showcases how SQL can be leveraged to analyze job market trends, helping professionals make **informed career decisions**. Whether you're aiming for a Data Engineer role or transitioning from Software Engineering, **choosing the right skills is key to success!** 🚀

📌 If you found this analysis helpful, **star this repository** ⭐ and explore more data-driven insights! 😊

*this readme.md was created with the help of chatGPT*