<%
Dim cnStr,cn


const ip_banco 			= "177.66.168.199"
const database			= "agenciaddwb_equino"
const user_banco 		= "ddwb_equino"
const password_banco 	= "decadura4444"



Sub Conecta()

cnStr = "Provider=SQLOLEDB.1;SERVER="& ip_banco &"; DATABASE="& database &"; UID="& user_banco &"; PWD="& password_banco &";" 
Set cn = Server.CreateObject("ADODB.Connection") 
cn.Open cnStr

End Sub

call Conecta()


'Variaveis Globais
Dim bairros
Dim predios
dim filtroPredios
Dim servicos
Dim horarios
Dim usuarios
Dim cadastroUsuarios
Dim tamanhoVeiculos
Dim ServicoTamanhoVeiculos
Dim veiculos
Dim veiculoUsuarios
Dim marcas
Dim agendamentos
Dim DetalheAgendamentos
dim login
dim placa
Dim remarcacao
if not Session("logado") then
	session("logado") = false
end if

function getServicoByHorario(tamanho, dia, codPredio)
	str_sql = "SELECT DISTINCT H.Cod_Servico, S.Descricao, ST.Duracao, ST.Valor FROM SERVICO S INNER JOIN Servico_TamanhoVeiculo ST ON S.Cod_Servico = ST.Cod_Servico INNER JOIN Horario H ON S.Cod_Servico = H.Cod_Servico WHERE ST.Cod_TamanhoVeiculo = " & tamanho & "AND H.Dia_Semana = " & dia & "  AND H.Cod_Predio = " & codPredio 	
	set rs = cn.execute(str_sql)
	set getServicoByHorario = rs
	set rs = nothing
end function

function getLoginUsuario(user, pass)
	str_sql = "select * from Cadastro_Usuario where Email = '"&user&"' and Senha = '"& pass &"'"
	set rs = cn.execute(str_sql)
	set getLoginUsuario = rs
	set rs = nothing
end function

function getLogin(user, pass)
	str_sql = "Select Cod_Usuario, Nome_Usuario, Senha_Usuario, Tipo_Usuario From Usuario Where Nome_Usuario = '" & user & "' And Senha_Usuario = '" & pass & "'"
	
	set rs = cn.execute(str_sql)
	set getLogin = rs			
	set rs = nothing	
end function


'Funções Globais
Dim str_sql, rs

function getBairros()
	str_sql = "SELECT DISTINCT(Bairro) FROM Predio WHERE bairro NOT LIKE ''"
	set rs = cn.execute(str_sql)
	set getBairros = rs
	set rs = nothing
end function

function getPredioEnd(pesquisa, filtro)
	str_sql = "SELECT * FROM Predio WHERE Endereco like '%" &pesquisa& "%' OR Nome_Predio like '%" &pesquisa& "%' "
	if not filtro = "" and not isEmpty(filtro) then
		str_sql = str_sql & "ORDER BY Nome_Predio " & filtro
	end if
	set rs = cn.execute(str_sql)
	set getPredioEnd = rs
	set rs = nothing
end function

function getPredioBusca(filtro)
	str_sql = "SELECT  distinct P.Cod_Predio, P.Endereco, P.Bairro, P.Condominio, P.Nome_Predio	FROM Predio P inner JOIN Horario H ON P.Cod_Predio = H.Cod_Predio "		
	if not filtro = "" then
		str_sql = str_sql & filtro
	end if
	
	set rs = cn.execute(str_sql)
	set getPredioBusca = rs
	set rs = nothing
end function

function getFiltroPredios()
	str_sql = "SELECT TOP 5 * FROM Predio ORDER BY Cod_Predio DESC"
	
	set rs = cn.execute(str_sql)
	set getFiltroPredios = rs
	set rs = nothing
end function

