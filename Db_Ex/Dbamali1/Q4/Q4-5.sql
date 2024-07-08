SELECT DISTINCT department.department_dept_name , department.department_budget
FROM department , section , course
WHERE course.course_dept_name = department.department_dept_name
AND section.section_course_id = course.course_course_id
AND section.section_year =2009 
AND section_semester = 'Fall'