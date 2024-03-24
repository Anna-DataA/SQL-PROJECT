-- 1. SELECT, WHERE, AND & OR
-- 1.1 Select only the employees who make more than 50k
select 
  * 
from 
  employees 
where 
  salary > 50000;
-- or
select 
  employee_id, 
  first_name, 
  last_name, 
  salary 
from 
  employees 
where 
  salary > 50000;
-- 1.2 Select only the employees who work in Common Grounds coffeshop
select 
  * 
from 
  employees 
where 
  coffeeshop_id = 1;
--or 
select 
  employee_id, 
  first_name, 
  last_name, 
  salary 
from 
  employees 
where 
  coffeeshop_id = 1;
-- 1.3 Select all the employees who work in Common Grounds and make more than 50k
select 
  * 
from 
  employees 
where 
  coffeeshop_id = 1 
  and salary > 50000;
--or 
select 
  employee_id, 
  first_name, 
  last_name, 
  salary 
from 
  employees 
where 
  coffeeshop_id = 1 
  and salary > 50000;
-- 1.4 Select all the employees who work in Common Grounds or make more than 50k
select 
  * 
from 
  employees 
where 
  coffeeshop_id = 1 
  or salary > 50000;
--or 
select 
  employee_id, 
  first_name, 
  last_name, 
  salary 
from 
  employees 
where 
  coffeeshop_id = 1 
  or salary > 50000;
-- 1.5 Select all the employees who work in Common Grounds, make more than 50k and are male
select 
  * 
from 
  employees 
where 
  coffeeshop_id = 1 
  and gender = 'M' 
  and salary > 50000;
--or 
select 
  employee_id, 
  first_name, 
  last_name, 
  salary 
from 
  employees 
where 
  coffeeshop_id = 1 
  and gender = 'M' 
  and salary > 50000;
-- 1.6 Select all the employees who work in Common Grounds or make more than 50k or are male
select 
  * 
from 
  employees 
where 
  coffeeshop_id = 1 
  or gender = 'M' 
  or salary > 50000;
--or 
select 
  employee_id, 
  first_name, 
  last_name, 
  salary 
from 
  employees 
where 
  coffeeshop_id = 1 
  or gender = 'M' 
  or salary > 50000;
-- ----------2. IN, NOT IN, IS NULL, BETWEEN-----------
-- 2.1 Select all rows from the suppliers table where the supplier is Beans and Barley
select 
  * 
from 
  suppliers 
where 
  supplier_name = 'Beans and Barley';
-- 2.2 Select all rows from the suppliers table where the supplier is NOT Beans and Barley
select 
  * 
from 
  suppliers 
where 
  NOT supplier_name = 'Beans and Barley';
-- or 
select 
  * 
from 
  suppliers 
where 
  supplier_name <> 'Beans and Barley';
-- 2.3 Select all Robusta and Arabica coffee types
select 
  * 
from 
  suppliers 
where 
  coffee_type IN ('Robusta', 'Arabica');
-- or 
select 
  * 
from 
  suppliers 
where 
  coffee_type = 'Robusta' 
  or coffee_type = 'Arabica';
-- 2.4 Select all coffee types that are not Robusta or Arabica
select 
  * 
from 
  suppliers 
where 
  coffee_type NOT IN ('Robusta', 'Arabica');
-- 2.5 Select all employees with missing email addresses
select 
  * 
from 
  employees 
where 
  email IS NULL;
-- 2.6 Select all employees whose emails are not missing
select 
  * 
from 
  employees 
where 
  NOT email IS NULL;
-- 2.7 Select all employees who make between 35k and 50k
select 
  employee_id, 
  first_name, 
  last_name, 
  salary 
from 
  employees 
where 
  salary between 35000 
  and 50000;
-- or 
select 
  employee_id, 
  first_name, 
  last_name, 
  salary 
from 
  employees 
where 
  salary >= 35000 
  and salary <= 50000;
-- ----------3. ORDER BY, LIMIT, DISTINCT and Renaming columns----------
-- 3.1 Order by salary ascending 
select 
  employee_id, 
  first_name, 
  last_name, 
  salary 
from 
  employees 
