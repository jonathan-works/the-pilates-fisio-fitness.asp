<%
Response.Charset = "UTF-8"
'Response.ContentType = "text/plain"
Session.Codepage = 65001
Session.LCID = 1046 

SUB Proc_Email_Report(FROM_Servidor, FROM,to_email,Subject,HtmlBody,copia)
	dim sEnviaRecebe, sSenha, sResponder, sAssunto, sMensagem, objCDOSYSMail, objCDOSYSCon
	  
	' Senha da conta utilizada para envio, necessária pela obrigatoriedade de autenticação.
	sSenha = "thefitpilates15@"  
	 
	' Cria o objeto CDOSYS
	Set objCDOSYSMail = Server.CreateObject("CDO.Message")
	 
	' Cria o objeto para configuração do SMTP
	Set objCDOSYSCon = Server.CreateObject ("CDO.Configuration")
	
	objCDOSYSMail.BodyPart.Charset = "utf-8"
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "smtp.pilatesfisiofitness.com.br"
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpserverport")= 587
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 30
	 
	objCDOSYSCon.Fields("http://schemas.microsoft.com/cdo/configuration/sendusername")= "contato@pilatesfisiofitness.com.br"
	 
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
		objCDOSYSMail.BCC = copia
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



Function PrepareReport(injectionType)
    'Build the messege
    Dim MessageBody
    MessageBody="<h1>One Sql Injection Attempt Was Blocked! </h1><br/>"
    MessageBody=MessageBody & "Attack Time: " & FormatDateTime(Now,3) & "<br/>"
    MessageBody=MessageBody & "Attaker IP Address: " & Request.ServerVariables("REMOTE_HOST") & "<br/>"
    MessageBody=MessageBody & "Injection Type: " & injectionType & "<hr size='1'/><br/>"
    MessageBody=MessageBody & "More Details Information: <br/>"
    
    MessageBody=MessageBody&"<table width='100%'>"
    MessageBody=MessageBody& "<tr><td colspan='2'><h2>Form Variables</h2></td></tr>"
    'List Form Data
    For Each s in Request.Form
        MessageBody=MessageBody&"<tr>"
        MessageBody=MessageBody&"   <td>" & s & "</td>"
        MessageBody=MessageBody&"   <td>" & Request.Form(s) & "</td>"
        MessageBody=MessageBody&"<tr>"
    Next
    MessageBody=MessageBody& "<tr><td colspan='2'><h2>QueryString Variables</h2></td></tr>"
    For Each s in Request.QueryString
        MessageBody=MessageBody&"<tr>"
        MessageBody=MessageBody&"   <td>" & s & "</td>"
        MessageBody=MessageBody&"   <td>" & Request.QueryString(s) & "</td>"
        MessageBody=MessageBody&"<tr>"
    Next
 
    MessageBody=MessageBody&"<tr><td colspan='2'><h2>Cookie Variables</h2></td></tr>"
    For Each s in Request.Cookies
        MessageBody=MessageBody&"<tr>"
        MessageBody=MessageBody&"   <td>" & s & "</td>"
        MessageBody=MessageBody&"   <td>" & Request.Cookies(s) & "</td>"
        MessageBody=MessageBody&"<tr>"
    Next
    
    MessageBody=MessageBody&"</table><br/>"
    MessageBody=MessageBody & "Script Page: " & GetCurrentPageUrl() & "<br/>"
    MessageBody=MessageBody & "Referer Page: " & GetRefererPageUrl() &  "<br/><br/>Automated Generated Report"
	
	'response.Write(MessageBody)
	  
	Proc_Email_Report "contato@pilatesfisiofitness.com.br", "contato@pilatesfisiofitness.com.br","cristiano@ddwb.com.br","Sql Injection Attempt Was Detected by " & injectionType & "!",MessageBody,"elaine.morozino@gmail.com"
	  
End Function

Function GetCurrentPageUrl()
    dim domainname,filename,querystring
	domainname = GetCurrentServerName() 
    filename = Request.ServerVariables("SCRIPT_NAME") 
    querystring = Request.ServerVariables("QUERY_STRING") 
    GetCurrentPageUrl= domainname & filename & "?" & querystring 
