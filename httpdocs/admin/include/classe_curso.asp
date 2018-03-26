<%
Sub Proc_lerdados(Cod)
	dim strsql, rs
    set rs=server.CreateObject("ADODB.Recordset")
	Conecta()
	strsql="SELECT * From studio Where cod_studio = " & Cod
	Rs.Open strsql,cn, 3,3
			 curso  = rs("studio")
			 endereco = rs("endereco")
			 complemento = rs("compl")
			 numero = rs("numero")			 
			 bairro  = rs("bairro")
			 cidade = rs("cidade")
			 uf = rs("cod_uf")	 
			 tela = rs("tel1")
			 telb = rs("tel2")
			 descricao = rs("descricao")
	rs.update
    rs.close
	set rs=nothing
	Desconecta()
	strNomeBotao = "Alterar"
End sub


%>