order by 
  salary desc;
-- 3.2 Order by salary descending 
select 
  employee_id, 
  first_name, 
  last_name, 
  salary 
from 
  employees 
order by 
  salary asc;
-- 3.3 Top 10 highest paid employees
select 
  employee_id, 
  first_name, 
  last_name, 
  salary 
from 
  employees 
order by 
  salary desc 
limit 
  10;
-- 3.4 Return all unique coffeeshop ids
select 
  distinct coffeeshop_id 
from 
  employees;
-- 3.5 Return all unique countries
select 
  distinct country 
from 
  locations;
-- 3.6 Renaming columns
select 
  email, 
  email as email_address, 
  hire_date, 
  hire_date as date_join, 
  salary, 
  salary as pay 
from 
  employees;
-- -----------4. EXTRACT-----------------
select 
  hire_date, 
  extract (
    year 
    from 
      hire_date
  ) as year, 
  extract (
    month 
    from 
      hire_date
  ) as month, 
  extract (
    day 
    from 
      hire_date
  ) as day 
from 
  employees;
-- -----------5. UPPER, LOWER, LENGTH, TRIM----------
-- 5.1 Uppercase first and last names
select 
  first_name, 
  upper(first_name) as first_name_upper, 
  last_name, 
  upper(last_name) as last_name_upper 
from 
  employees;
-- 5.2 Lowercase first and last names
select 
  first_name, 
  lower(first_name) as first_name_lower, 
  last_name, 
  lower(last_name) as last_name_lower 
from 
  employees;
-- 5.3 Return the email and the length of emails
select 
  email, 
  length(email) as email_length 
from 
  employees;
-- 5.4 TRIM
select 
  length('   thankforwatching    ') as words_with_spaces, 
  length('thankforwathcing') as words_without_spaces, 
  length(
    trim('   thankforwatching    ')
  ) as words_trimmed;
-- ----------6. Concatenation, Boolean expressions and Wildcards-----------------
-- 6.1 Concatenate first and last names to create full names
select 
  concat(first_name, '-', last_name) as full_name 
from 
  employees;
-- 6.2 Concatenate columns to create a sentence
select 
  concat(
    first_name, '-', last_name, ' ', 'make', 
    ' ', salary
  ) as full_name_salary 
from 
  employees;
-- Boolean expressios
-- 6.3 if the person makes less than 50k, then true, otherwise false
select 
  first_name || ' ' || last_name as full_name, 
  (salary < 50000) as less_than_50grand 
from 
  employees;
-- 6.4 if the person is a female and makes less than 50k, then true, otherwise false
select 
  first_name || ' ' || last_name as full_name, 
  (
    salary < 50000 
    and gender = 'F'
  ) AS less_than_50k_female 
from 
  employees;
-- Boolean expressions with wildcards (% subString)
-- 6.5 if email has '.com', return true, otherwise false
select 
  email, 
  (email like '%.com%') as dotcom_flag 
from 
  employees;
-- 6.6 return only government employees
select 
  email, 
  (email like '%.gov%') as dot_gov_flag 
from 
  employees;
-- ----7. SUBSTRING, POSITION, COALESCE-------
-- 7.1 Get the email from the 5th character
select 
  email, 
  substring(
    email 
    from 
      5
  ) 
from 
  employees;
-- POSITION
-- 7.2 Find the position of '@' in the email
select 
  email, 
  position('@' IN email) 
from 
  employees;
-- 7.3 SUBSTRING & POSITION to find the email client
select 
  email, 
  substring (
    email 
    from 
      position('@' IN email)+ 1
  ) 
from 
  employees;
-- 7.4 COALESCE to fill missing emails with custom value
select 
  email, 
  coalesce(email, 'Not applicable') 
from 
  employees;
-- -----8. MIN, MAX, AVG, SUM & COUNT---------------
-- 8.1 Select the minimum salary
select 
  min(salary) 
from 
  employees;
-- 8.2 Select the maximum salary
select 
  max(salary) 
from 
  employees;
-- 8.3 Select difference between maximum and minimum salary
select 
  max(salary) - min(salary) 
from 
  employees;
-- 8.4 Select the average salary
select 
  avg(salary) 
