
/* 09장 */

CREATE TABLE userTbl 
( userID  char(8) NOT NULL PRIMARY KEY, 
  name    varchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL 
);

-- <실습 1> --

USE sqlDB;
CREATE TABLE  tbl1
	(	a INT PRIMARY KEY,
		b INT,
		c INT
	);

SHOW INDEX FROM tbl1;

CREATE TABLE  tbl2
	(	a INT PRIMARY KEY,
		b INT UNIQUE,
		c INT UNIQUE,
		d INT
	);
SHOW INDEX FROM tbl2;

CREATE TABLE  tbl3
	(	a INT UNIQUE,
		b INT UNIQUE,
		c INT UNIQUE,
		d INT
	);
SHOW INDEX FROM tbl3;

CREATE TABLE  tbl4
	(	a INT UNIQUE NOT NULL,
		b INT UNIQUE ,
		c INT UNIQUE,
		d INT
	);
SHOW INDEX FROM tbl4;

CREATE TABLE  tbl5
	(	a INT UNIQUE NOT NULL,
		b INT UNIQUE ,
		c INT UNIQUE,
		d INT PRIMARY KEY
	);
SHOW INDEX FROM tbl5;

CREATE DATABASE IF NOT EXISTS testDB;
USE testDB;
DROP TABLE IF EXISTS userTbl;
CREATE TABLE userTbl 
( userID  char(8) NOT NULL PRIMARY KEY, 
  name    varchar(10) NOT NULL,
  birthYear   int NOT NULL,
  addr	  nchar(2) NOT NULL 
 );

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기');
INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울');
SELECT * FROM userTbl;

ALTER TABLE usertbl DROP PRIMARY KEY ;
ALTER TABLE usertbl 
	ADD CONSTRAINT pk_name PRIMARY KEY(name);
SELECT * FROM userTbl;

-- </실습 1> --

CREATE DATABASE IF NOT EXISTS testDB;
USE testDB;
DROP TABLE IF EXISTS clusterTbl;
CREATE TABLE clusterTbl
( userID  char(8) ,
  name    varchar(10) 
);
INSERT INTO clusterTbl VALUES('LSG', '이승기');
INSERT INTO clusterTbl VALUES('KBS', '김범수');
INSERT INTO clusterTbl VALUES('KKH', '김경호');
INSERT INTO clusterTbl VALUES('JYP', '조용필');
INSERT INTO clusterTbl VALUES('SSK', '성시경');
INSERT INTO clusterTbl VALUES('LJB', '임재범');
INSERT INTO clusterTbl VALUES('YJS', '윤종신');
INSERT INTO clusterTbl VALUES('EJW', '은지원');
INSERT INTO clusterTbl VALUES('JKW', '조관우');
INSERT INTO clusterTbl VALUES('BBK', '바비킴');

SELECT * FROM clusterTbl;

ALTER TABLE clusterTbl
	ADD CONSTRAINT PK_clusterTbl_userID
		PRIMARY KEY (userID);

SELECT * FROM clusterTbl;

CREATE DATABASE IF NOT EXISTS testDB;
USE testDB;
DROP TABLE IF EXISTS secondaryTbl;
CREATE TABLE secondaryTbl
( userID  char(8),
  name    varchar(10)
);
INSERT INTO secondaryTbl VALUES('LSG', '이승기');
INSERT INTO secondaryTbl VALUES('KBS', '김범수');
INSERT INTO secondaryTbl VALUES('KKH', '김경호');
INSERT INTO secondaryTbl VALUES('JYP', '조용필');
INSERT INTO secondaryTbl VALUES('SSK', '성시경');
INSERT INTO secondaryTbl VALUES('LJB', '임재범');
INSERT INTO secondaryTbl VALUES('YJS', '윤종신');
INSERT INTO secondaryTbl VALUES('EJW', '은지원');
INSERT INTO secondaryTbl VALUES('JKW', '조관우');
INSERT INTO secondaryTbl VALUES('BBK', '바비킴');

ALTER TABLE secondaryTbl
	ADD CONSTRAINT UK_secondaryTbl_userID
		UNIQUE (userID);

SELECT * FROM secondaryTbl;

INSERT INTO clusterTbl VALUES('FNT', '푸니타');
INSERT INTO clusterTbl VALUES('KAI', '카아이');

INSERT INTO secondaryTbl VALUES('FNT', '푸니타');
INSERT INTO secondaryTbl VALUES('KAI', '카아이');

-- <실습 2> --

CREATE DATABASE IF NOT EXISTS testDB;
USE testDB;
DROP TABLE IF EXISTS mixedTbl;
CREATE TABLE mixedTbl
( userID  char(8) NOT NULL ,
  name    varchar(10) NOT NULL,
  addr     nchar(2)
);
INSERT INTO mixedTbl VALUES('LSG', '이승기', '서울');
INSERT INTO mixedTbl VALUES('KBS', '김범수', '경남');
INSERT INTO mixedTbl VALUES('KKH', '김경호', '전남');
INSERT INTO mixedTbl VALUES('JYP', '조용필',  '경기');
INSERT INTO mixedTbl VALUES('SSK', '성시경', '서울');
INSERT INTO mixedTbl VALUES('LJB', '임재범',  '서울');
INSERT INTO mixedTbl VALUES('YJS', '윤종신',  '경남');
INSERT INTO mixedTbl VALUES('EJW', '은지원', '경북');
INSERT INTO mixedTbl VALUES('JKW', '조관우', '경기');
INSERT INTO mixedTbl VALUES('BBK', '바비킴',  '서울');

ALTER TABLE mixedTbl
	ADD CONSTRAINT PK_mixedTbl_userID
		PRIMARY KEY (userID);

ALTER TABLE mixedTbl
	ADD CONSTRAINT UK_mixedTbl_name
		UNIQUE (name) ;

