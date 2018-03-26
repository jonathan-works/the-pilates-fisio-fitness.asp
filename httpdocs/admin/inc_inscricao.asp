<%
Option Explicit
%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<!--#include file = "div_top.asp"-->
<!--#include file = "include/classe_inscricao.asp"-->
<%
Dim strNomeBotao,codigo,curso,email
Dim Botao,acao,strsql,rs

Botao=request.Form("Botao")
codigo=request("codigo")

curso=request.Form("curso")
email = request.Form("email")

Conecta() 
If Botao = "Incluir" Then
	if email = "" then
			Response.Redirect("inc_inscricao.asp?incok=1&acao=1")
	end if
	strsql = "INSERT INTO inscricao(cod_turma,email) VALUES("&curso&",'"&email&"')"
	cn.EXECUTE(strsql)
	set rs = cn.EXECUTE("SELECT SCOPE_IDENTITY() as codigo")
	
	Response.Redirect("inc_inscricao.asp?incok=1&acao=1&codigo="&rs("codigo"))
elseif Botao = "Alterar" Then
	if email = "" then
			Response.Redirect ("lista_inscricao_alt.asp")
	end if
	strsql = "UPDATE inscricao SET cod_turma = "&curso&", email = '"&email&"' WHERE cod_inscricao = "&codigo
	cn.EXECUTE(strsql)
	Response.Redirect ("lista_inscricao_alt.asp")
elseif Botao = "Excluir" Then
	strsql = "UPDATE inscricao SET status = 'I' WHERE cod_inscricao = "&codigo
	cn.EXECUTE(strsql)
	Response.Redirect ("lista_inscricao_excluir.asp")	
End if
%>
<html>
	

<link href="style.css" rel="stylesheet" type="text/css">
<head>
		<title>Inclus&atildeo</title>
		<script language = "javascript">
function verifica_campoSelected(){ 
 if (document.form1.email.value == "") { 
    alert('Preencha o email'); 
    return false; 
  } 
} 		
		
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
	</head>
	
	<body bgcolor = "#FFFFFF" >

<%
acao = int(Request.QueryString("acao"))

If acao = 1 Then
	strNomeBotao = "Incluir"
elseif acao = 2 Then
	Proc_Lerdados codigo
	strNomeBotao = "Alterar"
elseif acao = 3 Then
	Proc_Lerdados codigo
	strNomeBotao = "Excluir"
End If
%>

<p align="center"> 
</p>
<table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="80%" align="center">
  <tr> 
    <td width="41"><img name="n04" src="images/04.jpg" width="41" height="45" border="0"></td>
    <td background="images/05.jpg"><font size="5" color="#FFFFFF" face="Arial, Helvetica, sans-serif"><b>Cursos</b></font></td>
    <td width="7"><img name="n07" src="images/07.jpg" width="7" height="45" border="0"></td>
  </tr>
</table>
<table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="80%" align="center">
  <tr>
    <td width="7">&nbsp;</td>
    <td>&nbsp;</td>
    <td width="7">&nbsp;</td>
  </tr>
  <tr> 
    <td width="7"><img name="n10" src="images/10.jpg" width="7" height="25" border="0"></td>
    <td background="images/11.jpg"><img name="n10" src="images/11.jpg" width="7" height="25" border="0"></td>
    <td width="7"><img name="n13" src="images/13.jpg" width="7" height="25" border="0"></td>
  </tr>
  <tr> 
    <td width="7" background="images/14.jpg"><img name="n14" width="7" height="25" border="0" src="images/14.jpg"></td>
    <td>
      <form name = "form1" id = "form1" method = "post" onSubmit="return verifica_campoSelected()" action = "<%= request.ServerVariables("SCRIPT_NAME")%><% if acao = 2 THEN response.write("?acao=2") else response.write("?acao=1") end if  %>">
	    <input type = "hidden" name = "codigo" id = "Hidden1" value = "<%=codigo%>"> 
        <table border = "0" cellspacing = "0" cellppadding = "0" align = "center">
          <%If Request.QueryString("IncOk") = 1 Then%>
          <tr>
            <td> <font face = "Verdana" color = "#FF0000"> <b>Sua Inclus&atilde;o
                  foi efetuada com sucesso!</b> </font> </td>
          </tr>
          <%End If%>
        </table>
        <table border = "0" cellspacing = "0" cellppadding = "0" align = "center">
        <tr> 
            <td><div align="right">Turma:</div></td>
            <td colspan="3"><select name = "curso" id = "curso">
            <%
			Conecta()
			SET rs = cn.EXECUTE("SELECT * FROM turma")
			DO WHILE NOT rs.EOF
			%>
            	<option <%if curso = rs("cod_turma") then response.write("selected='selected'") end if%> value="<%=rs("cod_turma")%>"><%=rs("titulo")&" - "&rs("data")%></option>
            <%
			rs.MOVENEXT
			LOOP
			%>
            </select>  
            </td>
        </tr>
        <tr> 
            <td><div align="right">Email:</div></td>
            <td colspan="3"><input type = "text" name = "email" id = "email" size="50" value = "<%=email%>"> 
            </td>
        </tr>

        </table>
        <table width="344" border = "0" align = "center" cellspacing = "0" cellppadding = "0">
          <tr>
            <td width="342">
              <div valign = "middle" align = "center">
                <input type = "submit" name = "Botao" id = "Botao" value = "<%=strNomeBotao%>" >
                
                <input type = "button" onClick="window.open('http://www.thepilatesfisiofitness.com.br/email_inscrevase.asp?cod_inscricao=<%=codigo%>&pagamento2=1','_blank')" name = "Botao_pagamento" id = "Botao_pagamento" value = "Gerar Link Cartão" >
                <input type = "button" onClick="window.open('http://www.thepilatesfisiofitness.com.br/boleto/itau/boleto-itau-admin.asp?id=<%=codigo%>','_blank')" name = "Botao_pagamento_boleto" id = "Botao_pagamento_boleto" value = "Gerar Link Boleto" >
			  </div>
            </td>
          </tr>
        </table>
      </form>
      </td>
    <td width="7" background="images/16.jpg"><img name="n16" width="7" height="25" border="0" src="images/16.jpg"></td>
  </tr>
  <tr> 
    <td width="7"><img name="n19" src="images/19.jpg" width="7" height="14" border="0"></td>
    <td background="images/20.jpg"><img name="n19" src="images/20.jpg" width="7" height="14" border="0"></td>
    <td width="7"><img name="n22" src="images/22.jpg" width="7" height="14" border="0"></td>
  </tr>
</table>

	</body>
</html>

