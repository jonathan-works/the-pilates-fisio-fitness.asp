<?php 
	require "../includes/include.php";

$serverName = "187.45.208.84"; //serverName\instanceName
$connectionInfo = array( "Database"=>"click_oficial_bd", "UID"=>"click_oficial_bd", "PWD"=>"clik777@@@3");
$conexao = sqlsrv_connect( $serverName, $connectionInfo);

$retorno_operacao = 0;

if( $conexao ) {
	
	/*voltar
	$id =  $_GET['id'];
	*/
	$id =  "339185";
	
	$sql = "select valor_total,valor_frete,cod_usuario From Venda_Oferta where cod_vendaoferta = $id ";
	$resultado = sqlsrv_query($conexao, $sql);
	if( $resultado === false ) {
    	die( print_r( sqlsrv_errors(), true));
	}	
		
	if(sqlsrv_fetch($resultado) === false) {
     die( print_r( sqlsrv_errors(), true));
	}
	$valor_total = sqlsrv_get_field($resultado, 0);
	$valor_frete = sqlsrv_get_field($resultado, 1);
	$cod_usuario = sqlsrv_get_field($resultado, 2);
	
	$sql = " PROC_EfetivarCompra ?, ?, ? ";
	$params = array($cod_usuario,$id,0);
	$stmt = sqlsrv_query( $conexao, $sql, $params);
	if( $stmt === false ) {
		 die( print_r( sqlsrv_errors(), true));
	} 
	
	/* voltar depois e apagar as abaixo
	$mes_cartao = $_POST("mes_cartao");
	$ano_cartao = $_POST("ano_cartao");
	$codigo_cartao = $_POST("codigo_cartao");
	$numero_cartao = $_POST("numero_cartao");
	$codigoBandeira = $_POST["forma_pagamento"];
    $formaPagamento = $_POST["parcela"];
	*/
	
	/*apagar*/
	$mes_cartao = "08";
	$ano_cartao = "2015";
	$codigo_cartao = "973";
	$numero_cartao = "4551870000000183";
	$codigoBandeira = "visa";
    $formaPagamento = "1";
	/*apagar*/
	
	$total_compra = $valor_total + $valor_frete;
	$total_compra = number_format($total_compra, 2);
	$total_compra = str_replace(".","",$total_compra);
	
    $tentarAutenticar = "nao";
    $validade = $ano_cartao . $mes_cartao;
    $tipoParcelamento = "1";
    $capturarAutomaticamente = "true";
    $indicadorAutorizacao = "3";
	/*******************************************************/
	
	
	$Pedido = new Pedido();
	
	// Lê dados do $_POST
	$Pedido->formaPagamentoBandeira = $_POST["codigoBandeira"]; 
	if($_POST["formaPagamento"] != "A" && $_POST["formaPagamento"] != "1")
	{
		$Pedido->formaPagamentoProduto = $_POST["tipoParcelamento"];
		$Pedido->formaPagamentoParcelas = $_POST["formaPagamento"];
	} 
	else 
	{
		$Pedido->formaPagamentoProduto = $_POST["formaPagamento"];
		$Pedido->formaPagamentoParcelas = 1;
	}
	
	$Pedido->dadosEcNumero = LOJA;
	$Pedido->dadosEcChave = LOJA_CHAVE;
	
	$Pedido->capturar = $_POST["capturarAutomaticamente"];	
	$Pedido->autorizar = $_POST["indicadorAutorizacao"];
	
	
	$Pedido->dadosPortadorNumero = $_POST["cartaoNumero"];
	$Pedido->dadosPortadorVal = $_POST["cartaoValidade"];
	// Verifica se Código de Segurança foi informado e ajusta o indicador corretamente
	if ($_POST["cartaoCodigoSeguranca"] == null || $_POST["cartaoCodigoSeguranca"] == "")
	{
		$Pedido->dadosPortadorInd = "0";
	}
	else if ($Pedido->formaPagamentoBandeira == "mastercard")
	{
		$Pedido->dadosPortadorInd = "1";
	}
	else 
	{
		$Pedido->dadosPortadorInd = "1";
	}
	$Pedido->dadosPortadorCodSeg = $_POST["cartaoCodigoSeguranca"];
	
	$Pedido->dadosPedidoNumero = rand(1000000, 9999999); 
	$Pedido->dadosPedidoValor = $total_compra;
	
	$Pedido->urlRetorno = ReturnURL();

	// ENVIA REQUISIÇÃO SITE CIELO
	if($_POST["tentarAutenticar"] == "sim") // TRANSAÇÃO
	{
		$objResposta = $Pedido->RequisicaoTransacao(true);
	}
	else // AUTORIZAÇÃO DIRETA 
	{
		$objResposta = $Pedido->RequisicaoTid();
		
		$Pedido->tid = $objResposta->tid;
		$Pedido->pan = $objResposta->pan;
		$Pedido->status = $objResposta->status;
		
		$objResposta = $Pedido->RequisicaoAutorizacaoPortador();
	}
		
	$Pedido->tid = $objResposta->tid;
	$Pedido->pan = $objResposta->pan;
	$Pedido->status = $objResposta->status;
	
	$urlAutenticacao = "url-autenticacao";
	$Pedido->urlAutenticacao = $objResposta->$urlAutenticacao;
	
	// Serializa Pedido e guarda na SESSION
	$StrPedido = $Pedido->ToString();
	$_SESSION["pedidos"]->append($StrPedido);
	
	
	if($_POST["tentarAutenticar"] == "sim") // TRANSAÇÃO
	{
		echo '<script type="text/javascript">
				window.location.href = "' . $Pedido->urlAutenticacao . '"
			 </script>';
	}
	else // AUTORIZAÇÃO DIRETA 
	{
		
		echo($Pedido->status);
		exit();
				
		if($Pedido->status == '4' || $Pedido->status == '6')
			$finalizacao = true;
		else
			$finalizacao = false;
			
			echo $finalizacao ? "sim" : "não";
			echo "<br>";
			echo $Pedido->getStatus();
		}
}
?>
