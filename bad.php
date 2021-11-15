<?php
// This is some bad PHP for use within IT-351 Lab 6
$con = mysql_connect("localhost", "username", "password");
if(!$con)
    {
        die(mysql_error());
    }
$db = mysql_select_db("mydb");
if(!$db)
    {
        die(mysql_error());
    }
$query = mysql_query("SELECT * FROM table;");
while($row = mysql_fetch_array($query))
    {
    echo $row['id']."<br />";
    }
?>