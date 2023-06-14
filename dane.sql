insert into DZINNIK_TEACHERS(NAME, LASTNAME, BIRTHDATE, EMAIL)
VALUES ('Jan', 'Kowalski', '2000-05-19', 'jankowalski@agh.pl');
insert into DZINNIK_TEACHERS(NAME, LASTNAME, BIRTHDATE, EMAIL)
VALUES ('Michał', 'Nowak', '1900-01-18', 'michalnowak@uj.pl');
insert into DZINNIK_TEACHERS(NAME, LASTNAME, BIRTHDATE, EMAIL)
VALUES ('Anna', 'Wisniewska', '1985-12-25', 'anka@uw.pl');


insert into DZINNIK_CLASSSES (class_name, start_year, end_year, class_supervisor_id)
VALUES ('5a', 2023, 2026, 1);
insert into DZINNIK_CLASSSES (class_name, start_year, end_year, class_supervisor_id)
VALUES ('3b', 2022, 2025, 2);

insert into DZINNIK_STUDENTS (NAME, LASTNAME, BIRTH_DATE, CLASSES_ID)
VALUES ('Karol', 'Kowalski', '2009-12-15', 1);
insert into DZINNIK_STUDENTS (NAME, LASTNAME, BIRTH_DATE, CLASSES_ID)
VALUES ('Katarzyna', 'Nowak', '2006-10-12', 1);
insert into DZINNIK_STUDENTS (NAME, LASTNAME, BIRTH_DATE, CLASSES_ID)
VALUES ('Wojciech', 'Nowakowski', '2013-09-01', 2);
insert into DZINNIK_STUDENTS (NAME, LASTNAME, BIRTH_DATE, CLASSES_ID)
VALUES ('Karolina', 'Jakas', '2014-08-03', 2);

insert into DZINNIK_SUBJECTS (SUBJECT_NAME, MAX_CAPACITY, TEACHER_ID)
values ('Matematyka', 20, 1);
insert into DZINNIK_SUBJECTS (SUBJECT_NAME, MAX_CAPACITY, TEACHER_ID)
values ('J.Polski', 5, 2);
insert into DZINNIK_SUBJECTS (SUBJECT_NAME, MAX_CAPACITY, TEACHER_ID)
values ('Geografia', 2, 4);


commit;