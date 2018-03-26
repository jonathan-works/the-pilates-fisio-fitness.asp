<%
Sub Proc_Incluirdados(nome,login,senha,disponivel)
	dim strsql, rs, cod
    set rs=server.CreateObject("ADODB.Recordset")
	strsql="usuario"
	Conecta()
	Rs.Open strsql,cn, 3,3
	Rs.addnew
			 rs("nome")=nome
			 rs("login")=login
			 rs("senha")=senha
			 rs("habilitado")=disponivel
			 codigo=rs("Cod_Usuario")
	rs.update
    rs.close
	set rs=nothing
	Desconecta()
	
	Response.Redirect("inc_usuarios.asp?incok=1&acao=1")
End sub

Sub Proc_lerdados(Cod)
	dim strsql, rs
    set rs=server.CreateObject("ADODB.Recordset")
	Conecta()
	strsql="SELECT * From usuario Where cod_usuario = " & Cod
	Rs.Open strsql,cn, 3,3
			 nome  = rs("nome")
			 login = rs("login")
			 senha = rs("senha")
			 disponivel = rs("habilitado")
	rs.update
    rs.close
	set rs=nothing
	Desconecta()
	strNomeBotao = "Alterar"
End sub

Sub Proc_Alterardados(Cod,nome,login,senha,disponivel)
	dim strsql, rs
    set rs=server.CreateObject("ADODB.Recordset")
	strsql="SELECT * From usuario Where cod_usuario = " & Cod
	Conecta()
	Rs.Open strsql,cn, 3,3
			 rs("nome")=nome
			 rs("login")=login
			 rs("senha")=senha
			 rs("habilitado")=disponivel
			 codigo=rs("Cod_Usuario")
	rs.update
    rs.close
	set rs=nothing
	Desconecta()
	
	Response.Redirect ("lista_usuarios_alt.asp")
End sub

Sub Proc_excluirdados(Cod)
	dim strsql
	
	Conecta()
	strsql="DELETE FROM usuario WHERE cod_usuario = "&Cod
	cn.execute(strsql)
	Desconecta()
		
	Response.Redirect ("lista_usuarios_excluir.asp")
End sub

Sub Proc_listacombocodigo(strsql,codigo_combo,descricao,codigo)
	dim combo
	set rs=cn.execute(strsql)
	Do While not rs.eof
		
		combo = "<option value="& rs(codigo_combo)

		if Codigo = rs(codigo_combo) then 
			combo = combo & " selected " 
		end if
		
		combo = combo &" >"& rs(descricao) &"</option>"
		
		response.Write(combo)
	rs.movenext
	Loop
		
	set rs=nothing
End sub

Sub Proc_listacombocodigo2(strsql,codigo_combo,descricao,codigo)
	dim combo
	set rs=cn.execute(strsql)
	Do While not rs.eof
		
		combo = "<option value="& rs(codigo_combo)

		if Codigo = rs(codigo_combo) then 
			combo = combo & " selected " 
		end if
		
		combo = combo &" >"& formatcurrency(rs(descricao)) &"</option>"
		
		response.Write(combo)
	rs.movenext
	Loop
		
	set rs=nothing
End sub
%>