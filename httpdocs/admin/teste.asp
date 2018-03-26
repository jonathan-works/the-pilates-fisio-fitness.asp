<!--#include file = "model/conexao.asp"-->
<%
set agendamentos = getAgendamento_normal("all")
Do while not agendamentos.eof
	set DetalheAgendamentos = getDetalheAgendamentos(agendamentos("cod_Agendamento"))
	do while not DetalheAgendamentos.eof%>
    	<%=agendamentos("Cod_Agendamento")%> <br>
    <%detalheAgendamentos.movenext
    loop
agendamentos.movenext
loop
                    
%>                  