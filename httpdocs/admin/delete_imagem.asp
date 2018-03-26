<%
Option Explicit

Dim codigo,strsql,rs,imagem,objfso,pastadestino

codigo=request.querystring("id")
%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<%
Conecta()
strsql="select imagem from imagem where Cod_imagem = " & codigo
set rs=cn.execute(strsql)
imagem=rs("imagem")
set rs=nothing

	PastaDestino = Server.MapPath("/images/")

	strsql="DELETE FROM imagem where Cod_imagem = " & codigo
	cn.execute(strsql)
	'sresponse.Write(strsql)
	Desconecta()
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	If objFSO.FileExists(PastaDestino&"/p_"&imagem) Then
		objFSO.DeleteFile(PastaDestino&"/p_"&imagem)
	End If
	If objFSO.FileExists(PastaDestino&"/g_"&imagem) Then
		objFSO.DeleteFile(PastaDestino&"/g_"&imagem)
	End If

	Set objFSO = nothing

%>

<script language="JavaScript">
alert("Imagem Apagada com sucesso!")
window.close()
</script>
