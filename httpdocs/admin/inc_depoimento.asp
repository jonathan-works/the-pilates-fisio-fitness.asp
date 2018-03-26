<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<!--#include file = "div_top.asp"-->
<html>
<head>
<title>SPE BRASIL</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script type="text/javascript" src="calendarDateInput.js">

/***********************************************
* Jason's Date Input Calendar- By Jason Moon http://calendar.moonscript.com/dateinput.cfm
* Script featured on and available at http://www.dynamicdrive.com
* Keep this notice intact for use.
***********************************************/

</script>
</head>

<body leftmargin="0" topmargin="0">
      <!--#include file = "include/classe_depoimento.asp"-->
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
excluir = request.Form("excluir")



If Botao = "Incluir" Then		
	Proc_Incluirdados 
elseif Botao = "Alterar" Then
	Proc_Alterardados codigo_btn
elseif Botao = "Excluir" Then
	Proc_Excluirdados codigo_btn
End if

%>
      <%
acao = int(Request.QueryString("acao"))

If acao = 1 Then
	strNomeBotao = "Incluir"
elseif acao = 2 Then
	Proc_Lerdados codigo_btn
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
          <td valign="bottom"><font size="5" color="#902528" face="Arial, Helvetica, sans-serif"><b>Depoimento</b></font></td>
          <td width="7">&nbsp;</td>
        </tr>
        <tr> 
          <td height="1" colspan="3" bgcolor="#902528"></td>
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
      <form name = "form1" method = "post" action = "<%= request.ServerVariables("SCRIPT_NAME")%>?acao=1">
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
            <td width="130" ><div align="right">
              <input name="codigo" type="hidden" id="codigo" value="<%= codigo_btn %>">
              Descri&ccedil;&atilde;o:  
            </div></td>
            <td width="478"><textarea name="1" cols="70" rows="5" id="titulo"><% if exibe then response.Write vetor(1) %></textarea></td>
          </tr>
          
          <tr>
            <td><div align="right">Fonte: </div></td>
            <td><input name="2" type="text" id="titulo3" value="<% if exibe then response.Write vetor(2) %>" size="70"></td>
          </tr>
 <tr>
   <td><div align="right">Publicado: </div></td>
   <td>
   		<% if exibe then codigo_exibe = vetor(4) else codigo_exibe = 2 %>
   		<input type="radio" name="4" id="4" value="1" <% If codigo_exibe = 1 or not exibe then response.Write(" checked ") %>> Sim 
   		<input type="radio" name="4" id="4" value="0" <% If codigo_exibe = 0 then response.Write(" checked ") %>> Não 
   </td>
 </tr>
 <tr>
   <td>&nbsp;</td>
   <td>&nbsp;</td>
 </tr>
          <tr> 
            <td colspan="2"><hr></td>
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
        </div>
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