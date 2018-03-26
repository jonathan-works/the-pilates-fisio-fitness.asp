
<%

'Controlador Horario


Function index_Horario(id)
Response.Write("Index_Horario")


End Function

'/**   Função para Adicionar Horario  **/
Function add_Horario(form_Horario)
	
	add_msg = empty
	
	if not isEmpty(form_Horario("sub_submit")) then
	
		Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_AddHorario"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		for each campo in form_Horario
			'Exclui o array
			If inStr(campo,"submit") = 0 Then
			'Response.Write(campo)&Request.Form(campo)&"<br>"
			cmd.Parameters("@"&campo) = Request.Form(campo)
			End if
		next
		
		cmd.Execute
		
		
		add_retorno = cmd.Parameters.Item("@retorno")
		
		if add_retorno = true Then
			add_msg = "Cadastro efetuado com sucesso!"
		Else
			add_msg = "Ja existe um horário cadastrado como esse."
		End if
		
	end if
	
	
	set predios = getPredios("all", "")	
	set servicos = getServicos("all")
	 	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Horario/AddView.asp")

End function


Function list_Horario(id)
	'Response.write("List_Horario")
	
	msg_retorno = empty
	
	set horarios = getHorarios(id)
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Horario/ListView.asp")

End function


Function edit_Horario(id)
Response.write("Edit_Horario")




End Function


Function delete_Horario(ids)
'Response.write("Delete_Horario")

	if not ids = "all" and not isEmpty(ids) Then

	ids = split(ids, "/")
	
	call deleteHorarios(ids)
	
	End if
	
	set horarios = getHorarios("all")
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Horario/ListView.asp")

End Function


%>
