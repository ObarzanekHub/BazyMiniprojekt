--
-- Create model Classses
--
CREATE TABLE "DZINNIK_CLASSSES"
(
    "ID"         NUMBER(19) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    "CLASS_NAME" NVARCHAR2(10) NULL,
    "START_YEAR" NUMBER(11) NOT NULL,
    "END_YEAR"   NUMBER(11) NOT NULL
);
--
-- Create model Teachers
--
CREATE TABLE "DZINNIK_TEACHERS"
(
    "ID"        NUMBER(19) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    "NAME"      NVARCHAR2(50) NULL,
    "LASTNAME"  NVARCHAR2(50) NULL,
    "BIRTHDATE" TIMESTAMP NOT NULL,
    "EMAIL"     NVARCHAR2(254) NULL
);
--
-- Create model Subjects
--
CREATE TABLE "DZINNIK_SUBJECTS"
(
    "ID" NUMBER(19) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
    "SUBJECT_NAME"                                                                                                                      --
-- Create model Students
--
        CREATE TABLE "DZINNIK_STUDENTS"
        ("ID" NUMBER (19) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
        "NAME" NVARCHAR--
-- Create model Enrollments
--
        CREATE TABLE "DZINNIK_ENROLLMENTS"
        ("ID" NUMBER (19) GENERATED BY DEFAULT ON NULL AS IDENTITY NOT NULL PRIMARY KEY,
        "ENROLLMENT_DATE" TIMESTAMP NOT NULL,
        "STUDENT_ID" NUMBER (19) NOT NULL,
        "SUBJECT_ID" NUMBER (19) NOT NULL);
--
-- Add field class_supervisor to classses
--
ALTER TABLE "DZINNIK_CLASSSES"
    ADD "CLASS_SUPERVISOR_ID" NUMBER(19) NOT NULL
        CONSTRAINT "DZINNIK_C_CLASS_SUP_C8959F6A_F" REFERENCES "DZINNIK_TEACHERS" ("ID") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "DZINNIK_SUBJECTS"
    ADD CONSTRAINT "DZINNIK_S_TEACHER_I_3FAAA196_F" FOREIGN KEY ("TEACHER_ID") REFERENCES
        "DZINNIK_TEACHERS" ("ID") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "DZINNIK_SU_TEACHER_ID_3FAAA196" ON "DZINNIK_SUBJECTS" ("TEACHER_ID");
ALTER TABLE "DZINNIK_STUDENTS"
    ADD CONSTRAINT "DZINNIK_S_CLASSES_I_8E345D65_F" FOREIGN KEY ("CLASSES_ID") REFERENCES
        "DZINNIK_CLASSSES" ("ID") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "DZINNIK_ST_CLASSES_ID_8E345D65" ON "DZINNIK_STUDENTS" ("CLASSES_ID");
ALTER TABLE "DZINNIK_ENROLLMENTS"
    ADD CONSTRAINT "DZINNIK_E_STUDENT_I_8D8F63E3_F" FOREIGN KEY ("STUDENT_ID") REFERENCES
        "DZINNIK_STUDENTS" ("ID") DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE "DZINNIK_ENROLLMENTS"
    ADD CONSTRAINT "DZINNIK_E_SUBJECT_I_040ED708_F" FOREIGN KEY ("SUBJECT_ID") REFERENCES
        "DZINNIK_SUBJECTS" ("ID") DEFERRABLE INITIALLY DEFERRED;
CREATE INDEX "DZINNIK_EN_STUDENT_ID_8D8F63E3" ON "DZINNIK_ENROLLMENTS" ("STUDENT_ID");
CREATE INDEX "DZINNIK_EN_SUBJECT_ID_040ED708" ON "DZINNIK_ENROLLMENTS" ("SUBJECT_ID");
CREATE INDEX "DZINNIK_CL_CLASS_SUPE_C8959F6A" ON "DZINNIK_CLASSSES" ("CLASS_SUPERVISOR_ID");