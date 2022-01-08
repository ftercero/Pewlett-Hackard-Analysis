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