<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<%
conecta()

Response.AddHeader "expires","0"
Response.AddHeader "pragma", "no-cache"
Response.AddHeader "cache-control","no-cache"

Dim codigo,imagem,strsql,rs

codigo = REquest("codigo")
Session("codigo") = codigo

	strsql="SELECT * From imagem WHERE cod_turma = " & codigo
	set rs = cn.execute(strsql)
%>
<html>
<link href="style.css" rel="stylesheet" type="text/css">
<head>
<title>Administrativo de fotos</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#F7F4EA" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" scroll="auto">

	<form name="form2" action="upload_turma.asp" enctype="multipart/form-data" method="post">
  <table width="98%" align="center">
    <tr> 
      <td>&nbsp;</td>
    </tr>

	
    <tr> 
      <td><div align="center"><b>Foto</b><b><font color="#000000">:</font></b><font color="#FFFFFF" size="2" face="Arial, Helvetica, sans-serif"><b> 
          <input name="file2" type="file" id="file2">
          </b></font><br>
          <font color="#FF0000"><strong>* ex.:</strong> <em><%= imagem %></em></font>
      </div></td>
    </tr>
	  <tr> 
      <td bgcolor="#E8E2C1"><div align="center"> 
          <input type="submit" name="Submit" value="Enviar">
          <input name="codigo" type="hidden" id="codigo" value="<%=codigo%>">

        </div></td>
    </tr>
	<%
	
	DO WHILE NOT rs.EOF
	imagem = rs("imagem")
	%>
    <tr> 
      <td height="35">&nbsp;</td>
    </tr>
    <tr> 
      <td valign="top" bgcolor="#E8E2C1"><div align="center"><strong><font color="#6C6C24">Foto</font></strong></div>        <div align="center"></div></td>
    </tr>
    <tr> 
      <td valign="top" bgcolor="#F7F4EA"><div align="center"> 
          <%
if imagem <> "" then
%>
          <img src="../images/p_<%= imagem %>" border="0"> 
          <%
else
%>
          <font color="#FF0000"><strong>Sem Imagem</strong></font> 
          <%
end if
%>
        </div></td>
    </tr>
    <tr> 
      <td><%
if imagem <> "" then
%>
	<p align="center"><input type="button" name="botao" id="botao" onClick="window.open('delete_imagem.asp?id=<%=rs("cod_imagem")%>','_self')" value="Apagar Foto"></p>
<%
end if
%></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
    </tr>
<%
	rs.MOVENEXT
	LOOP
%>
  
    <tr> 
      <td><b><font color="#FF0000"></font></b></td>
    </tr>
  </table>
  <div align="center"></div>
</form>
</body>
</html>
<%
if request.QueryString("upload") = "s" then
%>
<script language="JavaScript">
alert("Foto Enviada com Sucesso");
</script>
<%
end if
%>