End Function
 
Function GetRefererPageUrl()
    GetRefererPageUrl= Request.ServerVariables("HTTP_REFERER") 
End Function
 
Function GetCurrentServerName()
	dim prot, https, domainname
    prot = "http" 
    https = lcase(request.ServerVariables("HTTPS")) 
    if https <> "off" then prot = "https" 
    domainname = Request.ServerVariables("SERVER_NAME") 
    GetCurrentServerName=prot & "://" & domainname 
End Function
 
Function GetPageNameFromPath(strPath)
    strPos= len(strPath)-InStrRev(strPath,"/")
    pageName=right(strPath,strPos)
    GetPageNameFromPath=pageName
End Function
 
Function GetCurrentPageName()
    scriptPath = Request.ServerVariables("SCRIPT_NAME") 
    pageName=GetPageNameFromPath(scriptPath)
    GetCurrentPageName=pageName
End Function


Dim BlackList, ErrorPage
BlackList = Array("=","#","$","%","^","&","*","|",";",_
                  "<",">","'","""",_
                  "--", "/*", "*/", "@@",_
                  "cursor","exec","execute",_
                  "nchar", "varchar", "nvarchar", "iframe"_
                  )

'BlackList = Array("=","#","$","%","^","&","*","|",";",_
'                  "<",">","'","""","(",")",_
'                  "--", "/*", "*/", "@@",_
'                  "cursor","exec","execute",_
'                  "nchar", "varchar", "nvarchar", "iframe"_
'                  )				  
				  
'Note: We can include following keyword to make a stronger scan but it will also 
'protect users to input these words even those are valid input
'  "!", "char", "alter", "begin", "cast", "create", 
 
'Populate the error page you want to redirect to in case the check fails.
ErrorPage = "Erro ao realizar cadastro"

dim CookieExceptionList
 
CookieExceptionList = Array("""","(",")")
	
Function IsExceptionList(str,varType)
	'If(varType="cookie") then
		For Each item in CookieExceptionList
			If(item=str) then
				IsExceptionList=True
				Exit Function
			End If
		Next
	'End If
	IsExceptionList=False
End Function
               
Function CheckStringForSQL(str,varType) 
  On Error Resume Next 
  Dim lstr 
  ' If the string is empty, return false that means pass
  If ( IsEmpty(str) ) Then
    CheckStringForSQL = false
    Exit Function
  ElseIf ( StrComp(str, "") = 0 ) Then
    CheckStringForSQL = false
    Exit Function
  End If
  
  	

  
  lstr = LCase(str)
  ' Check if the string contains any patterns in our black list
  For Each s in BlackList
    If(IsExceptionList(s,varType)=False) then
        If ( InStr (lstr, s) <> 0 ) Then
          CheckStringForSQL = true
		  response.Write("erro caracter: " & s)
          Exit Function
        End If
    End If
  Next
  CheckStringForSQL = false
End Function 

dim s

if not session("logadoLabassaniAdmin") or session("logadoLabassaniAdmin") = "" then
	For Each s in Request.Form
	  If ( CheckStringForSQL(Request.Form(s),"form") ) Then
		PrepareReport("Post Varibale")
		' Redirect to an error page
		Response.write(ErrorPage)
		response.End()
	  End If
	Next
end if

Dim cnStr,cn

Sub Conecta() 
	cnStr = "Provider=SQLOLEDB.1;SERVER=177.66.168.199; DATABASE=ThePilates_; UID=junior; PWD=wsws8443;"
	Set cn = Server.CreateObject("ADODB.Connection") 
	cn.Open cnStr
End Sub

Sub Desconecta()
	cn.close
	set cn=nothing 
End Sub



Function sqlInjection()
dim StrRuim, j, item
                'Palavras que serão barradas caso encontradas nos request
                if session("cod_usuario") > 0 then
                               StrRuim = array("--", ";", "/*", "*/", "@@",_
                  "char", "nchar", "varchar", "nvarchar",_
                  "alter", "begin", "create", "cursor",_
                  "declare", "delete", "drop", "end", "exec",_
                  "execute", "fetch", "insert", "kill", "open",_
                  "select", "sys", "sysobjects", "syscolumns",_
                  "table", "update")
                else
                               StrRuim = array("--", ";", "/*", "*/", "@@",_
                  "char", "nchar", "varchar", "nvarchar",_
                  "alter", "begin", "create", "cursor",_
                  "declare", "delete", "drop", "end", "exec",_
                  "execute", "fetch", "insert", "kill", "open",_
                  "select", "sys", "sysobjects", "syscolumns",_
                  "table", "update")
                end if
                
                ' Verificando o que é passado pelo request.queryString
                For each item in request.QueryString
                               For j = lbound(StrRuim) to ubound(StrRuim)
                                               If instr(lcase(Request.QueryString(item)), lcase(StrRuim(j))) > 0 then
                                                               Response.Write("Erro de SQL Injection - IP: " & StrRuim(j)& " - " & Request.ServerVariables("REMOTE_ADDR"))
                                                               Response.End()
                                               End if
                               Next
                Next
                
                'Verificando o que é enviado por request.form
                For each item in request.form
                               For j = lbound(StrRuim) To ubound(StrRuim)
                                               If instr(lcase(Request.form(item)), lcase(StrRuim(j))) > 0 then
                                                               Response.Write("Erro de SQL Injection - IP: " & StrRuim(j)& " - " & Request.ServerVariables("REMOTE_ADDR"))
                                                               Response.End()
                                               End If
                               Next
                Next
End Function

if session("logadoLabassaniAdmin") = false OR session("logadoLabassaniAdmin") = "" then
	'sqlInjection()
end if


Sub Proc_listacombocodigoAjax(strsql,valor,campo,codigo)
	dim combo, rscombo
	set rscombo = cn.execute(strsql)
	
		Do While not rscombo.eof
		   combo = "<option value='" & rscombo(valor) & "'"  
		   If IsNumeric(codigo) Then codigo=Int(codigo) End If
		   If codigo = rscombo(valor) Then 
				combo = combo & " selected" 
		   End If
		   combo = combo &" >"& server.HTMLEncode(rscombo(campo)) &"</option>"
		   response.Write(combo)
		rscombo.movenext
		Loop
				   
	set rscombo=nothing
End Sub

Sub Tamanho_Imagem(Jpeg, Width, Height)
	
	Dim aux_Width, aux_Height
	Dim Height_VO
	Dim Width_VO
	Dim largura_invalida, altura_invalida
	
	Height_VO = Height
	Width_VO = Width
	
	aux_Width = 0
	aux_Height = 0
	
	largura_invalida = false
	altura_invalida = false
							
	if Jpeg.OriginalWidth > Width then
		largura_invalida = true
	end if
							
	if Jpeg.OriginalHeight > Height then
		altura_invalida = true
	end if
		
	if (Jpeg.OriginalHeight - Height) > (Jpeg.OriginalWidth - Width) Then
		if altura_invalida then
			Do While aux_Width >= Width_VO or aux_Width = 0
				aux_Height = Height			
				aux_Width = (Height * Jpeg.OriginalWidth)/Jpeg.OriginalHeight
				Height = Height -1
			Loop		
		end if
	else						
		if largura_invalida then
			While aux_Height >= Height_VO or aux_Height = 0 
				aux_Width = Width
				aux_Height = (Width * Jpeg.OriginalHeight)/Jpeg.OriginalWidth
				Width = Width -1
'				response.Write("aux_Width " & aux_Width & "<br>")
'				response.Write("aux_Height " & aux_Height & "<br>")
'				response.Write("Width " & Width & "<br><br>")
			Wend
		end if
	end if
	
	if altura_invalida or largura_invalida Then
		Jpeg.Width = aux_Width
		Jpeg.Height = aux_Height
	end if
	
End Sub


Sub GA()
%>

	<script type="text/javascript">
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-34510263-1']);
      _gaq.push(['_trackPageview']);
    
      (function() {
        var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
        ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
      })();  
    </script>

<%
End Sub
%>