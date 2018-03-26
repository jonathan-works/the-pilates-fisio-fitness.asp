<%
'Controlador CadastroCadastroUsuario


Function index_CadastroUsuario(id)
Response.Write("Index_CadastroUsuario")


End Function



Function list_CadastroUsuario(id)
	'Response.write("List_CadastroUsuario")
	
	msg_retorno = empty
	
	'Se o @id = "all" exibe todos os CadastroUsuarios
	set CadastroUsuarios = getCadastroUsuarios(id)
	
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/CadastroUsuario/ListView.asp")

End function




%>
