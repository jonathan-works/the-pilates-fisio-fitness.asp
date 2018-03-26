// JavaScript Document
var transacao_cartao = false

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
	d1= eval("document.form1");
	
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


function efetivarCompraCartao(id) 
{	
	//alert("what");
	if (!transacao_cartao)
	 
	{
	//alert("entrou");	
	// criacao do objeto XMLHTTP do arquivo ajax.js
     var oHTTPRequest = createXMLHTTP(); 
     oHTTPRequest.open("post", "cielo/pages/carrinhoCartaoPagamento.php", true); //enviamos para a pÃ¡gina que faz o select do que foi digitado e traz a lista preenchida.
   // para solicitacoes utilizando o metodo post deve ser acrescentado 
   // este cabecalho HTTP
     oHTTPRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   // a funcao abaixo e executada sempre que o estado do objeto muda (onreadystatechange)
     oHTTPRequest.onreadystatechange=function()
	 {
		 if (oHTTPRequest.readyState == 1) 
		 {
				//showPopupLayer2();
		 }	 
		  if (oHTTPRequest.readyState==4)
		  {// abaixo o texto gerado no arquivo executa.asp e colocado no div
		  	 
			 hidePopupLayer2();
		  	 
			 transacao_cartao = false;
			 
			 if (oHTTPRequest.status == 200) 
	  		 {
				 //alert("OIOIOI");
				// alert(retorno_compra);
				 document.getElementById("divCadastro3").innerHTML = oHTTPRequest.responseText;
				 //alert(oHTTPRequest.responseText);
				 var retorno_compra
				 retorno_compra = document.getElementById("retorno_compra").value
				 //alert(retorno_compra);
				 
				 if ((retorno_compra == 4) || (retorno_compra == 6) )
				 {
					 	alert("Pagamento efetuado com sucesso!");
						location.href="http://www.pilatesfisiofitness.com.br/recibo.asp";
					 	//location.href="https://www.cariocaeletrohome.com/compra-concluida.asp?id="+id;
				 }
				 else if ((retorno_compra == 1) || (retorno_compra == 5) || (retorno_compra == 41) || (retorno_compra == 51) || (retorno_compra == 57) )
				 {
					 	alert("Compra não autorizada, entre em contato com o seu banco para liberar a compra.");
						//alert(retorno_compra);
						document.getElementById("numero_cartao").value='';
				 }
				 else if (retorno_compra == 7) 
				 {
					 	alert("Transação negada - Venda nÃ£o autorizada.");
				 }
				 else if (retorno_compra == 8) 
				 {
					 	alert("Código de Segurança Inválido.");
				 }
				 else if ((retorno_compra == 12) || (retorno_compra == 15))
				 {
					 	alert("Número do Cartão informado esta errado, por favor corriga e tente novamente.");
				 }
				 else if ((retorno_compra == 3) || (retorno_compra == 10) || (retorno_compra == 13))
				 {
					 	alert("Problemas para processar sua compra, tente novamente mais tarde, se o erro permitir entre em contato com a Carioca.");
				 }
				 else if (retorno_compra == 54) 
				 {
					 	alert("Cartão Vencido ou data de validade informada errada.");
				 }
				 else if (retorno_compra == 78) 
				 {
					 	alert("Cartão de Crédito Bloqueado, entre em contato para desbloquear.");
				 }
				 else if ((retorno_compra == 96) || (retorno_compra == 99) || (retorno_compra == 110) )
				 {
					 	alert("Sistema fora, tente novamente mais tarde.");
				 }
				 else
				 {
						alert(retorno_compra + " Erro na transação, tente novamente por favor.");	 
				 }
		 	 }
			 else
			 {
				alert("Erro na transação, tente novamente por favor.");
			 }
			 
		 }
		 
	 }
				
		
		
		if (valida_cartao())
		{	
			transacao_cartao = true;
				
			numero_cartao = document.getElementById("numero_cartao").value;
			nome_cartao = document.getElementById("nome_cartao").value;
			parcela = document.getElementById("parcela").value;
			mes_cartao = document.getElementById("mes_cartao").value;
			ano_cartao = document.getElementById("ano_cartao").value;
			codigo_cartao = document.getElementById("codigo_cartao").value;
			forma_pagamento = retornarRadio();
			//alert(numero_cartao)
			//alert(nome_cartao)
			//alert(parcela)
			//alert(mes_cartao)
			//alert(ano_cartao)
			//alert(codigo_cartao)
			//alert(forma_pagamento)
			
			showPopupLayer2()
			
			//alert(parcela);
			
			
			oHTTPRequest.send("id=" + encodeURI(id) + "&numero_cartao=" + encodeURI(numero_cartao) + "&nome_cartao=" + encodeURI(nome_cartao) + "&parcela=" + encodeURI(parcela) + "&mes_cartao=" + encodeURI(mes_cartao) + "&ano_cartao=" + encodeURI(ano_cartao) + "&codigo_cartao=" + encodeURI(codigo_cartao) + "&forma_pagamento=" + encodeURI(forma_pagamento) );
			
		document.getElementById("numero_cartao").value = ""
		document.getElementById("codigo_cartao").value = "";
		document.getElementById("nome_cartao").value = "";	
		document.getElementById("mes_cartao").value = "";
		document.getElementById("ano_cartao").value = "";
		document.getElementById("codigo_cartao").value = "";	
		}
		
	}
	else
	{
		alert("Aguarde, sua compra já esta sendo processada")
		
	}
} 





