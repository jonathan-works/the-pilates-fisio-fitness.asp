<%
Option Explicit
%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<!--#include file = "div_top.asp"-->
<!--#include file = "include/classe_turma.asp"-->
<!-- #INCLUDE file="ckeditor/ckeditor.asp" -->
<%
Dim strNomeBotao,codigo,titulo,endereco,complemento,numero,bairro,cidade,cod_studio,vagas,valor,tela,telb,descricao,oFCKeditor,exibe,hora,data, cod_curso
Dim Botao,acao,strsql,rs,ndisponivel

const diretorio_fckeditor = "/admin/fckeditor_2/editor/skins/silver/"
const diretorio_fckeditor_editor = "/admin/fckeditor_2/editor/skins/silver/"

Botao=request.Form("Botao")
codigo=request("codigo")

titulo = request.Form("titulo")
cod_curso = request.Form("cod_curso")
cod_studio = request.Form("cod_studio")
vagas = request.Form("vagas")
descricao = request.Form("descricao")
valor = request.Form("valor")
data = request.Form("data")
hora = request.Form("hora")
ndisponivel = cint(request.Form("ndisponivel"))

Conecta() 
If Botao = "Incluir" Then		
	if vagas = "" OR not IsNumeric(vagas) THEN
		Response.Redirect("inc_curso.asp?incok=1&acao=1")
	end if 
	
	strsql = "INSERT INTO turma(titulo,descricao, vagas,cod_studio, cod_curso,valor,data,hora, disponivel) VALUES('"&titulo&"','"&descricao&"',"&vagas&","&cod_studio&","&cod_curso&",'"&valor&"','"&data&"','"&hora&"',"&ndisponivel&")"
	cn.EXECUTE(strsql)
	Response.Redirect("inc_turma.asp?incok=1&acao=1")
elseif Botao = "Alterar" Then
	if vagas = "" THEN
		Response.Redirect ("lista_turma_alt.asp")
	end if 

	strsql = "UPDATE turma SET titulo = '"&titulo&"', cod_curso = "&cod_curso&", cod_studio = "&cod_studio&", vagas = "&vagas&", descricao = '"&descricao&"', valor = '"&valor&"', data = '"&data&"', hora = '"&hora&"', disponivel = "&ndisponivel&" WHERE cod_turma = "&codigo
	cn.EXECUTE(strsql)
	Response.Redirect ("lista_turma_alt.asp")
elseif Botao = "Excluir" Then
	strsql = "UPDATE turma SET status = 'I' WHERE cod_turma = "&codigo
	cn.EXECUTE(strsql)
	Response.Redirect ("lista_turma_excluir.asp")	
End if

%>
<html>
	

<link href="style.css" rel="stylesheet" type="text/css">
<head>
		<title>Inclus&atildeo</title>
		<script language = "javascript">
