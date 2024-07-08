SELECT DISTINCT department.department_building
FROM student , department
WHERE student.student_dept_name = department.department_dept_name
AND student.student_tot_cred > 40