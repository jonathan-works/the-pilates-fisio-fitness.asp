<%
'Class Envio_Emails

'Classe para o envio de E-mails do site em geral.
'---------------------------------------------------------------------------------------------
'---------------------------------------------------
'--------- GERA HTML PARA EMAIL DE COMPRA ----------
'---------------------------------------------------

'Function: gerar_htmlEmail2
'Parameters: status_cartao; Define se o pagamento via cartão foi efetuado ou não, para pagamentos ainda não pagos passar como "Aguardando"
'			 cod_inscricao; Código da inscrição que serão usados no SELECT para pegar as informação (e.g nome, telefone email) do banco de dados.
'Description: Gera o Html com as informações da inscrição feitas. Esse HTML será usado no envio de e-mail.

Function gerar_htmlEmail2(status_cartao, cod_inscricao)
dim sql_email, rs_email, sql_emailTurma, rs_emailTurma, sql_emailCurso, rs_emailCurso, sql_curso, rs_curso

Dim curso, turma, studio

		
		if id <> "" Then
		cod_inscricao = id
		end if
		
		
		sql_email = "SELECT * FROM Inscricao WHERE Cod_Inscricao = "& cod_inscricao
		'response.Write(sql_email)
		if cod_inscricao <> "" Then
		
		set rs_email = cn.execute(sql_email)
		
		sql_emailTurma = "SELECT * FROM Turma WHERE Cod_Turma = "& rs_email("cod_turma")
		if not rs_email.eof Then
		set rs_emailTurma = cn.execute(sql_emailTurma)
		
		if not rs_emailTurma.eof Then
		sql_emailCurso = "SELECT * FROM Studio WHERE Cod_Studio = "& rs_emailTurma("cod_studio")
		
		set rs_emailCurso = cn.execute(sql_emailCurso)		
		end if
		
		if not rs_emailTurma.eof then
			sql_curso = "SELECT * FROM curso WHERE cod_curso = "& rs_emailTurma("cod_curso")
			set rs_curso = cn.execute(sql_curso)
		end if
		
		
		
		if status_cartao = "Aguardando" Then 
		status_cartao = "Aguardando"
		 else 
		 status_cartao = rs_email("tipodepagamento") 
		 end if
		
		if not rs_curso.eof then
			curso = rs_curso("descricao")
		end if
		
		if not rs_emailCurso.eof Then 
		studio = rs_emailCurso("studio")
		end if
		
		if not rs_emailTurma.eof Then 
		turma = rs_emailTurma("titulo")
		end if
		
		end if
		end if
		
		Dim array_campo(13), array_valor(13)
		'Nomes dos campos
		array_campo(0) = "Estudio"
		array_campo(1) = "Curso"
		array_campo(2) = "Turma"		
		array_campo(3) = "Nome"
		array_campo(4) = "E-mail"
		array_campo(5) = "Telefone"
		array_campo(6) = "Celular"
		array_campo(7) = "Endereço"
		array_campo(8) = "CEP"
		array_campo(9) = "CPF"
		array_campo(10) = "Tipo de Pagamento"
		array_campo(11) = "Formação"
		array_campo(12) = "Status"
		array_campo(13) = "Código inscrição"
		
		
		'Valores dos campos		
		array_valor(0) = studio
		array_valor(1) = curso
		array_valor(2) = turma
		array_valor(3) = rs_email("nome")
		array_valor(4) = rs_email("email")
		array_valor(5) = rs_email("Tel")
		array_valor(6) = rs_email("cel")
		array_valor(7) = rs_email("endereco")
		array_valor(8) = rs_email("CEP")
		array_valor(9) = rs_email("CPF")
		array_valor(10) = rs_email("tipodepagamento")
		array_valor(11) = rs_email("formacao")
		array_valor(12) = status_cartao
		array_valor(13) = rs_email("cod_inscricao")
		
				
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
				
				
				for i=0 to ubound(array_campo)
				
				stremail=stremail&"<tr>  " & _
						  "        <td width=100 bgcolor=f5f5f5>" & array_campo(i) & "</td> " & _
						  "        <td width=400>" & array_valor(i) & "</td> " & _
						  "        </tr> "
						  
				next				  
	
	stremail=stremail & "      </table> " & _
					"      <p>&nbsp;</p> " & _
					"      </td> " & _
					"  </tr> " & _
					"</table> " & _
					"</body> " & _
					"</html>"

