create table department(
deptno int primary key, 
deptname char(3));

create table employee(
  empno int primary key,
  empname varchar(32) not null,
  gender char(1) check(gender in ('M', 'F')) not null,
  salary numeric(8, 3) not null,
  address varchar(32) not null,
  dno int,
  foreign key (dno) references department(deptno));

alter table employee add foreign key(dno) references department(deptno);
insert into department values (1, 'CSE');
insert into department values (2, 'CCE');
insert into department values (3, 'ICT');
insert into department values (4, 'EEE');

insert into employee values (1, 'Prashanth Barla', 'M', 293.01, 'somewhere', 4);
insert into employee values (2, 'Andrew Joseph', 'M', 293.82, 'elsewhere', 1);
insert into employee values (3, 'Gary Smith', 'M', 283.72, 'everywhere', 3);
insert into employee values (4, 'Larry Page', 'M', 284.73, 'here', 1);
insert into employee values (5, 'Suman Sharma', 'F', 384.93, 'there', 3);
insert into employee values (6, 'Jane Doe', 'F', 238.20, 'nowhere', 2);

alter table employee add dob date;
update employee set dob=to_date('1970-01-01', 'yyyy-mm-dd');