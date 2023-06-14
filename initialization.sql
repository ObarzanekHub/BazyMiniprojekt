alter session set "_ORACLE_SCRIPT"=true;

create user new_user IDENTIFIED BY "123456789";
commit;

GRANT CREATE TABLE TO NEW_USER;
commit;

GRANT CREATE SESSION TO NEW_USER;
commit;

ALTER USER new_user quota unlimited on USERS;
commit;

grant CREATE SEQUENCE to NEW_USER;
grant CREATE PROCEDURE to NEW_USER;
grant CREATE TRIGGER to NEW_USER;
grant CREATE VIEW to NEW_USER;
commit;