// JavaScript Document

function enviarSenha(email)
{
	if (email != '')
	{
     // criacao do objeto XMLHTTP do arquivo ajax.js
     var oHTTPRequest = createXMLHTTP(); 
     oHTTPRequest.open("post", "ajax/enviar_senha.asp", true); //enviamos para a página que faz o select do que foi digitado e traz a lista preenchida.
   // para solicitacoes utilizando o metodo post deve ser acrescentado 
   // este cabecalho HTTP
     oHTTPRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   // a funcao abaixo e executada sempre que o estado do objeto muda (onreadystatechange)
     oHTTPRequest.onreadystatechange=function(){
     // o valor 4 significa que o objeto ja completou a solicitacao
      if (oHTTPRequest.readyState==4){// abaixo o texto gerado no arquivo executa.asp e colocado no div
         document.getElementById("DivSenhaEmail").innerHTML = oHTTPRequest.responseText;}}
		 
       oHTTPRequest.send("txtEmail=" + encodeURI(email));
	   alert("Senha Enviada com Sucesso!");
	   //oHTTPRequest.send("txtEmail=" + email);
	}
	else
	{
		alert("Preencha o campo E-mail")
		document.login.email_login.focus()
	}
} 


function verifica_email(email)
{
     // criacao do objeto XMLHTTP do arquivo ajax.js
     var oHTTPRequest = createXMLHTTP(); 
     oHTTPRequest.open("post", "ajax/verifica_email.asp", true); //enviamos para a página que faz o select do que foi digitado e traz a lista preenchida.
   // para solicitacoes utilizando o metodo post deve ser acrescentado 
   // este cabecalho HTTP
     oHTTPRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
     // a funcao abaixo e executada sempre que o estado do objeto muda (onreadystatechange)
     oHTTPRequest.onreadystatechange=function()
	 {
     	// o valor 4 significa que o objeto ja completou a solicitacao
	  	if (oHTTPRequest.readyState == 1) 
		{
			//showPopupLayer2();
	  	}
      	if(oHTTPRequest.readyState==4)
		{
			if (oHTTPRequest.status == 200) 
			{
				hidePopupLayer2()
				document.getElementById("divEmail").innerHTML = oHTTPRequest.responseText;
			} 
			else 
			{                        
				hidePopupLayer2()
				alert("Erro ao carregar dados.");
				location.href="carrinho.asp";
			}		 
		 }
	 }
	
	showPopupLayer2()
		 
     oHTTPRequest.send("txtEmail=" + encodeURI(email)); 
} 

