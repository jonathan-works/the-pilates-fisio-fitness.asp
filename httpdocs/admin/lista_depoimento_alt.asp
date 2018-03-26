<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<!--#include file = "div_top.asp"-->
<html>
<head>
<title>SPE BRASIL</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body leftmargin="0" topmargin="0">
<%

Dim strSql, objReg, valContaTd, strsql2, rsdepoimento
Conecta()

strsql = "Select * from depoimento Order By data desc "
Set rsdepoimento = cn.execute(strSql)
If Not rsdepoimento.Eof Then
%>
	<style type="text/css">
		<!--
		.tabela {border-bottom-width: 0px}	
		.linha1 {border-top-width: 0px; border-bottom-width: 1px}
		.linha2 {border-top-width: 0px ; border-bottom-width: 1px}
		-->
	</style>	
	

      <table width="80%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
        <tr> 
          <td width="41"><img name="n04" src="images/04.jpg" width="41" height="45" border="0"></td>
          <td width="616" valign="bottom"><font size="5" color="#902528" face="Arial, Helvetica, sans-serif"><b>Depoimento 
            - Alterar</b></font></td>
          <td width="6">&nbsp;</td>
        </tr>
        <tr> 
          <td height="1" colspan="3" bgcolor="#902528"></td>
        </tr>
      </table>
      <p><br>
  <br>
  <br>
</p>
<table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="80%" align="left">
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
      <table border = "0" cellspacing = "1" cellpadding = "0" align = "center" width="90%" class = "tabela">
        <tr>
          <td bgcolor="#ffffff" class = "linha1"  onmouseover="bgColor='#f5f5f5'" onMouseOut="bgColor='FFffff'" >             
        </tr>
      <%
	  strsql = "Select * from depoimento  Order By data desc"
	  Set rsdepoimento = cn.execute(strSql)
	  valContaTd = 1
	  Do While Not rsdepoimento.Eof
	  %>
        <tr> 
          <td bgcolor="<% if rsdepoimento("aprovado") = 1 then response.Write("#ffffff") else response.Write("#FF9933")%>" class = "linha1"  onmouseover="bgColor='#f5f5f5'" onMouseOut="bgColor='FFffff'" ><font color="#FF0000"><strong><a href="inc_depoimento.asp?acao=2&codigo=<%=rsdepoimento("Cod_depoimento")%>"></a></strong></font>            <font color="#FF0000"><strong><a href="inc_depoimento.asp?acao=2&codigo=<%=rsdepoimento("Cod_depoimento")%>"><%= rsdepoimento("fonte") %> - <%= rsdepoimento("data") %></a></strong></font>                  
	  <%
	  rsdepoimento.MoveNext
	  Loop		
	  %>
      </table>
</td>
            <td width="7" background="images/16.jpg"><img name="n16" width="7" height="25" border="0" src="images/16.jpg"></td>
          </tr>
          <tr>
            <td width="7"><img name="n19" src="images/19.jpg" width="7" height="14" border="0"></td>
            <td background="images/20.jpg"><img name="n19" src="images/20.jpg" width="7" height="14" border="0"></td>
            <td width="7"><img name="n22" src="images/22.jpg" width="7" height="14" border="0"></td>
          </tr>
        </table>

<%
Else
	%>
	<script language="JavaScript">
	window.open("inc_depoimento.asp?acao=1","_self")
	</script>
	<%
End If
Desconecta()
%>