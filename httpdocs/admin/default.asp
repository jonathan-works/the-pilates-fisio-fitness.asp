<%
Option Explicit

Dim valContaReg,valContador,Passo
%>
<!--#include file = "div_top.asp"-->
<!--#include file = "conexao.asp"-->
<%
	sqlInjection()
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
			
		strSql = "Select cod_usuario, Login, Senha From Usuario "
		strSql = strSql & "Where Login = '" & strUsuario & "' And Senha = '" & strSenha & "'" 
		Conecta()
		Set objReg = cn.Execute(strSql)		
				
		'response.Write(strSql)
		'response.End()
		If objReg.Eof Then
			session("logadoLabassaniAdmin") = False
			Response.Redirect("default.asp")
		Else
			session("cod_usuario") = objReg("cod_usuario")
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
	background-color: #FFF;
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
    
          <form name="frm_login" id="frm_login" method="post" action="default.asp?passo=1">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td bgcolor="#E8F6FF" height="112" style="background-image:url(../img/bg-new.jpg); background-repeat:repeat-x"><div align="center"><h1><img src="../img/logo.jpg" width="373" height="112"><br>
                  </h1>
                </div>
                  <table border="0" cellspacing="0" cellppadding="0" align="center">
                    <tr> 
                      <td height="30" align="left" valign="middle"> <div align="right"><font color="#000"> <b>Usu&aacuterio: 
                          </b></font> </div></td>
                      <td height="30" align="left" valign="middle"> <div align="right"> 
                          <input type="text" name="txt_usuario" id="txt_usuario">
                        </div></td>
                    </tr>
                    <tr> 
                      <td height="30" align="left" valign="middle"> <div align="right"><font color="#000"> <b>Senha: 
                          </b></font> </div></td>
                      <td height="30" align="left" valign="middle"> <div align="right"> 
                          <input type="password" name="txt_senha" id="txt_senha">
                        </div></td>
                    </tr>
                    <tr>
                      <td height="10" align="left" valign="middle">&nbsp;</td>
                      <td height="10" align="left" valign="middle">&nbsp;</td>
                    </tr>
                    <tr>
                      <td align="left" valign="middle">&nbsp;</td>
                      <td align="left" valign="middle"><input type="submit" name="sub_logar" id="sub_logar" value="Logar" style="background:#093; color:#FFF; padding:10px; cursor:pointer;"></td>
                    </tr>
                  </table>
                 
                  <br></td>
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
