/*Find all students' name whose coach has teached more than 100 students and the success rate of students is more than 0.9*/
SELECT s.firstName, s.lastName
FROM Students as s 
INNER JOIN Appointments as a ON s.studentId = a.studentId
INNER JOIN Coaches as c ON c.coachId = a.coachId
WHERE c.totalNumberOfStudents >= 100 AND c.successRate > 0.9;

/*Find all coaches' name whose students' success rate before is more than the average rate of 
those coaches whose students 'number is more than 100. Besides, the coach has more than 200
students before and their location is California*/
SELECT firstName, lastName
FROM Coaches
WHERE successRate > (
	SELECT avg(successRate)
	FROM Coaches
	WHERE totalNumberOfStudents > 100
) AND totalNumberOfStudents > 200 AND location = "CA";

/*FInd all students' name with their coaches' name and the number of coaches who have students less than 200 before 
or have a success rate  more than 0.8 in each state. The result is ordered descendly*/
SELECT s.firstName, s.lastName, c.firstName, c.lastName, count(c.coachId) as ct, c.location
FROM Students as s 
INNER JOIN Appointments as a ON s.studentId = a.studentId
INNER JOIN Coaches as c ON c.coachId = a.coachId
WHERE c.totalNumberOfStudents >= 200 OR c.successRate > 0.8
GROUP BY c.location
HAVING count(c.coachId) > 10
ORDER BY ct DESC;

/*Find a male student whose first name starts with M, last name starts with B or D, and his email has a part like "@g"*/
SELECT firstName, lastName, email
FROM Students
WHERE (firstName like "M%" 
AND lastName like "B%" 
AND email like "%@g%"
AND gender = "Male")
OR ( email like "%@g%"
AND firstName like "M%" 
AND lastName like "D%" 
AND gender = "Male")

