SELECT DISTINCT student.student_name
FROM takes , student , section , [time-slot] , department , course
WHERE takes.takes_ID = student.student_ID
AND takes.takes_course_id = section.section_course_id
AND takes.takes_course_id = course.course_course_id
AND section.section_time_slot_id = [time-slot].time_slot_time_slot_id
AND [time-slot].time_slot_day = 'M'
AND course.course_dept_name = department.department_dept_name
AND department.department_budget > 90000