<%
'Inicializa as variáveis dim dados
dim codEmp
dim chave
dim pedido
dim formato
dim cripto
chave = "ABCD123456ABCD12"
'Coloque aqui sua chave de criptografia em maiúscula
'Inicializa valores
codEmp = "J1234567890123456789012345"
'Coloque aqui seu código de empresa
formato = "1"
'Coloque aqui o tipo de retorno desejado: 0 para HTML ou 1 para XML
'Recebe o pedido
pedido = Request.Form("pedido")
Set cripto = Server.CreateObject("Itaucripto.cripto")
'Realiza a criptografia dos dados
dados = cripto.geraConsulta(codEmp, pedido, formato, chave)
set cripto = nothing %>
<FORM METHOD="POST" ACTION="https://shopline.itau.com.br/shopline/consulta.aspx" id=form1 name=form1>
<INPUT TYPE="hidden" NAME="DC" VALUE="<%= dados %>">
<INPUT TYPE="submit" NAME="Shopline" BORDER="0" VALUE="Consulta ao Pagamento">
</FORM>
<?xml version="1.0" encoding="ISO-8859-1"?> 
<!DOCTYPE consulta [<!ELEMENT consulta (PARAMETER)> <!ELEMENT PARAMETER (PARAM)+> <!ELEMENT PARAM EMPTY> <!ATTLIST PARAM ID CDATA #REQUIRED VALUE CDATA #REQUIRED>]> 
<consulta>
<PARAMETER>
	<PARAM ID="CodEmp"VALUE=""/> 
	<PARAM ID="Pedido"VALUE=""/> 
	<PARAM ID="Valor" VALUE=""/> 
	<PARAM ID="tipPag"VALUE=""/> 
	<PARAM ID="sitPag" VALUE=""/> 
	<PARAM ID="dtPag"VALUE=""/> 
	<PARAM ID="codAut"VALUE=""/> 
	<PARAM ID="numId"VALUE=""/> 
	<PARAM ID="compVend"VALUE=""/>
	<PARAM ID="tipCart"VALUE=""/> 
</PARAMETER>
</consulta>
