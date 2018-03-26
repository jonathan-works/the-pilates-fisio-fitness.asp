<%

'Controlador Veiculo


Function index_Veiculo(id)
Response.Write("Index_Veiculo")


End Function

'/**   Função para Adicionar Veiculo  **/
Function add_Veiculo(form_Veiculo)
	
	add_msg = empty
	
	
	
	if not isEmpty(form_Veiculo("sub_submit")) then
			
		Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_AddVeiculo"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		for each campo in form_Veiculo
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
			add_msg = "Ja existe um veiculo cadastrado como esse."
		End if
		
	end if
	
	set Veiculos = getVeiculos("all")
	set Marcas = getMarcas("all")
	
	 	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Veiculo/AddView.asp")

End function

Function add_VeiculoTamanho(form_VeiculoTamanho)

	add_msg = empty
	
	if not isEmpty(form_VeiculoTamanho("sub_submit")) then
			
		Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_AddVeiculoTamanhoVeiculo"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		for each campo in form_VeiculoTamanho
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
			add_msg = "Ja existe um serviço cadastrado como esse."
		End if
		
	end if
	
	set Veiculos = getVeiculos("all")
	set tamanhoVeiculos = getTamanhoVeiculos("all")
	
	 	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Veiculo/AddViewTam.asp")



End Function


Function list_Veiculo(id)
	'Response.write("List_Veiculo")
	
	msg_retorno = empty
	
	set Veiculos = getVeiculos(id)'getVeiculos(id)

	'Mostra o código HTML ex. Formulario para inserir
	include("view/Veiculo/ListView.asp")

End function


Function edit_Veiculo(id, form_Veiculo)
	
	
	msg_retorno = empty
	
	
	If not isEmpty(form_Veiculo("sub_submit")) Then
	
	Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_EditVeiculo"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		cmd.Parameters("@id") = id
		
		for each campo in form_Veiculo
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
	
	set Veiculos = getVeiculos(id)	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Veiculo/EditView.asp")


End Function


Function edit_VeiculoTamanho(id, form_VeiculoTamanho)
	
	
	Dim ids:ids = split(id, "/")
	
	msg_retorno = empty
	
	
	If not isEmpty(form_VeiculoTamanho("sub_submit")) Then
	
	Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_EditVeiculoTamanhoVeiculo"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		for i = 0 to ubound(ids)
			cmd.Parameters("@id"&i+1) = ids(i)
		next
		
		for each campo in form_VeiculoTamanho
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
	
	set Veiculos = getVeiculos("all")
	set tamanhoVeiculos = getTamanhoVeiculos("all")
	set VeiculoTamanhoVeiculos = getVeiculoTamanhoVeiculos(ids)
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Veiculo/EditViewTam.asp")


End Function



Function delete_Veiculo(id)
	'Response.write("Delete_Veiculo")

	msg_retorno = empty
	
	Dim ids:ids = split(id,"/")
	
	If not isEmpty(id) Then
	
		call deleteVeiculos(ids)
		msg_retorno = "Exclusão realizada com sucesso!"
		
	End if
	
	set Veiculos = getVeiculoTamanhoVeiculos(array("all","all"))	
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Veiculo/ListView.asp")



End Function


%>
