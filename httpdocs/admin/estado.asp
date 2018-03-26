<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file = "admin/conexao.asp"-->
<%Conecta()%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pilates</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.style4 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 11px;
}
.style6 {font-size: 15px}
.style5 {
	font-size: 14px;
	font-weight: bold;
}
.style8 {font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
}
-->
</style></head>

<body>
<div align="center">
  <table width="1000" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="148" valign="top" background="fundotopo.jpg"><!--#include file="topo.asp"--></td>
    </tr>
    <tr>
      <td><img src="banner1.jpg" width="1000" height="106" /></td>
    </tr>
    <tr>
      <td bgcolor="#f0f0f0"><table width="1000" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="cursos.jpg" width="1000" height="63" /></td>
        </tr>
        <tr>
          <td valign="top"><div align="center">
            <table width="932" height="32" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td valign="top"><p></p></td>
                </tr>
              <tr>
                <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td valign="middle">
                    <%
					  uf = request.QueryString("uf")
					  SET rs = cn.EXECUTE("SELECT c.*,u.descricao as uf_desc FROM curso c,uf u WHERE c.cod_uf = "&uf&" AND c.cod_uf = u.cod_uf")
					  DO WHILE NOT rs.EOF
						descricao = rs("descricao")
						set rsa = cn.EXECUTE("SELECT * FROM turma WHERE cod_curso ="&rs("cod_curso"))
						DO WHILE NOT rsa.EOF
							set rs2 = cn.EXECUTE("SELECT count(*) as quant FROM inscricao WHERE cod_turma = "&rsa("cod_turma"))
						    resul = rsa("vagas")-rs2("quant")				
					%>
							<p align="left" class="style3"><%=rsa("titulo")&" - "&resul&" vagas em aberto:"&rsa("datas")%></p>
					<%
						rsa.MOVENEXT
						LOOP
	  
					  %>                    
                      <div align="left">
                      <p class="style3"><a href="inscreva-se.asp"></a></p>
                      
                      <!--LOCAL-->
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                          <td width="63%"><div align="left">
                            <table width="287" height="158" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td colspan="2" valign="top" background="qd.gif" style="padding:15px"><p align="left" class="style4 style5"><%=rs("curso")&" "&rs("cidade")&" - "&rs("uf_desc")%></p>
                                  <p align="left" class="style3"><%=rs("endereco")%>, <%=rs("numero")&" "%><%if rs("compl") <> "" then response.write(rs("compl")) end if%> – <%=rs("bairro")%> </p>
                                  <p align="left" class="style3">Tels:<%=rs("tel1")%><%if rs("tel2") <> "" then response.write("/"&rs("tel2")) %></p>
								  </td>
                              </tr>
                            </table>
                          </div></td>
                          <td width="37%"><a href="inscreva-se.asp?curso=<%=rs("cod_curso")%>"><img src="increva-se.jpg" width="216" height="48" border="0" /></a></td>
                        </tr>
                      </table>                      
                      <br />
 
                    </div><br>
                    
                      <%
					  rs.MOVENEXT
					  LOOP
					  %>
					
	
                    </td>                       
                    <td width="1" valign="top">
                    <!--#include file = "mapa.asp"-->
                    </td>
                  </tr>
                </table></td>
              </tr>
            </table>
          </div></td>
        </tr>
        <tr>
          <td><img src="linha.jpg" width="1000" height="26" /></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td><img src="baixo.jpg" width="1000" height="79" /></td>
    </tr>
  </table>
</div>


