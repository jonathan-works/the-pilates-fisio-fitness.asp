<%
Option Explicit
%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<!--#include file = "div_top.asp"-->
<!--#include file = "include/classe_inscricao.asp"-->
<%

Dim strSql, objReg, valContaTd, strsql2,busca, txt_busca_sql, busca_f


busca = request.QueryString("busca")
busca_f = request.QueryString("busca_f")

if busca_f = "falhou" then
Response.Write("<script>alert('A busca não retornou nenhum dado.')</script>")
End If

Function buscar(busca,param1,param2,param3)

if busca <> "" and not isnull(busca) Then

if param1 <> "" and not isnull(param1) Then
buscar = " and ("&param1&" like '%"&busca&"%' "
End If

if param2 <> "" and not isnull(param2) Then
buscar = buscar & " or "&param2&" like '%"&busca&"%' "
End If

if param3 <> "" and not isnull(param3) Then
buscar = buscar & " or "&param3&" like '%"&busca&"%') "
End If

End If




End Function


Conecta()



%>
<html>
        
<link href="style.css" rel="stylesheet" type="text/css">
<head>
        <title></title>
        </head>
	
	<link rel="stylesheet" href="style_alt.css" type="text/css">	
	
	<style type="text/css">
		<!--
		.tabela {border-bottom-width: 0px}	
		.linha1 {border-top-width: 0px; border-bottom-width: 1px}
		.linha2 {border-top-width: 0px ; border-bottom-width: 1px}
		.linha0:hover {background-color:#FFC;}
		-->
	</style>	
	
        <body>
              <table bgcolor="#ffffff" border="0" cellpadding="0" cellspacing="0" width="80%" align="center">
                <tr>
                  <td width="41"><img name="n04" src="images/04.jpg" width="41" height="45" border="0"></td>
                  
    <td background="images/05.jpg"><font size="5" color="#FFFFFF" face="Arial, Helvetica, sans-serif"><b>Inscrições</b></font></td>
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
		<table border = "0" cellspacing = "0" cellpadding = "9" align = "center" width="900" class = "tabela" style="border-right:1px solid #00a8ed">
		  <%
		  txt_busca_sql = buscar(busca, "nome","email","titulo")
		  
		  strSql2 = "Select TOP 200 * From V_inscricoes where status = 'A' and nome is not null and nome <> '' "&txt_busca_sql&" ORDER BY data Desc"
		  'response.Write(strSql2)
		  
		  %>
          
          <tr valign="middle">
          <td colspan="5">
          Busca:
          <form method="get" name="form_busca" action="<%=REQUEST.ServerVariables("SCRIPT_NAME")%>">
          <input type="text" name="busca" value="<%= busca%>">
          <input type="submit" name="submit" value="Buscar">
          </form>
          </td>
          <td>
          
          </td>
          </tr>
          
		  <tr>
          <td align="center" valign="middle" nowrap="nowrap" bgcolor="#00a8ed" style="color: #FFFFFF">Código Inscrição</td>
          <td align="center" valign="middle" nowrap="nowrap" bgcolor="#00a8ed" style="color: #FFFFFF">Nome</td>
          <td align="center" valign="middle" nowrap="nowrap" bgcolor="#105272" style="color: #FFFFFF">Email<span style="color: #FFFFFF"></span></td>
          <td align="center" valign="middle" nowrap="nowrap" bgcolor="#00a8ed" style="color: #FFFFFF">Data Inscrição</td>
          <td align="center" valign="middle" nowrap="nowrap" bgcolor="#105272" style="color: #FFFFFF">Cidade Inscrição</td>
          <td align="center" valign="middle" nowrap="nowrap" bgcolor="#00a8ed" style="color: #FFFFFF">Tipo de Pagamento</td>
          <td align="center" valign="middle" nowrap="nowrap" bgcolor="#105272" style="color: #FFFFFF">TID</td>
           <td align="center" valign="middle" nowrap="nowrap" bgcolor="#105272" style="color: #FFFFFF">Estorno</td>
          <td align="center" valign="middle" nowrap="nowrap" bgcolor="#00a8ed" style="color: #FFFFFF">Status</td>
          <td align="center" valign="middle" nowrap="nowrap" bgcolor="#105272" style="color: #FFFFFF">Bandeira</td>
          <td align="center" valign="middle" nowrap="nowrap" bgcolor="#00a8ed" style="color: #FFFFFF">Informações do Curso</td>
          
          
          
          </tr>
          <%
		  set objReg = cn.execute(strSql2)
		  If Not objReg.Eof Then
		  Do While not objReg.Eof
		  %>
		  <tr class="linha0">
          
          <td align="center" valign="middle" style="border-bottom:1px solid #00a8ed; border-left:1px solid #00a8ed"> <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
				               <%=objReg("cod_inscricao")%></a></td>
					<td align="center" valign="middle" class = "linha1" style="border-bottom:1px solid #00a8ed; border-left:1px solid #00a8ed"> 
				      <div align="left">
				                <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
				                  <%=objReg("nome")%>			                            </a>                      </div></td>
                                  <td align="center" valign="middle" style="border-bottom:1px solid #00a8ed; border-left:1px solid #00a8ed"> <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
				                  <%=objReg("email")%></a></td>
                                  <td align="center" valign="middle" style="border-bottom:1px solid #00a8ed; border-left:1px solid #00a8ed"> <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
				                  <%=objReg("data")%></a></td>
                                  <td align="center" valign="middle" style="border-bottom:1px solid #00a8ed; border-left:1px solid #00a8ed"> <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
				                  <%=objReg("cidade")%></a></td>
                                  <td align="center" valign="middle" style="border-bottom:1px solid #00a8ed; border-left:1px solid #00a8ed"> <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
				                  
				                  <%=objReg("TipodePagamento")%></a></td>
                                  <td align="center" valign="middle" style="border-bottom:1px solid #00a8ed; border-left:1px solid #00a8ed"> <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
				                  <%=objReg("TID")%></a></td>
                                  <td align="center" valign="middle" style="border-bottom:1px solid #00a8ed; border-left:1px solid #00a8ed"> 
				                  <%
								  If not isnull(objReg("TID")) and objReg("TID") <> "" Then
								  	if isnull(objReg("Data_Estorno")) or objReg("Data_Estorno") = "" Then
								  %>
                                  <script language="javascript">
                                  function confirma_estorno<%=objReg("Cod_Inscricao")%>()
								  {
									  if(confirm("Deseja mesmo estornar esse pedido?"))
									  {
									window.location="http://thepilatesfisiofitness.com.br/cielo/pages/carrinhoCartaoCancelamento.php?id=<%=objReg("TID")%>&cod_inscricao=<%=objReg("Cod_Inscricao")%>";  
									  }
									  else
									  {
										  
									  }
									  
								  }                             
                                                                    
                                  </script>
                                                                    
                                  <form name="form_estorno" id="form_estorno" method="post">
                                  <input type="button" onClick="confirma_estorno<%=objReg("Cod_Inscricao")%>();" name="estorno" value="Estorno"/>
                                  </form>
                                  
								  <%else%>
                                  <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
								  	<%Response.Write(objReg("Data_Estorno"))%>
                                    </a>
                                  <%
									end if
								 Else%>
                                  <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
								  	<%Response.Write(objReg("Data_Estorno"))%>
                                  </a>
                               <%End If%>
                                  </td>
                                  <td align="center" valign="middle" style="border-bottom:1px solid #00a8ed; border-left:1px solid #00a8ed"> <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
				                  <%=objReg("mensagem_status")%></a></td>
                                  <td align="center" valign="middle" style="border-bottom:1px solid #00a8ed; border-left:1px solid #00a8ed"> <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
				                  <%=objReg("Bandeira")%></a></td>
                                  <td align="center" valign="middle" style="border-bottom:1px solid #00a8ed; border-left:1px solid #00a8ed"> <a href = "inc_inscricao.asp?acao=2&codigo=<%=objReg("Cod_Inscricao")%>">
				                  <%=objReg("Cidade_Studio")&" - "&objReg("Descricao")&"/"&objReg("titulo")&" - "&objReg("data_turma")%></a></td>
                                  
                                  
		  </tr>
		  <%
		  valContaTd = valContaTd + 1
		  objReg.movenext
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
        </body>
</html>
<%
Else
	
	 'Response.Redirect("lista_inscricao_alt.asp?busca_f=falhou")
End If
Desconecta()
%>
