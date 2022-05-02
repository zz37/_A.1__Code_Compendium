/*table creation, data types int(integer),
varchar (string with 20 chars)
*/


create table student ( 
    student_id int,
    name  varchar(20), 
    major varchar(20),
    primary key(student_id) /*primary key; can also go in the student_id int*/
);

describe student;

drop table student;

alter table student add gpa decimal(3,2);

alter table student drop column gpa;