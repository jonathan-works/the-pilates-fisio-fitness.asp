<%
URL = Request.ServerVariables("SERVER_NAME") 
PAGINA = request.ServerVariables("SCRIPT_NAME")
uf = mid(request.QueryString("uf"),1,2)
id = request.QueryString("id")

if uf <> "" then
	pagina = pagina & "?uf="&uf
	'response.Write(pagina)
	'response.End()
end if

if id <> "" then
	pagina = pagina & "?id="&id
	'response.Write(pagina)
	'response.End()
end if

Select Case URL 
Case "www.fisiofitnesspilates.com" 
	if pagina = "" then
		Response.Status="301 Moved Permanently" 
		Response.AddHeader "Location", "http://www.pilatesfisiofitness.com.br/"
	else
		Response.Status="301 Moved Permanently" 
		Response.AddHeader "Location", "http://www.pilatesfisiofitness.com.br" & pagina
	end if
Case "fisiofitnesspilates.com" 
	if pagina = "" then
		Response.Status="301 Moved Permanently" 
		Response.AddHeader "Location", "http://www.pilatesfisiofitness.com.br/"
	else
		Response.Status="301 Moved Permanently" 
		Response.AddHeader "Location", "http://www.pilatesfisiofitness.com.br" & pagina
	end if
End Select 
%>