-- create database Student_Record_Keeping_System ;
 use Student_Record_Keeping_System;
/*
create table Department 
(
Department_Name varchar(100),
Department_ID int primary key,

)

create table Student_detalis
(
Student_First_Name varchar(100),
Student_Last_Name varchar(100),
Student_Phone_Number  int,
Student_Depart varchar(100),
Student_ID int primary key ,
depart_id int ,
foreign key (depart_id) references Department(Department_ID),
)
create table Lecturer
(
Lecturer_First_Name varchar(100),
Lecturer_Last_Name varchar(100),
Lecturer_ID int primary key,

)
create table  Course_Schedule 
(

Course_Name varchar(100),
Course_ID int primary key,

)

create table Marks
(

Mark int,
course_id int,
student_id int,
Mark_ID int primary key,
Exam_Mark_Date date,
foreign key (course_id) references Course_Schedule(Course_ID),
foreign key (student_id) references Student_detalis(student_ID),
)
create table Courses_of_Lecturer
(
course_id int,
lecturer_id int,
depart_id int,
primary key (course_id,lecturer_id,depart_id),
foreign key (course_id) references Course_Schedule(Course_ID),
foreign key (lecturer_id) references Lecturer(Lecturer_ID),
foreign key( depart_id) references Department (Department_ID)
)
*/

insert into Student_detalis (Student_First_Name,Student_Last_Name,Student_Phone_Number,Student_Depart,Student_ID,depart_id)
values('Ali','Amr',012,'SE',1,1);
insert into Student_detalis (Student_First_Name,Student_Last_Name,Student_Phone_Number,Student_Depart,Student_ID,depart_id)
values('Ahmed','Kamel',015,'IS',2,2);
----------------------------------------
insert into Department values ('SE',1);
insert into Department values ('CS',2);
insert into Lecturer values ('Reda','Hussein',1);
---------------------------------------------

	delete from Student_detalis where Student_Last_Name = 'Ibrahim'
	delete from Student_detalis where Student_ID = 3;
--------------------------------------------------

delete from Lecturer;
delete from Marks; 
---------------------------

update Student_detalis
set Student_First_Name='sameh'
where Student_ID=5;
----------------------------------
update Student_detalis
set Student_First_Name='Lucas'
-----------------------------
select*from Student_detalis;
-------------------------------
select*from Student_detalis where Student_ID=1;
--------------------------------------------
select Student_Last_Name  from Student_detalis where Student_ID=1;
-----------------------------------------------
select distinct Student_First_Name from Student_detalis;
---------------------------------------------------
 select * from Student_detalis order by Student_First_Name ;
 ------------------------------------------------------
 select * from Department
order by Department_ID desc ;
------------------------------------
select min(Mark) from Marks
-------------------------------------
select max(Mark) from Marks
 --------------------------------------
 select sum(Mark) from Marks
----------------------------------- 
select avg(Mark) from Marks
--------------------------------------------
 select count(student_id) from Student_detalis
 -------------------------------------------------
 select * from Student_detalis where Student_First_Name like 'A%';
 --------------------------------------------------------------------------
select * from Student_detalis where Student_First_Name like '%Ahm%'
--------------------------------------------------------------------------------------
select Student_First_Name  from Student_detalis where Student_ID is not null
----------------------------------------------------------------------------------------
select Student_First_Name from Student_detalis 
where Student_ID = All (select student_id from Marks where Mark = 100 )
----------------------------------------------------------------------------------------
select Student_First_Name,Student_Last_Name from Student_detalis
where Student_Depart = 'SE' and Student_First_Name like 'A%'
-------------------------------------------------------------------------------------------
select Student_First_Name from Student_detalis where Student_Depart = 'SE' or Student_Depart = 'Cs' 
---------------------------------------------------------------------------------------------------
select Student_First_Name from Student_detalis where not Student_ID = 1
--------------------------------------------------------------------------------------------------------
select Top 10* from Student_detalis
-------------------------------------------------
select Top 50 percent * from Student_detalis
---------------------------------------------------
            select Student_First_Name, count(*) 
            from Student_detalis 
           group by Student_First_Name;
------------------------------------------------------------
 select Student_First_Name
          from Student_detalis
          where student_id IN (select Mark_ID
           FROM Marks           where Mark>50)
-------------------------------------------------------------------
select Student_Last_Name,Mark
             from Student_detalis
             inner join Marks on  Marks.student_id= Student_detalis.Student_ID;

---------------------------------------------------------------------------------------------------------
                  select Course_Name,Mark
                  from Course_Schedule
                  left join Marks on Mark= 70 ;      
                      
-----------------------------------------------------------------------------------------------------
                  select Student_Last_Name,Department_Name
                  from Student_detalis
                  right join Department on Student_Last_Name = 'Kamel' and  Department_Name='SE'       
     
----------------------------------------------------------------------------------------------
                 select Lecturer_First_Name,course_id
                 from Lecturer
                 full join Courses_of_Lecturer on Lecturer.lecturer_id = 1  ;
