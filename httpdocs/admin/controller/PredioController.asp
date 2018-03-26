<%
dim imagens

'/**	Função para Editar Predio	**/
function edit_predio(id, formPredio)
	add_msg = empty
	On Error Resume Next
	formPredio.OverwriteFiles = true
	formPredio.SetMaxSize 10485760, True

	On Error GoTo 0	
	
	imagens = formPredio.Save(server.MapPath("../images/predio-images/"))
	'response.write(formPredio.form(formPredio.form("btnSubmit")))
	'response.End()
    if formPredio.form("btnSubmit") = "s" then
		

		Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.commandText = "PROC_EditPredio"
		cmd.commandType = 4
		cmd.parameters.refresh
		' Recuperando os Dados Digitados ----------------------
		cmd.parameters("@id") = id
		cmd.parameters("@nome_predio") =  formPredio.form("nome_predio")
		cmd.parameters("@endereco") = formPredio.form("endereco")
		cmd.parameters("@bairro") = formPredio.form("bairro")
		cmd.parameters("@condominio") = formPredio.form("condominio")
		cmd.parameters("@nome_condominio") = formPredio.form("nome_condominio")
								
		cmd.execute
			
		add_retorno = cmd.parameters.item("@retorno")

		if add_retorno = true then
			imgPredio formPredio, id, "edit"
			add_msg = "Alteração realizada com sucesso!"
		else
			add_msg = "Ocorreu algum erro durante a edição."
		end if
	else
		dim foto
		for each foto in formPredio.Form
				
			set predios = getPredios(id, "")
			pastaDestino = server.mapPath("../images/predio-images")
			set objFSO = server.createObject("Scripting.FileSystemObject")
			set cmd = Server.CreateObject("ADODB.Command")
			set cmd.ActiveConnection = cn
	
			if foto.name = "excluir1" then		
				img = predios("foto1")
				objFSO.DeleteFile(pastaDestino&"/"& img)						
				cmd.commandText = "UPDATE Predio SET foto1 = '' WHERE Cod_Predio = " & id
				cmd.execute
			elseif foto.name = "excluir2" then
				img = predios("foto2")
				objFSO.DeleteFile(pastaDestino&"/"& img)			
				cmd.commandText = "UPDATE Predio SET foto2 = '' WHERE Cod_Predio = " & id
				cmd.execute
			elseif foto.name = "excluir3" then
				img = predios("foto3")
				objFSO.DeleteFile(pastaDestino&"/"& img)	
				cmd.commandText = "UPDATE Predio SET foto3 = '' WHERE Cod_Predio = " & id
				cmd.execute
			elseif foto.name = "excluir4" then
				img = predios("foto4")
				objFSO.DeleteFile(pastaDestino&"/"& img)	
				cmd.commandText = "UPDATE Predio SET foto4 = '' WHERE Cod_Predio = " & id
				cmd.execute
			end if	
		next
	end if
	set predios = getPredios(id, "")
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Predio/EditView.asp")	
end function

function add_Predio(formPredio)
	On Error Resume Next
	formPredio.OverwriteFiles = true
	formPredio.SetMaxSize 10485760, True
	imagens = formPredio.Save(server.MapPath("../images/predio-images/"))	
	On Error GoTo 0	
'	response.write(server.MapPath("../images/predio-images/"))
'	response.End()

	if formPredio.form("btnSubmit") = "s" then		
		
		set cmd = Server.CreateObject("ADODB.Command")
		set cmd.ActiveConnection = cn
		cmd.commandText = "PROC_AddPredio"
		cmd.commandType = 4
		cmd.parameters.refresh 
		cmd.parameters("@nome_predio") = formPredio.form("nome_predio")
		cmd.parameters("@endereco") = formPredio.form("endereco")
		cmd.parameters("@bairro") = formPredio.form("bairro")
		cmd.parameters("@condominio") = formPredio.form("condominio")
		cmd.parameters("@nome_condominio") = formPredio.form("nome_condominio")
		cmd.Execute
		add_retorno = cmd.Parameters.item("@retorno")
		
		idRetorno = cmd.parameters.item("@id_retorno")
		
		if idRetorno > 0 then
			imgPredio formPredio, idRetorno, "add"
		end if
			
		if add_retorno = true then
			add_msg = "Cadastro efetuado com sucesso!"
		else
			add_msg = "Ja existe um prédio cadastrado com esse nome."			
		end if		
	end if
	'Mostra o código HTML ex. Formulario para inserir	
	include("view/Predio/AddView.asp")
end function