function verifica_campoSelected(){ 
 if (document.form1.titulo.value == "") { 
    alert('Preencha o Título'); 
    return false; 
  }
 if (document.form1.vagas.value == "") { 
    alert('Preencha as vagas'); 
    return false; 
  }
 
} 		
function keypressed( obj , e ) {
     var tecla = ( window.event ) ? e.keyCode : e.which;
     var texto = document.getElementById("vagas").value
     var indexvir = texto.indexOf(",")
     var indexpon = texto.indexOf(".")
	 
    if ( tecla == 8 || tecla == 0 )
        return true;
    if ( tecla != 44 && tecla != 46 && tecla < 48 || tecla > 57 )
        return false;
    if (tecla == 44) { if (indexvir !== -1 || indexpon !== -1) {return false} }
    if (tecla == 46) { if (indexvir !== -1 || indexpon !== -1) {return false} }
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
	exibe = true
	Proc_Lerdados codigo
	strNomeBotao = "Alterar"
elseif acao = 3 Then
	exibe = true
	Proc_Lerdados codigo
	strNomeBotao = "Excluir"
End If

%>

<p align="center"> 
</p>
<table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="80%" align="center">
  <tr> 
    <td width="41"><img name="n04" src="images/04.jpg" width="41" height="45" border="0"></td>
    <td background="images/05.jpg"><font size="5" color="#FFFFFF" face="Arial, Helvetica, sans-serif"><b>Turmas</b></font></td>
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
            <td><div align="right">Número da Turma:</div></td>
            <td colspan="3"><input type = "text" name = "titulo" id = "curso" size="50" value = "<%=titulo%>">  
            </td>
        </tr>
       <tr> 
            <td><div align="right">Datas:</div></td>
            <td colspan="3"><input type = "text" name = "data" id = "data" size="50" value = "<%=data%>"> 
            </td>
        </tr>
      <tr> 
            <td><div align="right">Horários:</div></td>
            <td colspan="3"><input type = "text" name = "hora" id = "hora" size="50" value = "<%=hora%>"> 
            </td>
        </tr>
      <tr> 
            <td><div align="right">Valores:</div></td>
            <td colspan="3"><input type = "text" name = "valor" id = "valor" size="50" value = "<%=valor%>"> 
            </td>
        </tr>
       <tr> 
            <td><div align="right">Vagas:</div></td>
            <td colspan="3"><input type = "text" name = "vagas" id = "vagas" size="3" onKeyPress="return keypressed( this , event );" value = "<%=vagas%>"> 
            </td>
        </tr>
 
        <tr> 
            <td><div align="right">Descrição:</div></td>
            <td colspan="3">
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
	initialValue = descricao

	' Create first instance.
	code = editor.editor("descricao", initialValue)

	response.write code
%>
            </td>
        </tr>
        
        <tr> 
            <td><div align="right">Stúdio:</div></td>
            <td colspan="3"><select name="cod_studio" id="cod_studio"> 
				<%
				Conecta()
                strsql = "SELECT * FROM studio"
                SET rs = cn.EXECUTE(strsql)
                DO WHILE NOT rs.EOF
                %>
                	<option <%if rs("cod_studio") = cint(cod_studio) then response.write("selected='selected'") end if%> value="<%=rs("cod_studio")%>"><%=rs("studio")&" "&rs("cidade")%></option>
                <%
                rs.MOVENEXT
                LOOP
				Desconecta()
                %>
            </select>
            </td>			
        </tr>
		<tr>
			
		</tr>
		<tr>
			<td><div align="right">Curso:</div></td>
			<td colspan="3">
				<select name="cod_curso" id="uf"> 
					<%
					Conecta()
					strsql = "SELECT * FROM curso"
					SET rs = cn.EXECUTE(strsql)
					DO WHILE NOT rs.EOF
					%>
						<option <%if rs("cod_curso") = cod_curso then response.write("selected='selected'") end if%> value="<%=rs("cod_curso")%>"><%=rs("descricao")%></option>
					<%
					rs.MOVENEXT
					LOOP
					Desconecta()
					%>
				</select>
            </td>
		</tr>		
       <tr> 
            <td><div align="right"><input type="checkbox" name="ndisponivel" id="ndisponivel" value="1" <%if ndisponivel then response.write("checked='checked'") end if%> /></div></td>
            <td colspan="3">Data Vencida
            </td>
        </tr>
		
        
        </table>
        <table width="344" border = "0" align = "center" cellspacing = "0" cellppadding = "0">
          <tr>
            <td width="342">
              <div valign = "middle" align = "center">
                <input type = "submit" name = "Botao" id = "Botao" value = "<%=strNomeBotao%>" >
				<%
				if strNomeBotao = "Alterar" then
				%>
				<input type = "button" name = "Botao" id = "Botao" value = "Foto" onClick="MM_openBrWindow('Imagem_turma.asp?codigo=<%=codigo%>','','width=400,height=300,scrollbars=auto')">
				<%
				end if
				%>
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

