<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
Option Explicit

Dim preference, valor_frete_gratis_sudeste, valor_frete_gratis_sul

'configuração frete gratuito
'response.Write(now())

dim dia_semana
dia_semana = weekday(now()) 

if dia_semana = 1 or dia_semana = 7 then
	valor_frete_gratis_sudeste = formatnumber(1,2)
	valor_frete_gratis_sul = formatnumber(1,2)
else
	valor_frete_gratis_sudeste = formatnumber(69.00,2)
	valor_frete_gratis_sul = formatnumber(199,2)
end if

function FreteGratisUsuario(cod_usuario)
	dim strsql, rs
	strsql="select frete_gratis from cadastro_usuario where cod_usuario = " & cod_usuario
	set rs=cn.execute(strsql) 
	if not isnull(rs("frete_gratis")) then
		if now() <= rs("frete_gratis") then
			FreteGratisUsuario = true
		else
			FreteGratisUsuario = false
		end if
	else
		FreteGratisUsuario=false
	end if
End Function

'response.Write(valor_frete_gratis_sudeste)

'valor_frete_gratis_sudeste = formatnumber(99.00)

Dim rs_frete,valor_frete,valor_taxa, forma_pagamento

forma_pagamento = request("forma_pagamento")


'response.Write("<br>" & valor_frete_gratis_sudeste)
'on error resume next

session("HTTPS") = "OFF"

%>
<!--#include file="conexao.asp"-->
<!--#include file="inc/classe_carrinho.asp"-->
<!--#include file="inc/classe_geral.asp"-->
<!--#include file="inc/classe_arearestrita.asp"-->
<!--#include file="inc/classe_correios.asp"-->
<%
dim rs_freteTE, valor_frete_te

url_completa = "http://www.clickmart.com.br/"

Dim edit

edit = request.QueryString("edit")

Dim cep_origem_loja,cep_destino, peso, comprimento, altura, largura, diametro,  frete_gratuito_ligado, valor_unitario_produto, qtde_embalagens
cep_origem_loja = "22640100"

Dim rs, strsql, Cod_VendaOferta_retorno, Unidade_Unica, valor_total_desconto, rs_matriz, codigo_cep

valor_total_desconto = 0

Dim acao, cod_loja, cod_vendaoferta, cod_oferta, cod_unidade, qtde, cod_usuario, cod_cidade

cod_usuario = int(session("cod_usuario"))
'if cod_usuario = 0 then cod_usuario = int(request.Form("cod_usuario"))

acao = int(request.Form("acao"))
if acao = 0 then acao = int(request.QueryString("id"))

cod_loja = int(request.Form("cod_loja"))
if cod_loja = 0 then cod_loja = int(request.QueryString("id1"))

Cod_VendaOferta = int(request.Form("Cod_VendaOferta"))
if cod_vendaoferta = 0 then cod_vendaoferta = int(request.QueryString("id2"))

Cod_Oferta = int(request.Form("Cod_Oferta"))
if cod_oferta = 0 then cod_oferta = int(request.QueryString("id3"))

cod_unidade = int(request.Form("cod_unidade"))
qtde = int(request.Form("qtde"))

cod_cidade=int(request.Form("cod_cidade"))

If Cod_VendaOferta = 0 and session("cod_VendaOferta") <> "" Then
	Cod_VendaOferta = session("cod_VendaOferta")
End If

session("Cod_VendaOferta_recibo") = Cod_VendaOferta

if request.Form("cidade_selecionada") <> "" then
	session("Cidade_Selecionada") = request.Form("cidade_selecionada")
end if

Dim rs_presente_selecionado_total
Dim qtde_presente_selecionado_oferta

Dim valor_pagamento

Conecta()

if cod_usuario <> "" then
	Dim strsql_login, email_cons, senha_cons, rs_login
	strsql_login=" select email, senha from cadastro_usuario where cod_usuario = " & cod_usuario
	set rs_login=cn.execute(strsql_login)
	if not rs_login.eof then
		email_cons = rs_login("email")
		senha_cons = rs_login("senha")
	end if
end if

Dim parcela_minima
parcela_minima = 65

Select Case acao
	Case 1 
		
		'response.Write("<br>Cod_Loja: " & Cod_Loja)
		'response.Write("<br>Cod_VendaOferta: " & Cod_VendaOferta)
		'response.Write("<br>Cod_Oferta: " & Cod_Oferta)
		'response.Write("<br>Cod_Unidade: " & Cod_Unidade)
		'response.Write("<br>Cod_Usuario: " & Cod_Usuario)
		'response.Write("<br>Qtde: " & Qtde)
		'response.Write("<br>Cod_Cidade: " & Cod_Cidade)
		'response.End()
		
		call adicionarCarrinho(Cod_Loja,Cod_VendaOferta,Cod_Oferta,Cod_Unidade,Cod_Usuario,Qtde,Cod_Cidade,1)
		
		if session("cod_vendaoferta") = "" or session("cod_vendaoferta") = 0 then
				session("cod_vendaoferta") =  Cod_VendaOferta_retorno
				Cod_VendaOferta = Cod_VendaOferta_retorno
				'REMOVER
				'response.Redirect("mp-sdk-php/gerar_preference_novo.php?id="&cod_vendaoferta)
				response.Redirect("carrinho_compras_cielo.asp") ' torar depois quando voltar mercadopago
			else
				session("cod_vendaoferta") =  Cod_VendaOferta_retorno
				Cod_VendaOferta = Cod_VendaOferta_retorno			
				response.Redirect("carrinho_compras_cielo.asp")
			end if		
	Case 2 
		call atualizarCarrinho(Cod_VendaOferta,Cod_Oferta,Qtde)
	Case 3
		call removerCarrinho(Cod_VendaOferta,Cod_Oferta)
		
		if verificarCarrinhoValido(Cod_VendaOferta) = 0 then
			if cod_usuario <> "" and cod_usuario <> 0 then
			%>

				<form action="http://www.clickmart.com.br/login_http.asp" method="post" id="form_h" name="form_h">
				<input type="hidden" name="logon" value="1" />
				<input name="email" type="hidden" id="email" value="<%= email_cons %>" />
				<input name="senha" type="hidden" id="senha" value="<%= senha_cons %>" />
				<input type="hidden" name="cod_vendaoferta" id="cod_vendaoferta" value="<%= cod_vendaoferta %>" />
			   </form>   
			   <script language="javascript">				
					window.onload = function()
					{
					document.forms[0].submit();
					}
				</script>
				<%
				response.End()
			else
			%>
			   <form action="http://www.clickmart.com.br/login_http.asp" method="post" id="form_h" name="form_h">
				<input name="email" type="hidden" id="email" value="0" />
				<input name="senha" type="hidden" id="senha" value="0" />
				<input type="hidden" name="cod_vendaoferta" id="cod_vendaoferta" value="<%= cod_vendaoferta %>" />
			   </form>   
				 <script language="javascript">				
					window.onload = function()
					{
					document.forms[0].submit();
					}
				</script>
				<%
				response.End()
			end if
		end if
			
		
End Select


dim desconto_pagamento_boleto
desconto_pagamento_boleto = 5

if forma_pagamento <> "" then
	if forma_pagamento = "boleto" then
		cn.execute("update venda_oferta set valor_desconto = valor_Total * ("&desconto_pagamento_boleto&"/100.00), forma_pagamento = '"&forma_pagamento&"' where cod_vendaoferta = " & cod_vendaoferta)
	else
		cn.execute("update venda_oferta set valor_desconto = 0, forma_pagamento = '"&forma_pagamento&"' where cod_vendaoferta = " & cod_vendaoferta)
	end if 
else
	dim rs_formapagamento
	strsql="select forma_pagamento from venda_oferta where cod_vendaoferta = " & cod_vendaoferta
	set rs_formapagamento=cn.execute(strsql)
	if not rs_formapagamento.eof then
		forma_pagamento = rs_formapagamento("forma_pagamento")
		if forma_pagamento = "boleto" then
			cn.execute("update venda_oferta set valor_desconto = valor_Total *("&desconto_pagamento_boleto&"/100.00), forma_pagamento = '"&forma_pagamento&"' where cod_vendaoferta = " & cod_vendaoferta)
		else
			cn.execute("update venda_oferta set valor_desconto = 0, forma_pagamento = '"&forma_pagamento&"' where cod_vendaoferta = " & cod_vendaoferta)
		end if
	end if
	set rs_formapagamento=nothing
end if




'carregar dados
Dim nome_retorno, cep_retorno, cpf_retorno, endereco_retorno, numero_retorno, complemento_retorno, bairro_retorno, ddd_Retorno, telefone_retorno, email_retorno, cod_cidade_retorno, cidade_retorno, coduf_retorno, senha_retorno, uf_retorno, aceite_retorno

if session("login_cdlar") = 1 then

	call ListarUsuario(cod_usuario)

	cep_destino = cep_retorno

	cn.execute("update venda_oferta set  cod_usuario = "& session("cod_usuario") &" where cod_vendaoferta = " & cod_vendaoferta & " and cod_usuario is null ")
	
	'REMOÇÃO
	'strsql="select preference from venda_oferta where cod_vendaoferta = " & cod_vendaoferta & " and preference is not null "
	'set rs=cn.execute(strsql)
	'if not rs.eof then
	'	preference = rs("preference")
	'else
	'	response.Redirect("mp-sdk-php/gerar_preference.php?id="&cod_vendaoferta)
	'end if
	set rs=nothing
else
	'REMOÇÃO
	'strsql="select preference from venda_oferta where cod_vendaoferta = " & cod_vendaoferta & " and preference is not null "
	'set rs=cn.execute(strsql)
	'if not rs.eof then
	'	preference = rs("preference")
	'else
	'	response.Redirect("mp-sdk-php/gerar_preference_novo.php?id="&cod_vendaoferta)
	'end if
	'set rs=nothing		
end if


'----------integração facebook----------'
Dim Email_FB,Primeiro_Nome_FB,Ultimo_Nome_FB,Data_Nascimento_FB,Sexo_FB

Email_FB = request.Form("email")
Primeiro_Nome_FB = request.Form("first_name")
Ultimo_Nome_FB = request.Form("last_name")
Data_Nascimento_FB = request.Form("birthday_date")
Sexo_FB = request.Form("sex")

'Email_FB = "morozino@gmail.com"
'Primeiro_Nome_FB = "Cristiano"
'Ultimo_Nome_FB = "Morozino"
'Data_Nascimento_FB = "24/12/1984"
'Sexo_FB = "Male"

'if Email_FB <> "" then

'	call PROC_CadastroUsuarioFB(Email_FB,Primeiro_Nome_FB,Ultimo_Nome_FB,Data_Nascimento_FB,Sexo_FB)
		
'	if not session("login_cdlar") = 1 then

'		nome_retorno = Primeiro_Nome_FB & " " & Ultimo_Nome_FB
'		email_retorno = Email_FB
	
'	end if
	
'	call Proc_adicionarCarrinhoFB()	
	
'End If
'----------integração facebook----------'

if Cod_VendaOferta = 0 then
	session("msg") = "Sessão Expirada, compre novamente"
	if cod_usuario <> "" and cod_usuario <> 0 then
	%>
		<form action="http://www.clickmart.com.br/login_http.asp" method="post" id="form_h" name="form_h">
			<input type="hidden" name="logon" value="1" />
			<input name="email" type="hidden" id="email" value="<%= email_cons %>" />
			<input name="senha" type="hidden" id="senha" value="<%= senha_cons %>" />
			<input type="hidden" name="cod_vendaoferta" id="cod_vendaoferta" value="<%= cod_vendaoferta %>" />
	   </form>   
	   <script language="javascript">				
			window.onload = function()
			{
				document.forms[0].submit();
			}
		</script>
		<%
		response.End()
	else
	%>
	   <form action="http://www.clickmart.com.br/login_http.asp" method="post" id="form_h" name="form_h">
		<input name="email" type="hidden" id="email" value="0" />
			<input name="senha" type="hidden" id="senha" value="0" />
			<input type="hidden" name="cod_vendaoferta" id="cod_vendaoferta" value="<%= cod_vendaoferta %>" />
		   </form>   
			 <script language="javascript">				
			window.onload = function()
			{
				document.forms[0].submit();
			}
			</script>
			<%
			response.End()
	end if
else
	'verifica se ja foi para o pagseguro
	call ValidarCarrinho(cod_vendaoferta)
	'verifica se ja foi para o pagseguro

end if

'apagar produtos com tweet
'cn.execute(" PROC_ValidarCompraTweetCarrinhoPadrao " & cod_vendaoferta)


'compra amigo indique oferta
Dim ID_Link

ID_Link = request.cookies("ID_Link_Amigo_Indique")
if ID_Link = "" then
	ID_Link = session("ID_Link_Amigo_Indique")
