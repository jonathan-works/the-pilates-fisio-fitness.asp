<%
'Controlador Usuario


Function index_Usuario(id)
Response.Write("Index_Usuario")


End Function

'/**   Função para Adicionar Usuario  **/
Function add_Usuario(form_Usuario)
	
	add_msg = empty
	
	if not isEmpty(form_Usuario("sub_submit")) then
		dim senha : senha = Request.Form("Senha_Usuario")
		dim c_senha : c_senha = Request.Form("confirmar")
		dim tipo : tipo = Request.Form("Tipo_Usuario")
		
		if not  senha = c_senha Then		
			add_msg = "As senhas não conferem"					
		elseif tipo = "2" then
			add_msg = "Selecione um tipo de usuário"
		Else 
			Set cmd = Server.CreateObject("ADODB.Command")
			Set cmd.ActiveConnection = cn
			cmd.CommandText = "PROC_AddUsuario"
			cmd.CommandType = 4
			cmd.Parameters.Refresh
			
			for each campo in form_Usuario
				'Exclui o campo submit do form
				If inStr(campo,"submit") = 0 AND inStr(campo,"confirmar") = 0 Then
				'Response.Write(campo)&Request.Form(campo)&"<br>"
				cmd.Parameters("@"&campo) = Request.Form(campo)
				End if
			next
			cmd.Execute
						
			add_retorno = cmd.Parameters.Item("@retorno")
			if add_retorno = true Then
				add_msg = "Cadastro efetuado com sucesso!"				
			Else
				add_msg = "Ja existe um Usuário cadastrado com esse nome."			
			End if
		End if
		
	end if
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Usuario/AddView.asp")

End function


Function list_Usuario(id)
	'Response.write("List_Usuario")
	
	msg_retorno = empty
	
	'Se o @id = "all" exibe todos os Usuarios
	set Usuarios = getUsuarios(id)
	
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Usuario/ListView.asp")

End function


Function edit_Usuario(id, form_Usuario)
	'Response.write("Edit_Usuario")

	msg_retorno = empty
	
	If not isEmpty(form_Usuario("sub_submit")) Then
	
	Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_EditUsuario"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		'Coloca o parametro @id igual ao id
		cmd.Parameters("@id") = id
		
		for each campo in form_Usuario
			'Exclui o campo submit do form
			If inStr(campo,"submit") = 0 Then
			'Response.Write(campo)&Request.Form(campo)&"<br>"
			cmd.Parameters("@"&campo) = Request.Form(campo)
			End if
		next
		
		cmd.Execute
	
		retorno = cmd.Parameters.Item("@retorno")
		
		if retorno = true Then
			msg_retorno = "Alteração realizada com sucesso!"
		Else
			msg_retorno = "Ocorreu algum erro durante a edição."
		End if
	
	End if
	
	set Usuarios = getUsuarios(id)
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Usuario/EditView.asp")

End Function


Function delete_Usuario(id)
	'Response.write("Delete_Usuario")
	
	msg_retorno = empty
	
	If not isEmpty(id) Then
	
		call deleteUsuarios(id)
		msg_retorno = "Exclusão realizada com sucesso!"
		
	End if
	
	set Usuarios = getUsuarios("all")
	
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Usuario/ListView.asp")

End Function


%>