SHOW INDEX FROM mixedTbl;

SELECT addr FROM mixedTbl WHERE name = '임재범';

-- </실습 2> --



-- <실습 3> --

USE sqlDB;
SELECT * FROM userTbl;

USE sqlDB;
SHOW INDEX FROM userTbl;

SHOW TABLE STATUS LIKE 'userTbl';

CREATE INDEX idx_userTbl_addr 
   ON userTbl (addr);

ANALYZE TABLE userTbl;
SHOW TABLE STATUS LIKE 'userTbl';

CREATE UNIQUE INDEX idx_userTbl_birtyYear
	ON userTbl (birthYear);

CREATE UNIQUE INDEX idx_userTbl_name
	ON userTbl (name);

INSERT INTO userTbl VALUES('GPS', '김범수', 1983, '미국', NULL  , NULL  , 162, NULL);

CREATE INDEX idx_userTbl_name_birthYear
	ON userTbl (name,birthYear);
DROP INDEX idx_userTbl_name ON userTbl;

SELECT * FROM userTbl WHERE name = '윤종신' and birthYear = '1969';

CREATE INDEX idx_userTbl_mobile1
	ON userTbl (mobile1);

SELECT * FROM userTbl WHERE mobile1 = '011';

DROP INDEX idx_userTbl_addr ON userTbl;
DROP INDEX idx_userTbl_name_birthYear ON userTbl;
DROP INDEX idx_userTbl_mobile1 ON userTbl;

ALTER TABLE userTbl DROP INDEX idx_userTbl_addr;
ALTER TABLE userTbl DROP INDEX idx_userTbl_name_birthYear;
ALTER TABLE userTbl DROP INDEX idx_userTbl_mobile1;

ALTER TABLE userTbl DROP PRIMARY KEY;

SELECT table_name, constraint_name
    FROM information_schema.referential_constraints
    WHERE constraint_schema = 'sqlDB';

ALTER TABLE buyTbl DROP FOREIGN KEY buytbl_ibfk_1;
ALTER TABLE userTbl DROP PRIMARY KEY;

-- </실습 3> --



-- <실습 4> --

CREATE DATABASE IF NOT EXISTS indexDB;

USE indexDB;
SELECT COUNT(*) FROM employees.employees;

CREATE TABLE Emp SELECT * FROM employees.employees ORDER BY RAND();
CREATE TABLE Emp_C SELECT * FROM employees.employees ORDER BY RAND();
CREATE TABLE Emp_Se SELECT * FROM employees.employees ORDER BY RAND();

SELECT * FROM Emp LIMIT 5;
SELECT * FROM Emp_C LIMIT 5;
SELECT * FROM Emp_Se LIMIT 5;

SHOW TABLE STATUS;

ALTER TABLE Emp_C ADD PRIMARY KEY(emp_no);
ALTER TABLE Emp_Se ADD INDEX idx_emp_no (emp_no);

SELECT * FROM Emp LIMIT 5;
SELECT * FROM Emp_C LIMIT 5;
SELECT * FROM Emp_Se LIMIT 5;

ANALYZE TABLE Emp, Emp_c, Emp_Se;

SHOW INDEX FROM Emp;
SHOW INDEX FROM Emp_C;
SHOW INDEX FROM Emp_Se;
SHOW TABLE STATUS;

/*
NET STOP MySQL
NET START MySQL
*/

USE indexDB;

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM Emp WHERE emp_no = 100000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후에 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM Emp_C WHERE emp_no = 100000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM Emp_Se WHERE emp_no = 100000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM Emp WHERE emp_no < 11000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM Emp_C WHERE emp_no < 11000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM Emp_C WHERE emp_no < 500000 LIMIT 1000000; -- 전체 데이터를 읽음
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; 
SELECT * FROM Emp_C IGNORE INDEX(PRIMARY) WHERE emp_no < 500000 LIMIT 1000000; 
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read';

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; 
SELECT * FROM Emp_C LIMIT 1000000; -- 전체 데이터를 읽음
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; 

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM Emp_Se WHERE emp_no < 11000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM Emp_Se IGNORE INDEX(idx_emp_no) WHERE emp_no < 11000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM Emp_Se  WHERE emp_no < 400000 LIMIT 500000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SELECT * FROM Emp_Se  WHERE emp_no < 70000 LIMIT 500000;

SELECT * FROM Emp_C WHERE emp_no = 100000;

SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 전의 읽은 페이지 수
SELECT * FROM Emp_C WHERE emp_no*1 = 100000;
SHOW GLOBAL STATUS LIKE 'Innodb_pages_read'; -- 쿼리 실행 후의 읽은 페이지 수

SELECT * FROM Emp_C WHERE emp_no = 100000 / 1 ;

ALTER TABLE Emp ADD INDEX idx_gender (gender);
ANALYZE TABLE Emp; -- 생성한 인덱스를 통계에 적용시킴
SHOW INDEX FROM Emp;

SELECT * FROM Emp WHERE gender = 'M' LIMIT 500000;

SELECT * FROM Emp IGNORE INDEX (idx_gender) WHERE gender = 'M' LIMIT 500000;

-- </실습 4> --

SELECT name, birthYear, addr FROM userTbl WHERE userID = 'KKH';

CREATE TABLE userTbl 
( userID  char(8) NOT NULL PRIMARY KEY, 
  name    varchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL 
);

CREATE TABLE userTbl 
( userID  char(8) NULL UNIQUE , 
  name    varchar(10) NOT NULL, 
  birthYear   int NOT NULL,  
  addr	  char(2) NOT NULL,
  mobile1	char(3) NULL, 
  mobile2   char(8) NULL, 
  height    smallint NULL, 
  mDate    date NULL 
);
