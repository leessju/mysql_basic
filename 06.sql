
/* 06장 */

USE employees;

USE mysql;
SELECT * FROM employees;

SELECT * FROM titles ;

SELECT * FROM employees.titles;

SELECT * FROM employees.titles;
SELECT * FROM titles;

SELECT first_name FROM employees;

SELECT first_name, last_name, gender FROM employees;

-- 한줄 주석 연습
SELECT first_name, last_name, gender -- 이름과 성별 열을 가져옴
FROM employees;

/* 블록 주석 연습
SELECT first_name, last_name, gender
FROM employees;
*/



-- <실습 1> --

SHOW DATABASES;

USE employees;

SHOW TABLE STATUS;

SHOW TABLES; 

DESCRIBE employees; -- 또는 DESC employees;

SELECT first_name, gender FROM employees;

-- </실습 1> --


SELECT first_name AS 이름 , gender 성별, hire_date '회사 입사일'
FROM employees;


-- <실습 2> --

DROP DATABASE IF EXISTS sqlDB; -- 만약 sqlDB가 존재하면 우선 삭제한다.
CREATE DATABASE sqlDB;

USE sqlDB;
CREATE TABLE userTbl -- 회원 테이블
( userID  	CHAR(8) NOT NULL PRIMARY KEY, -- 사용자 아이디(PK)
  name    	VARCHAR(10) NOT NULL, -- 이름
  birthYear   INT NOT NULL,  -- 출생년도
  addr	  	CHAR(2) NOT NULL, -- 지역(경기,서울,경남 식으로 2글자만입력)
  mobile1	CHAR(3), -- 휴대폰의 국번(011, 016, 017, 018, 019, 010 등)
  mobile2	CHAR(8), -- 휴대폰의 나머지 전화번호(하이픈제외)
  height    	SMALLINT,  -- 키
  mDate    	DATE  -- 회원 가입일
);
CREATE TABLE buyTbl -- 회원 구매 테이블
(  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
   userID  	CHAR(8) NOT NULL, -- 아이디(FK)
   prodName 	CHAR(6) NOT NULL, --  물품명
   groupName 	CHAR(4)  , -- 분류
   price     	INT  NOT NULL, -- 단가
   amount    	SMALLINT  NOT NULL, -- 수량
   FOREIGN KEY (userID) REFERENCES userTbl(userID)
);

INSERT INTO userTbl VALUES('LSG', '이승기', 1987, '서울', '011', '1111111', 182, '2008-8-8');
INSERT INTO userTbl VALUES('KBS', '김범수', 1979, '경남', '011', '2222222', 173, '2012-4-4');
INSERT INTO userTbl VALUES('KKH', '김경호', 1971, '전남', '019', '3333333', 177, '2007-7-7');
INSERT INTO userTbl VALUES('JYP', '조용필', 1950, '경기', '011', '4444444', 166, '2009-4-4');
INSERT INTO userTbl VALUES('SSK', '성시경', 1979, '서울', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO userTbl VALUES('LJB', '임재범', 1963, '서울', '016', '6666666', 182, '2009-9-9');
INSERT INTO userTbl VALUES('YJS', '윤종신', 1969, '경남', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO userTbl VALUES('EJW', '은지원', 1972, '경북', '011', '8888888', 174, '2014-3-3');
INSERT INTO userTbl VALUES('JKW', '조관우', 1965, '경기', '018', '9999999', 172, '2010-10-10');
INSERT INTO userTbl VALUES('BBK', '바비킴', 1973, '서울', '010', '0000000', 176, '2013-5-5');
INSERT INTO buyTbl VALUES(NULL, 'KBS', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '노트북', '전자', 1000, 1);
INSERT INTO buyTbl VALUES(NULL, 'JYP', '모니터', '전자', 200,  1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '모니터', '전자', 200,  5);
INSERT INTO buyTbl VALUES(NULL, 'KBS', '청바지', '의류', 50,   3);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '메모리', '전자', 80,  10);
INSERT INTO buyTbl VALUES(NULL, 'SSK', '책'    , '서적', 15,   5);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '청바지', '의류', 50,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);
INSERT INTO buyTbl VALUES(NULL, 'EJW', '책'    , '서적', 15,   1);
INSERT INTO buyTbl VALUES(NULL, 'BBK', '운동화', NULL   , 30,   2);

