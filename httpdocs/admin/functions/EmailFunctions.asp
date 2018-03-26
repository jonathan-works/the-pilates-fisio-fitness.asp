<%

function enviaEmailReAgendamento(nomeDestinatario, emailDestinatario, assunto, mensagem)
	'Declaramos as váriaveis a serem utilizadas no script
	Dim AspEmail, servidor, nomeRemetente, emailRemetente, emailRetorno
	
	'Configuramos os dados a serem utilizados no cabeçalho da mensagem
	'nomeDestinatario= nomeCliente
	'emailDestinatario= emailCliente
	nomeRemetente="Autoclean"
	emailRemetente="alan@ddwb.com.br" 'O endereço de e-mail deve ser preenchido com uma conta existente em seu próprio domínio.
	emailRetorno="alan@ddwb.com.br"
	responderPara="alan@ddwb.com.br"
	servidor = "localhost"
	'assunto="Aviso de Alteração de Data"
	'mensagem="Caro Sr(a) "& nomeCliente &", <br> Avisamos que o(s) serviço(s) listado(s) abaixo tiveram suas datas remanejadas: <br><br>
	
	'Serviços &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nova Data
	'<hr/>
	'Serviço 1'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'12/01/2015 15:30'<br>
	'Serviço 2'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'12/01/2015 16:00'<br>
	'Serviço 3'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'12/01/2015 17:00'<br>"
	'servidor="localhost"
	
	'Instancia o objeto na memória
	SET AspEmail = Server.CreateObject("Persits.MailSender")
	'response.write("OK")
	
	'Contfigura o servidor SMTP a ser utilizado
	AspEmail.Host = servidor
	 
	'Configura o Nome do remetente da mensagem
	AspEmail.FromName = nomeRemetente
	 
	'Configura o e-mail do remetente da mensagem que OBRIGATORIAMENTE deve ser um e-mail do seu próprio domínio
	AspEmail.From = emailRemetente
	 
	'Configura o E-mail de retorno para você ser avisado em caso de problemas no envio da mensagem
	AspEmail.MailFrom = emailRemetente  'Desabilitar essa linha caso o servidor esteja configurado para rodar em 64 bits
	 
	 
	'Configura o e-mail que receberá as respostas desta mensagem
	AspEmail.AddReplyTo responderPara
	 
	'Configura os destinatários da mensagem
	AspEmail.AddAddress emailDestinatario, nomeDestinatario
	 
	'Configura para enviar e-mail Com Cópia
	'AspEmail.AddCC "nome0@dominio.com.br", "Nome"
	'AspEmail.AddCC "nome1@dominio.com.br", "Nome"
	'AspEmail.AddCC "nome2@dominio.com.br", "Nome"
	 
	'Configura o Assunto da mensagem enviada
	AspEmail.Subject = assunto
	 
	'Configura o formato da mensagem para HTML
	AspEmail.IsHTML = True
	 
	'Configura o conteúdo da Mensagem
	AspEmail.Body = mensagem
	 
	'Definir porta no caso de envio autenticado
	'AspEmail.Port = 587
	 
	'Utilize este código caso queira enviar arquivo anexo
	'AspEmail.AddAttachment("E:\home\SEU_LOGIN_FTP\Web\caminho_do_arquivo")
	 
	'Para quem utiliza serviços da REVENDA conosco
	'AspEmail.AddAttachment("E:\vhosts\DOMINIO_COMPLETO\httpdocs\caminho_do_arquivo")
	 
	'#Ativa o tratamento de erros
	On Error Resume Next
	 
	'Envia a mensagem
	AspEmail.Send
	 
	'Caso ocorra problemas no envio, descreve os detalhes do mesmo.
	If Err <> 0 Then
		erro = "<b><font color='red'> Erro ao enviar a mensagem.</font></b><br>"
		erro = erro & "<b>Erro.Description:</b> " & Err.Description & "<br>"
		erro = erro & "<b>Erro.Number:</b> "      & Err.Number & "<br>"
		erro = erro & "<b>Erro.Source:</b> "      & Err.Source & "<br>"
		response.write erro
	Else
		response.write "<font color='blue'><b>Mensagem enviada com sucesso para</b></font> " & emailDestinatario
	End If
	 
	'## Remove a referência do componente da memória ##
	SET AspEmail = Nothing
