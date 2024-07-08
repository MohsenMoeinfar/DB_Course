SELECT DISTINCT instructor.instructor_name , instructor.instructor_salary
FROM takes , teaches , instructor
WHERE takes.takes_course_id = teaches.teaches_course_id
AND takes.takes_sec_id = teaches.teaches_sec_id
AND takes.takes_semester = teaches.teaches_semester
AND instructor.instructor_ID = teaches.teaches_ID
AND (takes_grade = 'F' OR takes_grade = 'C')

