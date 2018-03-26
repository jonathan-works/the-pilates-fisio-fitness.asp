<%
Option Explicit

Dim valContaReg,valContador,Passo
%>
<!--#include file = "div_top.asp"-->
<!--#include file = "conexao.asp"-->
<%
	session("logadoLabassaniAdmin") = False
	Dim valPasso
	Dim strSql, strUsuario, strSenha
	Dim objReg
	
	valContaReg = 0
	valContador = 0
	
	strUsuario = Request.Form("txt_usuario")
	strSenha = Request.Form("txt_senha")
	
	strUsuario = Replace(strUsuario, "'" , "+++")
	strSenha = Replace(strSenha, "'" , "+++")
	
	Passo = Request.QueryString("passo")
	
	If Passo = "1" Then
			
		strSql = "Select Login, Senha From Usuario "
		strSql = strSql & "Where Login = '" & strUsuario & "' And Senha = '" & strSenha & "'" 
		Conecta()
		Set objReg = cn.Execute(strSql)		
				
		If objReg.Eof Then
			session("logadoLabassaniAdmin") = False
			Response.Redirect("default.asp")
		Else
			session("logadoLabassaniAdmin") = True
			Response.Redirect("default1.asp")
		End If
		Desconecta()

	End If
		
%>
<html>
	<head>
		<title>Admin</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"><style type="text/css">
<!--
body {
	background-color: #000000;
}
-->
</style></head>
	<style type="text/css">
		<!--
	A:active {color: #ffffff; text-decoration: none}
	A:link {color: #ffffff; text-decoration: none}
	A:visited {color: #ffffff; text-decoration: none}
	A:hover {color: #c0c0c0; text-decoration: none}
	--></style>
	<body scroll="no" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
		
<div align="center"></div>
<div align="center">
  <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td><div align="center">
          <div align="center"></div>
          <form name="frm_login" id="frm_login" method="post" action="default.asp?passo=1">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#333333" height="150"><div align="center"><h1>ADMIN</h1><br>
                    <br>
                  </div>
                  <table border="0" cellspacing="0" cellppadding="0" align="center">
                    <tr> 
                      <td> <div align="right"><font color="#FFFFFF"> <b>Usu&aacuterio: 
                          </b></font> </div></td>
                      <td> <div align="right"> 
                          <input type="text" name="txt_usuario" id="txt_usuario">
                        </div></td>
                    </tr>
                    <tr> 
                      <td> <div align="right"><font color="#FFFFFF"> <b>Senha: 
                          </b></font> </div></td>
                      <td> <div align="right"> 
                          <input type="password" name="txt_senha" id="txt_senha">
                        </div></td>
                    </tr>
                  </table>
                  <table border="0" cellspacing="0" cellppadding="0" align="center">
                    <tr> 
                      <td> <div valign="middle" align="center"> 
                          <input type="submit" name="sub_logar" id="sub_logar" value="Logar">
                        </div></td>
                    </tr>
                  </table></td>
              </tr>
            </table>
          </form>
          <div align="center"></div>
        </div></td>
    </tr>
  </table>
  
</div>
	</body>
</html>