function getPredios(id, filtro)
	str_sql = "SELECT * FROM Predio "
	
	if not id = "all" and not isEmpty(id) then
		str_sql = str_sql & " WHERE Cod_Predio = "&cint(id)
	end if
	if not filtro = "" and not isEmpty(filtro) then
		str_sql = str_sql & " ORDER BY Nome_Predio " & filtro
	end if
	set rs = cn.execute(str_sql)	
	set getPredios = rs
	set rs = nothing	
end function

sub deletePredios(id)
	
	if not id = "all" and not isEmpty(id) then
	
		str_sql = "DELETE FROM Horario WHERE Cod_Predio = "&cint(id)
		cn.execute(str_sql)
	
		str_sql = "DELETE FROM Predio WHERE Cod_Predio = "&cint(id)
		cn.execute(str_sql)
		
	end if
	
	
end sub

function getRemarcacao(id)
	str_sql = "SELECT S.Descricao, D.Data_Inicial, D.Placa, V.Modelo FROM Servico S INNER JOIN Detalhe_Agendamento  D ON D.Cod_Servico = S.Cod_Servico INNER JOIN Veiculo V ON D.Cod_Veiculo = V.Cod_Veiculo WHERE D.Cod_Agendamento = " & id
	
	set rs = cn.execute(str_sql)
	set getRemarcacao = rs
	set rs = nothing
end function

function getServicos(id)
	
	str_sql = "SELECT * FROM Servico "
	
	if not id = "all" and not isEmpty(id) then
		str_sql = str_sql & " WHERE Cod_Servico = "&cint(id)
	end if
	
	set rs = cn.execute(str_sql)
	
	set getServicos = rs

	set rs = nothing

end function

function getServicosByPredio(id, tam)
	str_sql = "SELECT DISTINCT H.Cod_Servico, S.Descricao, ST.Duracao, ST.Valor FROM Horario H INNER JOIN Servico S ON h.Cod_Servico = s.Cod_Servico INNER JOIN Predio P ON H.Cod_Predio = P.Cod_Predio inner join Servico_TamanhoVeiculo ST on S.Cod_Servico = ST.Cod_Servico WHERE P.Cod_Predio = " & id & "  AND ST.Cod_TamanhoVeiculo = " & tam

	set rs = cn.execute(str_sql)
	set getServicosByPredio = rs
	set rs = nothing
end function

sub deleteServicos(ids)
	
	
	
	if not isNull(ids(1)) and isNumeric(ids(1)) Then
	
		if not ids(0) = "all" and not isEmpty(ids(0)) then
			str_sql = "DELETE FROM Servico_TamanhoVeiculo WHERE Cod_Servico = "&cint(ids(0))&" and Cod_TamanhoVeiculo = "&cint(ids(1))
			cn.execute(str_sql)
		end if
	else
		
			str_sql = "DELETE FROM Servico WHERE Cod_Servico = "&cint(ids(0))
			cn.execute(str_sql)
	end if
	
end sub

function getHorariosByServico(id)
	str_sql = "SELECT * FROM HORARIO WHERE Cod_Servico = " & id

	set rs = cn.execute(str_sql)
	
	set getHorariosByServico = rs

	set rs = nothing

end function


function getHorarios(id)
	
	str_sql = "SELECT * FROM Horario "
	
	Dim id_valor,i
	
	'if not id = "all" and not isEmpty(id) then
	if isNumeric(id) Then
		str_sql = str_sql & " WHERE Dia_Semana = "&cint(id)	
	Else
		if isArray(id) Then
			
			for i = 0 to uBound(id)
				
				id_valor = split(id(i),"=")
				
				if i = 0 Then
					str_sql = str_sql & " 	WHERE " & id_valor(0) & " = '" & id_valor(1) & "'"
					
				else
				
					str_sql = str_sql & " 	AND " & id_valor(0) & " = '" & id_valor(1) & "'"
				
				end if
				
			
			Next
			
			
		end if
	end if
	'Response.Write(str_sql)
	'response.End()
	set rs = cn.execute(str_sql)
	
	set getHorarios = rs

	set rs = nothing

