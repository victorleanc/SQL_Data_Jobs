/*
- Filter the jobs by the one I chose to analyze: 'Data Engineer'.
- Include the average annual salary and sort it in descending order.
- Limit the results by job_location to focus on the specific location I want to analyze.
*/

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
LIMIT 10
