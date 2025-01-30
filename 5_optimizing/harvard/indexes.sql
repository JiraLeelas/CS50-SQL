/*Initial Clean*/
VACUUM;

/* Student ID */
CREATE INDEX "student_id"
ON "students"("id");

/*Course ID search*/
CREATE INDEX "course_id"
ON "courses"("id");

/*Enrollment search*/
