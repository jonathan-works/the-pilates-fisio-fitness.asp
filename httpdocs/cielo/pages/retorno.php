<?php
	
	require '../includes/include.php';
	
	// Resgata �ltimo pedido feito da SESSION
	$ultimoPedido = $_SESSION["pedidos"]->count();
	
	print($ultimoPedido);
	exit();
	
	$ultimoPedido -= 1;
	
	$Pedido = new Pedido();
	$Pedido->FromString($_SESSION["pedidos"]->offsetGet($ultimoPedido));
	
	// Consulta situa��o da transa��o
	$objResposta = $Pedido->RequisicaoConsulta();
	
	// Atualiza status
	$Pedido->status = $objResposta->status;
	
	if($Pedido->status == '4' || $Pedido->status == '6')
		$finalizacao = true;
	else
		$finalizacao = false;
	
	// Atualiza Pedido da SESSION
	$StrPedido = $Pedido->ToString();
	$_SESSION["pedidos"]->offsetSet($ultimoPedido, $StrPedido);
?>
<html>
	<head>
		<title>Loja Exemplo : Fechamento pedido</title>
	</head>
	<body>
	<center>
		<h3>Fechamento (<?php echo date("D M d H:i:s T Y")?>)</h3>
		<table border="1">
			<tr>
				<th>N�mero pedido</th>
				<th>Finalizado com sucesso?</th>
				<th>Transa��o</th>
				<th>Status transa��o</th>
			</tr>
			<tr>
				<td><?php echo $Pedido->dadosPedidoNumero; ?></td>
				<td><?php echo $finalizacao ? "sim" : "n�o"; ?></td>
				<td><?php echo $Pedido->tid; ?></td>
				<td style="color: red;"><?php echo $Pedido->getStatus(); ?></td>
			</tr>			
		</table>				
		<h3>XML</h3>
		<textarea name="xmlRetorno" cols="80" rows="25" readonly>
<?php echo htmlentities($objResposta->asXML()); ?>
		</textarea>
		
		<p><a href="index.php">Menu</a></p>
		<p><a href="pedidos.php">Pedidos</a></p>
	</center>
	
	</body>
</html>