SELECT * FROM userTbl;
SELECT * FROM buyTbl;

/*
source C:\SQL\sqlDB.sql
exit
*/

-- </실습 2> --


USE  sqlDB;
SELECT * FROM userTbl;

SELECT * FROM userTbl WHERE name = '김경호';

SELECT userID, Name FROM userTbl WHERE birthYear >= 1970 AND height >= 182;

SELECT userID, Name FROM userTbl WHERE birthYear >= 1970 OR height >= 182;

SELECT Name, height FROM userTbl WHERE height >= 180 AND height <= 183;

SELECT Name, height FROM userTbl WHERE height BETWEEN 180 AND 183;

SELECT Name, addr FROM userTbl WHERE addr='경남' OR  addr='전남' OR addr='경북';

SELECT Name, addr FROM userTbl WHERE addr IN ('경남','전남','경북');

SELECT Name, height FROM userTbl WHERE name LIKE '김%';

SELECT Name, height FROM userTbl WHERE name LIKE '_종신';

SELECT Name, height FROM userTBL WHERE height  > 177;

SELECT Name, height FROM userTbl 
   WHERE height > (SELECT height FROM userTbl WHERE Name = '김경호');

SELECT Name, height FROM userTbl 
   WHERE height >= (SELECT height FROM userTbl WHERE addr = '경남');

SELECT Name, height FROM userTbl 
   WHERE height >= ANY (SELECT height FROM userTbl WHERE addr = '경남');

SELECT Name, height FROM userTbl 
   WHERE height = ANY (SELECT height FROM userTbl WHERE addr = '경남');

SELECT Name, height FROM userTbl 
  WHERE height IN (SELECT height FROM userTbl WHERE addr = '경남');

SELECT Name, mDate FROM userTbl ORDER BY mDate;

SELECT Name, mDate FROM userTbl ORDER BY mDate DESC;

SELECT Name, height FROM userTbl ORDER BY height DESC, name ASC;

SELECT addr FROM userTbl;

SELECT addr FROM userTbl ORDER BY addr;

SELECT DISTINCT addr FROM userTbl;

USE employees;
SELECT emp_no, hire_date FROM employees 
   ORDER BY hire_date ASC;

USE employees;
SELECT emp_no, hire_date FROM employees 
   ORDER BY hire_date ASC;

SELECT emp_no, hire_date FROM employees 
   ORDER BY hire_date ASC
   LIMIT 0, 5;  -- LIMIT 5 OFFSET 0 과 동일

USE sqlDB;
CREATE TABLE buyTbl2 (SELECT * FROM buyTbl);
SELECT * FROM buyTbl2;

CREATE TABLE buyTbl3 (SELECT userID, prodName FROM buyTbl);
SELECT * FROM buyTbl3;

CREATE TABLE buyTbl3 (SELECT userID, prodName FROM buyTbl);
SELECT * FROM buyTbl3;

SELECT userID, SUM(amount) FROM buyTbl GROUP BY userID;

SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수'  
   FROM buyTbl GROUP BY userID;

SELECT userID AS '사용자 아이디', SUM(price*amount) AS '총 구매액'  
   FROM buyTbl GROUP BY userID;

USE sqlDB;
SELECT AVG(amount) AS '평균 구매 개수' FROM buyTbl ;

SELECT userID, AVG(amount) AS '평균 구매 개수' FROM buyTbl  GROUP BY userID;

SELECT Name, MAX(height), MIN(height) FROM userTbl;

SELECT Name, MAX(height), MIN(height) FROM userTbl GROUP BY Name;

SELECT Name, height
   FROM userTbl 
   WHERE height = (SELECT MAX(height)FROM userTbl) 
       OR height = (SELECT MIN(height)FROM userTbl) ;

SELECT COUNT(*) FROM userTbl;

SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자' FROM userTbl;

USE sqlDB;
SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buyTbl 
   GROUP BY userID ;

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buyTbl 
   WHERE SUM(price*amount) > 1000 
   GROUP BY userID ;

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buyTbl 
   GROUP BY userID
   HAVING SUM(price*amount) > 1000 ;

SELECT userID AS '사용자', SUM(price*amount) AS '총구매액'  
   FROM buyTbl 
   GROUP BY userID
   HAVING SUM(price*amount) > 1000 
   ORDER BY SUM(price*amount) ;

