
/* 05장 */


-- <실습 1> --

-- </실습 1> --



-- <실습 2> --

-- </실습 2> --



-- <실습 3> --

USE employees;
SELECT * FROM employees;

use shopDB;
select * from membertbl;

USE ShopDB;
CREATE TABLE test (id INT);

USE ShopDB;
CREATE TABLE test (id INT);
INSERT INTO test VALUES(1);

USE employees;
SELECT * FROM employees;

SELECT * FROM employees ;

-- </실습 3> --



-- <실습 4> --

/*
ip addr 
ping Linux_IP_주소 
*/

show databases;

CREATE DATABASE myDB;
USE myDB;
CREATE TABLE myTBL (uname CHAR(10));
INSERT INTO myTBL VALUES ('마이리틀텔레비전');
SELECT * FROM myTBL;

USE myDB;
INSERT INTO myTBL VALUES ('MyLittleTV');
SELECT * FROM myTBL;

/*
exit 
shutdown -h now 
*/

-- </실습 4> --



-- <실습 5> --

CREATE USER ceo@'%' IDENTIFIED BY 'ceo';
GRANT SELECT ON *.* TO ceo@'%';

CREATE USER staff@'%' IDENTIFIED BY 'staff';
GRANT SELECT, INSERT, UPDATE, DELETE ON ShoDB.* TO staff@'%';
GRANT SELECT ON employees.* TO staff@'%';

CREATE DATABASE sampleDB;
DROP DATABASE sampleDB;

USE ShopDB;
SELECT * FROM membertbl;

USE ShopDB;
SELECT * FROM memberTBL;
DELETE FROM memberTBL WHERE memberID = 'Sang';

DROP TABLE memberTBL;

USE employees;
SELECT * FROM employees;

-- </실습 5> --
