<!--#include file = "admin/conexao.asp"-->
<%
Conecta() 
	cn.execute("LimparBanco")
Desconecta()
%>