<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Option Explicit
session.LCID=1036
%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<!--#include file = "div_top.asp"-->
<!--#include file = "include/classe_usuarios.asp"-->
<%
Dim strNomeBotao,codigo,login,nome,disponivel,senha
Dim Botao,acao,strsql,rs,rs_sub

Botao=request.Form("Botao")
codigo=request("codigo")


nome=request.Form("nome")
login=request.Form("login")
senha=request.Form("senha")
disponivel=int(request.Form("disponivel"))

If Botao = "Incluir" Then		
	Proc_Incluirdados nome,login,senha,disponivel
elseif Botao = "Alterar" Then
	Proc_Alterardados codigo,nome,login,senha,disponivel
elseif Botao = "Excluir" Then
	Proc_Excluirdados codigo	
End if



%>
<html>
	
<link href="style.css" rel="stylesheet" type="text/css">
<head>
		<title>Inclus&atildeo</title>
		<script language = "javascript">
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
	Proc_Lerdados Codigo
	strNomeBotao = "Alterar"
elseif acao = 3 Then
	Proc_Lerdados Codigo
	strNomeBotao = "Excluir"
End If

%>

<p align="center"> 
</p>
<table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="80%" align="center">
  <tr> 
    <td width="41"><img name="n04" src="images/04.jpg" width="41" height="45" border="0"></td>
    <td background="images/05.jpg"><font size="5" color="#FFFFFF" face="Arial, Helvetica, sans-serif"><b>Usu&aacute;rios</b></font></td>
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
      <form name = "form1" id = "form1" method = "post" action = "<%= request.ServerVariables("SCRIPT_NAME")%><% if acao = 2 THEN response.write("?acao=2") else response.write("?acao=1") end if  %>">
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
            <td width="89"> <div align="right"> Nome:</div></td>
            <td width="350"> <input type = "text" name = "Nome" id = "nome" size="20" maxlenght = "150" value = "<%=nome%>"> 
            </td>
          </tr>
          <tr> 
            <td width="89"> <div align="right"> Login:</div></td>
           <td width="350"> <input type = "text" name = "Login" id = "login" size="20" maxlenght = "150" value = "<%=login%>"> 
            </td>
          </tr>
		  
          <tr> 
            <td width="89"> <div align="right"> Senha:</div></td>
			<td width="350"> <input type = "text" name = "Senha" id = "senha" size="20" maxlenght = "150" value = "<%=senha%>"> 
            </td>
          </tr>
          <tr> 
            <td><div align="right">Habilitado:</div></td>
            <td><input name="disponivel" type="checkbox" id="destaque" value="1"<% if disponivel then response.Write("checked='checked'") %>></td>
          </tr>

        </table>
		<input type = "hidden" name = "codigo" id = "Hidden1" value = "<%=codigo%>"> 
        <table width="344" border = "0" align = "center" cellspacing = "0" cellppadding = "0">
          <tr>
            <td width="342">
              <div valign = "middle" align = "center">
                <input type = "submit" name = "Botao" id = "Botao" value = "<%=strNomeBotao%>" >
              
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

