<%
Option Explicit
%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<!--#include file = "div_top.asp"-->
<%

Dim strSql, objReg, valContaTd, strsql2, strsql3, objReg2, resul

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
		-->
	</style>	
	
        <body>
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
		<table border = "0" cellspacing = "1" cellpadding = "0" align = "center" width="600" class = "tabela">
		  <%
		  strSql2 = "Select * From studio "
		  set objReg = cn.execute(strSql2)
		  If Not objReg.Eof Then
		  Do While not objReg.Eof
			
		  %>
		  <tr>
					<td class = "linha1"> 
				<a href = "inc_studio.asp?acao=3&codigo=<%=objReg("Cod_studio")%>">
					<%=objReg("studio")&" "&objReg("cidade")%> 
				</a>
			</td>
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
	 Response.Redirect("inc_curso.asp?acao=1")
End If
Desconecta()
%>
