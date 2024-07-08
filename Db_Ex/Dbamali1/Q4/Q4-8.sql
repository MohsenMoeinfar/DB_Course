SELECT DISTINCT course.course_title
FROM takes , course
WHERE takes.takes_course_id = course.course_course_id
AND takes.takes_grade IN ('A' , 'A-' , 'B+' , 'A+')