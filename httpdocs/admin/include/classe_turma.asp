<%
Sub Proc_lerdados(Cod)
	dim strsql, rs
    set rs=server.CreateObject("ADODB.Recordset")
	Conecta()
	strsql="SELECT * From turma Where cod_turma = " & Cod
	Rs.Open strsql,cn, 3,3
			 titulo  = rs("titulo")
			 cod_curso = rs("cod_curso")
			 cod_studio = rs("cod_studio")
			 vagas = rs("vagas")			 
			 descricao = rs("descricao")
			 valor = rs("valor")
			 data = rs("data")
			 hora = rs("hora")
			 ndisponivel = rs("disponivel")
	rs.update
    rs.close
	set rs=nothing
	Desconecta()
	strNomeBotao = "Alterar"
End sub


%>