end function

sub deleteHorarios(ids)
	
	if not ids(0) = "all" and not isEmpty(ids(0)) then
	
		str_sql = "DELETE FROM Horario WHERE Dia_Semana = "&cint(ids(0))&" and ('"&ids(1)&"' between Horario_Inicial and Horario_Final or '"&ids(2)&"' between Horario_Inicial and Horario_Final) and Cod_Predio = "&cint(ids(3))&" and Cod_Servico = "&cint(ids(4))
		
		cn.execute(str_sql)
		
	end if
	
	
end sub


function getUsuarios(id)
	
	str_sql = "SELECT * FROM Usuario "
	
	if not id = "all" and not isEmpty(id) then
		str_sql = str_sql & " WHERE Cod_Usuario = "&cint(id)
	end if
	
	set rs = cn.execute(str_sql)
	
	set getUsuarios = rs

	set rs = nothing

end function



sub deleteUsuarios(id)
	
	if not id = "all" and not isEmpty(id) then
	
		str_sql = "DELETE FROM Usuario WHERE Cod_Usuario = "&cint(id)
		cn.execute(str_sql)
		
	end if
	
	
end sub

function getCadastroUsuarios(id)
	
	str_sql = "SELECT * FROM Cadastro_Usuario "
	
	if not id = "all" and not isEmpty(id) then
		If isNumeric(id) Then
			str_sql = str_sql & " WHERE Cod_CadastroUsuario = "&cint(id)
		Else
			str_sql = str_sql & " WHERE Email = '"&id&"'" 
		End if
	end if
	
	
	
	set rs = cn.execute(str_sql)
	
	set getCadastroUsuarios = rs

	set rs = nothing

end function


function getTamanhoVeiculos(id)
	str_sql = "SELECT * FROM Tamanho_Veiculo "
	
	
	
	if not id = "all" and not isEmpty(id) then
		str_sql = str_sql & " WHERE Cod_TamanhoVeiculo = "&cint(id)
	end if
	
	set rs = cn.execute(str_sql)
	
	set getTamanhoVeiculos = rs
	
	set rs= nothing

end function

function getServicoTamanhoVeiculos(ids)

	str_sql = "SELECT * FROM Servico_TamanhoVeiculo stv RIGHT OUTER JOIN Servico s ON stv.Cod_Servico = s.Cod_Servico "
	
	
	
	if not ids(0) = "all" and not isEmpty(ids(0)) then
	
		str_sql = str_sql & " WHERE stv.Cod_Servico = "&cint(ids(0))
		if not ids(1) = "all" and not isEmpty(ids(1)) then
			str_sql = str_sql & " and stv.Cod_TamanhoVeiculo = "&cint(ids(1))
		end if
		
	elseif not ids(1) = "all" and not isEmpty(ids(1)) then
		str_sql = str_sql & " WHERE stv.Cod_TamanhoVeiculo = "&cint(ids(1))
	end if
	
			
	set rs = cn.execute(str_sql)
	
	set getServicoTamanhoVeiculos = rs
	
	set rs= nothing

end function


function getVeiculos(id)
	
	str_sql = "SELECT * FROM Veiculo "
	
	if isNumeric(id) Then
			str_sql = str_sql & " WHERE Cod_Veiculo = "&cint(id) &" AND Desabilitado = 0 "
		else
			if instr(id,"=") Then
				id = split(id,"=")
				str_sql = str_sql & " 	WHERE " & id(0) & " = '" & id(1) & "'" &" AND Desabilitado = 0 "
			end if
		end if
	
	set rs = cn.execute(str_sql)
	
	set getVeiculos = rs

	set rs = nothing

end function


