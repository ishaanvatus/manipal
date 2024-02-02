# Lab 03

## Set operations
1. (select c.title from (course c natural join teaches t) where t.year=2009 and t.semester='Fall') union (select c.title from (course c natural join teaches t) where t.year=2010 and t.semester='Spring');
2. (select c.title from (course c natural join teaches t) where t.year=2009 and t.semester='Fall') intersect (select c.title from (course c natural join teaches t) where t.year=2010 and t.semester='Spring');
3. (select c.title from (course c natural join teaches t) where t.year=2009 and t.semester='Fall') minus (select c.title from (course c natural join teaches t) where t.year=2010 and t.semester='Spring');
4. (select c.title from (course c natural join teaches t)) minus (select c.title from (course c natural join teaches t) where t.course_id=c.course_id);


## Nested subqueries
5. select c.title from (course c natural join teaches t) where t.year=2009 and t.semester='Fall' and c.title in (select c.title from (course c natural join teaches t) where t.year=2010 and t.semester='Spring');
6. select count(unique t.id) from takes t where t.course_id in (select tc.course_id from teaches tc where tc.id='10101');
7. select c.title from (course c natural join teaches t) where t.year=2009 and t.semester='Fall' and c.title not in (select c.title from (course c natural join teaches t) where t.year=2010 and t.semester='Spring');
8. select s.name from student s where s.name in (select i.name from instructor i);


## Set comparision
9. select i.name from instructor i where i.salary > some (select b.salary from instructor b where dept_name='Biology');
10. select i.name from instructor i where i.salary > all (select b.salary from instructor b where dept_name='Biology');
11. select dept_name, avg(salary) avg_salary from instructor group by dept_name order by avg_salary DESC;
12. select dept_name from department where budget < (select avg(salary) from instructor);

## Test for empty relations
13.  SELECT s1.course_id FROM section s1 WHERE s1.semester = 'Fall' AND s1.year = 2009 AND EXISTS(SELECT s2.course_id FROM section s2 WHERE s2.semester = 'Spring' and s2.year = 2010 and s2.course_id=s1.course_id);
14.
