<!--#include file = "admin/conexao.asp"-->
<%Conecta()%>
<%


'Insere no banco de dados os dados enviados pelo form de inscrição
Dim cmd, formacao, tipo_pagamento

	formacao = request("txt1_Formacao")
	'formacao = Formacao_NumeroParaTexto(formacao)

	tipo_pagamento = request("txt1_TipodePagamento")
	'tipo_pagamento = TipoPagamento_NumeroParaTexto(tipo_pagamento)

	Set cmd = Server.CreateObject("ADODB.Command")
		
	Set cmd.ActiveConnection = cn
	cmd.CommandText = "PROC_inserirInscricao_new"
	cmd.CommandType = 4
	cmd.Parameters.Refresh
		cmd.Parameters("@nome") = request("txt1_Nome")
		cmd.Parameters("@endereco") = request("txt1_Endereco")
		cmd.Parameters("@CEP") = request("txt1_cep")
		cmd.Parameters("@telefone") = request("txt1_tel")
		cmd.Parameters("@celular") = request("txt1_cel")
		cmd.Parameters("@cpf") = request("txt1_cpf")
		cmd.Parameters("@email") = request("txt1_Email")
		cmd.Parameters("@tipo_pagamento") = request("txt1_TipodePagamento")
		cmd.Parameters("@cod_turma") = request("cod_turma")
		cmd.Parameters("@formacao") = formacao
	cmd.Execute	

	tipo_pagamento = lcase(replace(tipo_pagamento,"ã","a"))

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

    

    <!-- Component: login-registration/registration-alt1.html - START -->
    <section class="">
      <div class="container">
        <h1><span>Inscreva-se</span></h1>
        <div class="row">
          <div  class="col-sm-12 col-md-offset-3 col-md-6">
            <div class="thumbnail info-thumbnail background-lead color-text">
              <div class="special background-lead color-white">
              <h3><span class="fa fa-user"></span> Parabéns! Inscrição realizada com sucesso</h3></div>
              <div  class="caption bordered background-white">
                
                <form method="post" name="form1" id="form1" action="inscrevase-sucesso.asp">
                	<input type="hidden" name="cod_turma" id="cod_turma" value="<%=request.QueryString("turma")%>">
                  <div class="controls controls-row">
                  <div style="margin-bottom:25px;" align="left">Insira os dados do Cartão</div>
                  <div style="float:right"><img src="<%="http://"&request.ServerVariables("HTTP_HOST")%>/c1.jpg" alt="img" width="71" height="28" /></div>
                  
                  <div style="float:right; width:30px;"><input type="radio" style="width:20px; height:20px; margin-bottom:20px" class="form-control input-lg" name="forma_pagamento" value="visa"></div>
                  
                   <div align="left"><input type="text" class="form-control input-lg" name="numero_cartao" id="numero_cartao" style="width:245px; margin-bottom:20px" placeholder="Número do Cartão">
                   
                   <div style="float:right"><img src="<%="http://"&request.ServerVariables("HTTP_HOST")%>/c2.jpg" alt="img" width="71" height="28" /></div>
                     
                     <div style="float:right; width:30px;"><input type="radio" style="width:20px; height:20px; margin-bottom:20px" class="form-control input-lg" name="forma_pagamento" value="mastercard"></div>
                   </div>
                   
                   <div align="left"><input type="text" class="form-control input-lg" name="nome_cartao" id="nome_cartao" style="width:245px; margin-bottom:20px" placeholder="Nome do titular"></div>
                   
                   <div style="float:right">
                   <img src="<%="http://"&request.ServerVariables("HTTP_HOST")%>/c3.jpg" alt="img" width="71" height="28" /></div>
                   
                   <div style="float:right; width:30px;"><input type="radio" style="width:20px; height:20px; margin-bottom:20px" class="form-control input-lg" name="forma_pagamento" value="amex"></div>
                    <div align="left"><select name="parcela" id="parcela" class="form-control input-lg" style="width:245px; margin-bottom:20px">
                    <option>Quantidade de Parcelas</option>
                    <%for i = 0 to 9
					if i = 0 then%>
                    <option value="<%=(i+1)%>"><%=(i+1)&"x de "&formatcurrency(1560)&" À vista"%></option>
                    <%else%>
                    <option value="<%=(i+1)%>"><%=(i+1)&"x de "&formatcurrency(1560/(i+1))&" Sem juros"%></option>
                    <%end if
					next%>
                    </select>
                    </div>
                    <span style="float:left; margin-left:0px; margin-right:15px; margin-top:10px;"><font size="+1">Válido até:</font></span>
                   <div style="float:left"><input type="text" class="form-control input-lg" name="mes_cartao" id="mes_cartao" style="width:65px; margin-right:20px; " placeholder="mm"></div>
                   
                  <div> <input type="text" class="form-control input-lg" name="ano_cartao" id="ano_cartao" style="width:60px;" placeholder="aa"></div>
                   
                  <div align="left"><input maxlength="4" type="text" class="form-control input-lg" name="codigo_cartao" id="codigo_cartao" style="width:245px; margin-bottom:20px; margin-top:20px;"  placeholder="Código de Segurança"></div>
                  <%
				  Dim sql_inscricao, rs_inscricao, cod_inscricao
				  sql_inscricao = "SELECT MAX(cod_inscricao) as codigo from inscricao"
				   set rs_escopo = cn.execute(sql_inscricao) 
				   
				   cod_inscricao = rs_escopo("codigo")
				  %>
                  
                  <a onClick="efetivarCompraCartao(<%=cod_inscricao%>)" class="btn btn-large btn-primary">Finalizar Pagamento</a>
                  </div>
                  <div class="controls controls-row"></div>
                  <div class="controls controls-row"></div>
                  
                  <div id="divCadastro3"> </div>
                </form>
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
  </body>
</html>