<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<!--#include file = "div_top.asp"-->
<!-- #INCLUDE file="ckeditor/ckeditor.asp" -->
<html>
<head>
<title>DLock Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script language = "javascript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->

</script>

</head>

<body leftmargin="0" topmargin="0">
<!--#include file = "include/classe_noticia.asp"-->
<%
Dim strNomeBotao,codigo,Cod_CategoriaProduto,servico,disponivel
Dim Botao,acao,strsql,rs,vetor,exibe,codigo_btn, rs_checked, rsver
Dim cod_fabricante, fabricante, excluir
exibe=false
vetor=array()
ReDim preserve vetor(0) 
Conecta()

Botao=request.Form("Botao")
codigo_btn=request("codigo")

cod_fabricante = int(request.Form("cod_fabricante"))

excluir = request.Form("excluir")

If Botao = "Incluir" Then		
	Proc_Incluirdados 
elseif Botao = "Alterar" Then
	Proc_Alterardados codigo_btn
elseif Botao = "Excluir" Then
	Proc_Excluirdados codigo_btn
End if

acao = int(Request.QueryString("acao"))

If acao = 1 Then
	strNomeBotao = "Incluir"
elseif acao = 2 Then
	Proc_Lerdados codigo_btn
	strNomeBotao = "Alterar"
	exibe=true
elseif acao = 3 Then
	Proc_Lerdados codigo_btn
	strNomeBotao = "Excluir"
	exibe=true
End If

%>
      <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
        <tr> 
          <td width="41"><img name="n04" src="images/04.jpg" width="41" height="45" border="0"></td>
          <td valign="bottom"><font size="5" color="#CC0000" face="Arial, Helvetica, sans-serif"><b>Not&iacute;cias</b></font></td>
          <td width="7">&nbsp;</td>
        </tr>
        <tr> 
          <td height="1" colspan="3" bgcolor="#CC0000"></td>
        </tr>
      </table>
      <p><br>
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
      <form name = "form1" method = "post" action = "<%= request.ServerVariables("SCRIPT_NAME")%>?acao=1" >
        <table border = "0" cellspacing = "0" cellppadding = "0" align = "center">
          <%If Request.QueryString("IncOk") = 1 Then%>
          <tr>
            <td> <font face = "Verdana" color = "#FF0000"> <b>Sua Inclus&atilde;o
                  foi efetuada com sucesso!</b> </font> </td>
          </tr>
          <%End If%>
        </table>
        <table width="612" border = "0" align = "center" cellspacing = "0" cellppadding = "0">
          <tr> 
            <td width="130" > 
                <div align="left">
                  <strong>
<input name="codigo" type="hidden" id="codigo2" value="<%= codigo_btn %>">
T&iacute;tulo:</strong></div></td>
            <td width="478"><input name="1" type="text" id="titulo" value="<% if exibe then response.Write vetor(1) %>" size="105"></td>
          </tr>
          <tr> 
            <td><div align="left"><strong>Fonte: </strong></div></td>
            <td><input name="3" type="text" id="3" value="<% if exibe then response.Write vetor(3) %>" size="105"></td>
          </tr>
          <tr> 
            <td><div align="left"><strong>Not&iacute;cia Inter: </strong></div></td>
            <td>
   		<% 
		'Response.Write(vetor(12))
		if exibe then codigo_exibe = vetor(9) else codigo_exibe = 9 %>
   		<input type="radio" name="9" id="9" value="1" <% If codigo_exibe then response.Write(" checked ") %>> Sim 
   		<input type="radio" name="9" id="9" value="0" <% If Not codigo_exibe OR Not exibe then response.Write(" checked ") %>> Não   </td>
          </tr>
          <tr>
            <td colspan="2"><hr></td>
          </tr>          
          <tr>
            <td colspan="2"><div align="left"><strong>Texto Resumido:</strong></div>
              <textarea name="6" cols="70" rows="4"><%
			if exibe then 
				response.Write(vetor(6))
			end if
			%></textarea>           </td>
          </tr>
          <tr>
            <td colspan="2"><hr></td>
          </tr>
          <tr> 
            <td colspan="2"><div align="left"><strong>Texto Completo:</strong></div>
               <%
	' Create class instance.
	dim editor, initialValue, code, textareaAttributes
	set editor = New CKEditor

	' Do not print the code directly to the browser, return it instead
	editor.returnOutput = true

	' Path to CKEditor directory, ideally instead of relative dir, use an absolute path:
	'   editor.basePath = "/ckeditor/"
	' If not set, CKEditor will default to /ckeditor/
	editor.basePath = "ckeditor/"
	' Set global configuration (will be used by all instances of CKEditor).
	editor.config("width") = 600

	' Change default textarea attributes
	set textareaAttributes = CreateObject("Scripting.Dictionary")
	textareaAttributes.Add "rows", 10
	textareaAttributes.Add "cols", 80
	Set editor.textareaAttributes = textareaAttributes

	' The initial value to be displayed in the editor.
	if exibe then 
		initialValue = vetor(2)
	else
		initialValue = ""
	end if

	' Create first instance.
	code = editor.editor("2", initialValue)

	response.write code
%>            </td>
            </tr>
            <td colspan="2"><hr></td>
          </tr>
           <tr> 
            <td colspan="2"><hr></td>
          </tr>
           <tr>
             <td colspan="2">&nbsp;</td>
           </tr>
           <%
		   if exibe then
		   %>
           <tr> 
            <td colspan="2"><div align="center"><strong><font size="2">SEO</font></strong></div></td>
          </tr>
          		<input type="text" name="4" id="4" value="0">
          <tr> 
            <td><div align="left"><strong>URL: </strong></div></td>
            <td><input name="8" type="text" id="8" value="<% if exibe then response.Write vetor(8) %>" size="105"></td>
          </tr>
          <%
		  end if
		  %>
        </table>
        <table width="344" border = "0" align = "center" cellspacing = "0" cellppadding = "0">
          <tr>
          <td><%If acao <> 1 Then%><input type = "button" name = "Botao" id = "Botao" value = "Foto" onClick="MM_openBrWindow('Imagem_noticia.asp?codigo=<%= codigo_btn%>','','width=400,height=300,scrollbars=auto')"><%end if%>
          </td>
            <td width="342" colspan="5">
              <div valign = "middle" align = "center">
              <input type="hidden" name="7" id="7" value="<%= session("cod_usuario") %>">
              <input type = "submit" name = "Botao" id = "Botao" value = "<%=strNomeBotao%>" >
              </div>            </td>
              
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
<%
Desconecta()
%>