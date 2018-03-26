<!--#include file = "admin/conexao.asp"-->
<!--#include file = "cdosys.asp"-->
<!--#include file = "class-Envio_Emails.asp"-->
<%Conecta()%>
<%
'<!--#include file="
'redirect.asp"-->"
'Insere no banco de dados os dados enviados pelo form de inscrição
Dim cmd, formacao, tipo_pagamento

	formacao = request("txt1_Formacao")
	'formacao = Formacao_NumeroParaTexto(formacao)

	tipo_pagamento = request("txt1_TipodePagamento")
	'tipo_pagamento = TipoPagamento_NumeroParaTexto(tipo_pagamento)
	On error resume next
	if request("pagamento2") = "" Then

		if session("Sessao_Inscricao") = "" then
			Set cmd = Server.CreateObject("ADODB.Command")
				
			Set cmd.ActiveConnection = cn
			cmd.CommandText = "PROC_inserirInscricao_new"
			cmd.CommandType = 4
			cmd.Parameters.Refresh
				cmd.Parameters("@nome") = request("txt1_Nome")
				cmd.Parameters("@endereco") = request("txt1_Endereco")
				cmd.Parameters("@CEP") = request("txt1_cep")
				cmd.Parameters("@telefone") = request("txt1_Telefone")
				cmd.Parameters("@celular") = request("txt1_Celular")
				cmd.Parameters("@cpf") = request("txt1_cpf")
				cmd.Parameters("@email") = request("txt1_Email")
				cmd.Parameters("@tipo_pagamento") = request("txt1_TipodePagamento")
				cmd.Parameters("@cod_turma") = request("cod_turma")
				cmd.Parameters("@formacao") = formacao
			cmd.Execute	
		else
			cod_inscricao = session("Sessao_Inscricao")
		end if
	
	end if
	
	tipo_pagamento = lcase(replace(tipo_pagamento,"ã","a"))
	If Err.number <> 0 then 
    	if instr(Err.description, "@cod_turma") > 0 then 	 
    		Response.write "Turma nao encontrada. Você será redirecionado em 5 segundos"   	
	    	Response.AddHeader "Refresh", "5;URL=http://www.thepilatesfisiofitness.com.br/inscreva-se2.asp?turma=31" 
	    	response.end
		end if
  	End If


%>
<script type="text/javascript" src="<%="https://"&request.ServerVariables("HTTP_HOST")%>/js/ajax.js"></script>
<script type="text/javascript" src="<%="https://"&request.ServerVariables("HTTP_HOST")%>/js/js_carrinho_v7_new2.js"></script>
<script>
function retornarRadio()
{
	radio = document.form1.forma_pagamento;

	for(i=0; i<radio.length; i++)
		{
			if (radio[i].checked == true)
				{
					return(radio[i].value);
				}
		}
}
function showPopupLayer2(){
	
	$("#horizon2, #blend2").fadeIn(); 
	$("#horizon2, #blend2").show(); 
	
	$("#popupLayer2").hide().slideDown(700);
	
}
 
function hidePopupLayer2(){
	document.getElementById('blend2').style.display="none";
	document.getElementById('horizon2').style.display="none";
}

</script>

<!DOCTYPE html>
<html>
<head>
<title>The Pilates Fitness</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/neat-blue.css" media="screen" id="neat-stylesheet">
<link rel="stylesheet" href="https://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
<link rel="stylesheet" href="libs/Bootstrap-Image-Gallery-3.1.1/css/bootstrap-image-gallery.min.css">

<style>

.input-lg {
  height: 46px;
  padding: 10px 16px;
  font-size: 16px;
  line-height: 1.3333333;
  border-radius: 6px;
}

</style>

<!-- Use google font -->
<link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,300italic,400italic,700italic|Lustria" rel="stylesheet" type="text/css" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
</head>


  <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-94120888-1', 'auto');
  ga('send', 'pageview');

</script>
<body class="background-clouds">
<!-- #### POPUP LAYER #### -->


<!--#include file = "top-menu.asp"--> 

<!-- Breadcrumbs - START -->
<div class="breadcrumbs-container">
  <div class="container">
    <ol class="breadcrumb">
      <li><a href="index.asp">Home</a></li>
      <li class="active">Inscreva-se</li>
    </ol>
  </div>
</div>
<!-- Breadcrumbs - END --> 