from 
  employees;
-- 8.5 Round average salary to nearest integer
select 
  round(
    avg(salary), 
    0
  ) 
from 
  employees;
-- 8.6 Count the number of entries
select 
  count (*) 
from 
  employees;
select 
  count (email) 
from 
  employees;
-- -----9. GROUP BY & HAVING
-- 9.1 Return the number of employees for each coffeeshop
Select 
  * 
from 
  employees;
select 
  count(employee_id), 
  coffeeshop_id 
from 
  employees 
group by 
  coffeeshop_id 
order by 
  coffeeshop_id asc;
-- 9.2 Return the total salaries for each coffeeshop
select 
  coffeeshop_id, 
  sum(salary) 
from 
  employees 
group by 
  coffeeshop_id 
order by 
  coffeeshop_id asc;
-- 9.3 Return the number of employees, the avg & min & max & total salaries for each coffeeshop
select 
  coffeeshop_id, 
  count(employee_id), 
  round(
    avg(salary), 
    0
  ) as avg_pay, 
  min(salary) as min_pay, 
  max(salary) as max_pay, 
  sum(salary) as total_pay 
from 
  employees 
group by 
  coffeeshop_id 
order by 
  coffeeshop_id asc;
-- HAVING
-- 9.4 After GROUP BY, return only the coffeeshops with more than 200 employees
select 
  coffeeshop_id, 
  count(employee_id), 
  round(
    avg(salary), 
    0
  ) as avg_pay, 
  min(salary) as min_pay, 
  max(salary) as max_pay, 
  sum(salary) as total_pay 
from 
  employees 
group by 
  coffeeshop_id 
having 
  count(*) > 200 
order by 
  coffeeshop_id asc;
-- 9.5 After GROUP BY, return only the coffeeshops with a minimum salary of less than 10k
select 
  coffeeshop_id, 
  count(employee_id), 
  round(
    avg(salary), 
    0
  ) as avg_pay, 
  min(salary) as min_pay, 
  max(salary) as max_pay, 
  sum(salary) as total_pay 
from 
  employees 
group by 
  coffeeshop_id 
having 
  min(salary) < 10000 
order by 
  coffeeshop_id asc;
-- ------10.CASE (with GROUP BY and for transposing data)---------
-- 10.1 If pay is less than 50k, then low pay, otherwise high pay
select 
  employee_id, 
  first_name, 
  last_name, 
  salary, 
  case when salary < 50000 then 'low_pay' when salary >= 50000 then 'high_pay' else 'no_pay' end 
from 
  employees 
order by 
  salary desc;
-- 10.2 If pay is less than 20k, then low pay, if between 20k-50k inclusive, then medium pay if over 50k, then high pay
select 
  employee_id, 
  first_name, 
  last_name, 
  salary, 
  case when salary < 20000 then 'low_pay' when salary between 20000 
  and 50000 then 'medium_pay' when salary >= 50000 then 'high_pay' else 'no_pay' end 
from 
  employees 
order by 
  salary desc;
-- CASE & GROUP BY 
-- 10.3 Return the count of employees in each pay category
select 
  a.pay_category, 
  count(*) 
from 
  (
    select 
      employee_id, 
      first_name, 
      last_name, 
      salary, 
      case when salary < 20000 then 'low_pay' when salary between 20000 
      and 50000 then 'medium_pay' when salary >= 50000 then 'high_pay' else 'no_pay' end as pay_category 
    from 
      employees 
    order by 
      salary desc
  ) a 
group by 
  a.pay_category;
-- 10.4 Transpose above
select 
  sum(
    case when salary < 20000 then 1 else 0 end
  ) as low_pay, 
  sum(
    case when salary between 20000 
    and 50000 then 1 else 0 end
  ) as medium_pay, 
  sum(
    case when salary >= 50000 then 1 else 0 end
  ) as high_pay 
from 
  employees;
-- --------11. JOIN & UNION---------------
-- 11.1 Inserting values just for JOIN exercises
insert into locations 
values 
  (4, 'paris', 'france');
insert into shops 
values 
  (6, 'happy brew', null);
select 
  * 
from 
  locations;
