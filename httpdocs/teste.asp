<!--#include file = "admin/conexao.asp"-->
<%
Conecta()
set ufs = cn.execute("SELECT * FROM UF")

do while not ufs.eof
	Response.Write ufs("cod_uf") & " - " & ufs("descricao") & "</br>"
	ufs.movenext
loop
Desconecta()
response.end
%>