<!-- Component: login-registration/registration-alt1.html - START -->
<section class="">
  <div class="container">
    <h1><span>Inscreva-se</span></h1>
    <div class="row">
	     <%
				Dim tipo_de_pagamento, cod_curso, preco_curso
				tipo_de_pagamento = request.Form("txt1_TipoDePagamento")
				
				if tipo_de_pagamento = "" Then
					tipo_de_pagamento = "Cartao"
				end if
				 
				if session("Sessao_Inscricao") = "" then 
					Dim sql_inscricao, rs_inscricao, cod_inscricao
					sql_inscricao = "SELECT MAX(cod_inscricao) as codigo from inscricao"
					set rs_escopo = cn.execute(sql_inscricao) 
				   
					cod_inscricao = rs_escopo("codigo")
					
					session("Sessao_Inscricao") = cod_inscricao
				end if
				
				if request("pagamento2") <> "" Then
				
					cod_inscricao = request.QueryString("cod_inscricao")
				
				end if
				
				dim sql_curso, rs_curso
				sql_curso = "select c.cod_curso, c.preco from curso c inner join turma t on t.cod_curso = c.cod_curso inner join inscricao i on i.cod_turma = t.cod_turma where cod_inscricao = "& cod_inscricao 				
				set rs_curso = cn.execute(sql_curso)
				
				cod_curso = rs_curso("cod_curso")
				preco_curso = rs_curso("preco")
				session("valor_curso") = preco_curso
				'response.write(preco_curso)
				%>
      <div  class="col-sm-12 col-md-offset-3 col-md-6">
        <div class="thumbnail info-thumbnail background-lead color-text">
          <div class="special background-lead color-white">
			<%if tipo_de_pagamento = "Cheque" then%>
			<h3><span class="fa fa-user"></span> Você está quase lá! Falta apenas  realizar o pagamento do sinal no valor de R$100,00 e levar os cheques com o restante do valor no primeiro dia do curso.</h3>
			<%else%>
            <h3><span class="fa fa-user"></span> Você está quase lá! Falta apenas  realizar o pagamento para garantir sua vaga.</h3>
			<%end if%>
          </div>					
          <div  class="caption bordered background-white">		         		
			<%
				'envio email
				
				to_email="contato@thepilatesfisiofitness.com.br"
				'to_email="alan@ddwb.com.br"
				'to_email="lehnihon@hotmail.com"

				assunto="Formulário - Fisio Fitness Pilates"

				'Funcao no arquivo cdosys.asp
				stremail = gerar_htmlEmail2("Aguardando",cod_inscricao)

				Dim sql_email, rs_email
				'cod_inscricao = replace(cod_inscricao,"insert","")
				'cod_inscricao = replace(cod_inscricao,";","")
				'cod_inscricao = replace(cod_inscricao,",","")
				'cod_inscricao = replace(cod_inscricao,"'","")
				'cod_inscricao = replace(cod_inscricao,"update","")
				sql_email = "SELECT * FROM Inscricao WHERE Cod_inscricao = "& cod_inscricao
'				response.write(sql_email)
'				response.end
				set rs_email = cn.execute(sql_email)

				from_email = rs_email("email")'request.Form("txt1_Email")

				FROM_Servidor = "contato@thepilatesfisiofitness.com.br" ' este email tem que ser do dominio do site

					if isEmpty(session("Sessao_Inscricao_Email")) Then					
						session("Sessao_Inscricao_Email") = session.SessionID()
						Proc_Email FROM_Servidor, from_email,to_email,assunto, stremail,"cristiano@ddwb.com.br"		

					end if
				
				'Pagamentos Feitos por Cartão
				if (replace(tipo_de_pagamento,"ã","a") = "Cartao") Then
				
			%>
            <form method="post" name="form1" id="form1" action="inscrevase-sucesso.asp">
            	<input type="hidden" name="valor_curso" id="valor_curso" value="<%=preco_curso%>"/>
            	
              <input type="hidden" name="cod_turma" id="cod_turma" value="<%=request.QueryString("turma")%>">
               <div align="left">
                  <div style="float:left; width:30px;">
                    <input type="radio" style="width:40px; height:20px; margin-bottom:20px;" class="form-control input-lg" name="forma_pagamento" value="visa">
                  </div>
                  <div style="float:left"><img src="<%="https://"&request.ServerVariables("HTTP_HOST")%>/c1.jpg" alt="img" width="71" height="28" /></div>
                  <div style="float:left; width:30px;">
                    <input type="radio" style="width:40px; height:20px; margin-bottom:20px" class="form-control input-lg" name="forma_pagamento" value="mastercard">
                  </div>
                  <div style="float:left"><img src="<%="https://"&request.ServerVariables("HTTP_HOST")%>/c2.jpg" alt="img" width="71" height="28" /></div>
                   <div style="float:left; width:30px;">
                    <input type="radio" style="width:40px; height:20px; margin-bottom:20px" class="form-control input-lg" name="forma_pagamento" value="amex">
                  </div>
                  <div style="float:left"> <img src="<%="https://"&request.ServerVariables("HTTP_HOST")%>/c3.jpg" alt="img" width="71" height="28" /></div>
                 
                </div>
              <div class="controls controls-row">
              <div style="margin-bottom:25px; display:block; clear:left;" align="left">Insira os dados do Cartão</div>
                
                
                <div id="blend2" style="display:none;"><!-- &nbsp; --></div>
	<div id="horizon2" style="display:none; z-index:999">
		<div class="layer-content" id="popupLayer2">