function getMarcas(id)
	
	str_sql = "SELECT * FROM Marca "
	
	if not id = "all" and not isEmpty(id) then
	
		if isNumeric(id) Then
			str_sql = str_sql & " WHERE Cod_Marca = "&cint(id)
		else
			if instr(id,"=") Then
				id = split(id)
				str_sql = str_sql & " 	WHERE " & id(0) & " = '" & id(1) & "'"
			end if
		end if			
	else
		str_sql = str_sql & " WHERE Cod_Marca in(select Cod_Marca from Veiculo V where Desabilitado = 0) "
	end if
	
	set rs = cn.execute(str_sql)
	
	set getMarcas = rs

	set rs = nothing

end function

function getAgendamento_normal(id)
	str_sql = "select (C.Nome + ' ' + C.Sobrenome) as Nome_Cliente, C.Email, A.*, U.Nome_Usuario from Agendamento A left join Cadastro_Usuario C on A.Cod_CadastroUsuario = C.Cod_CadastroUsuario left join Usuario U on A.cod_usuario = U.Cod_Usuario"
	
	if not id = "all" and not isEmpty(id) Then	
		if isNumeric(id) Then
			str_sql = str_sql & "WHERE A.Cod_Agendamento = "&cint(id)
		end if
	end if
	
	set rs = cn.execute(str_sql)	
	set getAgendamento_normal = rs	
	set rs = nothing
end function

function getAgendamentos(id)

	str_sql = "SELECT * FROM V_Agendamento "
	
	if not id = "all" and not isEmpty(id) Then
	
		if isNumeric(id) Then
			str_sql = str_sql & "WHERE Cod_Agendamento = "&cint(id)
		end if
	
	
	end if
	
	set rs = cn.execute(str_sql)
	
	set getAgendamentos = rs
	
	set rs = nothing

end function



function getAgendamentoByUsuario(id)
	str_sql = "SELECT * FROM Agendamento WHERE Cod_CadastroUsuario = " & id & " AND Cast(Data_Pagamento as nvarchar) <> 'NULL'"
	set rs = cn.execute(str_sql)
	
	set getAgendamentoByUsuario = rs
	
	set rs = nothing
end function

function getDetalheAgendamentos_Agenda(id)
	
	Dim campo
	Dim coluna, valor
	
	str_sql = "SELECT Cod_Agendamento,  Cod_TamanhoVeiculo, Cod_Veiculo, Placa, Cod_Servico, Data_Inicial, Data_Final, Cod_Predio, Valor FROM Detalhe_Agendamento "
	
	if not id = "all" and not isEmpty(id) Then
		
		if isNumeric(id) Then
			str_sql = str_sql & "WHERE Cod_Agendamento="&cint(id)
		else
		
			if isArray(id) Then
				
				for i = 0 to uBound(id)
					
					id_valor = split(id(i),"=")
					
					if i = 0 Then
						str_sql = str_sql & " 	WHERE " & id_valor(0) & " = '" & id_valor(1) & "'"
						
					else
					
						str_sql = str_sql & " 	AND " & id_valor(0) & " = '" & id_valor(1) & "'"
					
					end if
					
				
				Next
				
				
			end if
		end if
	
	end if
	
	str_sql = str_sql &  " ORDER BY Data_Inicial"
	
	set rs = cn.execute(str_sql)
	
	set getDetalheAgendamentos_Agenda = rs
	
	set rs = nothing



end function

function getQtdeVeiculosAgendamento(id)
	str_sql = "SELECT count(distinct Cod_Veiculo) as Cod_Veiculo FROM Detalhe_Agendamento WHERE Cod_Agendamento = " & id
	
	set rs = cn.execute(str_sql)
	
	set getVeiculosAgendamento = rs
	set rs = nothing
end function

function getVeiculosAgendamento(id)
	str_sql = "SELECT distinct Cod_Veiculo, Placa FROM Detalhe_Agendamento WHERE Cod_Agendamento = " & id
	
	set rs = cn.execute(str_sql)
	
	set getVeiculosAgendamento = rs
	set rs = nothing