end if
if ID_Link <> "" then
	cn.execute("update venda_oferta set ID_Link_Compra_Oferta_Indique = "& ID_Link &" where cod_vendaoferta = " & cod_vendaoferta & " and ID_Link_Compra_Oferta_Indique = 0 ")
end if	

'compra afiliado
Dim ID_Campanha_Afiliado

ID_Campanha_Afiliado = request.cookies("ID_Campanha_Afiliado")
if ID_Campanha_Afiliado <> "" then
	cn.execute("update venda_oferta set ID_Campanha_Afiliado = "& ID_Campanha_Afiliado &" where cod_vendaoferta = " & cod_vendaoferta & " and ID_Campanha_Afiliado = 0 ")
end if	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Click Mart - Carrinho V2</title>
<style type="text/css">
body {
	margin: 0px;
	border: 0px;
	padding: 0px;
	top: 0px;
	background:url(img/bg-cart-topo.jpg) repeat-x center top;
	font-family:Arial, Helvetica, sans-serif;
	font-size:12px;
}

img {border:0px;}

.input_st {background-color:#F5F5F5; border:1px solid #C9C9C9; width:178px; height:22px;}

.input_stn {background-color:#F5F5F5; border:1px solid #C9C9C9; height:22px;}

.txt-preto-18 {font-size:16px;}

.txt-preto-14 {font-size:14px;}

.txt-branco-14 {font-size:14px; color:#FFF;}

.txt-branco-10 {font-size:10px; color:#FFF}

.txt-branco-12 {font-size:12px; color:#FFF}

.txt-cinza-12 {font-size:10px; color:#848484}

.txt-agua-12 {font-size:12px; color:#4B9375}

.txt-agua-16 {font-size:16px; color:#4B9375}

.txt-amarelo-12 {font-size:12px; color:#FFCC00}

.txt-preto-12 {font-size:12px; color:#000}

.txt-branco-18 {font-size:16px; color:#FFF}

.txt-amarelo-18 {font-size:16px; color:#FFCC00}

.txt-verde-15 {font-size:14px; color:#1D6407}

.botao:hover {
opacity: .5;
-webkit-transition: opacity;
-webkit-transition-timing-function: ease-out;
-webkit-transition-duration: 500ms;
}

.scale:hover {
-webkit-transform: scale(1.1);
-moz-transform: scale(1.1);
transform: scale(1.1);
}

a {text-decoration:none;}

</style>

<script type="text/javascript">var _sf_startpt=(new Date()).getTime()</script>

<script language="javascript">

var valorFG2;

function limpa_string(S){
	// Deixa so' os digitos no numero
	var Digitos = "0123456789";
	var temp = "";
	var digito = "";
    for (var i=0; i<S.length; i++){
      digito = S.charAt(i);
      if (Digitos.indexOf(digito)>=0){temp=temp+digito}
    }
    return temp
}

function valida_CPF(s)
{
	var i;
	s = limpa_string(s);
	var c = s.substr(0,9);
	var dv = s.substr(9,2);
	var d1 = 0;
	for (i = 0; i < 9; i++)
	{
		d1 += c.charAt(i)*(10-i);
	}
        if (d1 == 0) return false;
	d1 = 11 - (d1 % 11);
	if (d1 > 9) d1 = 0;
	if (dv.charAt(0) != d1)
	{
		return false;
	}
 
	d1 *= 2;
	for (i = 0; i < 9; i++)
	{
		d1 += c.charAt(i)*(11-i);
	}
	d1 = 11 - (d1 % 11);
	if (d1 > 9) d1 = 0;
	if (dv.charAt(1) != d1)
	{
		return false;
	}
        return true;
}
 




function showPopupLayer2(){
	
	$("#horizon2, #blend2").fadeIn(); 
	//$("#horizon, #blend").show(); 
	
	$("#popupLayer2").hide().slideDown(700);
	
}
 
function hidePopupLayer2(){
	document.getElementById('blend2').style.display="none";
	document.getElementById('horizon2').style.display="none";
}


</script>
<script language="javascript">

function Valida_pagamento() 
{
	preencheu = false;
	botoes = document.form1.forma_pagamento.length;
	for (i=0;i<botoes;i++) {
	if (document.form1.forma_pagamento[i].checked) {
		preencheu = true;
		break; }
	}
	return preencheu
}

function desmarcar_pagamento() 
{
	botoes = document.form1.forma_pagamento.length;
	for (i=0;i<botoes;i++) {
		document.form1.forma_pagamento[i].checked = false;
	}
}

var campos_erro = false

function atualizarCadastro(frete)
{
     // criacao do objeto XMLHTTP do arquivo ajax.js
     var oHTTPRequest = createXMLHTTP(); 
     oHTTPRequest.open("post", "ajax/atualizar_cadastro.asp", true); //enviamos para a página que faz o select do que foi digitado e traz a lista preenchida.
   // para solicitacoes utilizando o metodo post deve ser acrescentado 
   // este cabecalho HTTP
     oHTTPRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   // a funcao abaixo e executada sempre que o estado do objeto muda (onreadystatechange)
     oHTTPRequest.onreadystatechange=function(){
	 if (oHTTPRequest.readyState == 1) 
	 {
		//showPopupLayer2();
	 }
     // o valor 4 significa que o objeto ja completou a solicitacao
      if (oHTTPRequest.readyState==4){// abaixo o texto gerado no arquivo executa.asp e colocado no div
	  
	  
	  		if (oHTTPRequest.status == 200) 
			{
				hidePopupLayer2()
			} 
			else 
			{                    
				//alert("Erro ao atualizar dados.");
				hidePopupLayer2()
				location.href="carrinho_compras_cielo.asp";
				return false;
			}	
	  
	        document.getElementById("divCadastro2").innerHTML = oHTTPRequest.responseText;}}
		 
			var nome = document.form1.nome.value;
			CEP = document.form1.CEP.value;
			endereco = document.form1.endereco.value;
			cpf = document.form1.cpf.value;
			numero = document.form1.numero.value;
			complemento = document.form1.complemento.value;
			bairro = document.form1.bairro.value;
			DDD = document.form1.DDD.value;
			telefone = document.form1.telefone.value;
			cod_uf = document.form1.cod_uf.value;
			cidade = document.form1.cidade.value;

			TheForm = eval('document.form_pag')
			for (i = 0 ;i < TheForm.elements.length;  i++)  
			{
					fieldname = TheForm.elements[i].name ;
					if (fieldname.substring(0,11) == "Cod_Unidade")
					{
						if (TheForm.elements[i].value=="0")
						{
							msg="Por favor, selecione a unidade para a utilização do cupom ";
							alert( msg );
							TheForm.elements[i].focus()
							campos_erro = true;
							desmarcar_pagamento();
							return false;
						}
					}
					
					else if (fieldname.substring(0,32) == "qtde_presente_selecionado_oferta")
					{
						cod_oferta_validacao = fieldname.substring(32,40)
						
						qtde_presente_obrigatorio_validacao  = eval(document.getElementById("qtde_presente_obrigatorio"+cod_oferta_validacao).value);
						
						qtde_presente_selecionado_oferta_validacao = eval(document.getElementById("qtde_presente_selecionado_oferta"+cod_oferta_validacao).value);
						
						qtde_limite_oferta_validacao = eval(document.getElementById("qtde_limite_oferta"+cod_oferta_validacao).value);

						qtde_comprada_oferta_validacao = eval(document.getElementById("qtde_comprada_oferta"+cod_oferta_validacao).value);
						
						//alert("qtde_presente_obrigatorio_validacao: " + qtde_presente_obrigatorio_validacao)
						//alert("qtde_presente_selecionado_oferta_validacao: " + qtde_presente_selecionado_oferta_validacao)
						//alert("qtde_limite_oferta_validacao: " + qtde_limite_oferta_validacao)
						//alert("qtde_comprada_oferta_validacao: " + qtde_comprada_oferta_validacao)
						
						if ((qtde_comprada_oferta_validacao - qtde_presente_selecionado_oferta_validacao) > (qtde_limite_oferta_validacao - qtde_presente_obrigatorio_validacao))
						

						{
							msg="Você pode comprar até " + qtde_limite_oferta_validacao + " itens desta mesma oferta se "+ qtde_presente_obrigatorio_validacao +" forem para presente ";
							alert( msg );
							campos_erro = true;
							return false;
						}
					}


							
					else if (fieldname.substring(0,13) == "Nome_Presente")
					{
						check_presente = fieldname.substring(13,19)
						check_presente = document.getElementById("checkbox"+check_presente);
						if (check_presente.checked)
						{
							
							if ((TheForm.elements[i].value=="") || (TheForm.elements[i].value=="Nome"))
							{
								msg="Por favor, preencha o campo Nome do Presenteado Completo, Nome e Sobrenome ";
								alert( msg );
								TheForm.elements[i].focus()
								campos_erro = true;
								return false;
							}
							else if (TheForm.elements[i].value.length < 4){
								msg="Por favor, preencha o campo Nome do Presenteado com o Nome Completo, Nome e Sobrenome"
								alert( msg );
								TheForm.elements[i].focus()
								campos_erro = true;
								return false;
							}
							else if (TheForm.elements[i].value.indexOf(" ",2) == -1) 
							{
								msg="Por favor, preencha o campo Nome do Presenteado com o Nome Completo, Nome e Sobrenome"
								alert( msg );
								TheForm.elements[i].focus()
								campos_erro = true;
								return false;
							}						
						}
					}
					
					else if (fieldname.substring(0,14) == "Email_Presente")
					{
						check_presente = fieldname.substring(14,20)
						check_presente = document.getElementById("checkbox"+check_presente);
						if (check_presente.checked)
						{
							if ((TheForm.elements[i].value=="") || (TheForm.elements[i].value=="Email"))
							{
								msg="Por favor, preencha o campo E-mail do presente corretamente";
								alert( msg );
								TheForm.elements[i].focus()
								campos_erro = true;
								return false;
							}
							else if ((TheForm.elements[i].value.indexOf('@', 0) == -1 || TheForm.elements[i].value.indexOf('.', 0) == -1))  
							{
								msg="Por favor, preencha o campo E-mail do presente corretamente";
								alert( msg );
								TheForm.elements[i].focus()
								campos_erro = true;
								return false;					 
							}
						}	
					}
					
			}
			
			d1= document.form1;
			
			
			 if (d1.nome.value.indexOf(" ",2) == -1) {
			  alert("Favor informar o nome completo!");
			  d1.nome.focus();
			  campos_erro = true;
			 } else
		
			if (d1.email.value == "") {
				alert("Por favor preencha o campo de E-mail corretamente!");
				d1.email.focus();
				d1.email.select();
				campos_erro = true;
			} else 
		
			 if ((d1.email.value.indexOf('@', 0) == -1 ||
				  d1.email.value.indexOf('.', 0) == -1))  {
				 alert("Por favor preencha o campo de E-mail corretamente!");
				 d1.email.focus();
				 campos_erro = true;
			 }else
			 
			 if (d1.email.value != d1.email2.value) {
				alert("Os e-mails informados devem ser iguais!");
				d1.email2.focus();
				campos_erro = true;
			} else 
			 
			 <%
			 if not session("login_cdlar") = 1 then
			 %>
			 
			 if (d1.senha.value.length < 6)
			 {
			  alert("Senha Incorrata. A senha deve ter 6 caracteres ou mais.")
			  d1.senha.focus();
			  campos_erro = true;
			 }else
			 
			 if (d1.senha.value != d1.senha2.value)
			 {
       			alert("As senhas devem ser iguais.") 
				d1.senha2.focus();
				campos_erro = true;
		 	}else
		 <%
		 end if
		 %>
		 if (d1.email_igual.value == "1")
		 {
			alert("Este e-mail esta sendo utilizado por outro comprador.") 
			d1.email.focus();
			campos_erro = true;
		 }
 
		 else  if (CEP == ""){
			alert("O Campode CEP é obrigatório.") 
			document.form1.CEP.focus();
			campos_erro = true;
	 	}
		 else if (document.form1.endereco.value == "")
		 {
			alert("O Campode Endereço é obrigatório.") 
			document.form1.endereco.focus();
			campos_erro = true;
		 }

		else if ((valida_CPF(cpf) == false ))
		{
		   alert("O CPF não é válido !");
		   document.form1.cpf.focus();
		   campos_erro = true;
		 }
		 
		 else if (document.form1.numero.value == "")
		 {
			alert("O Campo de Numero é obrigatório.") 
			document.form1.numero.focus();
			campos_erro = true;
		 }
		 else if (document.form1.bairro.value == "")
		 {
			alert("O Campode Bairro é obrigatório.") 
			document.form1.bairro.focus();
			campos_erro = true;
		 }
		 else if (document.form1.DDD.value == "")
		 {
			alert("O Campode DDD é obrigatório.") 
			document.form1.DDD.focus();
			campos_erro = true;
		 }
		 else if (document.form1.telefone.value == "")
		 {
			alert("O Campode Telefone é obrigatório.") 
			document.form1.telefone.focus();
			campos_erro = true;
		 }
		 else if (document.form1.cidade.value == "")
		 {
			alert("O Campode Cidade é obrigatório.") 
			document.form1.cidade.focus();
			campos_erro = true;
		 }
		 else if ((!document.form1.aceite_contrato.checked) && (frete == 0))
		 {
			alert("É necessário confirmar a leitura e aceitar o contrato.") 
			document.form1.aceite_contrato.focus();
			campos_erro = true;
		 }
		 else if (!Valida_pagamento()){
			alert("Por favor Selecione uma Forma de Pagamento, no boleto você tem 5% de Desconto !");
			campos_erro = true;
		 } 
		 
		 else
		 {
		 	campos_erro = false;
			cod_usuario = document.getElementById("cod_usuario").value;
			

			if (cod_usuario > 0)
			{
				showPopupLayer2();
				oHTTPRequest.send("nome=" + encodeURI(nome) + "&CEP=" + encodeURI(CEP) + "&cpf=" + encodeURI(cpf) + "&endereco=" + encodeURI(endereco) + "&numero=" + encodeURI(numero) + "&complemento=" + encodeURI(complemento) + "&bairro=" + encodeURI(bairro) + "&DDD=" + encodeURI(DDD) + "&telefone=" + encodeURI(telefone) + "&cod_uf=" + encodeURI(cod_uf) + "&cidade=" + encodeURI(cidade) + "&cod_usuario=" + cod_usuario);
				
				if (frete == 1)
				{
					alert("Frete Calculado")
					location.href='carrinho_compras_cielo.asp?forma_pagamento=' + retornarRadio();
				}
				
			}
			else
			{
				cadastroRapido();
				
				alert("Dados de Endereço Modificados automaticamente pelo CEP, favor conferir e confirmar novamente a compra.") 
				document.form1.cidade.focus();
				campos_erro = true;
			}
		}
	   
	   //oHTTPRequest.send("txtEmail=" + email);
} 


</script>
<script type="text/javascript" src="js/jquery-1.2.6.pack.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.1.4.pack.js"/></script>
<script language="javascript" src="js/ajax.js"></script>
<script language="javascript" src="js/js_carrinho_v7.js"></script>
<script language="javascript" src="js/js_carrinho_compras.js"></script>
<script language="javascript" src="js/retornarEndereco.js"></script>
<script language="javascript" src="js/retornarCadastro2_v7.js"></script>
<script language="javascript" src="js/valida_cartao.js"></script>
<script>
<!--
function fcase(palavra) {
    if (palavra!= null ) {
        len = palavra.length;
        out = "";
        out += palavra.substring( 0, 1 ).toUpperCase();
        out += palavra.substring( 1,len ).toLowerCase();
    }
	return out.replace("_"," ");
}

var vazios;

function verTodos(){
vazios= false
qform= document.forms.length;
	 for (j=1; j<=3; j++){
		 
	 if(j==1){frm="form1";}else{frm="form"+j;}
	 
	 formj= eval("document."+ frm);
	 qformj= eval("formj.elements.length");
		   for (i= 0;i< qformj; i++){
			 d2= formj.elements[i];
			   if (d2.type!="hidden" && d2.name!="complemento"){
				 if (d2.value.length==0){
					 alert("Favor preencher todos os campos ou logar ao lado!");
					 d2.focus();
					 i= qformj;
					 j= 3;
					 vazios= true;
				 }
			   }
		   }
	 }
	 
	 if (!(vCEPGeral(document.getElementById("CEP").value,'CEP'))){
	 	vazios= true;
	 }
}

function vTab(x,y,cod_oferta){
	d1= document.getElementById("0"+x);
	d2= document.getElementById("1"+x);
	//alert(d1.style.display);
	dN= document.getElementById("Nome_Presente"+y)
	dE= document.getElementById("Email_Presente"+y)

	dO= document.getElementById("qtde_presente_selecionado_oferta"+cod_oferta)
	
	if (d1.style.display=="none"){
		d1.style.display="block";
		dO.value = (eval(dO.value) - 1);
		d2.style.display="none";
	} else {
		dN.value="Nome";
		dE.value="Email"
		d1.style.display="none";
		dO.value = (eval(dO.value) + 1);
		d2.style.display="block";
	}
	
}

function vunidade(id,valor,voucher,cod_uni,cont,cod_oferta){
	NomeP= document.getElementById("Nome_Presente"+cont);
	MailP= document.getElementById("Email_Presente"+cont);
	
	if (NomeP.value=="Nome"  || NomeP.value==""){NomePV=0;} else {NomePV=NomeP.value;}
	if (MailP.value=="Email" || MailP.value==""){MailPV=0;} else {MailPV=MailP.value;}
		
	var campo = "qtde_p"+cod_oferta+""+valor
		
	var qtde_valor = document.getElementById(campo).value;
		
	document.getElementById("qtde_taxa"+cont).value = qtde_valor;
	
	completaCarrinho('unidade_presente.asp?cod_voucher='+ voucher +'&cod_unidade='+ valor +'&presente_nome='+ NomePV +'&presente_email='+MailPV, 'vzo');
	
	//document.getElementById("TitCarrinho").innerHTML+= completaCarrinho;
}

function vresposta(valor,cod_oferta,cod_pergunta){
				
	completaCarrinho('resposta_carrinho.asp?cod_oferta='+ cod_oferta +'&cod_pergunta='+ cod_pergunta +'&cod_resposta='+ valor, 'vzo');
	
}


function vCamposPresente(id,valor,voucher,cod_uni,cont){
	d1= document.getElementById("Cod_Unidade"+cont);
	d2= document.getElementById("checkbox"+cont);
	d3= document.getElementById("Nome_Presente"+cont);
	d4= document.getElementById("Email_Presente"+cont);
	//alert(d2.checked);
	valorF= d1.options[d1.selectedIndex].value
	
	if (d3.value=="Nome"  || d3.value==""){NomePV=0;} else {NomePV=d3.value;}
	if (d4.value=="Email" || d4.value==""){MailPV=0;} else {MailPV=d4.value;}
	
	if (d2){
		if (d3.value!="Nome" && d4.value!="Email"){
			completaCarrinho('unidade_presente.asp?cod_voucher='+ voucher +'&cod_unidade='+ valorF +'&presente_nome='+ NomePV +'&presente_email='+ MailPV, 'vzo');
			//alert(completaCarrinho);
		}
	}
}

function vLoginSuc(){
	d= document.getElementById("nome");
	
	if (d.value==""){
		alert("Usuario ou senha inexistentes!");
	}
}

function vCEPGeral(x,y){
	if (x.length>0 && x.length<8){
		alert("Favor digitar o CEP completo!");
		return false;
	} else {
		obterRequisicao(x,'form1');
		//setTimeout('atualizarCadastro()',1000);
		return true;
	}
}

function vnum(x,y){
  for (i=0; i< x.length; i++){
	if (x.charAt(i)< '0' || x.charAt(i)> '9'){
		alert("Esse campo aceita apenas números !!!");
		document.getElementById(y).value= x.substring(0,(x.length - 1));
		return false;
	}
  }
}

function removeOption()
{
  var elSel = document.getElementById('parcela');
  for (i = elSel.length - 1; i>=0; i--) 
  {
      elSel.remove(i);
  }
}

function insertOption(value,text)
{
  var elSel = document.getElementById('parcela');
  var elOptNew = document.createElement('option');
    elOptNew.text = text;
    elOptNew.value = value;
    try 
	{
      elSel.add(elOptNew, null); // standards compliant; doesn't work in IE
    }
    catch(ex) 
	{
      elSel.add(elOptNew); // IE only
    }

}

function ajustarParcela()
{
	var parcela_minima = <%= parcela_minima %>;
	var valor_pagamento = valorFG2;
	var valor_parcela;
	
	removeOption()

	for (x=1; x< 4; x++)
	{
		valor_parcela = (valor_pagamento/x)
	 	if (( x == 1) || (valor_parcela >= parcela_minima))
		{
			insertOption(x,x + 'x de R$ ' + valor_parcela.toFixed(2).replace('.',',') );
		}
	}
}

qi=0;
function valida_qdade(campo,x,y,w,z,maxi,cod_oferta){
  d1= document.getElementById(y);
  //campo_qtde = eval('document.form_pag' + '.' + campo)
  
  if (eval(x)>0){
	completaCarrinho_refresh(w,z);
	
	//setTimeout('ajustarParcela()',6000);
		
	document.getElementById("qtde_comprada_oferta"+cod_oferta).value = x;
  } 
  
}

arroba= false;
ponto= false;
function vermail_baixo(x,y){
//y= "cad_rapido";
//x= document.getElementById(y).value;

  if (x.length>= 11){
	for (i=0; i< x.length; i++){
	  if (x.charAt(i)== '@'){
	    arroba= true;
	  }
	  
	  if (x.charAt(i)== "."){
	    ponto= true;
	  }
	}
	if (arroba!= true || ponto!= true){
	   alert("Favor informar o e-mail corretamente !!!");
	   document.getElementById(y).focus();
	}
  }
 
  if (x.length>= 1 && x.length< 11){
	alert("Favor informar o e-mail corretamente !!!");
	document.getElementById(y).focus();
	arroba= true;
  }
}


function vernome_baixo(x,y){
  		if (x.length < 4){
			alert("Favor informar o Nome Completo !!!");
			document.getElementById(y).focus();
		}
		else if (x.indexOf(" ",2) == -1)
		{
			alert("Favor informar o Nome Completo !!!");
			document.getElementById(y).focus();
		}
}
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>

<script type="text/javascript">

/***********************************************

***********************************************/

var offsetxpoint=-60 //Customize x offset of tooltip
var offsetypoint=20 //Customize y offset of tooltip
var ie=document.all
var ns6=document.getElementById && !document.all
var enabletip=false
if (ie||ns6)
var tipobj=document.all? document.all["dhtmltooltip"] : document.getElementById? document.getElementById("dhtmltooltip") : ""

function ietruebody(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
}

function ddrivetip(thetext, thecolor, thewidth){
if (ns6||ie){
if (typeof thewidth!="undefined") tipobj.style.width=thewidth+"px"
if (typeof thecolor!="undefined" && thecolor!="") tipobj.style.backgroundColor=thecolor
tipobj.innerHTML=thetext
enabletip=true
return false
}
}

function positiontip(e){
if (enabletip){
var curX=(ns6)?e.pageX : event.clientX+ietruebody().scrollLeft;
var curY=(ns6)?e.pageY : event.clientY+ietruebody().scrollTop;
//Find out how close the mouse is to the corner of the window
var rightedge=ie&&!window.opera? ietruebody().clientWidth-event.clientX-offsetxpoint : window.innerWidth-e.clientX-offsetxpoint-20
var bottomedge=ie&&!window.opera? ietruebody().clientHeight-event.clientY-offsetypoint : window.innerHeight-e.clientY-offsetypoint-20

var leftedge=(offsetxpoint<0)? offsetxpoint*(-1) : -1000

//if the horizontal distance isn't enough to accomodate the width of the context menu
if (rightedge<tipobj.offsetWidth)
//move the horizontal position of the menu to the left by it's width
tipobj.style.left=ie? ietruebody().scrollLeft+event.clientX-tipobj.offsetWidth+"px" : window.pageXOffset+e.clientX-tipobj.offsetWidth+"px"
else if (curX<leftedge)
tipobj.style.left="5px"
else
//position the horizontal position of the menu where the mouse is positioned
tipobj.style.left=curX+offsetxpoint+"px"

//same concept with the vertical position
if (bottomedge<tipobj.offsetHeight)
tipobj.style.top=ie? ietruebody().scrollTop+event.clientY-tipobj.offsetHeight-offsetypoint+"px" : window.pageYOffset+e.clientY-tipobj.offsetHeight-offsetypoint+"px"
else
tipobj.style.top=curY+offsetypoint+"px"
tipobj.style.visibility="visible"
}
}

function hideddrivetip(){
if (ns6||ie){
enabletip=false
tipobj.style.visibility="hidden"
tipobj.style.left="-1000px"
tipobj.style.backgroundColor=''
tipobj.style.width=''
}
}

document.onmousemove=positiontip



function isValidCreditCardNumber(cardNumber, cardType){
    var isValid = false;
    var ccCheckRegExp = /[^\d ]/;
    isValid = !ccCheckRegExp.test(cardNumber);
    if (isValid){
        var cardNumbersOnly = cardNumber.replace(/ /g,"");
        var cardNumberLength = cardNumbersOnly.length;
        var lengthIsValid = false;
        var prefixIsValid = false;
        var prefixRegExp;
    switch(cardType){
        case "mastercard":
            lengthIsValid = (cardNumberLength == 16);
            prefixRegExp = /^5[1-5]/;
        break;
		case "diners":
            lengthIsValid = (cardNumberLength == 14);
             prefixRegExp = /^3/;
        break;
        case "visa":
            lengthIsValid = (cardNumberLength == 16 || cardNumberLength == 13);
            prefixRegExp = /^4/;
        break;
        case "amex":
            lengthIsValid = (cardNumberLength == 15);
            prefixRegExp = /^3(4|7)/;
        break;
        default:
            prefixRegExp = /^$/;
            alert("Card type not found");
    }

    prefixIsValid = prefixRegExp.test(cardNumbersOnly);
    isValid = prefixIsValid && lengthIsValid;
    }
    if (isValid){
        var numberProduct;
        var numberProductDigitIndex;
        var checkSumTotal = 0;
        for (digitCounter = cardNumberLength - 1; digitCounter >= 0; digitCounter--){
            checkSumTotal += parseInt (cardNumbersOnly.charAt(digitCounter));
            digitCounter--;
            numberProduct = String((cardNumbersOnly.charAt(digitCounter) * 2));
            for (var productDigitCounter = 0; productDigitCounter < numberProduct.length; productDigitCounter++){
                checkSumTotal += parseInt(numberProduct.charAt(productDigitCounter));
            }
        }
        isValid = (checkSumTotal % 10 == 0);
    }

    return isValid;
}


function valida_cartao(){
	d1= eval("document.form3");
	
	var validacao = true;
	if (d1.numero_cartao.value==""){		
		alert("Favor informar o numero do Cartão");
		d1.numero_cartao.focus();
		validacao = false;
		}else
	
	
	if (!isValidCreditCardNumber(d1.numero_cartao.value,retornarRadio()))
	{
		alert("Favor informar o numero do Cartão Correto");
		d1.numero_cartao.focus();
		validacao = false;
	} else
		
		
		
	if (d1.nome_cartao.value==""){
		alert("Favor informar o nome impresso no Cartão");
		d1.nome_cartao.focus();
		validacao = false;
		}else
	if (d1.nome_cartao.value.indexOf(" ",2) == -1) {
		alert("Favor Informar o nome completo impresso no Cartão");
		d1.nome_cartao.focus();
		validacao = false;
		}else	
	if (d1.mes_cartao.value==""){
		alert("Favor informar o mês de validade do Cartão");
		d1.mes_cartao.focus();
		validacao = false;
		}else
	if (d1.mes_cartao.value > 12 || d1.mes_cartao.value <= 0){
		alert("Mês informado é inválido");
		d1.mes_cartao.focus();
		validacao = false;
		}else	
	if (d1.ano_cartao.value==""){
		alert("Favor informar o ano de validade do Cartão");
		d1.ano_cartao.focus();
		validacao = false;
		}else
	if (d1.ano_cartao.value < 11){
		alert("Ano informado é inválido");
		d1.ano_cartao.focus();
		validacao = false;
		}else		
	if (d1.codigo_cartao.value==""){
		alert("Favor informar o código de segurança do Cartão");
		d1.codigo_cartao.focus();
		validacao = false;
		}
	return validacao;
}


</script>

</head>
<%
ChartBeat()
%>
<body>

<div id="vzo"></div>
<!-- #### POPUP LAYER #### -->
<div id="blend2" style="display:none;"><!-- &nbsp; --></div>
	<div id="horizon2" style="display:none; z-index:999">
		<div class="layer-content" id="popupLayer2">



<table width="100%" border="0" bordercolor="#FF0000">
  <tr>
    <td><div align="center" style="position:fixed; left:40%; top:50p%; right:50%"> <img src="files/loading.gif" /></div></td>
  </tr>
</table>
      
			<!--<div id="pl-close-btn">x</div>--> 
			<div class="caption">		  
			</div>
 
			<div id="pl-subcaption"><!-- &nbsp; --></div>
		<div class="missed-deals-area" id="pl-showdeal"><!-- &nbsp; --></div> 
	</div>
</div>
 
 
 
</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>
    
    
    	<table width="951" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="60"><table width="951" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="135" height="60" valign="middle"><a href="default.asp"><img src="img/logo-cart.png" width="120" height="38" class="scale" /></a></td>
                <td width="46" height="60" align="center" valign="middle"><img src="img/spacer-topo.jpg" width="1" height="40" /></td>
                <td width="176" height="60" align="center" valign="middle"><span class="txt-branco-12">CARRINHO DE</span> <span class="txt-amarelo-12">COMPRAS &gt;</span></td>
                <td width="419" height="60" valign="middle">&nbsp;</td>
                <td width="175" height="60" align="right" valign="middle"><span class="txt-amarelo-12"><a href="default.asp" class="txt-amarelo-12">&lt; VOLTAR PARA CLICKMART</a></span></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="137"><table width="951" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="11"><img src="img/topo-topo.png" width="951" height="11" /></td>
              </tr>
              <tr>
                <td height="115" valign="middle" style="background:url(img/meio-topo.png) repeat-y center top;">
                
                <form  method="post" name="form_pag" id="form_pag" action="inicia_transacao.asp" target="_self">
                <input type="hidden" name="Cod_VendaOferta" id="Cod_VendaOferta" value="<%= Cod_VendaOferta %>">
                <input type="hidden" name="cod_usuario_vendaoferta" id="cod_usuario_vendaoferta" value="<%= cod_usuario %>" />
                <table width="925" border="0" align="center" cellpadding="0" cellspacing="0">
                <%
'contador pagseguro
Dim contador_carrinho
contador_carrinho = 1
Dim controle
controle = 0
						   
'total do carrinho
Dim valor_total
valor_total = 0
Conecta()
						  
dim retorno_proc
						  
Dim taxa_habilitada
				  
Dim cod_resposta_oferta
				  
Dim pergunta_carrinho_habilitar
				  
pergunta_carrinho_habilitar = 0
						  
taxa_habilitada = false

dim cod_oferta_ultima, cod_vocuher_ultimo

cod_oferta_ultima = 0
cod_vocuher_ultimo = 0

Strsql = "Select top 1 cod_oferta From V_Carrinho where Cod_VendaOferta = "& Cod_VendaOferta &" order by cod_oferta desc "
set rs=cn.execute(strsql)
cod_oferta_ultima = rs("cod_oferta")

Strsql = " Select top 1 cod_voucher From Voucher where Cod_VendaOferta = "& Cod_VendaOferta &"  and Cod_Oferta = "& cod_oferta_ultima &" order by cod_voucher desc "
set rs=cn.execute(strsql)
cod_vocuher_ultimo = rs("cod_voucher")

dim transportadora, tipo_entrega
transportadora = false
tipo_entrega = "Correios"
						  
'listar os produtos do carrinho
Dim cod_oferta_lista_carrinho
Strsql = "Select * From V_Carrinho where Cod_VendaOferta = "& Cod_VendaOferta &" order by cod_oferta "
'response.Write(strsql)
set rs=cn.execute(strsql)

valor_total_desconto = FormatCurrency(rs("valor_desconto"))

dim valor_cep_total
if not isnull(rs("valor_total")) then
	valor_cep_total = formatnumber(rs("valor_total"),2)
else
	valor_cep_total = 0
end if

codigo_cep = left(cep_destino,1)
if isnumeric(codigo_cep) then
	codigo_cep = int(codigo_cep) 
	'response.Write("<br>valor_cep_total: " & valor_cep_total)
	'response.Write("<br>valor_frete_gratis_sudeste: " & valor_frete_gratis_sudeste)
	'if valor_cep_total > valor_frete_gratis_sudeste then
		'response.Write("ok1")
	'else
		'response.Write("ok2")
	'end if
	'response.Write("codigo_cep:" & codigo_cep)
'	if (codigo_cep = 0 or codigo_cep = 1 or codigo_cep = 2 or codigo_cep = 3) or (codigo_cep = 8 or codigo_cep = 9 and valor_cep_total > 99) then	
	if (  ((codigo_cep = 0 or codigo_cep = 1 or codigo_cep = 2 or codigo_cep = 3) and int(valor_cep_total) > int(valor_frete_gratis_sudeste))) or ( (codigo_cep = 8 or codigo_cep = 9) and (valor_cep_total >  int(valor_frete_gratis_sul)  ) ) then
		'response.Write("ok--"&valor_cep_total)
		frete_gratuito_ligado = true
	else
		frete_gratuito_ligado = false
	end if
end if

if cod_usuario > 0 then
	frete_gratuito_ligado = FreteGratisUsuario(cod_usuario)
end if

valor_frete = 0
peso = 0
dim esedex_entrega, prazo_nf, prazo_snf

esedex_entrega=true

dim valor_frete_consulta

''''voltar'''''
if cep_destino <> "" then
	valor_frete_consulta = valorFrete("11172916","09083173","81019",cep_origem_loja,cep_destino,1,"1",30,30,30,0,"n",0,"n")
	if valor_frete_consulta = 0 then
		esedex_entrega = false
	end if
end if
''''''''''

'response.Write("valor_frete_consulta:" & valor_frete_consulta)

Do While not rs.eof
	if rs("cod_oferta") <> cod_oferta_lista_carrinho then
		
		if codigo_cep <> "" Then
			if (codigo_cep = 0 or codigo_cep = 1 or codigo_cep = 2 or codigo_cep = 3) and rs("frete_gratuito") then
				frete_gratuito_ligado = true
			end if
		end if
		
		'frete_gratuito_ligado = false
		
		'if session("login_cdlar") = 1 then
			if not (frete_gratuito_ligado) then
				'for x = 1 to rs("Qtde")
					'peso = rs("peso")
					'comprimento = rs("comprimento")
					'altura = rs("altura")
					'largura = rs("largura")
					'diametro = rs("diametro")
					'valor_unitario_produto = cint(rs("valor_unitario"))
					
					peso = peso + (rs("peso")*rs("Qtde"))
					comprimento = rs("comprimento")
					altura = rs("altura")
					largura = rs("largura")
					diametro = rs("diametro")
					valor_unitario_produto = cint( rs("valor_unitario") * rs("Qtde") )
					
					if peso >30 then
						peso = 30
					end if
					
					if comprimento > 90 then 
						comprimento = 90
					end if
					
					if altura > 90 then		
						altura = 90
					end if

					if altura > comprimento then
						altura =  comprimento
					end if
					
					if (comprimento + largura + altura) > 160 then
						comprimento = 52
						largura = 52
						altura = 52
					end if
					
					if altura < 2 then altura = 2
					if largura < 11 then largura = 11
					if comprimento < 16 then comprimento = 16
					
					''''''''''''''''''''''''''''''''''''''''''''''
					valor_frete = valorFrete("11172916","09083173","81019",cep_origem_loja,cep_destino,peso,"1",comprimento,altura,largura,diametro,"n",0,"n")
					
					if valor_frete = 0 then
						valor_frete = valorFrete("11172916","09083173","41068",cep_origem_loja,cep_destino,peso,"1",comprimento,altura,largura,diametro,"n",0,"n")
					end if
					''''''''''''''''''''''''''''''''''
					'valor_frete = 8
					
					'valor_frete = valor_frete - (valor_frete * 0.30)
					
					if rs("transportadora") then
						transportadora = true
						tipo_entrega = "Transportadora"
					end if
					
					if transportadora then
						if cep_destino <> "" then				
							set rs_freteTE=cn.execute("select frete from frete_e where "& cep_destino &" between cep_inicial and cep_final and '"& peso &"' between peso_inicial and peso_final")
							'response.Write("select frete from frete_e where "& cep_destino &" between cep_inicial and cep_final and '"& peso &"' between peso_inicial and peso_final")
							if not rs_freteTE.eof then
								if not isnull(rs_freteTE("frete")) then
									valor_frete_te = rs_freteTE("frete")
								end if
							end if
							valor_frete = valor_frete_te
						end if
					end if										
					
				'next
			'else
				'valor_frete = 0
			end if
			

			if rs("Frete_Gratis_Brasil") then
				frete_gratuito_ligado = true
				valor_frete = 0
'				response.End()
			end if
			
		'end if
		'response.Write("peso: " & peso & "<br>")
		''response.Write("comprimento: " & comprimento & "<br>")
		'response.Write("altura: " & altura & "<br>")
		'response.Write("largura: " & largura & "<br>")
		'response.Write("diametro: " & diametro & "<br>")
		'response.Write("valor: " & cint(rs("valor_unitario")*rs("qtde")) & "<br>")
		'response.Write("(valor_frete: " & valor_frete & "<br>")

		'response.Write(valor_frete)
		'response.End()
		
		valor_total = valor_total + rs("total")
		
		cod_resposta_oferta = rs("cod_resposta")
					 	  
		if rs("taxa_individual") > 0 then taxa_habilitada = true
					  
		if session("login_cdlar") = 1 then
			retorno_proc = VerificarLimiteCompra(cod_usuario,rs("cod_oferta"))
		 	    if retorno_proc = 1 Then
					call removerCarrinho(Cod_VendaOferta,rs("cod_oferta"))
					session("limite_msg") = "Infelizmente a compra limite por usuário foi atingida e não vai ser possível efetuar uma nova compra."
					if verificarCarrinhoValido(Cod_VendaOferta) = 1 then
						response.Redirect("carrinho_compras_cielo.asp")
					else
						response.Redirect("http://www.clickmart.com.br/cadastro_rapido.asp")
					end if
				end if
		end if
						  
		'strsql="select Qtde_Pessoas_Permitida,cod_unidade, descricao from V_Unidade_Loja_Carrinho where cod_oferta = " & rs("cod_oferta") & " and cidade = '"& session("Cidade_Selecionada") &"' order by descricao "
		strsql="select Qtde_Pessoas_Permitida,cod_unidade, descricao from V_Unidade_Loja_Carrinho where cod_oferta = " & rs("cod_oferta") & "  order by descricao "
		set rs_matriz=cn.execute(strsql)
		Do While not rs_matriz.eof
%>
			<input type="hidden" name="qtde_p<%= rs("cod_oferta")%><%= rs_matriz("cod_unidade") %>" id="qtde_p<%= rs("cod_oferta")%><%= rs_matriz("cod_unidade") %>" value="<%= rs_matriz("Qtde_Pessoas_Permitida") %>" />
		<%
		rs_matriz.movenext
		Loop
		%>
                  <tr>
                    <td>
                  
						    <%
                            strsql = " Select count(*) as total From Voucher where Cod_VendaOferta = "& Cod_VendaOferta &"  and cod_oferta = " & rs("cod_oferta") & " and   (presente_nome <> '' or presente_nome is not null)  "
                            set rs_presente_selecionado_total = cn.execute(strsql)
                            if not rs_presente_selecionado_total.eof then
                                qtde_presente_selecionado_oferta = rs_presente_selecionado_total("total")
                            else
                                qtde_presente_selecionado_oferta = 0
                            end if
                            %>
                           	<input type="hidden" name="valor_taxa<%= contador_carrinho %>" id="valor_taxa<%= contador_carrinho %>" value="<%= formatcurrency(rs("taxa_individual"),2)%>" />
                                    
                           	<input type="hidden" name="qtde_presente_obrigatorio<%= rs("cod_oferta") %>" id="qtde_presente_obrigatorio<%= rs("cod_oferta") %>" value="<%= rs("Qtde_Presente_Obrigatorio") %>" />
                            <input type="hidden" name="qtde_presente_selecionado_oferta<%= rs("cod_oferta") %>" id="qtde_presente_selecionado_oferta<%= rs("cod_oferta") %>" value="<%= qtde_presente_selecionado_oferta %>"  />
                            <input type="hidden" name="qtde_comprada_oferta<%= rs("cod_oferta") %>" id="qtde_comprada_oferta<%= rs("cod_oferta") %>" value="<%= rs("qtde") %>"  />
                                    
                            <input type="hidden" name="qtde_limite_oferta<%= rs("cod_oferta") %>" id="qtde_limite_oferta<%= rs("cod_oferta") %>" value="<%= rs("Limite_Compras_Usuario") %>"  />
                    <table width="925" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="141" height="68" align="center" valign="middle"><img src="Imagens/Oferta/Carrinho/thumb/<%= rs("Nome_Arquivo_Carrinho") %>" width="107" height="37" /></td>
                        <td width="333" height="68" align="left" valign="middle" style="padding:5px;">
                        
                        <p><%= rs("oferta") %></p>
                        <!--
                        <table border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="25" align="center" valign="middle" class="txt-preto-14"><font size="1"><strong>&nbsp;&nbsp;&nbsp;Prazo de Entrega:</strong>
                              Até 
                              <%
							  if esedex_entrega then
							  	prazo_nf = 3
								prazo_snf = 12
							  else
							  	prazo_nf = 6
								prazo_snf = 15
							  end if
							  
							  if rs("cod_oferta") = 538 then
							  	if esedex_entrega then
									prazo_snf = 6
								else
									prazo_snf = 9
								end if
							  end if
							  
							  if rs("NF") then response.Write(prazo_nf) else response.Write(prazo_snf)
				 			  %>
                              Dias úteis&nbsp;&nbsp;&nbsp;</font></td>
                          </tr>
                        </table>
                       -->
                        
                        </td>
                        <td width="24" height="68" align="center" valign="middle"><img src="img/spacer-topo.jpg" width="1" height="40" /></td>
                        <td width="98" height="68" align="center" valign="middle"><table width="88" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="32" align="center" valign="middle" bgcolor="#FFCC00" class="txt-preto-14"><strong><%= rs("percentual_desconto") %>% OFF</strong></td>

                          </tr>
                        </table></td>
                        <td width="24" height="68" align="center" valign="middle"><img src="img/spacer-topo.jpg" width="1" height="40" /></td>
                        <td width="104" height="68" align="center" valign="middle"><a href="carrinho_compras_cielo.asp?id=3&amp;id1=<%= rs("cod_loja") %>&amp;id2=<%= rs("Cod_VendaOferta") %>&amp;id3=<%= rs("Cod_Oferta") %>" ><img src="img/excluir.png" width="74" height="19" class="scale" /></a></td>
                        <td width="24" height="68" align="center" valign="middle"><img src="img/spacer-topo.jpg" width="1" height="40" /></td>
                        <td width="67" height="68" align="center" valign="middle"><strong>QTDE.</strong><br />                           
                        
                        <select style="width:55px" name="qtde<%= contador_carrinho %>" id="qtde<%= contador_carrinho %>" onChange="qi=this.value;vnum(this.value,this.id);valida_qdade('item_quant_<%= contador_carrinho %>',this.value,this.id,'completa_carrinho4.asp?cod_cidade=<%= cod_cidade %>&acao=2&cod_loja=<%= rs("cod_loja") %>&Cod_VendaOferta=<%= rs("Cod_VendaOferta") %>&Cod_Oferta=<%= rs("Cod_Oferta") %>&cc=<%= contador_carrinho %>&cod_unidade=0&ru=<%=rs("ru")%>&qtde_limite=<%= rs("QTDE_Limite") %>&qtde='+this.value, 'LCompras<%= contador_carrinho %>',<%= rs("Limite_Compras_Usuario") %>,<%= rs("Cod_Oferta") %>);" >
                        <%
						for x = 1 to rs("Limite_Compras_Usuario")
						%>
                        	<option value="<%= x %>" <% if rs("qtde") = x then response.Write(" selected ") %> ><%= x %></option>
                        <%
						next
						%>
                        </select>
                        
                        <br /></td>
                        <td width="24" height="68" align="center" valign="middle"><img src="img/spacer-topo.jpg" width="1" height="40" /></td>
                        <td width="86" height="68" align="center" valign="middle"><strong>PREÇO UNIT.</strong><br />
                          <div class="style5" align="center" id="divVUnitario<%= contador_carrinho %>"><%= formatcurrency( rs("valor_unitario")) %></div>
                                <div style="display:none" id="divVTotal1<%= contador_carrinho %>"><%= formatcurrency( rs("valor_unitario")) %></div>
                              </span>                         <br /></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td height="14"></td>
                  </tr><tr>
                    <td>
                <div id="LCompras<%= contador_carrinho %>">
       			<%
				Dim rs_v, contador_voucher, valor_nome, valor_email, vSelect, vDisp, vDisp1
							'id do voucher
				contador_voucher = 1
				strsql = " Select qtde_pessoa, cod_unidade, presente_nome, presente_email, cod_voucher From Voucher where Cod_VendaOferta = "& Cod_VendaOferta &"  and cod_oferta = " & rs("cod_oferta") & " order by cod_voucher "
				set rs_v=cn.execute(strsql)
				Do While not rs_v.eof
					if  contador_carrinho = 1 then
						controle = rs_v("cod_voucher")
					end if
										
					valor_nome= rs_v("Presente_Nome")
					valor_email= rs_v("Presente_Email")
										
					If valor_nome="" Or valor_nome="0" Or IsNull(valor_nome) Then
						valor_nome= "Nome"
					End If
										
					If valor_email="" Or valor_email="0" Or IsNull(valor_email) Then
						valor_email= "Email"
						vDisp="none"
						vDisp1="block"
						vSelect=""
					Else
						vSelect="checked='checked'"
						vDisp="block"
						vDisp1="none"
					End If
					%>
                  <table width="925" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="127" align="center" valign="middle"><strong>Unidade:</strong></td>
                        <td width="140" align="center" valign="middle">
                          
                          <select name="Cod_Unidade<%= contador_carrinho & contador_voucher %>"  id="Cod_Unidade<%= contador_carrinho & contador_voucher %>" style="width:140px; " onChange="vunidade(this.id,this.value,<%= rs_v("cod_voucher") %>,<% if isnull(rs_v("cod_unidade")) then response.Write("0") else response.Write(rs_v("cod_unidade")) %>,<%= contador_carrinho & contador_voucher %>,<%= rs("cod_oferta") %>);">
									<%
			IF isnull(rs("RU")) Then
	           	'Proc_listacombocodigo "select cod_unidade, descricao from V_Unidade_Loja_Carrinho where cod_oferta = " & rs("cod_oferta") & " and cidade = '"& session("Cidade_Selecionada") &"' order by descricao ", "cod_unidade", "Descricao", rs_v("cod_unidade")
				Proc_listacombocodigo "select cod_unidade, descricao from V_Unidade_Loja_Carrinho where cod_oferta = " & rs("cod_oferta") & "  order by descricao ", "cod_unidade", "Descricao", rs_v("cod_unidade")
			Else
			%>
               	<option value="0">Selecione a Unidade</option>
            <%
				if isnull(rs("QTDE_Limite")) then
					'Proc_listacombocodigo " select cod_unidade, descricao from V_Unidade_Loja_Carrinho where cod_oferta = " & rs("cod_oferta") & " and cidade = '"& session("Cidade_Selecionada") &"' order by descricao ", "cod_unidade", "Descricao", rs_v("cod_unidade")
					Proc_listacombocodigo " select cod_unidade, descricao from V_Unidade_Loja_Carrinho where cod_oferta = " & rs("cod_oferta") & " order by descricao ", "cod_unidade", "Descricao", rs_v("cod_unidade")
				else
					'Proc_listacombocodigo " select cod_unidade, descricao from V_Unidade_Loja_Carrinho where cod_oferta = " & rs("cod_oferta") & " and cidade = '"& session("Cidade_Selecionada") &"' and cod_unidade in(select cod_unidade from unidade_oferta_quantidade where cod_oferta = "& rs("cod_oferta") &" and qtde_compras_efetivadas < qtde_compra_limite ) order by descricao ", "cod_unidade", "Descricao", rs_v("cod_unidade")
					Proc_listacombocodigo " select cod_unidade, descricao from V_Unidade_Loja_Carrinho where cod_oferta = " & rs("cod_oferta") & " and cod_unidade in(select cod_unidade from unidade_oferta_quantidade where (cod_oferta = "& rs("cod_oferta") &") and ( (qtde_compras_efetivadas < qtde_compra_limite) or (  Qtde_Estoque_Atual > 0 )  ) ) order by descricao ", "cod_unidade", "Descricao", rs_v("cod_unidade")
				end if
			End if
            %>
					</select>

                           <input type="hidden" name="qtde_taxa<%= contador_carrinho & contador_voucher %>" id="qtde_taxa<%= contador_carrinho & contador_voucher %>" value="<%= rs_v("qtde_pessoa") %>" /> 
                                    
                       
                	</label>
                          
                          </td>
                        <td width="127" align="center" valign="middle"><strong>Presente?</strong></td>
                        <td width="32" align="center" valign="middle">
                        <input type="checkbox" name="checkbox<%= contador_carrinho & contador_voucher %>" id="checkbox<%= contador_carrinho & contador_voucher %>" <%= vSelect %> />     
                        </td>
                        <td width="127" align="center" valign="middle"><input name="Nome_Presente<%= contador_carrinho & contador_voucher %>" type="text" class="input_stn" id="Nome_Presente<%= contador_carrinho & contador_voucher %>" value="<%= valor_nome %>" size="11" onFocus="if(this.value=='Nome'){this.value='';}" onBlur="  if(this.value==''){this.value='Nome';}; vCamposPresente(this.id,this.value,<%= rs_v("cod_voucher") %>,<% if isnull(rs_v("cod_unidade")) then response.Write("0") else response.Write(rs_v("cod_unidade")) %>,<%= contador_carrinho & contador_voucher %>);" />     </td>
                        <td width="68" align="center" valign="middle"><input name="Email_Presente<%= contador_carrinho & contador_voucher %>" type="text" class="input_stn" id="Email_Presente<%= contador_carrinho & contador_voucher %>" value="<%= valor_email %>" size="11" onFocus="if(this.value=='Email'){this.value='';}" onBlur="  if(this.value==''){this.value='Email';}; vCamposPresente(this.id,this.value,<%= rs_v("cod_voucher") %>,<% if isnull(rs_v("cod_unidade")) then response.Write("0") else response.Write(rs_v("cod_unidade")) %>,<%= contador_carrinho & contador_voucher %>);" /> </td>
                        <td width="304" align="center" valign="middle"><table border="0" align="right" cellpadding="0" cellspacing="0">
                          <tr>
                            <td height="32" align="center" valign="middle" bgcolor="#FFCC00" class="txt-preto-14">
                              <%
                            if cod_oferta_ultima = rs("cod_oferta") and cod_vocuher_ultimo = rs_v("cod_voucher") then
					    if valor_frete <> "" then
							cn.execute("update venda_oferta set tipo_entrega = '" & tipo_entrega & "', valor_frete = '"& replace(valor_frete,",",".") &"', valor_pagamento = valor_total + '"& replace(valor_frete,",",".") &"' where cod_vendaoferta = " & cod_vendaoferta)
						end if
					  	
					  	
						valor_frete = 0
						Strsql = "Select isnull(valor_frete,0) as valor_frete,isnull(valor_taxa,0) as valor_taxa From Venda_Oferta where Cod_VendaOferta = "& Cod_VendaOferta
						'response.Write(Strsql)
						set rs_frete=cn.execute(strsql)
						if not rs_frete.eof then
							valor_frete = formatnumber(rs_frete("valor_frete"),2)
							valor_taxa = formatnumber(rs_frete("valor_taxa"),2)
						end if
						set rs_frete=nothing
						
					     valor_pagamento = valor_total-valor_total_desconto
						 valor_pagamento = valor_pagamento + valor_frete
						 valor_pagamento = valor_pagamento + valor_taxa 
						 						 
						 if valor_pagamento < 0 then valor_pagamento = 0
						
					  %>
                              <div align="center">
                                <table border="0" align="right" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td style="padding-left: 3px; font-weight: bold;" ><div align="left">
                                      <table border="0" cellspacing="0" cellpadding="0">
                                        <%
							  if valor_frete > 0 then
							  %>
                                        <tr>
                                          <td height="21"><div align="right"><span class="style100"><strong>FRETE:</strong></span></div></td>
                                          </tr>
                                        <%
							  end if
							  if taxa_habilitada then
							  %>
                                        <tr>
                                          <td height="21"><div align="right"><span class="style100"><strong>TAXA PORTUÁRIA:</strong></span></div></td>
                                          </tr>
                                        <%
							  end if
							  if valor_total_desconto > 0 then
							  %>
                                        <tr>
                                          <td height="21"><div align="right"><span class="style100"><strong>Desconto Boleto 5%:</strong></span></div></td>
                                          </tr>
                                        <%
							  end if
							  if valor_total_desconto > 0 or valor_frete > 0 or taxa_habilitada then
							  %>
                                        <tr>
                                          <td height="21"><div align="right"><span  class="style100"><strong>SUBTOTAL:</strong></span></div></td>
                                          </tr>
                                        <%
							  end if
							  %>
                                        <tr>
                                          <td height="21"><div align="right"><span class="style88"> </span>
                                            <span class="style92"><strong>TOTAL:</strong></span></div></td>
                                          </tr>
                                        </table>
                                      </div></td>
                                    
                                    <td style="padding-right:5px" ><div align="left">
                                      <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                        <%
							  if valor_frete > 0 then
							  %>
                                        <tr>
                                          <td height="21"><div align="right"><span class="style88"><span class="style86"><strong><%=  FormatCurrency(valor_frete) %></strong></span>:</span></div></td>
                                          </tr>
                                        <%
							  end if
							  %>
                                        <%
							  if taxa_habilitada > 0 then
							  %>
                                        <tr>
                                          <td height="21"><div align="right"><span class="style88"><span class="style86"><strong><%=  FormatCurrency(valor_taxa) %></strong></span>:</span></div></td>
                                          </tr>
                                        <%
							  end if
							  if valor_total_desconto > 0  then
							  %>
                                        <tr>
                                          <td height="21"><div align="right"><span class="style88"><span class="style86"><strong><%= FormatCurrency(valor_total_desconto) %></strong></span>:</span></div></td>
                                          </tr>
                                        <%
							  end if
							  if valor_total_desconto > 0 or valor_frete > 0 or taxa_habilitada then
							  %>
                                        <tr>
                                          <td height="21"><div align="right"><span class="style88" id="divVTotal2"><strong><%= FormatCurrency(valor_total) %></strong></span></div></td>
                                          </tr>
                                        <%
							  end if
							  %>
                                        <tr>
                                          <td height="21">
                                            <div align="right"><span class="style90" id="divVTotal3"><strong>
                                              <%
									if isnull(valor_pagamento) then
										session("cod_vendaoferta") = 0
										response.Redirect("default.asp")
									end if
									%>
                                              <%= FormatCurrency(valor_pagamento) %></strong></span>                                    </div></td>
                                          </tr>
                                        </table>
                                      </div></td>
                                    </tr>
                                  </table>
                                </div>
                              <%
					  end if
					  %>
                              
                              </td>
                            </tr>
                        </table></td>
                        </tr>
                    </table>
                     <%
			contador_voucher = contador_voucher + 1
		rs_v.movenext
		Loop
				%>
                    <input type="hidden" name="contador_voucher_limite<%= contador_carrinho %>" id="contador_voucher_limite<%= contador_carrinho %>" value="<%= contador_voucher %>" />
       </div>
                    </td>
                  </tr>
                            <%
		contador_carrinho = contador_carrinho + 1
		cod_oferta_lista_carrinho = rs("cod_oferta")
	end if
rs.movenext
Loop
						  
%>
                </table>
                </form>
                
                
                </td>
              </tr>
              <tr>
                <td height="11"><img src="img/baixo-topo.png" width="951" height="11" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="8"></td>
          </tr>
          <tr>
            <td height="597" valign="top"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="725" valign="top"><table  border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td height="11"><img src="img/topo-produto.png" height="11" /></td>
                  </tr>
                  <tr>
                    <td style="background:url(img/meio-quadro.png) repeat-y center top;">
					   <form action="carrinho_compras_cielo.asp" name="form1" id="form1" method="post" >
                    <%
					if( session("login_cdlar") = 1 and edit = "" and not isnull(cpf_retorno) and not isnull(DDD_retorno) )  then
					%>

                    	<input name="nome" id="nome" type="hidden" value="<%= nome_retorno %>" />
						<input name="email" id="email" type="hidden" value="<%= email_retorno %>" />
                        <input name="email2" id="email2" type="hidden"  value="<%= email_retorno %>"  />
						<input name="senha" type="hidden" id="senha"  value="<%= senha_retorno %>" />
                        <input name="senha2" type="hidden" id="senha2" value="<%= senha_retorno %>"  />
						<input name="CEP" type="hidden" id="CEP" value="<%= cep_retorno %>" />
						<input name="cpf" type="hidden" id="cpf" value="<%= cpf_retorno %>" />
						<input name="endereco" type="hidden" id="endereco"  value="<%= endereco_retorno %>"  />
						<input name="numero" type="hidden" id="numero" value="<%= numero_retorno %>" />
						<input name="complemento" type="hidden" id="complemento" value="<%= complemento_retorno %>"  />
						<input name="bairro" type="hidden" id="bairro" value="<%= bairro_retorno %>"  />
						<input name="DDD" type="hidden" id="DDD" value="<%= DDD_retorno %>"   />
						<input name="telefone" type="hidden" id="telefone" value="<%= telefone_retorno %>" />
                        <input name="cod_uf" type="hidden" id="cod_uf" value="<%= coduf_retorno %>"  />
						<input name="cidade" type="hidden" class="inputlogin" id="cidade"  size="25" value="<%= cidade_retorno %>" />
                        <input type="hidden" id="email_igual" name="email_igual" value="0" />
                        <input name="aceite_contrato" id="aceite_contrato" type="hidden" value="1" checked />
                        
                    <table border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td style="padding-left:10px" align="left">Todos os campos com * são obrigatórios:</td>
                      </tr>
                      <tr>
                        <td style="padding-left:10px"><img src="img/slide-t.jpg" width="230" height="31" /></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>
                        
                       
                        <span id="divCadastro2"></span>
                        
                        <table  border="0" cellspacing="0" cellpadding="0">
                        	<tr>
                            	<td style="padding-left:15px" height="34" background="<%=url_completa%>barranl2.jpg">
                                	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    	<tr>
                                      		<td width="22"><div align="left"><img src="setapassos.gif" width="16" height="15" /></div></td>
                                      		<td><div align="left" class="branco16 style87 style123"><strong>Olá <%= session("nome_topo") %>,</strong></div></td>
                                    	</tr>
                                  	</table>                                  
                                </td>
							</tr>
                            <tr>
                            	<td height="3"></td>
                            </tr>
                            <tr>
                            	<td height="58">
                                <table width="78%" border="0" cellspacing="2" cellpadding="2">
                                	<tr>
                                    	<td width="7" height="28">&nbsp;</td>
                                      	<td width="186" height="28" valign="top">
                                        	<table width="179" border="0" cellpadding="0" cellspacing="0" class="inputdmi1">
                                        		<tr>
                                          			<td>
                                                        <div class="pp" align="left">
                                                        <div align="left" class="style80">
                                                          <div align="left"><span class="style98"><%= nome_retorno %></span><br />
                                                              <span class="style96"><%= email_retorno %> <br />
                                                                <%= endereco_retorno & ", " & numero_retorno & " " & complemento_retorno & " - " & bairro_retorno %><br />
                                                              </span><span class="style96"><%= cidade_retorno %> - <%= uf_retorno %></span><br />
                                                          </div>
                                                        </div>
                                                      </div>
		                                          </td>
                                        		</tr>
                                      		</table>
										</td>
                                      	<td width="372" valign="top"><div align="left"><a href="<%= request.ServerVariables("SCRIPT_NAME")%>?edit=on"><img src="<%=url_completa%>editardados.jpg" border="0" /></a></div>
                                        </td>
                                    </tr>
                                </table>
                                </td>
                            </tr>
                          </table>
                             <%
							else
							%> 
                            
                            <table  border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td style="padding-left:5px" height="34">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                  <tr>
                                    <td width="22"><div align="left"><img src="setapassos2.gif" alt="" width="16" height="15" /></div></td>
                                    <td><div align="left"  ><strong><%
									if edit = "on" then
									%>
										 </strong>
                                        <div align="left" class="style87 style117 style121"><strong><span class="style128">Olá <%= session("nome_topo") %></span></strong></div>
                                        <strong><span    >
                                          <%
									else
									%>
									    </span></strong>
                                        
                                        
                                        
                                        <div align="left" class="style87 style117 style121"><strong><span class="style128">Novo Usuário</span></strong></div>
                                        <strong><span    >
                                        <%
									end if
									%>
                                          </span></strong></div></td>
                                  </tr>
                                </table>
                                
                        <table border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="123" height="35" align="left" valign="middle">Nome Completo *:</td>
                            <td width="220" height="35" align="left" valign="middle"><input name="nome" type="text" class="input_st" id="nome" value="<%= nome_retorno %>" /></td>
                            <td width="20" height="35" align="left" valign="middle">&nbsp;</td>
                            <td width="123" height="35" align="left" valign="middle">
                            <%
							If not session("login_cdlar") = 1 then
							%>
                            	Vale Presente:
                            <%
							end if
							%>    
                            </td>
                            <td width="204" height="35" align="left" valign="middle">
                            <%
							If not session("login_cdlar") = 1 then
							%>
                            <input name="cupom" type="text" class="input_st" id="cupom" />
                            <%
							end if
							%>
                            </td>
                          </tr>
                          <tr>
                            <td height="35" align="left" valign="middle">Email *:</td>
                            <td height="35" align="left" valign="middle">
                            <span id="divEmail">
                            <input type="hidden" name="email_igual" value="0" />
                            </span>
                            <input name="email" type="text" class="input_st" id="email"  <%
										If not session("login_cdlar") = 1 then
											response.Write(" onBlur='verifica_email(this.value)' ")
										end if
										%> value="<%= email_retorno %>" <%  If session("login_cdlar") = 1 Then response.Write(" readonly ") %> /></td>
                            <td height="35" align="left" valign="middle">&nbsp;</td>
                            <td height="35" align="left" valign="middle">Confirmar email *:</td>
                            <td height="35" align="left" valign="middle"><input name="email2" type="text" class="input_st" id="email2" value="<%= email_retorno %>" /></td>
                          </tr>
                        <%
						if not session("login_cdlar") = 1 then
						%>
                          <tr>
                            <td height="35" align="left" valign="middle">Senha *:</td>
                            <td height="35" align="left" valign="middle"><input name="senha" type="password" class="input_st" id="senha" value="" size="25" /></td>
                            <td height="35" align="left" valign="middle">&nbsp;</td>
                            <td height="35" align="left" valign="middle">Confirmar senha *:</td>
                            <td height="35" align="left" valign="middle"><input name="senha2" type="password" class="input_st" id="senha2" value="" size="25" /></td>
                          </tr>
                         <%
						 else
						 %>
                          <tr>
                          	<td height="0" colspan="5">
                            <input name="senha" type="hidden" class="inputlogin" id="senha"  size="25" value="<%= senha_retorno %>" />
                            <input name="senha2" type="hidden" class="inputlogin" id="senha2"  size="25" value="<%= senha_retorno %>"  />
                            </td>
                          </tr>
                         <%
						 end if
						 %>  
                          <tr>
                            <td height="35" align="left" valign="middle">CEP *:</td>
                            <td height="35" align="left" valign="middle"><input name="CEP" type="text" class="input_st" id="CEP"  <% 
										  If not session("login_cdlar") = 1 then
										  	response.Write(" onBlur='cadastroRapido();' ")
										  else
										  	response.Write(" onBlur='vCEPGeral(this.value, this.id);' ") 
										  end if
										  %> value="<%= cep_retorno %>" />
                                           <span id="divCadastro2"></span>
                                        </td>
                            <td height="35" align="left" valign="middle">&nbsp;</td>
                            <td height="35" align="left" valign="middle">CPF *:</td>
                            <td height="35" align="left" valign="middle"><input name="cpf" type="text" class="input_st" id="cpf" value="<%= cpf_retorno %>" /></td>
                          </tr>
                          <tr>
                            <td height="35" align="left" valign="middle">Endereço *:</td>
                            <td height="35" align="left" valign="middle"><input name="endereco" type="text" class="input_st" id="endereco" value="<%= endereco_retorno %>" /></td>
                            <td height="35" align="left" valign="middle">&nbsp;</td>
                            <td height="35" align="left" valign="middle">Número *:</td>
                            <td height="35" align="left" valign="middle"><input name="numero" type="text" class="input_st" id="numero" value="<%= numero_retorno %>" /></td>
                          </tr>
                          <tr>
                            <td height="35" align="left" valign="middle">Complemento *:</td>
                            <td height="35" align="left" valign="middle"><input name="complemento" type="text" class="input_st" id="complemento" value="<%= complemento_retorno %>" /></td>
                            <td height="35" align="left" valign="middle">&nbsp;</td>
                            <td height="35" align="left" valign="middle">Bairro *:</td>
                            <td height="35" align="left" valign="middle"><input name="bairro" type="text" class="input_st" id="bairro" value="<%= bairro_retorno %>" /></td>
                          </tr>
                          <tr>
                            <td height="35" align="left" valign="middle">Estado *:</td>
                            <td height="35" align="left" valign="middle">
                             <select style="width:195px; height:24px" name="cod_uf" class="inputlogin2" id="cod_uf">
                             <% 
							 	call Proc_listacombocodigo("Select cod_uf, descricao from uf","cod_uf","descricao",coduf_retorno)
							 %>
                             </select>
                            </td>
                            <td height="35" align="left" valign="middle">&nbsp;</td>
                            <td height="35" align="left" valign="middle">Cidade *:</td>
                            <td height="35" align="left" valign="middle">
                            <input name="cidade" type="text" class="input_stn" id="input_st"  size="25" value="<%= cidade_retorno %>" />
                            </td>
                          </tr>
                          <tr>
                            <td height="35" align="left" valign="middle">DDD + Telefone *:</td>
                            <td height="35" align="left" valign="middle">
                            <input style="width:25px" name="DDD" type="text" class="input_st" id="DDD"  value="<%= DDD_retorno %>"  size="2" maxlength="2"  />
                            <input style="width:148px"  name="telefone" type="text" class="input_st" id="telefone"  value="<%= telefone_retorno %>"  size="19" maxlength="8" />
                            </td>
                            <td height="35" align="left" valign="middle">&nbsp;</td>
                            <td height="35" align="left" valign="middle">&nbsp;</td>
                            <td height="35" align="left" valign="middle">&nbsp;</td>
                          </tr>
                        </table>
                        <%
							end if
							%>
                            <span id="divCadastro3"></span>
                          <table border="0" cellspacing="0" cellpadding="0">
                            <tr>
                              <td height="10" align="left" valign="middle"></td>
                            </tr>
                            <tr>
                              <td align="left" valign="middle"><label>
                                    <input name="aceite_contrato" id="aceite_contrato" type="checkbox" value="1" <% if aceite_retorno then response.Write(" checked ") %> onClick="atualizarCadastro(0);" />
                                  </label>
                               Confirmo que li e aceitei os <a  href="#" class="azul linkpreto" onClick="MM_openBrWindow('pop_contrato.html','','width=650,height=557')">Termos e Condições</a>.</td>
                            </tr>
                          </table>
                          <table width="100%">
                          	
                          		<tr>
                          		  <td width="99%"  height="32" colspan="3" style="background:url(spacer.png) no-repeat;">&nbsp;</td>
                        		  </tr>
                          		<tr>
                          		  <td colspan="3"><br />
                          		    <b><img src="setapassos2.gif" alt="" width="16" height="15" /> 
                                      <%
									  dim action_bt_cartao
									  if forma_pagamento = "boleto" or forma_pagamento = "ps" or forma_pagamento = "" then
									  		action_bt_cartao = "onClick='atualizarCadastro(1);'"
									  %>
                                    		Selecione uma Forma de Pagamento
                                      <%
									  else
									  		action_bt_cartao = ""
									  %>
                                      		Informe abaixos do seu cartão de crédito para finalizar sua compra:
                                      <%
									  end if
									  %>
                                    </b></td>
                        		  </tr>
                            	
                                <tr>
                                	<td colspan="3">
                                    
										<!-- cartao -->
                                        
                                        	
                          	<table width="100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                          <td height="58"><table width="100%" border="0" align="left" cellpadding="0" cellspacing="0" class="txt-cinza-escuro-14">
                              <tr>
                              
                                <td bgcolor="#F1F1F1">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                      <td width="124" style="padding-right:5PX"><div align="center"><a href="javascript:enviarSenha(document.login.email_login.value);" class="txt-azul-12"><strong>Boleto</strong></a>:</div></td>
                                      <td width="2" height="41" bgcolor="#FFFFFF"></td>
                                      <td width="12">&nbsp;</td>
                                      <td width="496"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="4%"><input name="forma_pagamento" id="forma_pagamento" type="radio" value="boleto" <% if forma_pagamento = "boleto" then response.Write(" checked ") %> onClick="atualizarCadastro(1);" /></td>
                                          <td width="20%"><img src='http://www.clickmart.com.br/boleto/ico_boleto.png' alt="img" border='0' /><br /></td>
                                          <td width="76%"><img src="http://www.clickmart.com.br/desconto5.jpg" alt="img" /><br />
                                            Economia de <strong><%= FormatCurrency(valor_total*(desconto_pagamento_boleto/100))%></strong> <br />
                                            Total da compra: <%= FormatCurrency(valor_total - (valor_total*(desconto_pagamento_boleto/100)))%></td>
                                        </tr>
                                      </table>
                                      </td>
                                    </tr>
								<%
								'response.Write("forma_pagamento: " & forma_pagamento)
								if forma_pagamento = "ps" or forma_pagamento = "" then
								%>
                                    <tr>
                                      <td style="padding-right:5PX"><div align="center"><a href="javascript:enviarSenha(document.login.email_login.value);" class="txt-azul-12"><strong>PagSeguro</strong></a>:</div></td>
                                      <td height="41" bgcolor="#FFFFFF"></td>
                                      <td>&nbsp;</td>
                                      <td>
                                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td width="10%"><input name="forma_pagamento" id="forma_pagamento3" type="radio" value="ps" <% if forma_pagamento = "ps" then response.Write(" checked ") %> onClick="atualizarCadastro(1);" /></td>
                                          <td width="90%"><img src="pagseguro-icon.jpg" alt="img" /></td>
                                        </tr>
                                      </table>
                                      </td>
                                    </tr>
                                  <%
								  end if
								  %>
                                    <tr>
                                      <td style="padding-right:5PX"><div align="center"><a href="javascript:enviarSenha(document.login.email_login.value);" class="txt-azul-12"><strong>Cartão: </strong></a>:</div></td>
                                      <td height="41" bgcolor="#FFFFFF"></td>
                                      <td><div align="right"></div></td>
                                      <td><div align="left">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                          <tr>
                                            <td width="20"><input type="radio" name="forma_pagamento" id="forma_pagamento" value="visa" <%= action_bt_cartao %> <% if forma_pagamento = "visa" then response.Write(" checked ")  %>  /></td>
                                            <td width="106"><div align="left"><img src="<%=url_completa%>c1.jpg" alt="img" width="71" height="28" /></div></td>
                                            <td width="20"><input type="radio" name="forma_pagamento" id="forma_pagamento" value="mastercard" <%= action_bt_cartao %> <% if forma_pagamento = "mastercard" then response.Write(" checked ")  %>/></td>
                                            <td width="106"><div align="left"><img src="<%=url_completa%>c2.jpg" alt="img" width="71" height="28" /></div></td>
                                            <td width="106"><input type="radio" name="forma_pagamento" id="forma_pagamento" value="amex" <%= action_bt_cartao %> <% if forma_pagamento = "amex" then response.Write(" checked ")  %>/></td>
                                            <td width="106"><div align="left"><img src="<%=url_completa%>c3.jpg" alt="img" width="71" height="28" /></div></td>
                                            <td width="106"><input type="radio" name="forma_pagamento" id="forma_pagamento" value="diners" <%= action_bt_cartao %> <% if forma_pagamento = "diners" then response.Write(" checked ")  %>/></td>
                                            <td width="106"><div align="left"><img src="<%=url_completa%>c4.jpg" alt="img" width="71" height="28" /></div></td>
                                            </tr>
                                          </table>
                                        </div>
                                        <div align="left"></div></td>
                                    </tr>
                                    </table>                                </td>
                               
                              </tr>
                          </table></td>
                        </tr>
                        <tr>
                        <td>                        </td>
                        </tr> 
                      </table>
                        <%
						if forma_pagamento = "visa" or forma_pagamento = "mastercard" or forma_pagamento = "amex" or forma_pagamento = "diners" then
						%>   
                         <table width="580" border="0" align="left" cellpadding="2" cellspacing="2" class="txt-cinza-escuro-14" id="tabela_pagamento">
                             <tr>
                               <td width="163" height="25"><div align="left" class="style80 style116">
                                   <div align="right"><span class="txt-preto-12">Número do Cartão:</span></div>
                               </div></td>
                               <td width="195" height="25"><span class="txt-preto-12">
                                 <input type="text" class="inputlogin" name="numero_cartao" id="numero_cartao" size="25" onKeyUp="vnum(this.value,this.id)" maxlength="16" />
                               </span></td>
                               <td height="25" colspan="2"><div align="left" class="style80">
                                   <div align="left" class="style58 style111"><span class="txt-preto-12">(Digite somente os números)</span></div>
                               </div></td>
                               </tr>
                             <tr>
                               <td height="25"><div align="left" class="style80 style116">
                                 <div align="right"><span class="txt-preto-12">Nome Impresso no Cartão:</span></div>
                                 </div></td>
                               <td height="25"><span class="txt-preto-12">
                                 <input type="text" class="inputlogin" name="nome_cartao" id="nome_cartao" size="25"  />                                 
                                 </span></td>
                               <td width="79" height="25">&nbsp;</td>
                               <td width="117">&nbsp;</td>
                             </tr>
                             <tr>
                               <td height="25"><div align="left" class="style80 style116">
                                 <div align="right"><span class="txt-preto-12">Parcela:</span></div>
                               </div></td>
                               <td height="25" colspan="3">
                                 <span class="txt-preto-12">
                                 <select style="width:300px"  name="parcela" id="parcela" class="inputlogin">
                                   <%
								 'valor_pagamento = 1000.00
								 dim vetor_taxa(11)
								 vetor_taxa(2) = 0.5314
								 vetor_taxa(3) = 0.3603
								 vetor_taxa(4) = 0.2755
								 vetor_taxa(5) = 0.2246
								 vetor_taxa(6) = 0.1908
								 vetor_taxa(7) = 0.1666
								 vetor_taxa(8) = 0.1485
								 vetor_taxa(9) = 0.1345
								 vetor_taxa(10) = 0.1232

								 
								 Dim valor_parcela, total_pago, Juros
								 for x = 1 to 10
								 	'valor_parcela = (valor_pagamento/x)
									valor_parcela = (valor_pagamento*vetor_taxa(x))
									total_pago = valor_parcela * x
									Juros = ((formatnumber(total_pago,2) / FormatNumber(valor_pagamento,2))-1)*100
									Juros = FormatNumber(Juros,2)
								 	'if x = 1 or valor_parcela >= parcela_minima then
									if x > 1 then
								    %>
                                   <option value="<%=x%>"><%= x %>x de <%= FormatCurrency(valor_parcela) %> - Total:<%= FormatCurrency(total_pago) %> </option>
                                   <%
								 	else
									%>
                                   <option value="<%=x%>"><%= x %>x de <%= FormatCurrency(valor_pagamento) %>  Sem Juros </option>						
                                   <%
									end if
								 next
								 %>
                                 </select>
                                 </span></td>
                             </tr>
                             <tr>
                               <td height="25">
                               <div align="left" class="style80 style116">
                                 <div align="right"><span class="txt-preto-12">Data de Validade:</span></div>
                                 </div></td>
                               <td height="25" colspan="3"><table width="292" border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                   <td width="110"><table width="111" border="0" cellspacing="0" cellpadding="0">
                                     <tr>
                                       <td width="32"><span class="txt-preto-12">
                                         <input type="text" class="inputlogin" maxlength="2" name="mes_cartao" id="mes_cartao" size="3"  onkeyup="vnum(this.value,this.id)"/>
                                       </span></td>
                                       <td style="padding-left:10px" width="33"><div align="left" class="style80">
                                         <div align="right" class="style111"><span class="txt-preto-12">/20</span></div>
                                         </div></td>
                                       <td style="padding-left:7px">
                                         <span class="txt-preto-12">
                                         <input type="text" maxlength="2" name="ano_cartao" id="ano_cartao" class="inputlogin"  size="3" onKeyUp="vnum(this.value,this.id)" />                                         
                                         </span></td>
                                       </tr>
                                     </table></td>
                                   <td width="182"><div align="left" class="style80">
                                     <div align="left" class="style111"><span class="txt-preto-12">(Ex: mm / aa)</span></div>
                                     </div></td>
                                   </tr>
                                 </table></td>
                             </tr>
                             <tr>
                               <td height="25"><div align="left" class="style80 style116">
                                   <div align="right"><span class="txt-preto-12">Código de Segurança:</span></div>
                               </div></td>
                               <td height="25" colspan="3"><table width="292" border="0" cellspacing="0" cellpadding="0">
                                   <tr>
                                     <td width="105"><span class="txt-preto-12">
                                       <input type="text" class="inputlogin" id="codigo_cartao" name="codigo_cartao" size="4" maxlength="4" onKeyUp="vnum(this.value,this.id)" />
                                     </span></td>
                                     <td width="187"><div align="left" class="style80">
                                         <div align="left"><a href="#" class="txt-azul-12" onClick="MM_openBrWindow('pop_cod_seguranca.html','','width=463,height=557')"><strong>Código de Segurança</strong></a></div>
                                     </div></td>
                                   </tr>
                               </table></td>
                             </tr>
                           </table>
                            <%
								end if
								%>
                                       
                                        <!-- cartao -->
                                        
                                        
                                        
                                        
                                    </td>
                                </tr>
                                
                            </table>
                          
                          </form>
                          </td>
                      </tr>
                      <tr>
                        <td  height="32" style="background:url(spacer.png) no-repeat;">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="10">&nbsp;</td>
                      </tr>
                      <tr>
                        <td style="padding-left:10px" align="left"><span class="txt-amarelo-18">►</span><span class="txt-preto-18"><strong> Finalize sua compra</strong></span></td>
                      </tr>
                      <tr>
                        <td height="15">&nbsp;</td>
                      </tr>
                      <tr>
                        <td>
                           <%
						   'response.Write(frete_gratuito_ligado)
						   'response.Write("<br>")
						   'response.Write(valor_frete)
						   if valor_frete = 0 and not frete_gratuito_ligado then
						   %>
                               <table border="0" cellspacing="0" cellpadding="0">
                                 <tr>
                                   <td height="25"><div align="right"><img src="1passo.jpg" width="48" height="13" /></div></td>
                                   <td height="25" style="padding-left:15px"><div align="right"><img src="2passo.jpg" width="49" height="13" /></div></td>
                                 </tr>
                                 <tr>
                                   <td><div align="left"><span style="padding-right:18px"><a href="javascript:atualizarCadastro(1);"><img src="calculafrete.jpg" border="0" align="right" /></a></span></div></td>
                                   <td width="200"><div align="right"><span style="padding-right:18px"><img src="comprarpicn.jpg" width="188" height="47" align="right" /></span></div></td>
                                 </tr>
                               </table>
                             <br />		
                           <%
						   else
						   %>
                           
                        <table border="0" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                            <td align="center" valign="top"><span class="txt-verde-15">ETAPA 1</span><br />
                              <br />
                              <a onClick="efetivarCompra(<%= Cod_VendaOferta %>,'<%= forma_pagamento %>')" style="cursor:pointer"><img src="img/confirmar-dados.jpg" width="244" height="59" class="botao" /></a></td>
                            <td align="center" valign="middle">&nbsp;</td>
                            <td align="center" valign="top"><span class="txt-verde-15">ETAPA 2</span><br />
                              <br />
                              
                             
                              </td>
                          </tr>
                        </table>
                        <%
						   end if
						   %>
                        </td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    </td>
                  </tr>
                  <tr>
                    <td height="11"><img src="img/baixo-quadro.png" width="725" height="11" /></td>
                  </tr>
                </table></td>
                <td valign="top">
                <%
				if not session("login_cdlar") = 1 then
				%> 
                
                <table width="225" border="0" cellspacing="0" cellpadding="0">
                
                  <tr>
                    <td><img src="img/topo-cadastro.png" width="225" height="11" /></td>
                  </tr>
                  <tr>
                    <td bgcolor="#28292A">
                    
                    <form id="login" name="login" method="post" action="login_carrinho_compras_cielo.asp" >
                                    <input type="hidden" name="Cod_VendaOferta" id="Cod_VendaOferta" value="<%= Cod_VendaOferta %>">     
                                    <input type="hidden" name="logon" id="logon" value="1" />
                    
                    
                    <table width="205" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr>
                        <td align="left" class="txt-branco-18">&nbsp;</td>
                      </tr>
                      <tr>
                        <td align="left" class="txt-branco-18"><strong>Já Sou Cadastrado</strong></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>
                        
                        	<table width="205" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="47" align="left" valign="middle" class="txt-branco-14"><strong>e-mail</strong></td>
                                <td width="158" align="right"><input name="email_login" type="text" class="inputlogin" id="email_login" size="21" onBlur="vermail_baixo(this.value,this.id);" value="<%= email_retorno %>" /></td>
                              </tr>
                            </table>
                        
                        </td>
                      </tr>
                      <tr>
                        <td>
                        
                        	<table width="205" border="0" cellspacing="0" cellpadding="0">
                              <tr>
                                <td width="47" align="left" valign="middle" class="txt-branco-14"><strong>senha</strong></td>
                                <td width="157" align="right"><input name="senha_login" type="password" class="inputlogin" id="senha_login" value="" size="21" /></td>
                              </tr>
                            </table>
                        	
                        
                        </td>
                      </tr>
                      <tr>
                        <td><table width="205" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="62">&nbsp;</td>
                            <td width="143" height="20" align="left" valign="middle"><a href="javascript:enviarSenha(document.login.email_login.value);" class="txt-branco-10">ou você esqueceu sua senha?</a></td>
                          </tr>
                        </table></td>
                      </tr>
                      <tr>
                        <td class="txt-branco-12">
                        
                        <div id="DivSenhaEmail"></div>
                                          <%
                                          if session("msg_login") <> "" then
                                            response.Write(session("msg_login"))
                                            session("msg_login") = ""
                                          end if
                                          %>
                        
                        </td>
                      </tr>
                      <tr>
                        <td align="center"><a href="javascript: document.login.submit();" ><img src="img/botao-login.png" width="107" height="31" class="scale" /></a></td>
                      </tr>
                    </table>
                    
                        </form>
                    
                    
                    </td>
                  </tr>
                  <tr>
                    <td><img src="img/baixo-cadastro.png" width="225" height="11" /></td>
                  </tr>
              
                </table>
                
                <%else%>
	           		<form name="form_cod_usuario" id="form_cod_usuario" method="post" action="carrinho_compras_cielo.asp">
		           		<input type="hidden" name="cod_usuario" id="cod_usuario" value="<%= cod_usuario %>" />
	                </form>                         
                <%
				end if
				%>  
                <div id="divCadastro1">
                        	<%
							if not session("login_cdlar") = 1 then
							%>  
	                            <form name="form_cod_usuario" id="form_cod_usuario" method="post" action="carrinho_compras_cielo.asp">
									<input type="hidden" name="cod_usuario" id="cod_usuario" value="0" />
								</form>  
	                            <%
							end if
							%>
                  </div>
                  <table width="215" border="0" align="center" cellpadding="0" cellspacing="0">
                   
                    <tr>
                      <td width="217" height="201" align="center" valign="middle" style="background:url(img/quadro-selos.png) no-repeat center top;"><img src="img/selos.jpg" width="212" height="159" /></td>
                    </tr>
                    <tr>
                      <td height="201" align="center" valign="top" style="background:url(img/quadro-selos.png) no-repeat center top;"><img src="img/entrega-car.jpg" width="209" height="267" /></td>
                    </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="19">&nbsp;</td>
          </tr>
        </table>
    
    
    </td>
  </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="background:url(img/bg-cart-baixo.jpg) repeat-x center bottom;">
    
    	<table width="951" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="79" align="left" valign="middle"><a href="default.asp"><img src="img/logo-cart.png" width="120" height="38" class="scale" /></a></td>
  </tr>
</table>

    
    </td>
  </tr>
</table>
</body>

<script>
<!--
function trataValor(x){
	if (x!=""){
		arr= x.split(" ");
		return parseFloat(arr[1].replace(",","."));
	}
}

function conta(k){
	d2= document.form_pag.elements.length;
	for (i=1;i<=d2;i++){
		if (!(document.getElementById("checkbox"+k+i))){
			return (i - 1);
			i=d2;
		}
	}
}

function validaPerguntaCarrinho()
{
	var pergunta_carrinho = <%= pergunta_carrinho_habilitar %>	
	var preencheu = false;
	
	if (pergunta_carrinho == 1)
	{
		botoes = document.form_pag.idpc.length;
		for (i=0;i<botoes;i++) 
		{
			if (document.form_pag.idpc[i].checked) 
			{
				preencheu = true;
				break; 
			}
		}
		return preencheu
	}
	else
	{
		return true
	}	
}


//lCarrinho= document.getElementById("LCompras").innerHTML;
//	$(document).ready(function(){
//		$("#telefone").mask("9999-9999");
//		$("#CEP").mask("99999-999");
		//$("#data").mask("99/99/9999");
		//$("#cpf").mask("999.999.999-99");
//	});

//setTimeout('verTodos();',2000);
-->



</script>
<%
'call atualizarCarrinho(33,4,3)

if session("limite_msg") <> "" then
%>
	<script language="javascript">
	alert("<%=session("limite_msg")%>")
	</script>
<%
	session("limite_msg") = ""
end if


GA()


call Tag_Google_Carrinho_Chegada()

%>
<script language="javascript">
	
function habilitar_cartao(habilita)	
{
if ( (habilita) && (valorFG2 > 0) )
	{
		document.getElementById("tabela_pagamento").style.display = "";
	}
	else
	{
		document.getElementById("tabela_pagamento").style.display = "none";
	}
}


function habilitar_mp(habilita)	
{
	if (habilita)
	{
		document.getElementById("divBotaoMP").style.display = "";
	}
	else
	{
		document.getElementById("divBotaoMP").style.display = "none";
	}
}

</script>
</body>

<%      
if cod_usuario <> "" and cod_usuario <> 0 then
		%>
            <form action="http://www.clickmart.com.br/login_http.asp" method="post" id="form_h" name="form_h">
            <input type="hidden" name="logon" value="1" />
            <input name="email" type="hidden" id="email" value="<%= email_cons %>" />
            <input name="senha" type="hidden" id="senha" value="<%= senha_cons %>" />
            <input type="hidden" name="cod_vendaoferta" id="cod_vendaoferta" value="<%= cod_vendaoferta %>" />
           </form>   
<%
else
%>
           <form action="http://www.clickmart.com.br/login_http.asp" method="post" id="form_h" name="form_h">
            <input name="email" type="hidden" id="email" value="0" />
            <input name="senha" type="hidden" id="senha" value="0" />
            <input type="hidden" name="cod_vendaoferta" id="cod_vendaoferta" value="<%= cod_vendaoferta %>" />
           </form>   
            <%
end if 
%>

</html>
<%
Desconecta()

%>