<table width="100%" border="0" bordercolor="#FF0000">
  <tr>
    <td><div align="center" style="position:fixed; left:48%; top:50p%; right:50%"> <img src="loading.gif" /></div></td>
  </tr>
</table>
      
			<!--<div id="pl-close-btn">x</div>--> 
			<div class="caption">		  
			</div>
 
			<div id="pl-subcaption"><!-- &nbsp; --></div>
		<div class="missed-deals-area" id="pl-showdeal"><!-- &nbsp; --></div> 
	</div>
</div> 
                
                <div align="left" style=" display:block; clear:left;">
                  <input type="text" class="form-control input-lg" name="numero_cartao" id="numero_cartao" style="width:100%; margin-bottom:20px" placeholder="Número do Cartão">
                </div>
               
                <div align="left" style="display:block; clear:left;">
                  <input type="text" class="form-control input-lg" name="nome_cartao" id="nome_cartao" style="width:width:100%; margin-bottom:20px" placeholder="Nome do titular">
                </div>
                <div align="left">
                  <select name="parcela" id="parcela" class="form-control input-lg" style="margin-bottom:20px">
                    <option>Quantidade de Parcelas</option>
                    <option value="1">R$ 1,00 À vista produto teste"</option>
                    
                  </select>
                </div>
                <div align="left" style="display:block; clear:left;"> <span style="float:left; margin-left:0px; margin-right:4px; margin-top:10px; "><font size="+1">Válido até:</font></span>
                  <input maxlength="2" type="text" class="form-control input-lg" name="mes_cartao" id="mes_cartao" style="width:65px;  float:left; margin-right:10px; " placeholder="mm">
                  <input maxlength="2" type="text" class="form-control input-lg" name="ano_cartao" id="ano_cartao" style="width:55px; float:left;" placeholder="aa">
                  <input maxlength="4" type="text" class="form-control input-lg" name="codigo_cartao" id="codigo_cartao" style=" float:left; margin-bottom:20px; width:56%; margin-left:10px;"  placeholder="Cód. de Segurança">
                </div>
                <a onClick="efetivarCompraCartao(<%=cod_inscricao%>)" class="btn btn-large btn-primary" style="display:block; clear:left;">Finalizar Pagamento</a> </div>
              <div class="controls controls-row"></div>
              <div class="controls controls-row"></div>
              <div id="divCadastro3"> </div>
            </form>
            <%'Final de Pagamento com Cartão
				
	
				'Pagamentos com Boleto
				ElseIf (tipo_de_pagamento = "Boleto") Then%>
            
             	<%response.Redirect("compra-concluida.asp?id="&cod_inscricao)%>
			
				<%ElseIf (tipo_de_pagamento = "Cheque") Then%>
					<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
					<form action="https://pagseguro.uol.com.br/checkout/v2/payment.html" method="post" onsubmit="PagSeguroLightbox(this); return false;">
						<!-- NÃO EDITE OS COMANDOS DAS LINHAS ABAIXO -->
						<input type="hidden" name="code" value="1FB1834FF4F4886994DE9F97CB0AC3B2" />
						<input type="image" src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/209x48-pagar-azul-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
					</form>
					<script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
					<!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
            	<%'response.Redirect("compra-concluida.asp?id="&cod_inscricao)
				%> 
				<%else
					'response.write(cod_curso)
					if cod_curso = 1 then%>
						<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
						<form action="https://pagseguro.uol.com.br/checkout/v2/payment.html" method="post" onsubmit="PagSeguroLightbox(this); return false;">
							<!-- NÃO EDITE OS COMANDOS DAS LINHAS ABAIXO -->
							<input type="hidden" name="code" value="E56E6D777B7B1418842DCF8D5F997B0B" />
							<input type="image" src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/209x48-pagar-azul-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
						</form>
						<script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
						<!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
					<%
					elseif cod_curso = 2 then%>
						<form action="https://pagseguro.uol.com.br/checkout/v2/payment.html" method="post" onsubmit="PagSeguroLightbox(this); return false;">
						<!-- NÃO EDITE OS COMANDOS DAS LINHAS ABAIXO -->
							<input type="hidden" name="code" value="20094C36101023E884DCAFA4739DFA27" />
							<input type="image" src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/209x48-pagar-azul-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
						</form>
						<script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
					<%
					elseif cod_curso = 3 then%>
					<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
					<form action="https://pagseguro.uol.com.br/checkout/v2/payment.html" method="post" onsubmit="PagSeguroLightbox(this); return false;">
						<!-- NÃO EDITE OS COMANDOS DAS LINHAS ABAIXO -->
						<input type="hidden" name="code" value="39A8BAB37D7DF37AA4A51FBBB65DD639" />
						<input type="image" src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/209x48-pagar-azul-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
					</form>
					<script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
					<!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
					<%
					else%>
						<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
						<form action="https://pagseguro.uol.com.br/checkout/v2/payment.html" method="post" onsubmit="PagSeguroLightbox(this); return false;">
							<!-- NÃO EDITE OS COMANDOS DAS LINHAS ABAIXO -->
							<input type="hidden" name="code" value="E1FBF5420C0C639884D00FBBE99936A5" />
							<input type="image" src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/209x48-pagar-azul-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
						</form>
						<script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
						<!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
					<%end if%>
                <%End if%>
				
          </div>
          <!--<div class="list-group bright background-clouds color-text"><a href="#" class="list-group-item">Dados Bancários:<br>
                  <strong>Banco Itaú</strong><br>
                  Ag: 0680<br>
                  C/C: 05015-0<br>
                  FISIO FITNESS PILATES LTDA<br>
                  CNPJ: 16.803.566/0001-91</a></div>
                <p><strong>COLOCAR OS PAGAMENTOS VIA CARTÃO AQUI</strong></p>
              </div>--> 
          
        </div>
      </div>
    </div>
  </div>
  </div>
