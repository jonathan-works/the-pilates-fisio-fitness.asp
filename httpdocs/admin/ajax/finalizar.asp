<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include virtual="admin/model/conexao.asp"-->
<!--#include virtual="admin/functions/EmailFunctions.asp"-->
<%
Response.Charset = "UTF-8"
Session.Codepage = 65001
Session.Timeout = 15 'valor em minutos
Session.LCID = 1046 

Dim data, codAgendamento, placa_agenda, retorno, nome_usuario, data_finalizacao

codAgendamento = request.Form("codAgendamento")
'data = request.Form("data")
placa_agenda = request.Form("placa")
emailCliente = request.Form("email")
nomeCliente = Request.Form("nomeCliente")


set cmd = server.CreateObject("ADODB.Command")
set cmd.activeConnection = cn
cmd.CommandText = "PROC_AtualizaStatus"
cmd.CommandType = 4
cmd.parameters.refresh

cmd.parameters("@p_codAgendamento") = codAgendamento
cmd.parameters("@p_codUsuario") = session("CodUsuarioAdmin")
cmd.execute 
retorno = cmd.parameters.item("@p_retorno")
nome_usuario = cmd.parameters.item("@p_nomeUsuario")
data_finalizacao = cmd.parameters.item("@p_data")

if retorno = 1 then
	assunto = "Autoclean - Finalização de serviço"
	mensagemCliente = "Sr(a) " & nomeCliente &", seu veículo está pronto."
	enviaEmailFinalizacao nomeCliente, emailCliente, assunto, mensagemCliente
	Response.Clear()
	response.write("OK, "&nome_usuario&", "&data_finalizacao)
else
	response.Write("ERRO")
end if

%>