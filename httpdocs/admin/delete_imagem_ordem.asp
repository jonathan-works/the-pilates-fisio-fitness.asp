<%
Option Explicit

Dim codigo,strsql,rs,imagem,objfso,pastadestino

codigo=Session("codigo")
%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<%
Conecta()
strsql="select imagem"&session("ordem")&" from noticia where Cod_noticia = " & codigo
set rs=cn.execute(strsql)
imagem=rs("imagem"&session("ordem"))
set rs=nothing

	PastaDestino = Server.MapPath("/images/noticia/")

	strsql="update noticia set imagem"&session("ordem")&" = null where Cod_noticia = " & codigo
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
