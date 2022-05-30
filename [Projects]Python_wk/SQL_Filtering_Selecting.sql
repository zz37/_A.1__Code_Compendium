create table student ( 
    student_id int,
    name  varchar(20), 
    major varchar(20),
    primary key(student_id) /*primary key; can also go in the student_id int*/
);

--Insert data into database by inserting the values in order of appeareance.
--You can not insert duplicate keys, beacuse a record all rady exists.
INSERT into student values(1,'Jack','Biology');
INSERT into student values(2,'Kate','Sociology');

/*We can specify the picies of information eg. only student_id & name*/
INSERT into student(student_id,name) values(3,'Claire');

/* adding more*/
INSERT into student values(4,'Jack','Biology');
INSERT into student values(5,'Mike','Copmuter Science');

--ascending order
select student.name, student.major
from student
order by name;

--descendin order
select student.name, student.major
from student
order by name desc;

--asc (ascending) , desc(desceding)
select *
from student
order by student_id desc;

--first order by major then by number
select *
from student
order by major,student_id desc;

--limiting results
select *
from student
order by student_id desc
limit 2;

--filterig results
select *
from student
where major = 'Biology' or name= 'Kate';

--filterig results
select *
from student
where major <> 'Chemistry';

--filterig results
select *
from student
where student_id <= 3 and name <> 'Jack';

--filterig results
select *
from student
where name in('Claire','Kate','Mike');


--filterig results
select *
from student
where major in('Biology','Chemistry') and student_id > 2; 