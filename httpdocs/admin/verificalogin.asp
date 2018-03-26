	<%
	Dim logadoLabassaniAdmin
	If session("logadoLabassaniAdmin") = "" Then
		session("logadoLabassaniAdmin") = False
	End If

	logadoLabassaniAdmin = session("logadoLabassaniAdmin")
		
	If logadoLabassaniAdmin <> True Then
			Response.Redirect("default.asp")
	End If
	%>
