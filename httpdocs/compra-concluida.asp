<!--#include file="redirect.asp"-->
<!--#include file = "admin/conexao.asp"-->
<!--#include file = "cdosys.asp"-->

<%Conecta()%>
<%



%>
<script type="text/javascript" src="<%="http://"&request.ServerVariables("HTTP_HOST")%>/js/ajax.js"></script> 
<script type="text/javascript" src="<%="http://"&request.ServerVariables("HTTP_HOST")%>/js/js_carrinho_v7_new.js"></script>
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
	//$("#horizon, #blend").show(); 
	
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
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/neat-blue.css" media="screen" id="neat-stylesheet">

    <link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
    <link rel="stylesheet" href="libs/Bootstrap-Image-Gallery-3.1.1/css/bootstrap-image-gallery.min.css">

    <!-- Use google font -->
    <link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,300italic,400italic,700italic|Lustria" rel="stylesheet" type="text/css" />

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
<div id="blend2" style="display:none;"><!-- &nbsp; --></div>
	<div id="horizon2" style="display:none; z-index:999">
		<div class="layer-content" id="popupLayer2">



<table width="100%" border="0" bordercolor="#FF0000">
  <tr>
    <td><div align="center" style="position:fixed; left:40%; top:50p%; right:50%"> <img src="loading.gif" /></div></td>
  </tr>
</table>
      
			<!--<div id="pl-close-btn">x</div>--> 
			<div class="caption">		  
			</div>
 
			<div id="pl-subcaption"><!-- &nbsp; --></div>
		<div class="missed-deals-area" id="pl-showdeal"><!-- &nbsp; --></div> 
	</div>
</div>



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

    <%
		Dim id
		id = request.QueryString("id")
		
		Dim sql_pagamento, rs_pagamento
		id = replace(id,";","")
		id = replace(id,"insert","")
		id = replace(id,"update","")
		id = replace(id,"delete","")
		id = replace(id,"'","")
		id = replace(id,",","")
				
		sql_pagamento="select cod_inscricao,nome,email, endereco, estado, cidade, cep,bairro, TipodePagamento from inscricao where Cod_Inscricao = " & id
		set rs_pagamento=cn.execute(sql_pagamento)
		
		Dim msg_h1, msg_h3
		if (replace(rs_pagamento("tipodepagamento"),"ã","a") = "Cartao") Then 
			msg_h1 = "Pagamento Efetuado"
			msg_h3 = "Parabéns! Inscrição realizada com sucesso."
		elseif (rs_pagamento("tipodepagamento") = "Boleto") Then
			msg_h1 = "Imprima ou faça download de seu Boleto"
		else
			msg_h1 = "Imprima ou faça download de seu Boleto"
		end if
	%>

    <!-- Component: login-registration/registration-alt1.html - START -->
    <section class="">
      <div class="container">
        <h1><span><%=msg_h1%></span></h1>
        <div class="row">
          <div  class="col-sm-12 col-md-offset-3 col-md-6">
            <div class="thumbnail info-thumbnail background-lead color-text">
              <div class="special background-lead color-white">
              <h3><span class="fa fa-user"></span> <%=msg_h3%></h3></div>
              <div  class="caption bordered background-white">
                
                <%
				
				 Dim sql_comprovante, rs_comprovante
				 sql_comprovante = "SELECT * FROM Transacao_Cielo WHERE Cod_Inscricao = "&id
			    set rs_comprovante = cn.execute(sql_comprovante)
				
				
				'Pagamentos Feitos por Cartão
				if (replace(rs_pagamento("tipodepagamento"),"ã","a") = "Cartao") Then
				
				%>
                <div class="caption bordered background-white">
                
                	Comprovante de Pagamento<br>
                    <br>
                    <br>
                    Código da Inscrição: <%=rs_comprovante("Cod_Inscricao")%><br>
                    <br>
                    Nome: <%=rs_pagamento("Nome")%><br>
                    <br>
                    ID da Transação(TID): <%=rs_comprovante("TID")%><br>
                    <br>
                    <%
					Dim valor_tratado
					valor_tratado = Left(rs_comprovante("valor"),len(rs_comprovante("valor"))-2)&","&Right(rs_comprovante("valor"),2)
					valor_tratado = formatcurrency(valor_tratado)
					%>
                    Valor: <%=valor_tratado%>
                    <br>
                    <br>
                    
                   <a class="btn btn-primary" target="_blank" href="comprovante.asp?id=<%=id%>">Imprimir</a>
                   
                </div>
                <%'Final de Pagamento com Cartão
				ElseIf (rs_pagamento("tipodepagamento") = "Boleto") Then%>
				<div>
                <img src="img/boleto.png" width="158" height="111" style="float:left; margin-right:15px;">A sua participação no curso somente será confirmada após a constatação do pagamento do seu boleto, garanta sua vaga o quanto antes.<br>
                Caso não possa imprimir agora, acesse o link que foi enviado para o seu e-mail.
                 <br><br>
                <a target="_blank" class="btn btn-primary" href="/boleto/itau/boleto-itau.asp?id=<%=id%>">Gerar Boleto</a>
                </div>
				<%'Pagamento PagSeguro
				ElseIf (rs_pagamento("tipodepagamento") = "PagSeguro") Then%>
					<!-- INICIO FORMULARIO BOTAO PAGSEGURO -->
					<form action="https://pagseguro.uol.com.br/checkout/v2/payment.html" method="post" onsubmit="PagSeguroLightbox(this); return false;">
						<!-- NÃO EDITE OS COMANDOS DAS LINHAS ABAIXO -->
						<input type="hidden" name="code" value="20094C36101023E884DCAFA4739DFA27" />
						<input type="image" src="https://p.simg.uol.com.br/out/pagseguro/i/botoes/pagamentos/209x48-pagar-azul-assina.gif" name="submit" alt="Pague com PagSeguro - é rápido, grátis e seguro!" />
					</form>
					<script type="text/javascript" src="https://stc.pagseguro.uol.com.br/pagseguro/api/v2/checkout/pagseguro.lightbox.js"></script>
					<!-- FINAL FORMULARIO BOTAO PAGSEGURO -->
				<%'Pagamento com Cheque
				ElseIf (rs_pagamento("tipodepagamento") = "Cheque") Then%>
                
                <div>
                <img src="img/cheque.png" width="158" height="111" style="float:left; margin-right:15px;">A sua participação no curso somente será confirmada após a constatação do pagamento do seu boleto, garanta sua vaga o quanto antes.<br>
                Caso não possa imprimir agora, acesse o link que foi enviado para o seu e-mail.
                <br><br>
                <a target="_blank" class="btn btn-primary" href="/boleto/itau/boleto-itau.asp?id=<%=id%>">Gerar primeiro pagamento via Boleto</a><br><br>
                Lembrando que o valor restante deve ser pago em até 5 cheques que devem ser levados no primeiro dia de aula.
                </div>
				
				<%'Final de Pagamento com Cheque
				End if%>
                
                
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
      </div>      </div>
    </section>
  
    <!-- Component: login-registration/registration-alt1.html - END -->
    
    <!--#include file = "footer.asp"-->
    
    <!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
    <div id="blueimp-gallery" class="blueimp-gallery">
      <!-- The container for the modal slides -->
      <div class="slides"></div>
      <!-- Controls for the borderless lightbox -->
      <h3 class="title">title</h3>
      <a class="prev">‹</a>
      <a class="next">›</a>
      <a class="close">×</a>
      <a class="play-pause"></a>
      <ol class="indicator"></ol>
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
              <button type="button" class="btn btn-default pull-left prev">
                <i class="glyphicon glyphicon-chevron-left"></i>
                Previous
              </button>
              <button type="button" class="btn btn-primary next">
                Next
                <i class="glyphicon glyphicon-chevron-right"></i>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
    
