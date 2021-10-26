CREATE TABLE "Appointments" (
	"studentID"	TEXT NOT NULL,
	"courseID"	TEXT NOT NULL,
	FOREIGN KEY("studentID") REFERENCES "Student"("studentID"),
	FOREIGN KEY("courseID") REFERENCES "Course"("courseID"),
	PRIMARY KEY("studentID","courseID")
);

CREATE TABLE "Coach" (
	"coachID"	TEXT NOT NULL,
	"firstName"	TEXT NOT NULL,
	"lastName"	TEXT NOT NULL,
	"phoneNumber"	TEXT NOT NULL,
	"location"	TEXT NOT NULL,
	"registerOn"	TEXT NOT NULL,
	"ratings"	NUMERIC NOT NULL,
	PRIMARY KEY("coachID")
);

CREATE TABLE "Course" (
	"courseID"	TEXT NOT NULL,
	"courseName"	TEXT NOT NULL,
	"carType"	TEXT NOT NULL,
	"startTime"	TEXT NOT NULL,
	"duration"	TEXT NOT NULL,
	"courseInfo"	TEXT,
	"capacity"	INTEGER NOT NULL,
	"coachID"	TEXT NOT NULL,
	PRIMARY KEY("courseID"),
	FOREIGN KEY("coachID") REFERENCES "Coach"("coachID")
);

CREATE TABLE "Student" (
	"studentID"	TEXT NOT NULL,
	"firstName"	TEXT NOT NULL,
	"lastName"	TEXT NOT NULL,
	"gender"	TEXT,
	"phoneNumber"	TEXT NOT NULL,
	"email"	TEXT,
	"address"	TEXT NOT NULL,
	PRIMARY KEY("studentID")
);