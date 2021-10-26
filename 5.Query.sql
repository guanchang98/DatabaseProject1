/*Find all students' name whose coach has ratings more than 4.8 and register on a coach in 2017*/
SELECT s.firstName, s.lastName
FROM Student as s 
INNER JOIN Appointments as a ON s.studentId = a.studentId
INNER JOIN Course as c ON c.courseID = a.courseID
INNER JOIN Coach as co ON c.coachID = co.coachID
WHERE co.ratings > 4.8 AND registerOn like "%2017%";

/*Find all coaches' name whoseratings is more than the average  of those coaches teaching in California. 
Besides, the coach registered on 2019 and their location is California*/
SELECT firstName, lastName
FROM Coach
WHERE ratings > (
	SELECT avg(ratings)
	FROM Coach
	WHERE location = "CA"
) AND registerOn like "%2019%" AND location = "CA";

/*Find all locations with the average ratings of coaches in those states, where the duration of the course is 3.5 hours.
 The result is grouped by location with average ratings bigger than 4.8 and the result is ordered by ratings descendly*/
SELECT co.location, avg(ratings)
FROM Coach as co
INNER JOIN Course as c ON co.coachID = c.coachID
WHERE duration = "3.5 Hours"
GROUP BY co.location
HAVING avg(ratings) > 4.8
ORDER BY avg(co.ratings) DESC

/*Find specific first name, last name, email and address of a male or a female student 
whose first name starts with D and last name begins with C or R*/
SELECT firstName, lastName, email, address
FROM Student
WHERE email like "%@c%"
AND firstName like "D%"
AND (lastName like "C%" OR lastName like "R%")
AND (gender = "Male" OR gender = "Female")
ORDER BY studentID

/*Find all coaches' first name and last name and ordered by ratings. 
Besides, the coaches in california should be demonstrated*/
SELECT 
       firstName,
       lastName,
	   ratings,
       CASE location
           WHEN "CA" 
               THEN "Yes"
           ELSE "No"
       END CoachInCA
FROM 
    Coach
ORDER BY ratings DESC

/*Find all coaches names, showing the ratings of the coaches 
and use a boolean to show whether the coach is in NY. 
Besides, the coach should have equals or more than 2 students
and their ratings is more than 4.8*/
SELECT co.firstName, co.lastName, co.ratings,
CASE location
           WHEN "NY" 
               THEN "Yes"
           ELSE "No"
       END CoachInNY
FROM Student as s 
INNER JOIN Appointments as a ON s.studentId = a.studentId
INNER JOIN Course as c ON c.courseID = a.courseID
INNER JOIN Coach as co ON c.coachID = co.coachID
WHERE co.ratings > 4.8 AND registerOn like "%2016%"
GROUP BY co.coachID
HAVING count(s.studentID) >= 2;