SELECT num, groupName, SUM(price * amount) AS '비용' 
   FROM buyTbl
   GROUP BY  groupName, num
   WITH ROLLUP;

SELECT groupName, SUM(price * amount) AS '비용' 
   FROM buyTbl
   GROUP BY  groupName
   WITH ROLLUP;

USE sqlDB;
CREATE TABLE testTbl1 (id  int, userName char(3), age int);
INSERT INTO testTbl1 VALUES (1, '홍길동', 25);

INSERT INTO testTbl1(id, userName) VALUES (2, '설현');

INSERT INTO testTbl1(userName, age, id) VALUES ('초아', 26,  3);

USE  sqlDB;
CREATE TABLE testTbl2 
  (id  int AUTO_INCREMENT PRIMARY KEY, 
   userName char(3), 
   age int );
INSERT INTO testTbl2 VALUES (NULL, '지민', 25);
INSERT INTO testTbl2 VALUES (NULL, '유나', 22);
INSERT INTO testTbl2 VALUES (NULL, '유경', 21);
SELECT * FROM testTbl2;

ALTER TABLE testTbl2 AUTO_INCREMENT=100;
INSERT INTO testTbl2 VALUES (NULL, '찬미', 23);
SELECT * FROM testTbl2;

USE  sqlDB;
CREATE TABLE testTbl3 
  (id  int AUTO_INCREMENT PRIMARY KEY, 
   userName char(3), 
   age int );
ALTER TABLE testTbl3 AUTO_INCREMENT=1000;
SET @@auto_increment_increment=3;
INSERT INTO testTbl3 VALUES (NULL, '나연', 20);
INSERT INTO testTbl3 VALUES (NULL, '정연', 18);
INSERT INTO testTbl3 VALUES (NULL, '모모', 19);
SELECT * FROM testTbl3;

USE sqlDB;
CREATE TABLE testTbl4 (id int, Fname varchar(50), Lname varchar(50));
INSERT INTO testTbl4 
  SELECT emp_no, first_name, last_name
    FROM employees.employees ;

USE sqlDB;
CREATE TABLE testTbl5 
   (SELECT emp_no, first_name, last_name  FROM employees.employees) ;

UPDATE testTbl4
    SET Lname = '없음'
    WHERE Fname = 'Kyichi';

USE sqlDB;
UPDATE buyTbl SET price = price * 1.5 ;

USE sqlDB;
DELETE FROM testTbl4 WHERE Fname = 'Aamer';

USE sqlDB;
DELETE FROM testTbl4 WHERE Fname = 'Aamer'  LIMIT 5;


-- <실습 3> --

USE sqlDB;
SELECT * INTO bigTbl1 FROM employees.employees;
SELECT * INTO bigTbl2 FROM employees.employees;
SELECT * INTO bigTbl3 FROM employees.employees;

DELETE FROM bigTbl1;
DROP TABLE bigTbl2;
TRUNCATE TABLE bigTbl3;

-- </실습 3> --



-- <실습 4> --

USE sqlDB;
CREATE TABLE memberTBL (SELECT userID, name, addr FROM userTbl LIMIT 3); -- 3건만 가져옴
ALTER TABLE memberTBL 
	ADD CONSTRAINT pk_memberTBL PRIMARY KEY (userID); -- PK를 지정함
SELECT * FROM memberTBL;

INSERT INTO memberTBL VALUES('BBK' , '비비코', '미국');
INSERT INTO memberTBL VALUES('SJH' , '서장훈', '서울');
INSERT INTO memberTBL VALUES('HJY' , '현주엽', '경기');
SELECT * FROM memberTBL;

INSERT IGNORE INTO memberTBL VALUES('BBK' , '비비코', '미국');
INSERT IGNORE INTO memberTBL VALUES('SJH' , '서장훈', '서울');
INSERT IGNORE INTO memberTBL VALUES('HJY' , '현주엽', '경기');
SELECT * FROM memberTBL;

INSERT INTO memberTBL VALUES('BBK' , '비비코', '미국')
	ON DUPLICATE KEY UPDATE name='비비코', addr='미국';
INSERT INTO memberTBL VALUES('DJM' , '동짜몽', '일본')
	ON DUPLICATE KEY UPDATE name='동짜몽', addr='일본';
SELECT * FROM memberTBL;

-- </실습 4> --