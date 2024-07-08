SELECT DISTINCT takes.takes_grade
FROM takes , course
WHERE takes.takes_course_id = course.course_course_id
AND course.course_dept_name = 'Comp. Sci.'