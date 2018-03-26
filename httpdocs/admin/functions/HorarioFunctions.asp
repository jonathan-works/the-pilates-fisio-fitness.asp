<%
'Funções Horario
Dim str_sql, rs

function getPredios()
	
	str_sql = "SELECT * FROM Predio"
	set rs = cn.execute(str_sql)
	
	set getPredios = rs

	set rs = nothing
	
end function


function getServicos()
	
	str_sql = "SELECT * FROM Servico"
	set rs = cn.execute(str_sql)
	
	set getServicos = rs

	set rs = nothing

end function





%>