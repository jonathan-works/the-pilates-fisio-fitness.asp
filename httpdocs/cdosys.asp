<%



SUB Proc_Email(FROM_Servidor, FROM,to_email,Subject,HtmlBody,copia)
	dim sEnviaRecebe, sSenha, sResponder, sAssunto, sMensagem, objCDOSYSMail, objCDOSYSCon
	  
	' Senha da conta utilizada para envio, necessária pela obrigatoriedade de autenticação.
	sSenha = "thefitpilates15@"  
	 
	' Cria o objeto CDOSYS
	Set objCDOSYSMail = Server.CreateObject("CDO.Message")
	 
	' Cria o objeto para configuração do SMTP
	Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration")
	
	objCDOSYSMail.BodyPart.Charset = "utf-8"
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.thepilatesfisiofitness.com.br"
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport")= 587
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername")= "contato@thepilatesfisiofitness.com.br"
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword")= sSenha
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	 
	objCDOSYSCon.Fields.update
	 
	' Atualiza a configuração do CDOSYS para envio do e-mail
	Set objCDOSYSMail.Configuration = objCDOSYSCon
	 
	' Configura o remetente(FROM)
	objCDOSYSMail.From = FROM_Servidor
 
	' Configura o destinatário(TO)
	objCDOSYSMail.To = to_email
	 
	' Configura o Reply-To(Responder Para)
	objCDOSYSMail.ReplyTo = FROM
	
	if copia <> "" then
		objCDOSYSMail.BCC = copia'&";philipe@ddwb.com.br"
	end if
	 
	' Configura o assunto(SUBJECT)
	objCDOSYSMail.Subject = Subject
	 
	' Para enviar mensagens no formato HTML, altere o TextBody para HtmlBody
	objCDOSYSMail.HtmlBody = HtmlBody
	 
	' Enviando o email:
	objCDOSYSMail.Send
	 	 
	' Para assegurar uma boa prática de programação, ao final da execução é necessário destruir os objetos previamente criados:
	Set objCDOSYSMail = Nothing
	Set objCDOSYSCon = Nothing
	 	
END SUB


SUB Proc_Email_Contato(FROM_Servidor, FROM,to_email,Subject,HtmlBody)
	Dim objCDOSYSMail, objCDOSYSCon
	'cria o objeto para o envio de e-mail
	Set objCDOSYSMail = Server.CreateObject("CDO.Message")
	
	
	objCDOSYSMail.BodyPart.Charset = "utf-8"
	'cria o objeto para configuração do SMTP
	Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration")
	'SMTP
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
	'porta do SMTP
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 587
	'porta do CDO
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	'timeout
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30
	
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername")= "contato@pilatesfisiofitness.com.br"
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword")= sSenha
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	 
	
	objCDOSYSCon.Fields.update
	'atualiza a configuração do CDOSYS para o envio do e-mail
	Set objCDOSYSMail.Configuration = objCDOSYSCon
	'e-mail do remetente
	objCDOSYSMail.From = "contato@pilatesfisiofitness.com.br"
	'objCDOSYSMail.From = "rafael@ddwb.com.br"
	
	'objCDOSYSMail.cc = "cristiano@ddwb.com.br"
	'e-mail do destinatário
	objCDOSYSMail.To = to_email
	objCDOSYSMail.cc = "contato@pilatesfisiofitness.com.br"
	objCDOSYSMail.ReplyTo = FROM
'	objCDOSYSMail.To = "cristiano@ddwb.com.br"
	'assunto da mensagem
	objCDOSYSMail.Subject = Subject
	'conteúdo da mensagem
	objCDOSYSMail.HtmlBody = HtmlBody
	'para envio da mensagem no formato html altere o TextBody para HtmlBody
	'objCDOSYSMail.HtmlBody = "Teste do componente CDOSYS"
	'objCDOSYSMail.fields.update
	'envia o e-mail
	objCDOSYSMail.Send
	'destrói os objetos
	Set objCDOSYSMail = Nothing
	Set objCDOSYSCon = Nothing
END SUB


SUB Proc_Email_Copia(FROM,to_email,Subject,HtmlBody,cc_email)
	Dim objCDOSYSMail, objCDOSYSCon
	'cria o objeto para o envio de e-mail
	Set objCDOSYSMail = Server.CreateObject("CDO.Message")
	
	
	objCDOSYSMail.BodyPart.Charset = "utf-8"
	'cria o objeto para configuração do SMTP
	Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration")
	'SMTP
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
	'porta do SMTP
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 587
	'porta do CDO
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	'timeout
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30
		objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername")= "contato@pilatesfisiofitness.com.br"
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendpassword")= sSenha
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
	
	objCDOSYSCon.Fields.update
	'atualiza a configuração do CDOSYS para o envio do e-mail
	Set objCDOSYSMail.Configuration = objCDOSYSCon
	'e-mail do remetente
	objCDOSYSMail.From = "contato@pilatesfisiofitness.com.br"
	'objCDOSYSMail.From = "rafael@ddwb.com.br"
	
	'objCDOSYSMail.cc = "cristiano@ddwb.com.br"
	'e-mail do destinatário
	objCDOSYSMail.To = to_email
	objCDOSYSMail.cc = cc_email
	objCDOSYSMail.ReplyTo = FROM
'	objCDOSYSMail.To = "cristiano@ddwb.com.br"
	'assunto da mensagem
	objCDOSYSMail.Subject = Subject
	'conteúdo da mensagem
	objCDOSYSMail.HtmlBody = HtmlBody
	'para envio da mensagem no formato html altere o TextBody para HtmlBody
	'objCDOSYSMail.HtmlBody = "Teste do componente CDOSYS"
	'objCDOSYSMail.fields.update
	'envia o e-mail
	objCDOSYSMail.Send
	'destrói os objetos
	Set objCDOSYSMail = Nothing
	Set objCDOSYSCon = Nothing
END SUB
%>
