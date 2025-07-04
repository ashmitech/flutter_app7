<?php 
$host ="localhost";
$user="root";
$password="";
$db_name="news_app";
$conn= new mysqli("$host, $user, $password", $dbname);
//check database connection
if($conn-> connect_error){
    die("Connection failed: ".$conn-> connect_error);
}
?>