function cadastroRapido()
{
     // criacao do objeto XMLHTTP do arquivo ajax.js
     var oHTTPRequest = createXMLHTTP(); 
     oHTTPRequest.open("post", "ajax/cadastro_rapido.asp", true); //enviamos para a página que faz o select do que foi digitado e traz a lista preenchida.
   // para solicitacoes utilizando o metodo post deve ser acrescentado 
   // este cabecalho HTTP
     oHTTPRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   // a funcao abaixo e executada sempre que o estado do objeto muda (onreadystatechange)
     
	oHTTPRequest.onreadystatechange=function()
		 {
		 // o valor 4 significa que o objeto ja completou a solicitacao		 
//			 alert(oHTTPRequest.readyState)
			if (oHTTPRequest.readyState == 1) 
			{
				//showPopupLayer2();
			}
			if(oHTTPRequest.readyState==4)
			{
				if (oHTTPRequest.status == 200) 
				{
					hidePopupLayer2()
					document.getElementById("divCadastro1").innerHTML = oHTTPRequest.responseText;
					vCEPGeral(document.form1.CEP.value, document.form1.CEP.id);
				} 
				else 
				{                    
					alert("Erro ao carregar dados.");
					hidePopupLayer2()
					location.href="carrinho.asp";
				}		 
			}
		 }

		 
		 d1= document.form1;
		
		 if (d1.nome.value.indexOf(" ",2) == -1) {
		  alert("Favor informar o nome completo!");
		  d1.nome.focus();
		 } else
	
		if (d1.email.value == "") {
			alert("Por favor preencha o campo de E-mail corretamente!");
			d1.email.focus();
			d1.email.select();
		} else 
	
		 if ((d1.email.value.indexOf('@', 0) == -1 ||
			  d1.email.value.indexOf('.', 0) == -1))  {
			 alert("Por favor preencha o campo de E-mail corretamente!");
			 d1.email.focus();
		 } else 
		 
		 if (d1.senha.value.length < 6)
		 {
		  alert("Senha Incorrata. A senha deve ter 6 caracteres ou mais.")
		  d1.senha.focus();
		 }
		 else if (d1.senha.value != d1.senha2.value)
		 {
       		alert("As senhas devem ser iguais.") 
			d1.senha2.focus();
		 }
		 else if (d1.email_igual.value == "1")
		 {
			alert("Este e-mail esta sendo utilizado por outro comprador.") 
			d1.email.focus();
		 }
		 else
		 {
			 showPopupLayer2()
			 
			oHTTPRequest.send("nome=" + encodeURI(d1.nome.value) + "&email=" + encodeURI(d1.email.value) + "&senha=" + encodeURI(d1.senha.value));
		 }
	   
	   //oHTTPRequest.send("txtEmail=" + email);
} 



function efetivarCompra(cod_venda) 
{	
	// criacao do objeto XMLHTTP do arquivo ajax.js
     var oHTTPRequest = createXMLHTTP(); 
     oHTTPRequest.open("post", "ajax/efetivar_compra.asp", true); //enviamos para a página que faz o select do que foi digitado e traz a lista preenchida.
   // para solicitacoes utilizando o metodo post deve ser acrescentado 
   // este cabecalho HTTP
     oHTTPRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
   // a funcao abaixo e executada sempre que o estado do objeto muda (onreadystatechange)
     oHTTPRequest.onreadystatechange=function()
	 {
		 if (oHTTPRequest.readyState == 1) 
		 {
				//showPopupLayer2();
		 }	 
		  if (oHTTPRequest.readyState==4)
		  {// abaixo o texto gerado no arquivo executa.asp e colocado no div
		  	 if (oHTTPRequest.status == 200) 
	  		 {
				 document.getElementById("divCadastro3").innerHTML = oHTTPRequest.responseText;
				 
				 if (document.getElementById("retorno_compra").value == 1) 
				 {
					 	document.form_pag.action = "inicia_transacao.asp" 
					 	document.form_pag.submit();	
				 }
				 else
				 {
					 location.href="default.asp";
				 }
		 	 }
			 else
			 {
				alert("Erro ao carregar dados.");
				hidePopupLayer2()
				location.href="carrinho.asp";
			 }
		 }
	 }
		
		atualizarCadastro();
		
		if (!campos_erro)
		{
			if (retornarRadio() == "boleto" || retornarRadio() == "pagseguro")
			{
				showPopupLayer2()
				cod_usuario = document.getElementById("cod_usuario").value;
				oHTTPRequest.send("cod_venda=" + cod_venda + "&cod_usuario=" + cod_usuario);
			}
			else
			{
				efetivarCompraCartao(cod_venda);
			}
		}	
			
} 


function validarCompra()
{	
	atualizarCadastro();
		
	if (!campos_erro)
	{
		cod_usuario = document.getElementById("cod_usuario").value;
		document.form_pg.submit();	
	}
	else
	{		
   		for (i=0;i<document.form_pg.forma_pagamento.length;i++)
		{ 
      			document.form_pg.forma_pagamento[i].checked=false;
		}
   	} 								
} 



function logarCadastro() 
{
	var email = document.login.email_login.value;
	var senha = document.login.senha_login.value;	
	obterRequisicaoCadastro(email,senha)
}