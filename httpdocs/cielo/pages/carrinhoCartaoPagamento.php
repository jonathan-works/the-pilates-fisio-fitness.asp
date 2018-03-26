<?php 
	require "../includes/include.php";
	
$serverName = "177.66.168.199"; //serverName\instanceName
//$connectionInfo = array( "Database"=>"ThePilates_", "UID"=>"junior", "PWD"=>"wsws8443");

$conexao = mssql_connect($serverName, 'junior', 'wsws8443'); 




//$conexao = mssql_connect( $serverName, $connectionInfo) 
if( $conexao === false ) {
    	die( print_r( mssql_get_last_message(), true));
}	

$retorno_operacao = 0;

if( $conexao ) {
	
	//Select DB 
	$dbn = 'ThePilates_'; 
	if ( mssql_select_db($dbn, $conexao) == false) {
		die( print_r( mssql_get_last_message(), true)); 
	} 
	
	
	//voltar e tirar o GET
	$id = $_POST['id'];
	/*$id =  $_GET['id'];*/
	
	//$sql = "select valor_total,valor_frete_total,cod_usuario,valor_desconto From Venda where cod_venda =  $id ";
	//$resultado = sqlsrv_query($conexao, $sql);
	//if( $resultado === false ) {
    //	die( print_r( sqlsrv_errors(), true));
	//}	
		
	//if(sqlsrv_fetch($resultado) === false) {
    // die( print_r( sqlsrv_errors(), true));
	//}
	
	//$valor_frete = //sqlsrv_get_field($resultado, 1);
	$cod_usuario = 1;//sqlsrv_get_field($resultado, 2);
	//$valor_desconto = //sqlsrv_get_field($resultado, 3);
	
	
	//voltar depois e apagar as abaixo
	$mes_cartao = $_POST['mes_cartao'];
	$ano_cartao = $_POST['ano_cartao'];
	$codigo_cartao = $_POST['codigo_cartao'];
	$numero_cartao = $_POST['numero_cartao'];
	$codigoBandeira = $_POST['forma_pagamento'];
    $formaPagamento = $_POST['parcela'];
	$nome_cartao = $_POST['nome_cartao'];
	
	if ($formaPagamento == "1")
	{
		$valor_total = 1800.00*85/100; //sqlsrv_get_field($resultado, 0);
	}
	else
	{
		$valor_total = 1800.00; //sqlsrv_get_field($resultado, 0);
	}
	
	$valor_total = 1;
	
	/*
	print($valor_total);
	print("<br>");
	print($formaPagamento);
	exit();
	*/
	
	/*/apagar
	$mes_cartao = "08";
	$ano_cartao = "2015";
	$codigo_cartao = "973";
	$numero_cartao = "4551870000000183";
	$codigoBandeira = "visa";
    $formaPagamento = "1";
	$nome_cartao = "Cristiano Morozino";
	/*/
	
	$total_compra = $valor_total;
	//$total_compra = 100.00;
	$total_compra = number_format($total_compra, 2);
	$total_compra = str_replace(".","",$total_compra);
	$total_compra = str_replace(",","",$total_compra);
	
    $tentarAutenticar = "nao";
    $validade = "20" . $ano_cartao . $mes_cartao;
    $tipoParcelamento = "2";
    $capturarAutomaticamente = "true";
    $indicadorAutorizacao = "3";
	
	$Pedido = new Pedido();
	
	// Lê dados do $_POST
	$Pedido->formaPagamentoBandeira = $codigoBandeira; 
	if($formaPagamento != "A" && $formaPagamento != "1")
	{
		$Pedido->formaPagamentoProduto = $tipoParcelamento;
		$Pedido->formaPagamentoParcelas = $formaPagamento;
	} 
	else 
	{
		$Pedido->formaPagamentoProduto = $formaPagamento;
		$Pedido->formaPagamentoParcelas = 1;
	}
	
	$Pedido->dadosEcNumero = LOJA;
	$Pedido->dadosEcChave = LOJA_CHAVE;
	
	$Pedido->capturar = $capturarAutomaticamente;	
	$Pedido->autorizar = $indicadorAutorizacao;
	
	
	$Pedido->dadosPortadorNumero = $numero_cartao;
	$Pedido->dadosPortadorVal = $validade;
	// Verifica se Código de Segurança foi informado e ajusta o indicador corretamente
	if ($codigo_cartao == null || $codigo_cartao == "")
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
	$Pedido->dadosPortadorCodSeg = $codigo_cartao;
	
	$Pedido->dadosPedidoNumero = $id; 
	$Pedido->dadosPedidoValor = $total_compra;
	
	$Pedido->urlRetorno = ReturnURL();
	
	

	// ENVIA REQUISIÇÃO SITE CIELO
	if($tentarAutenticar == "sim") // TRANSAÇÃO
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

	$tid = $objResposta->tid;
	$pan = $objResposta->pan;
	$status = $objResposta->status;
	
	$urlAutenticacao = "url-autenticacao";
	$Pedido->urlAutenticacao = $objResposta->$urlAutenticacao;
	
	// Serializa Pedido e guarda na SESSION
	$StrPedido = $Pedido->ToString();
	$_SESSION["pedidos"]->append($StrPedido);
	
	
	if($tentarAutenticar == "sim") // TRANSAÇÃO
	{
		echo '<script type="text/javascript">
				window.location.href = "' . $Pedido->urlAutenticacao . '"
			 </script>';
		
		//	("teste6666:");
		//exit();
	}
	else // AUTORIZAÇÃO DIRETA 
	{
		
		
		
		
		$tid=$Pedido->tid;
		$pan = $Pedido->pan;
		$status = $Pedido->status;
		$valor_autorizacao = $Pedido->dadosPedidoValor;
		$produto = $Pedido->formaPagamentoProduto;
		$mensagem_status = $Pedido->getStatus();
		
		
		
		$sql = " INSERT INTO [dbo].[Transacao_Cielo]
          ([Cod_Inscricao],[TID],[PAN],[Valor],[Bandeira],[Produto],[Parcela],[Status],[Mensagem_status])
    		VALUES
          ($id,'$tid','$pan','$total_compra','$codigoBandeira','$produto','$formaPagamento','$status','$mensagem_status')";
        
		$stmt = mssql_query( $sql, $conexao);
		if( $stmt == false ) {
			 die( print_r( sqlsrv_errors(), true));
		} 
			
		
		if($Pedido->status == '4' || $Pedido->status == '6'){
			
			$retorno_operacao = 1;
			$sql = " PROC_EfetuarPagamento $id, 0 ";
			//$params = array($id,0);
			$stmt = mssql_query($sql, $conexao);
			if( $stmt === false ) {
				 die( print_r( mssql_get_last_message(), true));
			} 
			//executa url para disparar o cupom
			$ch = curl_init("http://www.pilatesfisiofitness.com.br/compra-concluida.asp?id=$id");
			curl_exec($ch);
		}
		else
		{
			$retorno_operacao = 0;			
		}
	}
	
		
}
?>
<input type="hidden" name="retorno_compra" id="retorno_compra" value="<? echo $status ?>" />