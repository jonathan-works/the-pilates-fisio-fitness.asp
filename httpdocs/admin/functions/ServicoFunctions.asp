<%
'Funções Predio
function unset(byref form_predio, index)
	
	dim d,a,i
	set d=Server.CreateObject("Scripting.Dictionary")
	
	for each campo in form_predio
	d.Add campo, request.Form(campo)
	next
	
	
	unset = d
	

end function





%>