<%
'Inicializa as variáveis
dim dados, codEmp, chave, pedido, tipPag, cripto
chave = "ABCD123456ABCD12" 'Coloque aqui a chave de criptografia em maiúscula
'Recebe valores da página anterior dados = Request.Form("DC")
Set cripto = Server.CreateObject("Itaucripto.cripto")
'Decriptografa os dados chamando o método decripto da classe Itaucripto e recebe os dados
dados = cripto.decripto(dados, chave)
codEmp = cripto.retornaCodEmp()
pedido = cripto.retornaPedido() 
tipPag = cripto.retornaTipPag() %>
<html>
<head>
	<title> Retorno Online </title>
</head> 
<body>
	<h1>Dados recebidos</h1>
	Codigo da empresa: <%= codEmp %><br> 
	Pedido: <%= pedido %><br>
	Tipo de pagamento: <%= tipPag %> <br>
</body> 
</html>