function imgPredio(formPredio, id, operacao)	
	dim pastaDestino, objFSO, jpeg, strFormElement, arquivo, vetorImgs(4), novoArq, path, imagem	
	vetorImgs(1) = ""
	vetorImgs(2) = ""
	vetorImgs(3) = ""
	vetorImgs(4) = ""
	Set cmd = Server.CreateObject("ADODB.Command")
	Set cmd.ActiveConnection = cn
	cmd.CommandText = "PROC_EditImg"
	cmd.CommandType = 4
	cmd.Parameters.refresh
	cmd.parameters("@id") = id
	pastaDestino = server.mapPath("../images/predio-images")			
	set objFSO = server.createObject("Scripting.FileSystemObject")
	set jpeg = server.createObject("Persits.Jpeg")
	'formPredio.path = pastaDestino
	
	if imagens > 0 then	
		for each imagem in formPredio.files
			jpeg.Quality = 100		
			arquivo = imagem.fileName
			if imagem.name = "foto1" then
				novoArq = renomear(arquivo, id, 1)
				vetorImgs(1) = novoArq
			elseif imagem.name = "foto2" then 
				novoArq = renomear(arquivo, id, 2)
				vetorImgs(2) = novoArq
			elseif imagem.name = "foto3" then
				novoArq = renomear(arquivo, id, 3)
				vetorImgs(3) = novoArq
			elseif imagem.name = "foto4" then
				novoArq = renomear(arquivo, id, 4)
				vetorImgs(4) = novoArq
			end if
			
			if objFSO.FileExists(pastaDestino&"/"& novoArq) then
				objFSO.DeleteFile(pastaDestino&"/"& novoArq)
			end if			
			'formPredio.Form(strFormElement).Save																					
			objFSO.MoveFile pastaDestino&"/"& arquivo, pastaDestino&"/"& novoArq
			'response.End()
			'if isObject(formPredio.form(strFormElement)) then
			'	if not formPredio.form(strFormElement).isEmpty then	
			'		if strFormElement = "foto1" or strFormElement = "foto2" or strFormElement = "foto3" or strFormElement = "foto4"  then								
			'
			'			arquivo = Mid(formPredio.Form(strFormElement).UserFilename, InstrRev(formPredio.Form(strFormElement).UserFilename, "\") + 1)																																															
																																																						
			'			if strFormElement = "foto1" then							
			'				novoArq = renomear(formPredio.Form(strFormElement).UserFileName, id, 1)
			'				vetorImgs(1) = novoArq
			'			elseif strFormElement = "foto2" then
			'				novoArq = renomear(formPredio.Form(strFormElement).UserFileName, id, 2)
			'				vetorImgs(2) = novoArq
			'			elseif strFormElement = "foto3" then
			'				novoArq = renomear(formPredio.Form(strFormElement).UserFileName, id, 3)
			'				vetorImgs(3) = novoArq
			'			elseif strFormElement = "foto4" then
			'				novoArq = renomear(formPredio.Form(strFormElement).UserFileName, id, 4)
			'				vetorImgs(4) = novoArq
			'			end if
			'			
			'			if objFSO.FileExists(pastaDestino&"/"& novoArq) then
			'				objFSO.DeleteFile(pastaDestino&"/"& novoArq)
			'			end if			
			'			formPredio.Form(strFormElement).Save																					
			'			objFSO.MoveFile pastaDestino&"/"& arquivo, pastaDestino&"/"& novoArq											
			'		end if				
			'	end if	
			'end if
		next
	end if
	if operacao = "edit" then
		set predios = getPredios(id, "")
		if not vetorImgs(1) = "" then	
			cmd.parameters("@foto1") = vetorImgs(1)
		else
			cmd.parameters("@foto1") = predios("foto1")
		end if
		
		if not vetorImgs(2) = "" then	
			cmd.parameters("@foto2") = vetorImgs(2)
		else
			cmd.parameters("@foto2") = predios("foto2")
		end if
		
		if not vetorImgs(3) = "" then	
			cmd.parameters("@foto3") = vetorImgs(3)
		else
			cmd.parameters("@foto3") = predios("foto3")
		end if
		
		if not vetorImgs(4) = "" then	
			cmd.parameters("@foto4") = vetorImgs(4)
		else
			cmd.parameters("@foto4") = predios("foto4")
		end if
	else
		cmd.Parameters("@foto1") = vetorImgs(1)
		cmd.Parameters("@foto2") = vetorImgs(2)
		cmd.Parameters("@foto3") = vetorImgs(3)
		cmd.Parameters("@foto4") = vetorImgs(4)
	end if
	
	cmd.execute
end function

%>

<%
'Controlador Predio
Function index_Predio(id)
	Response.Write("Index_Predio")
End Function

Function list_Predio(id)
	'Response.write("List_Predio")
	
	msg_retorno = empty
	
	'Se o @id = "all" exibe todos os predios
	set predios = getPredios(id, "")
	
	
	
	'Mostra o código HTML ex. Formulario para inserir
	%>
	
    <!--#include file="../view/Predio/ListView.asp"-->
<%
End function

Function delete_predio(id)
	'Response.write("Delete_Predio")
	
	msg_retorno = empty
	
	If not isEmpty(id) Then
	
		call deletePredios(id)
		msg_retorno = "Exclusão realizada com sucesso!"
		
	End if
	
	set predios = getPredios("all", "")
	
	
	
	'Mostra o código HTML ex. Formulario para inserir
	include("view/Predio/ListView.asp")

End Function

function renomear(nome, id, foto)
  Set objetoFSO = Server.CreateObject("Scripting.FileSystemObject")
  extensao = objetoFSO.getExtensionName(nome)
  renomear = "predio" & id &"foto" & foto & "." & extensao
  Set objetoFSO = nothing
end function
 
%>