select 
  * 
from 
  shops;
-- 11.2 INNER JOIN 
select 
  s.coffeeshop_name, 
  l.city, 
  l.country 
from 
  shops s 
  join locations l on s.city_id = l.city_id;
-- 11.3 LEFT JOIN 
select 
  s.coffeeshop_name, 
  l.city, 
  l.country 
from 
  shops s 
  left join locations l on s.city_id = l.city_id;
-- 11.4 RIGHT JOIN 
select 
  s.coffeeshop_name, 
  l.city, 
  l.country 
from 
  shops s 
  right join locations l on s.city_id = l.city_id;
-- 11.5 FULL OUTER JOIN
select 
  s.coffeeshop_name, 
  l.city, 
  l.country 
from 
  shops s full 
  outer join locations l on s.city_id = l.city_id;
-- 11.6 Delete the values that are created just for the JOIN exercises
DELETE FROM 
  locations 
WHERE 
  city_id = 4;
DELETE FROM 
  shops 
WHERE 
  coffeeshop_id = 6;
-- 11.7 Return all cities and countries
select 
  city 
from 
  locations 
union 
select 
  country 
from 
  locations;
-- 11.8 UNION removes duplicates
select 
  country 
from 
  locations 
union 
select 
  country 
from 
  locations;
-- 11.9 UNION ALL keeps duplicates
select 
  country 
from 
  locations 
union all 
select 
  country 
from 
  locations;
-- 11.10 Return all coffeeshop names, cities and countries
select 
  coffeeshop_name 
from 
  shops 
union 
select 
  city 
from 
  locations 
union 
select 
  country 
from 
  locations;
-- -------------12. Subqueries-----------------
-- 12.1 Basic subqueries with subqueries in the FROM clause
select 
  * 
from 
  (
    select 
      * 
    from 
      employees 
    where 
      coffeeshop_id IN (3, 4)
  ) a;
select 
  a.employee_id, 
  a.first_name, 
  a.last_name 
from 
  (
    select 
      * 
    from 
      employees 
    where 
      coffeeshop_id IN (3, 4)
  ) a;
-- 12.2 Basic subqueries with subqueries in the SELECT clause
select 
  first_name, 
  last_name, 
  salary, 
  (
    select 
      max(salary) 
    from 
      employees 
    limit 
      1
  ) 
from 
  employees;
select 
  first_name, 
  last_name, 
  salary, 
  (
    select 
      round(
        avg(salary), 
        0
      ) 
    from 
      employees 
    limit 
      1
  ) 
from 
  employees;
select 
  first_name, 
  last_name, 
  salary, 
  salary - (
    select 
      round(
        avg(salary), 
        0
      ) 
    from 
      employees 
    limit 
      1
  ) 
from 
  employees;
-- Subqueries in the WHERE clause
-- 12.3 Return all US coffee shops
select 
  * 
from 
  shops 
where 
  city_id IN (
    select 
      city_id 
    from 
      locations 
    where 
      country = 'United States'
  );
-- 12.4 Return all employees who work in US coffee shops
select 
  * 
from 
  employees 
where 
  coffeeshop_id IN (
    select 
      coffeeshop_id 
    from 
      shops 
    where 
      city_id IN (
        select 
          city_id 
        from 
          locations 
        where 
          country = 'United States'
      )
  );
-- 12.5 Return all employees who make over 35k and work in US coffee shops
select 
  * 
from 
  employees 
where 
  salary > 35000 
  and coffeeshop_id IN (
    select 
      coffeeshop_id 
    from 
      shops 
    where 
      city_id IN (
        select 
          city_id 
        from 
          locations 
        where 
          country = 'United States'
      )
  );
-- 30 day moving total pay 
-- The inner query calculates the total_salary of employees who were hired "within" the 30-day period before the hire_date of the current employee
SELECT 
  hire_date, 
  salary, 
  (
    SELECT 
      SUM(salary) 
    FROM 
      employees e2 
    WHERE 
      e2.hire_date BETWEEN e1.hire_date - 30 
      AND e1.hire_date
  ) AS pay_pattern 
FROM 
  employees e1 
ORDER BY 
  hire_date;
