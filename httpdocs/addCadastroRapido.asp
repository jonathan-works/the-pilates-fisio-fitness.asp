 <!--#include file="redirect.asp"-->
<!--#include file="admin/conexao.asp"-->
<!--#include file="cdosys.asp"-->
<%
Conecta()
Function gerar_htmlEmail()

stremail="<html> " & _
		"<head> " & _
		"<title>Untitled Document</title> " & _
		"<meta http-equiv=Content-Type content=text/html; charset=utf-8> " & _
		"<style>"&_
		"td { font-family: Verdana, Helvetica, sans-serif; font-size: 10px;  color: #000000}"&_
		"</style>"&_
		"</head> " & _
		"<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0> " & _
		"<table width=600 border=0> " & _
		"  <tr> " & _
		"    <td>" & _
		"<table width=100% border=0 align=center> " 

for each campo in request.Form
			if mid(campo,1,4) = "txt_" or mid(campo,1,5) = "txt1_" then
				nome_form=mid(campo,5,30)
				nome_form=replace(nome_form,"_","")
				inf_form=request.Form(campo)
				inf_form = Replace(inf_form, vbCrLf, "<br>")
		'		response.Write("nome_form: " & nome_form & "<br>")
		'		response.Write("inf_form: " & inf_form & "<br><br>")
		
				'response.Write(nome_form)
				'response.Write("<br><br>")
				IF nome_form <> "confEmail" then
					'Rs_i(nome_form) = inf_form
				end if
		
						stremail=stremail&" <tr>  " & _
										  "          <td width=100 bgcolor=f5f5f5>" & nome_form & "</td> " & _
										  "          <td width=400>" & inf_form & "</td> " & _
										  "        </tr> "
			end if
		next
	
	
	
	'rs_i("cod_turma") = cod_turma
	'Rs_i.update
	
	stremail=stremail & "      </table> " & _
					"      <p>&nbsp;</p> " & _
					"      </td> " & _
					"  </tr> " & _
					"</table> " & _
					"</body> " & _
					"</html>"

gerar_htmlEmail = stremail

end Function

Function addAspas(var_string)

	if (varType(var_string) = 8 or var_string = "") Then
		
		var_string = "'"&var_string&"'"
	
	end if

	addAspas = var_string

End Function

Dim msg_alert

Dim Nome, Email, Celular, Mensagem


'response.Write("INSERT INTO Cadastro_Rapido (Nome, Email, Celular, Mensagem) VALUES ("& Nome &","& Email &","& Celular &","&Mensagem&")")
Nome = request.Form("txt1_Nome")
Email = request.Form("txt1_Email")
Celular = request.Form("txt1_Celular")
Mensagem = request.Form("txt1_Mensagem")

'trata dados celular

if (inStr(Celular,"-") <> 0) Then
Celular = replace(Celular,"-","")
end if

Nome = addAspas(Nome)
Email = addAspas(Email)
Celular = addAspas(Celular)
Mensagem = addAspas(Mensagem)

'cn.execute("INSERT INTO Cadastro_Rapido (Nome, Email, Celular, Mensagem) VALUES ("& Nome &","& Email &","& Celular &","&Mensagem&")")


msg_alert = "Seus dados foram enviados com suceso!"


'-----------------------------
if (request.Form("nome_form") = "form_contatoHome") Then

msg_alert = "Seu contato foi enviado com suceso!"

'enviar E-mail

from_email = request.Form("txt1_Email")

to_email="contato@thepilatesfisiofitness.com.br"
'to_email="alan@ddwb.com.br"
assunto="Formulário - Fisio Fitness Pilates"

stremail = gerar_htmlEmail()

FROM_Servidor = "contato@thepilatesfisiofitness.com.br" ' este email tem que ser do dominio do site
	
Proc_Email FROM_Servidor, from_email,to_email,assunto,stremail,"cristiano@ddwb.com.br"

end if
'--------------------------------
%>

<!-- TAGS ANALYTHICS -->

<%
Response.Write("<script>alert('"&msg_alert&"'); window.location='email_contato.asp';</script>")

%>