</section>

<!-- Component: login-registration/registration-alt1.html - END --> 

<!--#include file = "footer.asp"--> 

<!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
<div id="blueimp-gallery" class="blueimp-gallery"> 
  <!-- The container for the modal slides -->
  <div class="slides"></div>
  <!-- Controls for the borderless lightbox -->
  <h3 class="title">title</h3>
  <a class="prev">‹</a> <a class="next">›</a> <a class="close">×</a> <a class="play-pause"></a>
  <ol class="indicator">
  </ol>
  <!-- The modal dialog, which will be used to wrap the lightbox content -->
  <div class="modal fade">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" aria-hidden="true">&times;</button>
          <h4 class="modal-title">title</h4>
        </div>
        <div class="modal-body next"></div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default pull-left prev"> <i class="glyphicon glyphicon-chevron-left"></i> Previous </button>
          <button type="button" class="btn btn-primary next"> Next <i class="glyphicon glyphicon-chevron-right"></i> </button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script> 

<!-- Include slider --> 
<script src="js/jquery.event.move.js"></script> 
<script src="js/jquery.mixitup.min.js"></script> 
<script src="js/responsive-slider.js"></script> 
<script src="js/responsive-calendar.js"></script> 
<script src="https://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script> 
<script src="libs/Bootstrap-Image-Gallery-3.1.1/js/bootstrap-image-gallery.min.js"></script> 
<script src="js/reduce-menu.js"></script> 
<script src="js/match-height.js"></script> 
<script type="text/javascript">
    $(window).load(function(){
      matchHeight($('.info-thumbnail .caption .description'), 3);
    });
    </script>
</body>
</html>