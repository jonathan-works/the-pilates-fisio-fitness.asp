<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>

<%
Option Explicit
%>
<%
Response.Charset = "UTF-8"
Session.Codepage = 65001
Session.LCID = 1046 

Dim url_completa:url_completa = "http://www.thepilatesfisiofitness.com.br/"
DIm img_logo_loja:img_logo_loja = URL_completa & "images/logo.png"




'-------------------CONFIGURAÇÕES BOLETO--------------------
Dim Razao_Social:Razao_Social = "The Pilates Fitness"

Dim Boleto(2), Link_boleto_config(2)
'Banco do Brasil
Boleto(0) = false
link_boleto_config(0) = url_completa & "boleto/bb/boleto-banco-brasil.asp"

'Banco Bradesco
Boleto(1) = false
link_boleto_config(1) = url_completa & "boleto/bradesco/boleto-bradesco.asp"


'Banco Itaú
Boleto(2) = true
link_boleto_config(2) = url_completa & "boleto/itau/boleto-itau.asp"

'Loja
Const Nome_Loja = "The Pilates Fitness "

const Cidade_Cadastro = "São Paulo "
const Endereco_Cadastro = "Rua Romeu de Campos vergal, 38 Bragança Paulista"
const Estado_Cadastro = "São Paulo"
const CEP_cadastro = "12906780"


'Dados Gerais
dim conta, cedente, cpf_cnpj,agencia, dac_agencia,dac_conta,carteira
cedente = Razao_Social
cpf_cnpj = "19.547.696/0001-07"
agencia = "0000"' Numero da Agência
dac_agencia = "7" ' Digito da Agência
conta = "11444" ' Numero da Conta
dac_conta = "0" ' 1 Digito da Conta
carteira = "176" 'Carteira

'================ INSTRUÇÕES DO BOLETO ==============
dim instrucoes1,instrucoes2,instrucoes3,instrucoes4,instrucoes5
instrucoes1 = "Pagar até o Vencimento em qualquer agência bancária"
instrucoes2 = "Caixa, favor não aceitar este após o vencimento"
instrucoes3 = Razao_Social & " - The Pilates Fitness"
instrucoes4 = ""
instrucoes5 = ""

'-----------------------------------------------------------
%>