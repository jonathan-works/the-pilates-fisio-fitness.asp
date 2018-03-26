<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="admin/model/conexao.asp"-->
<!--#include virtual="admin/functions/EmailFunctions.asp"-->
<%

Response.Charset = "UTF-8"
Session.Codepage = 65001
Session.Timeout = 15 'valor em minutos
Session.LCID = 1046 


Dim data, codAgendamento, placa_agenda, retorno

'codAgendamento = 159
'data = "2015-12-13 15:30:00"
'placa_agenda = "DSA-5401"
'emailCliente = "alanoliveiran45@gmail.com"
'nomeCliente = "ALAN"

codAgendamento = request.Form("codAgendamento")
data = request.Form("data")
placa_agenda = request.Form("placa")
emailCliente = request.Form("email")
nomeCliente = Request.Form("nomeCliente")

Dim dataOnly, horarioOnly

data = replace(data, "T", " ")
'dataOnly = split(data,"T")(0)
'horarioOnly = split(data,"T")(1)

'Response.Write(day(dataOnly)&"update"&horarioOnly)

set cmd = server.CreateObject("ADODB.Command")
set cmd.activeConnection = cn
cmd.CommandText = "PROC_EditDetalheAgendamento"
cmd.CommandType = 4
cmd.parameters.refresh

cmd.parameters("@p_codAgendamento") = codAgendamento
cmd.parameters("@p_placa") = placa_agenda
cmd.parameters("@p_data") = data
cmd.execute 
retorno = cmd.parameters.item("@p_retorno")

if retorno = 1 then
	assunto = "Autoclean - Remarcação de serviço"
	mensagemCliente = mensagem(codAgendamento)
	enviaEmailReAgendamento nomeCliente, emailCliente, assunto, mensagemCliente
	Response.Clear()
	response.write("OK")
else
	response.Write("ERRO")
end if

'cn.execute("UPDATE Agendamento SET Data_Inicial = '"& dataOnly &"', Horario_Inicial = '"& horarioOnly &"' WHERE Cod_Agendamento = "&id)

function mensagem(id)
	mensagem2 = "<!doctype html><html lang='pt-br'><head><meta charset='utf-8'><meta http-equiv='Content-Type' content='text/html; charset=utf-8'/></head><body>Caro Sr(a) "& nomeCliente &", <br> Avisamos que o(s) servi&ccedil;o(s) listado(s) abaixo tiveram suas datas remanejadas: <br><br> <table><th>Servi&ccedil;os</th> <th>Nova Data</th><th>Ve&iacute;culo</th><th>Placa</th>"
	
	set remarcacao = getRemarcacao(id)
	
	do while not remarcacao.eof
		mensagem2 = mensagem2 & "<tr><td>" & remarcacao("Descricao") & "</td><td>" & remarcacao("Data_Inicial") & "</td><td>" & remarcacao("Modelo") & "</td><td>" & remarcacao("Placa") & "</td></tr>"
		remarcacao.movenext
	Loop
	mensagem2 = mensagem2 & "</table></body></html>"
	mensagem = mensagem2
end function

%>