end function

function enviaEmailFinalizacao(nomeDestinatario, emailDestinatario, assunto, mensagem)
	'Declaramos as váriaveis a serem utilizadas no script
	Dim AspEmail, servidor, nomeRemetente, emailRemetente, emailRetorno
	
	'Configuramos os dados a serem utilizados no cabeçalho da mensagem
	'nomeDestinatario= nomeCliente
	'emailDestinatario= emailCliente
	nomeRemetente="Autoclean"
	emailRemetente="alan@ddwb.com.br" 'O endereço de e-mail deve ser preenchido com uma conta existente em seu próprio domínio.
	emailRetorno="alan@ddwb.com.br"
	responderPara="alan@ddwb.com.br"
	servidor = "localhost"
	'assunto="Aviso de Alteração de Data"
	'mensagem="Caro Sr(a) "& nomeCliente &", <br> Avisamos que o(s) serviço(s) listado(s) abaixo tiveram suas datas remanejadas: <br><br>
	
	'Serviços &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nova Data
	'<hr/>
	'Serviço 1'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'12/01/2015 15:30'<br>
	'Serviço 2'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'12/01/2015 16:00'<br>
	'Serviço 3'&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'12/01/2015 17:00'<br>"
	'servidor="localhost"
	
	'Instancia o objeto na memória
	SET AspEmail = Server.CreateObject("Persits.MailSender")
	'response.write("OK")
	
	'Contfigura o servidor SMTP a ser utilizado
	AspEmail.Host = servidor
	 
	'Configura o Nome do remetente da mensagem
	AspEmail.FromName = nomeRemetente
	 
	'Configura o e-mail do remetente da mensagem que OBRIGATORIAMENTE deve ser um e-mail do seu próprio domínio
	AspEmail.From = emailRemetente
	 
	'Configura o E-mail de retorno para você ser avisado em caso de problemas no envio da mensagem
	AspEmail.MailFrom = emailRemetente  'Desabilitar essa linha caso o servidor esteja configurado para rodar em 64 bits
	 
	 
	'Configura o e-mail que receberá as respostas desta mensagem
	AspEmail.AddReplyTo responderPara
	 
	'Configura os destinatários da mensagem
	AspEmail.AddAddress emailDestinatario, nomeDestinatario
	 
	'Configura para enviar e-mail Com Cópia
	'AspEmail.AddCC "nome0@dominio.com.br", "Nome"
	'AspEmail.AddCC "nome1@dominio.com.br", "Nome"
	'AspEmail.AddCC "nome2@dominio.com.br", "Nome"
	 
	'Configura o Assunto da mensagem enviada
	AspEmail.Subject = assunto
	 
	'Configura o formato da mensagem para HTML
	AspEmail.IsHTML = True
	 
	'Configura o conteúdo da Mensagem
	AspEmail.Body = mensagem
	 
	'Definir porta no caso de envio autenticado
	'AspEmail.Port = 587
	 
	'Utilize este código caso queira enviar arquivo anexo
	'AspEmail.AddAttachment("E:\home\SEU_LOGIN_FTP\Web\caminho_do_arquivo")
	 
	'Para quem utiliza serviços da REVENDA conosco
	'AspEmail.AddAttachment("E:\vhosts\DOMINIO_COMPLETO\httpdocs\caminho_do_arquivo")
	 
	'#Ativa o tratamento de erros
	On Error Resume Next
	 
	'Envia a mensagem
	AspEmail.Send
	 
	'Caso ocorra problemas no envio, descreve os detalhes do mesmo.
	If Err <> 0 Then
		erro = "<b><font color='red'> Erro ao enviar a mensagem.</font></b><br>"
		erro = erro & "<b>Erro.Description:</b> " & Err.Description & "<br>"
		erro = erro & "<b>Erro.Number:</b> "      & Err.Number & "<br>"
		erro = erro & "<b>Erro.Source:</b> "      & Err.Source & "<br>"
		response.write erro
	Else
		response.write "<font color='blue'><b>Mensagem enviada com sucesso para</b></font> " & emailDestinatario
	End If
	 
	'## Remove a referência do componente da memória ##
	SET AspEmail = Nothing
end function


%>