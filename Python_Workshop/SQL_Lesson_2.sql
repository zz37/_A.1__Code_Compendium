/*table creation, data types int(integer),
varchar (string with 20 chars)
*/


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


select * from student;--selection of all elements from student table

-- now we drop the table.
drop table student;

--adding a not null and unique instruction in the table.
--unique is if a repeated name is used it will not be allowed
create table student ( 
    student_id int,
    name  varchar(20) not null,  
    major varchar(20) unique,
    primary key(student_id) /*primary key; can also go in the student_id int*/
);

select * from student;

--adding 
INSERT into student values(1,'Jack','Biology');
INSERT into student values(2,'Kate','Sociology');

--cannot insert a null value because it is specified in the table
INSERT into student values(3,null,'Chemistry');

--cannot add a double entry because unique is instructed. hence the error.
INSERT into student values(4,'Jack','Biology');

--not null and unique are refered as constrains.

drop table student;

--another constrain is the defualt value, which is used when no value is entered.
create table student ( 
    student_id int,
    name  varchar(20),  
    major varchar(20) default 'undicided',
    primary key(student_id) /*primary key; can also go in the student_id int*/
);
--not adding a value will be replaced with the default value.
insert into student(student_id,name) values(1,'Jack');

--seing the table.
select * from student;

--drop the table.
drop table student;


--another is the auto increment for the student id, like i++.
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
