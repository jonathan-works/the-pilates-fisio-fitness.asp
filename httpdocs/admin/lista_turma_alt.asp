<%
Option Explicit
%>
<!--#include file = "conexao.asp"-->
<!--#include file = "verificalogin.asp"-->
<!--#include file = "div_top.asp"-->
<%

Dim strSql, objReg, valContaTd, strsql2, strsql3, strSql4, objReg4, objReg2, resul

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
		.botao {background:#ddf1fc;}
		.botao:hover {background:#00a4eb; color:#FFF}
		-->
	</style>	
	
        <body>
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
		<table border = "0" cellspacing = "1" cellpadding = "0" align = "left" width="950" class = "tabela">
		  
                     
			
			
		  <tr>
          
			<td width="214" class = "linha1" valign="top"> 
                    
                    
			<%
			Dim cidade
			if request.QueryString("cidade") = null then
				cidade = ""
			else
				cidade = request.QueryString("cidade")
			end if
			strSql4 = "Select distinct cidade FROM studio order by cidade"
			set objReg4 = cn.execute(strSql4)
			Do while not objReg4.Eof
			%>
                    
				      <a class="botao" style="display:block; height:35px; border:1px solid #105272; width:180px; clear:left;line-height:35px; text-align:left; padding-left:10px; margin-bottom:5px;" href = "lista_turma_alt.asp?cidade=<%=objReg4("cidade")%>"> <%=objReg4("cidade")%> </a>
                      
                          <%
			objReg4.movenext
			Loop
			%>
            </td>
            <td width="733" valign="top" class = "linha1"><div align="left">
            <%
		  strSql2 = "Select t.*, s.studio as desc_curso, s.cidade as cidade_curso From turma t, studio s WHERE t.cod_studio = s.cod_studio and data not like '%2012%' and data not like '%2013%' and s.cidade like '%"&cidade&"%' and t.status = 'A' order by cod_turma desc"
		  'response.Write(strsql2)
		  set objReg = cn.execute(strSql2)
		  Do While not objReg.Eof
			  strsql3 = "SELECT count(*) as quant FROM inscricao WHERE cod_turma = "&objReg("cod_turma")
			  set objReg2 = cn.EXECUTE(strsql3)
			  resul = objReg("vagas")-objReg2("quant")
		  %> 
                      
                      
					
				        <p><a href = "inc_turma.asp?acao=2&codigo=<%=objReg("cod_turma")%>"><%=objReg("titulo")&" - "&resul&" vagas "&objReg("desc_curso")&" "&objReg("cidade_curso")%></a></p>
           
                      
         
		  <%
		  valContaTd = valContaTd + 1
		  objReg.movenext
		  Loop		  							 
%>
 </div></td>
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
Desconecta()
%>