end function

function getMarcaVeiculo(id, placa)
	str_sql = "SELECT V.Cod_Veiculo, V.Modelo, M.Cod_Marca, M.Descricao, D.Placa from Veiculo V INNER JOIN Marca M ON V.Cod_Marca = M.Cod_Marca INNER JOIN Detalhe_Agendamento D ON D.Cod_Veiculo = V.Cod_Veiculo WHERE D.Cod_Veiculo =  " & id & " AND D.Placa = '" & placa & "'" &" AND Desabilitado = 0 "
	set rs = cn.execute(str_sql)
	set getMarcaVeiculo = rs
	set rs = nothing
end function

function atualizaAgendamento(agenda, usuario)
	str_sql = "UPDATE Agendamento SET Cod_CadastroUsuario = " & usuario & " WHERE Cod_Agendamento = " & agenda
	response.Write(str_sql)
	set rs = cn.execute(str_sql)
	set atualizaAgenda = rs
	set rs = nothing

end function

function getLastUser()

	str_sql = "SELECT MAX(Cod_CadastroUsuario) as Cod_CadastroUsuario FROM Cadastro_Usuario "
	
	set rs = cn.execute(str_sql)
	
	getLastUser = rs("Cod_CadastroUsuario")
	
	set rs = nothing

end function

function getPlacaByUsuario(codUsuario, codVeiculo)
	str_sql = "SELECT Placa FROM Veiculo_CadastroUsuario WHERE Cod_CadastroUsuario = " & codUsuario & " AND Cod_Veiculo = " & codVeiculo
	set rs = cn.execute(str_sql)
	getPlacaByUsuario = rs
	set rs = nothing
end function

function getPlaca(placa)
	str_sql = "SELECT Placa FROM Veiculo_CadastroUsuario WHERE Placa = '" & placa & "'"
	set rs = cn.execute(str_sql)
	if rs.eof then
		getPlaca = false
	else
		getPlaca = true
	end if
	set rs = nothing	
end function

function exec_Proc(nome_proc,form_dados)
	
	Set cmd = Server.CreateObject("ADODB.Command")
		Set cmd.ActiveConnection = cn
		cmd.CommandText = nome_proc
		cmd.CommandType = 4
		cmd.Parameters.Refresh
		
		for each campo in form_registro
			'Exclui o campo submit do form
			If inStr(campo,"submit") = 0 Then
			'Response.Write(campo)&Request.Form(campo)&"<br>"
			cmd.Parameters("@"&campo) = Request.Form(campo)
			End if
		next
		
		cmd.Execute
		cmd = nothing


end function

'--Busca Veículos cadastrados pelo usuário
function buscaVeiculosUsuario(id)
	str_sql = "SELECT VC.Cod_Veiculo, VC.Placa, V.Cod_TamanhoVeiculo, M.Descricao, V.Modelo FROM Veiculo_CadastroUsuario "_
				&"VC INNER JOIN Veiculo V ON VC.Cod_Veiculo = V.Cod_Veiculo "_
				&"INNER JOIN Marca M ON V.Cod_Marca = M.Cod_Marca "_
				&"WHERE VC.Cod_CadastroUsuario = " & id
	set rs = cn.execute(str_sql)
	set buscaVeiculosUsuario = rs
	set rs = nothing
end function

sub excluirAgendamento(agenda, tamanho, servico, veiculo, dataInicial, dataFinal, predio)
	str_sql = "DELETE FROM Detalhe_Agendamento WHERE Cod_Agendamento = " & agenda & " AND Cod_TamanhoVeiculo = " & tamanho & " AND Cod_Servico = " & servico & " AND Cod_Veiculo = " & veiculo & " AND Data_Inicial ='" & dataInicial & "' AND Data_Final = '" & datafinal & "' AND Cod_Predio = " & predio
	response.Write(str_sql)
	cn.execute(str_sql)
	
end sub

%>