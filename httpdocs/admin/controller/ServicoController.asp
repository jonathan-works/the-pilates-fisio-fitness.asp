<%

'Controlador Servico


Function index_Servico(id)
Response.Write("Index_Servico")


End Function

'/**   Função para Adicionar Servico  **/
Function add_Servico(form_Servico)
	
	add_msg = empty
	
	
	
	if not isEmpty(form_Servico("sub_submit")) then
			
		Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_AddServico"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		for each campo in form_Servico
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
	
	set servicos = getServicos("all")
	
	
	 	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Servico/AddView.asp")

End function

Function add_ServicoTamanho(form_ServicoTamanho)

	add_msg = empty
	
	if not isEmpty(form_ServicoTamanho("sub_submit")) then
			
		Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_AddServicoTamanhoVeiculo"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		for each campo in form_ServicoTamanho
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
	
	set servicos = getServicos("all")
	set tamanhoVeiculos = getTamanhoVeiculos("all")
	
	 	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Servico/AddViewTam.asp")



End Function


Function list_Servico(id)
	'Response.write("List_Servico")
	
	msg_retorno = empty
	
	set servicos = getServicoTamanhoVeiculos(array(id,id))'getServicos(id)

	'Mostra o código HTML ex. Formulario para inserir
	include("view/Servico/ListView.asp")

End function


Function edit_Servico(id, form_Servico)
	
	
	msg_retorno = empty
	
	
	If not isEmpty(form_Servico("sub_submit")) Then
	
	Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_EditServico"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		cmd.Parameters("@id") = id
		
		for each campo in form_Servico
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
	
	set Servicos = getServicos(id)	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Servico/EditView.asp")


End Function


Function edit_ServicoTamanho(id, form_ServicoTamanho)
	
	
	Dim ids:ids = split(id, "/")
	
	msg_retorno = empty
	
	
	If not isEmpty(form_ServicoTamanho("sub_submit")) Then
	
	Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_EditServicoTamanhoVeiculo"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		for i = 0 to ubound(ids)
			cmd.Parameters("@id"&i+1) = ids(i)
		next
		
		for each campo in form_ServicoTamanho
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
	
	set servicos = getServicos("all")
	set tamanhoVeiculos = getTamanhoVeiculos("all")
	set servicoTamanhoVeiculos = getServicoTamanhoVeiculos(ids)
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Servico/EditViewTam.asp")


End Function



Function delete_Servico(id)
	'Response.write("Delete_Servico")

	msg_retorno = empty
	
	Dim ids:ids = split(id,"/")
	
	If not isEmpty(id) Then
	
		call deleteServicos(ids)
		msg_retorno = "Exclusão realizada com sucesso!"
		
	End if
	
	set servicos = getServicoTamanhoVeiculos(array("all","all"))	
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Servico/ListView.asp")



End Function


%>
