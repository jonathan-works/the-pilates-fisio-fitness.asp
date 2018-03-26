<%

'Controlador Agendamento


Function index_agendamento(id)
Response.Write("Index_Agendamento")


End Function

'/**   Função para Adicionar Agendamento  **/
Function add_Agendamento(form_Agendamento)
	
	add_msg = empty
	
	
	
	 	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Agendamento/agendamento.asp")

End function



Function list_Agendamento(id)
	'Response.write("List_Agendamento")
	
	msg_retorno = empty
		
	set servicos = getServicos("all")
	set Agendamentos = getAgendamento_normal("all")'getAgendamentos(id)
	'set DetalheAgendamentos = getDetalheAgendamentos("all")

	'Mostra o código HTML ex. Formulario para inserir
	%><!--#include virtual="Admin/view/Agendamento/ListView.asp"--><%

End function


Function edit_Agendamento(id, form_Agendamento)
	
	
	msg_retorno = empty
	
	
	If not isEmpty(form_Agendamento("sub_submit")) Then
	
	Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_EditAgendamento"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		cmd.Parameters("@id") = id
		
		for each campo in form_Agendamento
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
	
	set Agendamentos = getAgendamentos(id)	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Agendamento/EditView.asp")


End Function


Function edit_AgendamentoTamanho(id, form_AgendamentoTamanho)
	
	
	Dim ids:ids = split(id, "/")
	
	msg_retorno = empty
	
	
	If not isEmpty(form_AgendamentoTamanho("sub_submit")) Then
	
	Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = "PROC_EditAgendamentoTamanhoAgendamento"
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		for i = 0 to ubound(ids)
			cmd.Parameters("@id"&i+1) = ids(i)
		next
		
		for each campo in form_AgendamentoTamanho
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
	
	set Agendamentos = getAgendamentos("all")
	set tamanhoAgendamentos = getTamanhoAgendamentos("all")
	set AgendamentoTamanhoAgendamentos = getAgendamentoTamanhoAgendamentos(ids)
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Agendamento/EditViewTam.asp")


End Function



Function delete_Agendamento(id)
	'Response.write("Delete_Agendamento")

	msg_retorno = empty
	
	Dim ids:ids = split(id,"/")
	
	If not isEmpty(id) Then
	
		call deleteAgendamentos(ids)
		msg_retorno = "Exclusão realizada com sucesso!"
		
	End if
	
	set Agendamentos = getAgendamentoTamanhoAgendamentos(array("all","all"))	
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Agendamento/ListView.asp")



End Function


%>
