-- Deliverable 1 - The Number of Retiring Employees by Title/////////////////////////////////////////////
-- from employees table and titles table/////////////////////////////////////////////
SELECT ce.emp_no, ce.first_name, ce.last_name,
	   ti.title, ti.from_date, ti.to_date
INTO ret_titles
FROM current_emp as ce  -- current_emp is filtered employees table who are born between the dates in the Module
	INNER JOIN titles as ti
		ON (ce.emp_no = ti.emp_no)
ORDER BY ce.emp_no;

SELECT * FROM ret_titles


-- Use Dictinct ON with Orderby to remove duplicate rows and order by their recent title (using to_date)
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title

INTO unique_titles
FROM ret_titles
ORDER BY ret_titles.emp_no, ret_titles.to_date DESC;

SELECT * FROM unique_titles




--- count number of employee per title
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

SELECT * FROM retiring_titles

select*from employees


-- Deliverable 2 - The Employees Eligible for the Mentorship Program/////////////////////////////////////////////
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	   de.from_date, de.to_date,
	   ti.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
	On (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER by e.emp_no;

SELECT * FROM mentorship;