<!--Classe para montar os HTMLs dos E-mails-->
<!--#include file="class-Envio_Emails.asp"-->
    <%
	
'enviar E-mail
to_email="contato@pilatesfisiofitness.com.br"
'to_email="lehnihon@hotmail.com"

from_email = rs_pagamento("email")

assunto="Formulário - Fisio Fitness Pilates"

'class-Envio_Emails.asp -> gerar_htmlEmail2
stremail = gerar_htmlEmail2("finalizado","")

FROM_Servidor = "contato@pilatesfisiofitness.com.br" ' este email tem que ser do dominio do site
	
	if isEmpty(session("Sessao_Finalizar")) Then
	
	session("Sessao_Finalizar") = session.SessionID()
	'Envia o e-mail para The Pilates Fitness
	'cdosys.asp -> Proc_Email
	Proc_Email FROM_Servidor, from_email,to_email,assunto,stremail,"cristiano@ddwb.com.br"
	
	'Envia o e-mail para o cliente com link do boleto
	to_email = rs_pagamento("email")
	from_email = "contato@pilatesfisiofitness.com.br"
	assunto = "Inscrição - Fisio Fitness Pilates"
	''class-Envio_Emails.asp -> gerar_htmlEmail_Usuario
	stremail = gerar_htmlEmail_Usuario(id,rs_pagamento("tipodepagamento"))
	
	'cdosys.asp -> Proc_Email
	Proc_Email FROM_Servidor, from_email,to_email,assunto,stremail,"cristiano@ddwb.com.br;philipe@ddwb.com.br"
	end if
	%>
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

    <!-- Include slider -->
    <script src="js/jquery.event.move.js"></script>
    <script src="js/jquery.mixitup.min.js"></script>
    <script src="js/responsive-slider.js"></script>
    <script src="js/responsive-calendar.js"></script>
    <script src="http://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
    <script src="libs/Bootstrap-Image-Gallery-3.1.1/js/bootstrap-image-gallery.min.js"></script>
    <script src="js/reduce-menu.js"></script>
    <script src="js/match-height.js"></script>

    <script type="text/javascript">
    $(window).load(function(){
      matchHeight($('.info-thumbnail .caption .description'), 3);
    });
    </script>
    
    <!-- Google Code for Inscri&ccedil;&atilde;o Curso Conversion Page -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 973326819;
var google_conversion_language = "en";
var google_conversion_format = "2";
var google_conversion_color = "ffffff";
var google_conversion_label = "aREeCP2VjAoQ45OP0AM";
var google_remarketing_only = false;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//www.googleadservices.com/pagead/conversion/973326819/?label=aREeCP2VjAoQ45OP0AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<script>(function(w,d,t,r,u){var f,n,i;w[u]=w[u]||[],f=function(){var o={ti:"4055826"};o.q=w[u],w[u]=new UET(o),w[u].push("pageLoad")},n=d.createElement(t),n.src=r,n.async=1,n.onload=n.onreadystatechange=function(){var s=this.readyState;s&&s!=="loaded"&&s!=="complete"||(f(),n.onload=n.onreadystatechange=null)},i=d.getElementsByTagName(t)[0],i.parentNode.insertBefore(n,i)})(window,document,"script","//bat.bing.com/bat.js","uetq");</script><noscript><img src="//bat.bing.com/action/0?ti=4055826&Ver=2" height="0" width="0" style="display:none; visibility: hidden;" /></noscript>

    
    
  </body>
</html>