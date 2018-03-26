<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<!--#include file = "div_top.asp"-->
<html><head>
<title>CONIB</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body leftmargin="0" topmargin="0">
<%

Dim strSql, objReg, valContaTd, strsql2, rsNoticia
Conecta()

strsql = "Select * from Noticia inner join Usuario on noticia.cod_usuario = usuario.cod_usuario Order By noticia_inter, data desc"
Set rsNoticia = cn.execute(strSql)
If Not rsNoticia.Eof Then
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
          <td width="616" valign="bottom"><font size="5" color="#CC0000" face="Arial, Helvetica, sans-serif"><b>Not&iacute;cia 
            - Alterar</b></font></td>
          <td width="6">&nbsp;</td>
        </tr>
        <tr> 
          <td height="1" colspan="3" bgcolor="#CC0000"></td>
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
          <td width="43%" bgcolor="#ffffff" class = "linha1"  onmouseover="bgColor='#f5f5f5'" onMouseOut="bgColor='FFffff'" >        
          <td width="25%" bgcolor="#ffffff" class = "linha1"  onmouseover="bgColor='#f5f5f5'" onMouseOut="bgColor='FFffff'" ><strong>Cadastrado por</strong>          </tr>
<%
		  valContaTd = 1
		  Do While Not rsNoticia.Eof
		  %>  
        <tr> 
          <td bgcolor="#ffffff"  onmouseover="bgColor='#f5f5f5'" onMouseOut="bgColor='FFffff'" class = "linha1" ><font color="#FF0000"><strong><a href="inc_Noticia.asp?acao=2&codigo=<%=rsNoticia("Cod_Noticia")%>">
          <%
		  if rsNoticia("noticia_inter") = 1 then response.Write("<strong>NI</strong> - ")
		  %>
		  <%= rsNoticia("cod_Noticia") & " - " & rsNoticia("Titulo") %></a></strong></font>	
          <td bgcolor="#ffffff"  onmouseover="bgColor='#f5f5f5'" onMouseOut="bgColor='FFffff'" class = "linha1" ><font color="#FF0000"><strong><a href="inc_Noticia.asp?acao=2&codigo=<%=rsNoticia("Cod_Noticia")%>"></a></strong></font> <font color="#FF0000"><strong><a href="inc_Noticia.asp?acao=2&codigo=<%=rsNoticia("Cod_Noticia")%>"><%= rsNoticia("nome") %></a></strong></font>          </tr>
		<%
		     rsNoticia.MoveNext
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
	window.open("inc_Noticia.asp?acao=1","_self")
	</script>
	<%
End If
Desconecta()
%>