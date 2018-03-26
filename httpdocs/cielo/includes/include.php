<?php

require 'errorHandling.php';
require_once 'pedido.php';
require_once 'logger.php';

set_time_limit(400);

define('VERSAO', "1.1.0");

session_start();

if(!isset($_SESSION["pedidos"]))
{
	$_SESSION["pedidos"] = new ArrayObject();
}

// CONSTANTES
//define("ENDERECO_BASE", "https://qasecommerce.cielo.com.br");
define("ENDERECO_BASE", "https://ecommerce.cielo.com.br"); //URL DE PRODUCAO
define("ENDERECO", ENDERECO_BASE."/servicos/ecommwsec.do");

define("LOJA", "1073685079");
define("LOJA_CHAVE", "771c886add1cebe606e344f31afb5b70006145c63b0db080f0d269972a093f54"); //chave passada pela cielo


// Envia requisiчуo
function httprequest($paEndereco, $paPost){

	$sessao_curl = curl_init();
	curl_setopt($sessao_curl, CURLOPT_URL, $paEndereco);
	
	curl_setopt($sessao_curl, CURLOPT_FAILONERROR, true);

	//  CURLOPT_SSL_VERIFYPEER
	//  verifica a validade do certificado
	curl_setopt($sessao_curl, CURLOPT_SSL_VERIFYPEER, true);
	//  CURLOPPT_SSL_VERIFYHOST
	//  verifica se a identidade do servidor bate com aquela informada no certificado
	curl_setopt($sessao_curl, CURLOPT_SSL_VERIFYHOST, 2);

	//  CURLOPT_SSL_CAINFO
	//  informa a localizaчуo do certificado para verificaчуo com o peer
	curl_setopt($sessao_curl, CURLOPT_CAINFO, getcwd() .
			"/ssl/VeriSignClass3PublicPrimaryCertificationAuthority-G5.crt");
	//curl_setopt($sessao_curl, CURLOPT_SSLVERSION, 3);
	curl_setopt($sessao_curl, CURLOPT_SSLVERSION, 4);
	//  CURLOPT_CONNECTTIMEOUT
	//  o tempo em segundos de espera para obter uma conexуo
	curl_setopt($sessao_curl, CURLOPT_CONNECTTIMEOUT, 10);

	//  CURLOPT_TIMEOUT
	//  o tempo mсximo em segundos de espera para a execuчуo da requisiчуo (curl_exec)
	curl_setopt($sessao_curl, CURLOPT_TIMEOUT, 40);

	//  CURLOPT_RETURNTRANSFER
	//  TRUE para curl_exec retornar uma string de resultado em caso de sucesso, ao
	//  invщs de imprimir o resultado na tela. Retorna FALSE se hс problemas na requisiчуo
	curl_setopt($sessao_curl, CURLOPT_RETURNTRANSFER, true);

	curl_setopt($sessao_curl, CURLOPT_POST, true);
	curl_setopt($sessao_curl, CURLOPT_POSTFIELDS, $paPost );

	$resultado = curl_exec($sessao_curl);
	
	if ($resultado)
	{
		return $resultado;
	}
	else
	{
		return curl_error($sessao_curl);
	}
	
	curl_close($sessao_curl);
}

// Monta URL de retorno
function ReturnURL()
{
	$pageURL = 'http';

	if ($_SERVER["SERVER_PORT"] == 443) // protocolo https
	{
		$pageURL .= 's';
	}
	$pageURL .= "://";
	if ($_SERVER["SERVER_PORT"] != "80")
	{
		$pageURL .= $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"].$_SERVER["REQUEST_URI"];
	} else {
		$pageURL .= $_SERVER["SERVER_NAME"]. substr($_SERVER["REQUEST_URI"], 0);
	}
	// ALTERNATIVA PARA SERVER_NAME -> HOST_HTTP

	$file = substr($_SERVER["SCRIPT_NAME"],strrpos($_SERVER["SCRIPT_NAME"],"/")+1);

	$ReturnURL = str_replace($file, "retorno.php", $pageURL);

	return $ReturnURL;
}

?>