gerar_htmlEmail2 = stremail

end Function

'-------------------- FIM ---------------------------
'--------- GERA HTML PARA EMAIL DE COMPRA ----------
'-------------------- FIM ---------------------------
'---------------------------------------------------------------------------------------------

'---------------------------------------------------------------------------------------------
'---------------------------------------------------
'--------- GERA HTML PARA EMAIL DO USUARIO ---------
'---------------------------------------------------

'Function: gerar_htmlEmail_Usuario
'Parameters: cod_inscricao; Código da inscrição para que o boleto seja gerado para o usuário correto.
'			 forma_pagamento; Passar "boleto" para mensagem e link de boleto e "cartao para mensagem e link de comprovante."
'Description: Gera o Html para enviar o link do boleto. Esse HTML será usado no envio de e-mail para o cliente.

Function gerar_htmlEmail_Usuario(cod_inscricao, forma_pagamento)

Dim msg_email, link_boleto, img_logo, email_site

img_logo = "http://"&request.ServerVariables("HTTP_HOST")&"/img/logo.png"

If forma_pagamento = "Boleto" or forma_pagamento = "Cheque" Then

	msg_email = "Sua inscri&ccedil;&atilde;o est&aacute; quase completa, efetue o pagamento do boleto que se encontra no link abaixo para que ela seja finalizada:"
	
	link_pagamento = "http://"&request.ServerVariables("HTTP_HOST")&"/boleto/itau/boleto-itau.asp?id="&cod_inscricao
	
ElseIf replace(forma_pagamento,"ã","a") = "Cartao" Then

	msg_email = "Sua inscri&ccedil;&atilde;o est&aacute; finalizada. Para ver seu comprovante acesse o link abaixo:"

	link_pagamento = "http://"&request.ServerVariables("HTTP_HOST")&"/comprovante.asp?id="&cod_inscricao
	
End If

email_site = "contato@pilatesfisiofitness.com.br"

stremail="<html> " & _
		"<head> " & _
		"<title>Untitled Document</title> " & _
		"<meta http-equiv=Content-Type content=text/html; charset=utf-8> " & _
		"<style>"&_
		"td { font-family: Verdana, Helvetica, sans-serif; font-size: 16px;  color: #000000}"&_
		"</style>"&_
		"</head> " & _
		"<body leftmargin=0 topmargin=0 marginwidth=0 marginheight=0> " & _
		"<table width=600 border=0> " & _
		"  <tr> " & _
		"    <td>" & _
		"<table width=100% border=0 align=center> " 
		
		stremail=stremail&"<tr><td><img  src='"& img_logo &"'></td></tr>"
				
		
		stremail=stremail&"<tr>  " & _
						  "        <td>" & msg_email & "</td> " & _
						  "        </tr> "
						  
		stremail = stremail&"<tr><td><br><a href='"&link_pagamento&"'>" & link_pagamento & "</a></td></tr>"

 
		stremail = stremail&"<tr><td bgcolor='#FFFFFF' style=' border-bottom:3px solid #09F;'><br>Em caso de d&uacute;vidas entre em contato conosco.<br> Telefone:(11)3297-2335<br> Whatsapp:(11)96781-1979<br> Email:<a href='mailto:"&email_site&"' >"&email_site&"</a>"


stremail=stremail & "      </table> " & _
					"      <p>&nbsp;</p> " & _
					"      </td> " & _
					"  </tr> " & _
					"</table> " & _
					"</body> " & _
					"</html>"


	gerar_htmlEmail_Usuario = stremail


End Function

'response.Write(gerar_htmlEmail_Usuario(1518,"Boleto"))

'-------------------- FIM ---------------------------
'--------- GERA HTML PARA EMAIL DO USUARIO ----------
'-------------------- FIM ---------------------------
'---------------------------------------------------------------------------------------------


%>