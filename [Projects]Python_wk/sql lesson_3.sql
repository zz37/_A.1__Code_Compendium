create table student ( 
    student_id int auto_increment,
    name  varchar(20),  
    major varchar(20) default 'undicided',
    primary key(student_id) /*primary key; can also go in the student_id int*/
);
--adding only the name and major.
insert into student(name,major) values('Jack','Biology');
insert into student(name,major) values('Kate','Sociology');

--seeing the table, with theincremented id´s.
select * from student;

--updating
update student
set major='Bio'
where major='Biology';

update student
set major='Computer Science'
where major='Sociology';

update student
set major='Mathematics'
where student_id=1;

update student
set major='undecided'
where major='Mathematics' or major='Chemistry';

update student
set name='Tom', major='undecided'
where student_id=1;

--affects all rows
update student
set major='undecided';

--delete a row of the id 5.
delete from student
where student_id=5;

--delete a row of the id 5.
delete from student
where name ='Tom' and major='undecided';

--delete the whole table
delete from student