<%
Option Explicit
%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<!--#include file = "div_top.asp"-->
<!--#include file = "include/classe_curso.asp"-->
<!--#include file="fckeditor_2/fckeditor.asp"-->
<%
Dim strNomeBotao,codigo,curso,endereco,complemento,numero,bairro,cidade,uf,tela,telb,descricao,oFCKeditor,exibe
Dim Botao,acao,strsql,rs

const diretorio_fckeditor = "/admin/fckeditor_2/editor/skins/silver/"
const diretorio_fckeditor_editor = "/admin/fckeditor_2/editor/skins/silver/"

Botao=request.Form("Botao")
codigo=request("codigo")

curso=request.Form("curso")
endereco=request.Form("endereco")
complemento = request.Form("complemento")
numero = request.Form("numero")
bairro = request.Form("bairro")
cidade = request.Form("cidade")
uf = request.Form("uf")
tela = request.Form("tela")
telb = request.Form("telb")
descricao = request.Form("descricao")
'descricao = replace(descricao,chr(34),"'")
Conecta() 



If Botao = "Incluir" Then		
	if curso = "" OR numero = "" THEN
		Response.Redirect("inc_curso.asp?incok=1&acao=1")
	end if 
	
	strsql = "INSERT INTO studio(studio, endereco, compl, numero, bairro, cidade, cod_uf, tel1, tel2, descricao) VALUES('"&curso&"','"&endereco&"','"&complemento&"',"&numero&",'"&bairro&"','"&cidade&"',"&uf&",'"&tela&"','"&telb&"','"&descricao&"')"
	
	cn.EXECUTE(strsql)		
	Response.Redirect("inc_studio.asp?incok=1&acao=1")
elseif Botao = "Alterar" Then
	if curso = "" OR numero = "" THEN
		Response.Redirect ("lista_studios_alt.asp")
	end if 

	strsql = "UPDATE studio SET studio = '"&curso&"', endereco = '"&endereco&"', compl = '"&complemento&"', numero = "&numero&", bairro = '"&bairro&"', cidade = '"&cidade&"', cod_uf = "&uf&", tel1 = '"&tela&"', tel2 = '"&telb&"', descricao = '"&descricao&"' WHERE cod_studio = "&codigo
	cn.EXECUTE(strsql)
	Response.Redirect ("lista_studios_alt.asp")
elseif Botao = "Excluir" Then
	strsql = "DELETE FROM studio WHERE cod_studio = "&codigo
	cn.EXECUTE(strsql)
	Response.Redirect ("lista_studios_excluir.asp")	
End if
%>
<html>
	

<link href="style.css" rel="stylesheet" type="text/css">
<head>
		<title>Inclus&atildeo</title>
		<script language = "javascript">
function verifica_campoSelected(){ 
 if (document.form1.curso.value == "") { 
    alert('Preencha o curso'); 
    return false; 
  }
 
 
 if (document.form1.numero.value == "") { 
    alert('Preencha o numero'); 
    return false; 
  }  
} 		
function keypressed3( obj , e ) {
     var tecla = ( window.event ) ? e.keyCode : e.which;
     var texto = document.getElementById("numero").value
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
    <td background="images/05.jpg"><font size="5" color="#FFFFFF" face="Arial, Helvetica, sans-serif"><b>Stúdio</b></font></td>
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
				<td><div align="right">Stúdio:</div></td>
				<td colspan="3"><input type = "text" name = "curso" id = "curso" size="50" value = "<%=curso%>">  
				</td>
			</tr>
			
	 
	   
			<tr> 
				<td><div align="right">Tel 1:</div></td>
				<td colspan="3"><input type = "text" name = "tela" id = "tela" size="50" value = "<%=tela%>"> 
				</td>
			</tr>
			<tr> 
				<td><div align="right">Tel 2:</div></td>
				<td colspan="3"><input type = "text" name = "telb" id = "telb" size="50" value = "<%=telb%>"> 
				</td>
			</tr>
			<tr> 
				<td><div align="right">Endereço:</div></td>
				<td colspan="3"><input type = "text" name = "endereco" id = "endereco" size="50" value = "<%=endereco%>"> 
				</td>
			</tr>
			<tr> 
				<td><div align="right">Complemento:</div></td>
				<td><input type = "text" name = "complemento" id = "complemento" size="31" value = "<%=complemento%>"> 
				</td>
				<td><div align="right">Número:</div></td>
				<td><input type = "text" name = "numero" id = "numero" size="5" onkeypress="return keypressed3( this , event );" value = "<%=numero%>"> 
				</td>
			</tr>
			<tr> 
				<td><div align="right">Bairro:</div></td>
				<td colspan="3"><input type = "text" name = "bairro" id = "bairro" size="50" value = "<%=bairro%>"> 
				</td>
			</tr>
			<tr> 
				<td><div align="right">Cidade:</div></td>
				<td><input type = "text" name = "cidade" id = "cidade" size="31" value = "<%=cidade%>"> 
				</td>
				<td><div align="right">UF:</div></td>
				<td><select name = "uf" id = "uf"> 
					<%
					Conecta()
					strsql = "SELECT * FROM UF"
					SET rs = cn.EXECUTE(strsql)
					DO WHILE NOT rs.EOF
					%>
						<option <%if rs("cod_uf") = uf then response.write("selected='selected'") end if%> value="<%=rs("cod_uf")%>"><%=rs("descricao")%></option>
					<%
					rs.MOVENEXT
					LOOP
					Desconecta()
					%>
				</select>
				</td>       
			</tr>
        </table>
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

