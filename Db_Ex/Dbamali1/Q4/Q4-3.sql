SELECT takes_grade
FROM takes , section
WHERE takes.takes_course_id = section.section_course_id
AND takes.takes_sec_id = section.section_sec_id 
AND takes.takes_semester = section.section_semester
AND section_time_slot_id = 'A'
--کلاس های 8 صبح تایم اسلات 
--A دارند
