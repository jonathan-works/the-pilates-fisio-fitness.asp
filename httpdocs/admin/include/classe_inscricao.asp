<%

Sub Proc_lerdados(Cod)
	dim strsql, rs
    set rs=server.CreateObject("ADODB.Recordset")
	Conecta()
	strsql="SELECT * From inscricao WHERE cod_inscricao = "&Cod
	Rs.Open strsql,cn, 3,3
			 curso  = rs("cod_turma")
			 email = rs("email")
	rs.update
    rs.close
	set rs=nothing
	Desconecta()
	strNomeBotao = "Alterar"
End sub

Function FormataDataSemHora(Data)
	Dim dia,mes,ano
	dia = DatePart("d", Data)
	if dia < 10 Then
	dia = "0"&dia
	End If
	mes = DatePart("m", Data)
	if mes < 10 Then
	mes = "0"&mes
	End If
	
	ano = DatePart("yyyy", Data)
	FormataDataSemHora = dia  &"/" & mes & "/" & ano
End Function

%>