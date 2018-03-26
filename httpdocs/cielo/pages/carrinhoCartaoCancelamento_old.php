<?php 
	require "../includes/include.php";
	
	ini_set('display_errors',1);
	ini_set('display_startup_erros',1);
	error_reporting(E_ALL);
	
$serverName = "177.66.168.199"; //serverName\instanceName
$connectionInfo = array( "Database"=>"pilatesfisio1", "UID"=>"pilatesfisio1", "PWD"=>"wsws8443");
$conexao = sqlsrv_connect( $serverName, $connectionInfo);
if( $conexao === false ) {
    	die( print_r( sqlsrv_errors(), true));
	}	

$retorno_operacao = 0;

if( $conexao ) {
	
	$id =  $_GET['id'];
	$cod_inscricao = $_GET['cod_inscricao'];
	
	$cod_usuario = 1;
	
	
	$Pedido = new Pedido();
	
	
	$Pedido->dadosEcNumero = LOJA;
	$Pedido->dadosEcChave = LOJA_CHAVE;
	
	
	
	$Pedido->tid = $id;
	
	$retorno_cancelamento = $Pedido->RequisicaoCancelamento();
	
	$urlAutenticacao = "url-autenticacao";
	$Pedido->urlAutenticacao = $objResposta->$urlAutenticacao;
	$mensagem_status = $Pedido->getStatus();
	
	$data = $retorno_cancelamento->{'cancelamentos'}->{'cancelamento'}->{'data-hora'};
	
	// Serializa Pedido e guarda na SESSION
	print_r($Pedido);
	$StrPedido = $Pedido->ToString();
	$_SESSION["pedidos"]->append($StrPedido);
	
	$sql = "update Transacao_Cielo set Data_Estorno = '$data' where Cod_Inscricao =  $cod_inscricao";
	$resultado = sqlsrv_query($conexao, $sql);
	if( $resultado === false ) {
    	die( print_r( sqlsrv_errors(), true));
	}	
	
	echo ("<script>alert('Estorno Feito com sucesso.')</script>");
	header("location:lista_inscricao_alt.php");
		
}
?>
