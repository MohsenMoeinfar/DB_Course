
CREATE TABLE timeslot(
   time_slot_time_slot_id NVARCHAR(50) NOT NULL ,
   time_slot_day NVARCHAR(50) NOT NULL , 
   time_slot_start_hr TINYINT NOT NULL ,  
   time_slot_start_min TINYINT NOT NULL , 
   time_slot_end_hr TINYINT NOT NULL  ,
   time_slot_end_min TINYINT NOT NULL 
   PRIMARY KEY(time_slot_time_slot_id  ,time_slot_day)
);
CREATE TABLE department(
 department_dept_name NVARCHAR(50) PRIMARY KEY NOT NULL , 
 department_building NVARCHAR(50) NOT NULL , 
  department_budget INT NOT NULL
);
CREATE TABLE classroom
(
   classroom_building NVARCHAR(50) NOT NULL , 
   classroom_room_number SMALLINT NOT NULL , 
   classroom_capacity SMALLINT NOT NULL CHECK(classroom_capacity >10)  ,
   PRIMARY KEY (classroom_building , classroom_room_number)
);
CREATE TABLE course(
  course_course_id NVARCHAR(50) PRIMARY KEY NOT NULL , 
  course_title NVARCHAR(50) NOT NULL , 
  course_dept_name NVARCHAR(50) NOT NULL ,  
  course_credits TINYINT NOT NULL ,
  FOREIGN KEY (course_dept_name) REFERENCES department(department_dept_name) ON DELETE CASCADE ON UPDATE CASCADE 
);
CREATE TABLE prereq(
 prereq_course_id NVARCHAR(50)  NOT NULL  , 
 prereq_prereq_id NVARCHAR(50) NOT NULL , 
 PRIMARY KEY(prereq_course_id , prereq_prereq_id ) , 
 FOREIGN KEY (prereq_course_id) REFERENCES course(course_course_id) ON DELETE NO ACTION ON UPDATE NO ACTION, 
 FOREIGN KEY (prereq_prereq_id) REFERENCES course(course_course_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);

CREATE TABLE section(
section_course_id NVARCHAR(50) NOT NULL  ,  
section_sec_id TINYINT NOT NULL ,  
section_semester NVARCHAR(50) NOT NULL  , 
section_year SMALLINT NOT NULL  CHECK (section_year > 2000) , 
section_building NVARCHAR(50) NOT NULL , 
section_room_number SMALLINT NOT NULL  ,
section_time_slot_id NVARCHAR(50) NOT NULL ,
PRIMARY KEY(section_course_id , section_sec_id ,section_semester) ,
FOREIGN KEY (section_building , section_room_number) REFERENCES classroom(classroom_building , classroom_room_number)  ON DELETE CASCADE ON UPDATE CASCADE
) ; 

CREATE TABLE instructor(
instructor_ID INT PRIMARY KEY NOT NULL ,
instructor_name NVARCHAR(50) NOT NULL , 
instructor_dept_name NVARCHAR(50) NOT NULL ,
instructor_salary INT NOT NULL
FOREIGN KEY (instructor_dept_name) REFERENCES department(department_dept_name) ON DELETE CASCADE ON UPDATE CASCADE
)
CREATE TABLE student(
student_ID INT PRIMARY KEY NOT NULL ,  
student_name NVARCHAR(50) NOT NULL , 
student_dept_name NVARCHAR(50) NOT NULL , 
student_tot_cred TINYINT NOT NULL
FOREIGN KEY (student_dept_name) REFERENCES department(department_dept_name)  ON DELETE CASCADE ON UPDATE CASCADE
) ;
CREATE TABLE takes(
 takes_ID INT NOT NULL , 
 takes_course_id NVARCHAR(50) NOT NULL  , 
 takes_sec_id TINYINT NOT NULL  , 
 takes_semester NVARCHAR(50) NOT NULL , 
 takes_year SMALLINT NOT NULL ,
 takes_grade NVARCHAR(50) NOT NULL
 PRIMARY KEY(takes_ID , takes_course_id , takes_sec_id ,takes_semester) , 
 FOREIGN KEY (takes_ID) REFERENCES student(student_ID)  ON DELETE CASCADE ON UPDATE CASCADE , 
 FOREIGN KEY (takes_course_id , takes_sec_id , takes_semester) REFERENCES section(section_course_id , section_sec_id ,section_semester)  ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE  teaches(
teaches_ID INT NOT NULL  ,
teaches_course_id NVARCHAR(50) NOT NULL  , 
teaches_sec_id TINYINT NOT NULL  , 
teaches_semester NVARCHAR(50) NOT NULL , 
teaches_year SMALLINT NOT NULL , 
PRIMARY KEY (teaches_ID , teaches_course_id ,teaches_sec_id,  teaches_semester) , 
FOREIGN KEY (teaches_ID) REFERENCES instructor(instructor_ID)  ON DELETE CASCADE ON UPDATE CASCADE , 
FOREIGN KEY (teaches_course_id ,teaches_sec_id,  teaches_semester) REFERENCES section(section_course_id , section_sec_id ,section_semester)  ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE advisor(
advisor_s_id INT  NOT NULL ,
advisor_i_id INT NOT NULL ,
PRIMARY KEY (advisor_s_id ,advisor_i_id) ,
FOREIGN KEY (advisor_s_id) REFERENCES student(student_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION ,
FOREIGN KEY (advisor_i_id) REFERENCES instructor(instructor_ID)  ON DELETE NO ACTION ON UPDATE NO ACTION
) ;