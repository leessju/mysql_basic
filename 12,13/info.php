<?php
   $con=mysql_connect("localhost", "root", "") or die("MySQL 접속 실패");
   phpinfo();
   mysql_close($con);
?>
