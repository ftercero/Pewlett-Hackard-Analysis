-- Deliverable 1
-- determine the number of retiring employees per title and
-- identify employees who are eligible to participate in a mentorship program.

SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   ti.title,
	   ti.from_date,
	   ti.to_date
INTO retirement_tables
FROM employees AS e
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT *
FROM retirement_tables;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title

INTO unique_titles
FROM retirement_tables AS rt
ORDER BY emp_no, to_date DESC;

-- Call unique titles table columns.
SELECT *
FROM unique_title;

-- Create table grouped by title of retirees and sorted by counts.
SELECT COUNT (ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut
GROUP BY (ut.title)
ORDER BY count DESC;

--Deliverable 2

-- Create a mentorship eligibility table.
-- Select columns
SELECT DISTINCT ON (e.emp_no)
 	e.emp_no,
 	e.first_name,
    e.last_name,
 	e.birth_date,
 	de.from_date,
 	de.to_date,
 	tl.title
-- Create new table
INTO mentorship_eligibility
-- Define alias and tables to join
FROM
	employees AS e
INNER JOIN
	dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN
	titles AS tl
ON (e.emp_no = tl.emp_no)
-- Filter by current status and retirement age
WHERE de.to_date = ('9999-01-01') AND
	  (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
-- Order by employee number
ORDER BY emp_no;

-- Deliverable 3