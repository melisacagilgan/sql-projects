SELECT student_id, name, surname, email FROM Student;

SELECT student_id, supervisor_email FROM Internship WHERE course_code = 3550300 and start_date >= TO_DATE('01/07/2019', 'DD/MM/YYYY') AND end_date <= TO_DATE('30/07/2020', 'DD/MM/YYYY');

SELECT a.name, a.surname, a.email from Student a INNER JOIN Internship b on a.STUDENT_ID = b.STUDENT_ID WHERE b.semester = 20183 and b.COURSE_CODE=3550300;

SELECT x.name, x.surname, x.tel, y.name, y.address FROM Supervisor x INNER JOIN Company y on x.company_id = y.id INNER JOIN Internship z on z.SUPERVISOR_EMAIL=x.email WHERE  z.semester=20183 and z.course_code = 3550300 or z.course_code = 3550400 group by  x.name, x.surname, x.tel, y.name, y.address;

SELECT e.report_name, v.score, k.supervisor_evaluation_score from Report e INNER JOIN FacultyEvaluation v on v.report=e.report_id INNER JOIN Internship k on k.internship_id=e.internship_id INNER JOIN Student t on t.student_id=k.student_id where k.course_code = 3550300 and t.name = 'Kaila' and t.surname = 'Lembrick';

SELECT ROUND((v.score + k.supervisor_evaluation_score)/2) as "average" from Report e INNER JOIN FacultyEvaluation v on v.report=e.report_id INNER JOIN Internship k on k.internship_id=e.internship_id INNER JOIN Student t on t.student_id=k.student_id where k.course_code = 3550300 and t.student_id = 2;