<%
'Set cripto = Server.CreateObject("Itaucripto.cripto")

dim codEmp, chave, pedido, valor, observacao, nomeSacado, codigoInscricao, enderecoSacado 
dim bairroSacado, cepSacado, cidadeSacado, estadoSacado, dataVencimento, urlRetorna, cripto


'codEmp = "J0123456789012345678901234" 'Coloque aqui o codigo da empresa
codEmp = "J0195476960001070000021414" 'Coloque aqui o codigo da empresa
chave = "P1A2L3M4E5I6R7AS" 'Coloque aqui a chave de criptografia em maiuscula 
pedido = int(session("Sessao_Inscricao"))'obtem o valor do campo "pedido"
valor = Request.Form("valor")'obtém o valor do campo "valor"
valor = valor - (valor * 0.05)
observacao = "1"'obtem o valor do campo "observacao" 
nomeSacado = Request.Form("txt1_Nome")'obtém o valor do campo "nomeSacado"
'codigoInscricao = Request.Form("codigoInscricao")  'obtém o valor do campo "codigoInscricao"
codigoInscricao = "01"  'obtém o valor do campo "codigoInscricao"
numeroInscricao = Request.Form("txt1_Cpf") 'obtém o valor do campo "numeroInscricao"
enderecoSacado = Request.Form("txt1_Endereco")'obtém o valor do campo "enderecoSacado"
bairroSacado = Request.Form("txt1_Bairro")'obtém o valor do campo "bairroSacado"
cepSacado = Request.Form("txt1_Cep")'obtém o valor do campo "cepSacado"
cidadeSacado = Request.Form("txt1_Cidade")'obtém o valor do campo "cidadeSacado"
estadoSacado = Request.Form("txt1_Estado")'obtém o valor do campo "estadoSacado"
'dataVencimento = Request.Form("dataVencimento")'obtém o valor do campo "dataVencimento"
dataVencimento = dateadd("d", 3, date)'obtém o valor do campo "dataVencimento"
dataVencimento = replace(dataVencimento, "/", "")
urlRetorna = "/inscrevase-sucesso.asp"'obtém o valor do campo "urlRetorna"
obsAdicional1 = "Não receber após data de nascimento"'obtém o valor do campo "obsAdicional1"
obsAdicional2 = Request.Form("obsAdicional2")'obtém o valor do campo "obsAdicional2"
obsAdicional3 = Request.Form("obsAdicional3")  'obtém o valor do campo "obsAdicional3

Set cripto = server.createobject("Itaucripto.cripto")
dados = cripto.geraDados(codEmp, pedido, valor, observacao, chave, nomeSacado, codigoInscricao, numeroInscricao, enderecoSacado, bairroSacado, cepSacado, cidadeSacado, estadoSacado, dataVencimento, urlRetorna, obsAdicional1, obsAdicional2, obsAdicional3)
Set cripto = nothing

%>

<FORM ACTION="https://shopline.itau.com.br/shopline/shopline.aspx" method="post" name="form1" onsubmit=carregabrw() target="SHOPLINE">
<INPUT type="hidden" name="DC" value="<%= dados %>"> <BR>
<INPUT type="submit" name="Shopline" value="Imprimir Boleto Itau Shopline">
</form>
<script language="JavaScript"> 
<!--
function carregabrw()
{
window.open('', 'SHOPLINE', 'toolbar=yes,menubar=yes,resizable=yes,status=no,scrollbars=yes,width =815,height=575');
}
//-->
</script>
</BODY> 
</HTML>

<!--<HTML>
<HEAD>
<TITLE>Exemplo de codigo HTML</TITLE>
</HEAD>
<BODY>
<FORM ACTION="https://shopline.itau.com.br/shopline/shopline.aspx" METHOD="Post" NAME="form1"> <CENTER>Entre com os Dados
<TABLE width=100% border=1 align=center>
<TR>
<TD width=25% align=center><B>Pedido (99999999):</B></TD>
<TD><INPUT type="text" maxlength=8 size=8 name="pedido" value=""></TD> </TR>
<TR>
<TD width=25% align=center><B>Valor (99999999,99):</B></TD>
<TD><INPUT type="text" maxlength=10 size=10 name="valor" value=""></TD> </TR>
<TR>
<TD width=25% align=right><B>Observação:</B></TD>
<TD><INPUT type="text" maxlength=40 size=40 name="observacao" value=""></TD>
</TR> <TR>
<TD width=25% align=right><B>Nome do Sacado:</B></TD>
<TD><INPUT type="text" maxlength=30 size=30 name="nomeSacado" value=""></TD> </TR>
<TR>
<TD width=25% align=right><B>Código de Inscrição (01 CPF, 02 CNPJ):</B></TD> <TD><INPUT type="text" maxlength=2 size=2 name="codigoInscricao" value=""></TD>
</TR> <TR>
<TD width=25% align=right><B>Número de Inscrição (CPF, CNPJ):</B></TD>
<TD><INPUT type="text" maxlength=14 size=14 name="numeroInscricao" value=""></TD> </TR>
<TR>
<TD width=25% align=right><B>Endereço do Sacado:</B></TD>
<TD><INPUT type="text" maxlength=40 size=40 name="enderecoSacado" value=""></TD>
</TR> <TR>
<TD width=25% align=right><B>Bairro:</B></TD>
<TD><INPUT type="text" maxlength=15 size=15 name="bairroSacado" value=""></TD> </TR>
<TR>
<TD width=25% align=right><B>CEP (99999999):</B></TD>
<TD><INPUT type="text" maxlength=8 size=8 name="cepSacado" value=""></TD>
</TR> <TR>
<TD width=25% align=right><B>Cidade:</B></TD>
<TD><INPUT type="text" maxlength=15 size=15 name="cidadeSacado" value=""></TD> </TR>
<TR>
<TD width=25% align=right><B>Estado:</B></TD>
<TD><INPUT type="text" maxlength=2 size=2 name="estadoSacado" value=""></TD>
</TR> <TR>
<TD width=25% align=right><B>Data de Vencimento (ddmmaaaa):</B></TD>
<TD><INPUT type="text" maxlength=8 size=8 name="dataVencimento" value=""></TD> </TR>
<TR>
<TD width=25% align=right><B>URL retorna:</B></TD>
<TD><INPUT type="text" maxlength=60 size=60 name="urlRetorna" value=""></TD>
</TR> <TR>
<TD width=25% align=right><B>ObsAdicional1:</B></TD>
<TD><INPUT type="text" maxlength=60 size=60 name="ObsAdicional1" value=""></TD> </TR>
<TR>
<TD width=25% align=right><B>ObsAdicional2:</B></TD>
<TD><INPUT type="text" maxlength=60 size=60 name="ObsAdicional2" value=""></TD>
</TR> <TR>
<TD width=25% align=right><B>ObsAdicional3:</B></TD>
<TD><INPUT type="text" maxlength=60 size=60 name="ObsAdicional3" value=""></TD> </TR>
</TABLE>
</CENTER>
<BR><BR>
<INPUT TYPE="submit" value="Pagar" name="Pagar"> </FORM>
</BODY> </HTML>-->