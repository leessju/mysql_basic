
/* 02장 */


-- <실습 1> --

-- </실습 1> --



-- <실습 2> --

/*
CD \employees 

mysql -u root -p 

source employees.sql ;

show databases ;

*/

-- </실습 2> --



-- <실습 3> --

-- </실습 3> --



-- <실습 4> --

/*
SETX PATH "%PATH%;C:\mysql\bin" 

shutdown -r -t 0 

CD \mysql\bin 

mysqld --initialize 

NOTEPAD c:\mysql\my.cnf 

[mysqld]
explicit_defaults_for_timestamp
skip-grant-tables

mysqld --install MySQL --defaults-file=C:\mysql\my.cnf
NET START MySQL

mysql  -u  root  

use mysql;
update USER set authentication_string=password('1234') where user='root';
flush privileges;
alter user 'root'@'localhost' identified by '1234';
exit

mysql -u root -p 

exit

NET STOP MySQL
mysqld --remove MySQL

*/

-- </실습 4> --