SELECT instructor.instructor_name
FROM instructor , teaches , prereq , course
WHERE instructor.instructor_ID = teaches.teaches_ID AND 
teaches.teaches_course_id = course.course_course_id AND
course.course_course_id  = prereq.prereq_course_id AND 
prereq.prereq_prereq_id = 'BIO-101';