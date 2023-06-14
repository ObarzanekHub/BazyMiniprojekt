--ilość zajętych miejsc na dany przedmiot
create or replace view occupied_seats as
select SUBJECT_ID, count(*) as occupied
from DZINNIK_ENROLLMENTS
group by SUBJECT_ID;

--ilośc wolnych miejsc na dany przedmiot
CREATE OR REPLACE VIEW available_seats as
select SUBJECT_ID,DZINNIK_SUBJECTS.MAX_CAPACITY - COALESCE(os.occupied, 0) as available_seats
from DZINNIK_SUBJECTS
         left join occupied_seats os on DZINNIK_SUBJECTS.ID = os.SUBJECT_ID;


--zapisywanie studenta na zajęcia
create or replace procedure enroll_student(student_id in number, subject_id in number) is
    v_available_seats number;
begin
    if not exists(select * from DZINNIK_STUDENTS where ID = student_id) then
        raise_application_error(-20000, 'student o podanym id nie istnieje');
    end if;
    if not exists(select * from DZINNIK_SUBJECTS where ID = subject_id) then
        raise_application_error(-20000, 'przedmiot o podanym id nie istnieje');
    end if;
    --sprawdza czy student jest juz zapisany na zajecia
    if exists(select * from DZINNIK_ENROLLMENTS where SUBJECT_ID = subject_id and STUDENT_ID = student_id) then
        raise_application_error(-20000, 'student jest już zapisany na zajecia');
    end if;
    --sprawdza czy sa dostepne miejsca
    select available_seats into v_available_seats from available_seats where available_seats.SUBJECT_ID = subject_id;
    if v_available_seats <= 0 then
        raise_application_error(-20000, 'brak wolnych miejsc');
    end if;

    insert into DZINNIK_ENROLLMENTS (ENROLLMENT_DATE, STUDENT_ID, SUBJECT_ID) VALUES (SYSDATE, student_id, subject_id);
end;

--usuwanie studenta z zapisanego przedmiotu
create or replace procedure remove_student_from_enrollment(
    student_id in number,
    subject_id in number
) is
begin
    if not exists(select * from DZINNIK_ENROLLMENTS where SUBJECT_ID = subject_id and STUDENT_ID = student_id) then
        raise_application_error(-20000, 'student nie jest zapisany do tego przedmiotu');
    end if;
    delete from DZINNIK_ENROLLMENTS where STUDENT_ID = student_id and SUBJECT_ID = subject_id;
end;


--trigger przed usunięciem przedmiotu:
CREATE OR REPLACE TRIGGER before_delete_subject
BEFORE DELETE ON DZINNIK_SUBJECTS
FOR EACH ROW
DECLARE
  subject_id NUMBER;
BEGIN
  subject_id := :OLD.ID;

  -- Sprawdź, czy istnieją zapisy na ten przedmiot
  IF EXISTS(SELECT 1 FROM DZINNIK_ENROLLMENTS WHERE SUBJECT_ID = subject_id) THEN
    -- Jeśli istnieją zapisy, zatrzymaj usuwanie rekordu
    RAISE_APPLICATION_ERROR(-20001, 'Nie można usunąć przedmiotu. Istnieją zapisy uczniów na ten przedmiot.');
  END IF;
END;


    