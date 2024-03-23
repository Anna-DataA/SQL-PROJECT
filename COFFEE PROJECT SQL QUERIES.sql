-- 1. SELECT, WHERE, AND & OR

-- 1.1 Select only the employees who make more than 50k
select *
from employees
where salary > 50000;

-- or

select employee_id, first_name, last_name, salary
from employees
where salary > 50000;

-- 1.2 Select only the employees who work in Common Grounds coffeshop

select *
from employees
where coffeeshop_id = 1;

--or 

select employee_id, first_name, last_name, salary
from employees
where coffeeshop_id = 1;

-- 1.3 Select all the employees who work in Common Grounds and make more than 50k
select *
from employees
where coffeeshop_id = 1 and salary > 50000;

--or 

select employee_id, first_name, last_name, salary
from employees
where coffeeshop_id = 1 and salary > 50000;

-- 1.4 Select all the employees who work in Common Grounds or make more than 50k

select *
from employees
where coffeeshop_id = 1 or salary > 50000;

--or 

select employee_id, first_name, last_name, salary
from employees
where coffeeshop_id = 1 or salary > 50000;

-- 1.5 Select all the employees who work in Common Grounds, make more than 50k and are male

select *
from employees
where coffeeshop_id = 1
and gender = 'M' 
and salary > 50000;

--or 

select employee_id, first_name, last_name, salary
from employees
where coffeeshop_id = 1
and gender = 'M' 
and salary > 50000;

-- 1.6 Select all the employees who work in Common Grounds or make more than 50k or are male


select *
from employees
where coffeeshop_id = 1
or gender = 'M' 
or salary > 50000;

--or 

select employee_id, first_name, last_name, salary
from employees
where coffeeshop_id = 1
or gender = 'M' 
or salary > 50000;



-- ----------2. IN, NOT IN, IS NULL, BETWEEN-----------


-- 2.1 Select all rows from the suppliers table where the supplier is Beans and Barley

select * from suppliers 
where supplier_name = 'Beans and Barley'; 


-- 2.2 Select all rows from the suppliers table where the supplier is NOT Beans and Barley

select * from suppliers 
where NOT supplier_name = 'Beans and Barley';

-- or 

select * from suppliers 
where supplier_name <> 'Beans and Barley'; 

-- 2.3 Select all Robusta and Arabica coffee types

select * 
from suppliers
where coffee_type IN ('Robusta', 'Arabica');

-- or 

select * 
from suppliers 
where coffee_type = 'Robusta'
or coffee_type = 'Arabica';


-- 2.4 Select all coffee types that are not Robusta or Arabica

select * 
from suppliers
where coffee_type NOT IN ('Robusta', 'Arabica');


-- 2.5 Select all employees with missing email addresses
select * 
from employees
where email IS NULL;


-- 2.6 Select all employees whose emails are not missing
select *
from employees 
where NOT email IS NULL;

-- 2.7 Select all employees who make between 35k and 50k

select employee_id, first_name, last_name, salary
from employees
where salary between 35000 and 50000;


-- or 

select employee_id, first_name, last_name, salary
from employees
where salary >= 35000 
and salary <= 50000;

-- ----------3. ORDER BY, LIMIT, DISTINCT and Renaming columns----------

-- 3.1 Order by salary ascending 

select employee_id, first_name, last_name, salary
from employees
order by salary desc;

-- 3.2 Order by salary descending 

select employee_id, first_name, last_name, salary
from employees
order by salary asc;

-- 3.3 Top 10 highest paid employees

select employee_id, first_name, last_name, salary
from employees
order by salary desc
limit 10;

-- 3.4 Return all unique coffeeshop ids

select distinct coffeeshop_id 
from employees; 

-- 3.5 Return all unique countries

select distinct country 
from locations; 

-- 3.6 Renaming columns

select 
email,
email as email_address, 
hire_date, 
hire_date as date_join,
salary,
salary as pay
from employees; 

-- -----------4. EXTRACT-----------------

select 
hire_date,
extract (year from hire_date) as year, 
extract (month from hire_date) as month, 
extract (day from hire_date) as day
from employees;

-- -----------5. UPPER, LOWER, LENGTH, TRIM----------

-- 5.1 Uppercase first and last names

select 
first_name,
upper(first_name) as first_name_upper,
last_name,
upper(last_name) as last_name_upper
from employees; 

-- 5.2 Lowercase first and last names

select 
first_name,
lower(first_name) as first_name_lower,
last_name,
lower(last_name) as last_name_lower
from employees; 

-- 5.3 Return the email and the length of emails

select email, 
length(email) as email_length
from employees; 


-- 5.4 TRIM

select 
length('   thankforwatching    ') as words_with_spaces,
length('thankforwathcing') as words_without_spaces, 
length(trim('   thankforwatching    ')) as words_trimmed; 


-- ----------6. Concatenation, Boolean expressions and Wildcards-----------------


-- 6.1 Concatenate first and last names to create full names

select concat(first_name, '-', last_name)as full_name
from employees;


-- 6.2 Concatenate columns to create a sentence

select concat(first_name, '-', last_name, ' ', 'make', ' ',salary)as full_name_salary
from employees;

-- Boolean expressios

-- 6.3 if the person makes less than 50k, then true, otherwise false

select
first_name || ' ' || last_name as full_name,
(salary < 50000) as less_than_50grand
from employees;

-- 6.4 if the person is a female and makes less than 50k, then true, otherwise false

select
first_name || ' ' || last_name as full_name,
(salary < 50000 and gender = 'F') AS less_than_50k_female
from employees;

-- Boolean expressions with wildcards (% subString)
-- 6.5 if email has '.com', return true, otherwise false


-- 6.6 return only government employees


-- SUBSTRING, POSITION, COALESCE
-- MIN, MAX, AVG, SUM & COUNT
-- GROUP BY & HAVING
-- CASE (with GROUP BY and for transposing data)
-- JOIN & UNION
-- Subqueries
-- 30 day moving total