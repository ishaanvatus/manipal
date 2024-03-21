/*
1: select count(*) from takes group by course_id; 
2: select dept_name, count(*) from student group by dept_name having count(*) > 10;	
3: select count(*) from course group by dept_name;
4: select avg(salary) from instructor group by dept_name having avg(salary) > 42000;
5: select count(*) from takes where semester='Fall' and year=2009 group by course_id;
6: select * from prereq order by course_id asc;
7: select * from instructor order by salary desc;
8: select dept_name, max(salary) max_sal from instructor group by dept_name;
9: 
*/

# 1.
select count(ID) from takes group by course_id;

 COUNT(ID)
----------
         1
         1
         7
         2
         1
         2
         1
         1
         2
         2
         1

 COUNT(ID)
----------
         1

12 rows selected.