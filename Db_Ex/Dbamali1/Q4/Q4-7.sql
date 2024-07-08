SELECT DISTINCT course.course_title , instructor.instructor_name
FROM course , teaches ,instructor
WHERE teaches.teaches_course_id = course.course_course_id
AND teaches.teaches_ID = instructor.instructor_ID
AND course.course_dept_name = 'Comp. Sci.'
