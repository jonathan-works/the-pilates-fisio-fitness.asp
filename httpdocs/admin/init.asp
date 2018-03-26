
<!--#include file="config.asp"-->

<%'Para fazer o include Dinamico%>
<!--#include file="asp-simple-include.asp"-->

<!-- verifica o login -->
<!--#include file="verificaLogin.asp" -->

<%'Includes dos Controladores%>
<%
'Mensagem retorno add
Dim add_msg

'Mensagem de Retorno PROC
Dim msg_retorno
%>
<!--#include file = "model/conexao.asp"-->
<!--#include file = "head.asp"-->

<!--#include file = "menu.asp"-->
<!--#include file = "functions/Functions.asp"-->
<!-- #include file = "functions/upload_img.asp" -->
<!--#include file = "controller/PredioController.asp"-->
<!--#include file = "controller/HorarioController.asp"-->
<!--#include file = "controller/ServicoController.asp"-->
<!--#include file = "controller/UsuarioController.asp"-->
<!--#include file = "controller/CadastroUsuarioController.asp"-->
<!--#include file = "controller/VeiculoController.asp"-->
<!--#include file = "controller/AgendamentoController.asp"-->

<!--#include file = "footer.asp"-->

<%
'Pega o controlador passado pela URL
Dim controller:controller = request.QueryString("c")

'Requisição para a ação solicitada
Dim action:action = request.QueryString("a")

'Id caso seja necessario
Dim id:id = request.QueryString("id")

if not isEmpty(action) and not isEmpty(controller) then
	dim metodo : metodo = action&"_"&controller
	dim funcao : set funcao = getRef(metodo)
	dim oFileUp	
	if action = "add" and controller = "Predio" then
		set oFileUp = Server.CreateObject("Persits.Upload")
		oFileUp.codePage = 65001		
		response.write funcao(oFileUp)
	elseif action = "add" then
		response.write funcao(request.form)
	elseif action = "edit" and controller = "Predio" then	
		set oFileUp = Server.CreateObject("Persits.Upload")
		oFileUp.codePage = 65001
		response.write funcao(id, oFileUp)
	elseif action = "edit" then
		response.write funcao(id,request.form)
	elseif action = "list" then
		if not isEmpty(id) then
			response.write funcao(id)
		else
			response.write funcao("all")
		end if
	elseif action = "delete" then
		response.write funcao(id)
	else
		response.write funcao(id)
	end if
end if


%>
