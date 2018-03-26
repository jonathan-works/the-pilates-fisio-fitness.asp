<!--#include file = "admin/conexao.asp"-->
<%Conecta()%>
<%
'Limpa as sessões responsáveis por gerenciar a quantidade de e-mails que serão enviados.
session("Sessao_Finalizar") = empty
session("Sessao_Inscricao") = empty
session("Sessao_Inscricao_Email") = empty

session.Timeout = 60
dim cursos
set cursos = cn.execute("select * from turma where cod_turma = " & request.queryString("turma"))

%>
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

    <!-- Use google font -->
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,300italic,400italic,700italic|Lustria" rel="stylesheet" type="text/css" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>
  <script type="text/javascript">
        window.history.forward();
        function noBack()
        {
            window.history.forward();
        }
  </script>
  
  
  <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-94120888-1', 'auto');
  ga('send', 'pageview');

</script>
  <body onLoad="noBack();" onpageshow="if (event.persisted) noBack();" class="background-clouds">

	<!--#include file = "top-menu.asp"-->

<!-- Breadcrumbs - START -->
    <div class="breadcrumbs-container">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="default.asp">Home</a></li>
         
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
          <div class="col-sm-12 col-md-offset-3 col-md-6">
            <div class="thumbnail info-thumbnail background-lead color-text">
              <div class="special background-lead color-white">
              <h3><span class="fa fa-user"></span> Preencha os campos abaixo</h3></div>
              <div class="caption bordered background-white" style="min-height: 470px;">
                <form name="form_insc" id="form_insc" method="post" action="https://www.thepilatesfisiofitness.com.br/email_inscrevase.asp" onSubmit="return checa ('document.form_insc')">
                	<input type="hidden" name="cod_turma" id="cod_turma" value="<%=request.QueryString("turma")%>">
					<input type="hidden" name="valor" id="valor" value="<%=cursos("valor")%>">
                  <div class="controls controls-row">
                   <div style="float:left"><input type="text" class="form-control input-lg" name="txt1_Nome" id="txt1_Nome" style="width:245px; margin-right:20px; margin-bottom:20px" placeholder="Nome"></div>
                   <div><input type="email" class="form-control input-lg" name="txt1_Email" id="txt1_Email" style="width:245px; margin-bottom:20px" placeholder="E-mail"></div>
                   
                    <div style="float:left"><input type="text" class="form-control input-lg" onKeyPress="javascript:mascara( this, mtel );" name="txt1_Telefone" id="txt1_Telefone" style="width:245px; margin-right:20px; margin-bottom:20px" placeholder="DDD+Telefone" maxlength="14"></div>
                   <div><input type="text" class="form-control input-lg" name="txt1_Celular" id="txt1_Celular" style="width:245px; margin-bottom:20px" placeholder="DDD+Celular" maxlength="15"></div>
                   
                    <div style="float:left"><input type="text" class="form-control input-lg" name="txt1_Cpf" id="txt1_Cpf" style="width:245px; margin-right:20px; margin-bottom:20px" placeholder="CPF"></div>
                   <div><input type="text" class="form-control input-lg" name="txt1_Cep" id="txt1_Cep" style="width:245px; margin-bottom:20px" placeholder="CEP"></div>
                        
                    <div style="float:left"><input type="text" class="form-control input-lg" name="txt1_Endereco" id="txt1_Endereco" style="width:245px; margin-right:20px; margin-bottom:20px" placeholder="Endereço"></div>
                   	<div style="float:left"><input type="text" class="form-control input-lg" name="txt1_Bairro" id="txt1_Bairro" style="width:245px; margin-right:20px; margin-bottom:20px" placeholder="Bairro"></div>
					<div style="float:left"><input type="text" class="form-control input-lg" name="txt1_Cidade" id="txt1_Cidade" style="width:245px; margin-right:20px; margin-bottom:20px" placeholder="Cidade"></div>
					<div style="float:left"><input type="text" class="form-control input-lg" name="txt1_Estado" id="txt1_Estado" maxlength="2" style="width:245px; margin-right:20px; margin-bottom:20px" placeholder="Estado"></div>
				   <div><select name="txt1_TipoDePagamento" id="txt1_TipoDePagamento" style="width:245px; margin-bottom:20px; height:47px" class="form-control">
  <option >Forma de Pagamento</option>  
  <option> Boleto</option>
  <option >Cartão</option>
  <option>Cheque</option>
  <option>PagSeguro</option>  
</select></div>
<%
Dim cod_estado, turma

Dim sql_estado, rs_estado
turma = request.QueryString("turma")
turma = replace(turma, "'","")
turma = replace(turma, "insert","")
turma = replace(turma, "update","")
turma = replace(turma, "--","")
turma = replace(turma, ";","")

sql_estado = "SELECT * FROM turma t INNER JOIN studio s ON t.cod_studio = s.cod_studio WHERE t.cod_turma = "&turma
set rs_estado = cn.execute(sql_estado)

cod_estado = rs_estado("cod_uf")


if cod_estado = 14 then
%>

    <div><select name="txt1_Formacao" id="txt1_Formacao" style="width:245px; margin-bottom:20px; height:47px" class="form-control">
      <option value="0">Escolha sua Formação</option>
      <option >Graduação em Fisioterapia</option>
      <option >Estudante de Fisioterapia</option>
    </select></div>

<%else%>

    <div><select name="txt1_Formacao" id="txt1_Formacao" style="width:245px; margin-bottom:20px; height:47px" class="form-control">
      <option value="0">Escolha sua Formação</option>
      <option >Graduação em Ed. Física</option>
      <option >Graduação em Fisioterapia</option>
      <option >Estudante de Ed. Física</option>
      <option >Estudante de Fisioterapia</option>
      <option >Estudante de Terapia Ocupacional</option>
      <option >Terapeuta Ocupacional</option>
    </select></div>

<%end if%>    
                   
                 
                  <input type="submit" class="btn btn-large btn-primary" name="submit" value="Enviar Inscrição" style="display:block; clear:left;">
                  </div>
                  <div class="controls controls-row"></div>
                  <div class="controls controls-row"></div>
                  
                </form>
              </div>
            </div>
          </div>
      </div>      </div>
    </section>
    <section class="">
      <div class="container">
        <div class="row">
          
          <div class="col-md-9 col-md-offset-2">
            <div class="content">
               
              <p><strong>PARA PAGAMENTOS COM BOLETO BANCÁRIO:</strong> Concedemos 5% de desconto para pagamentos a vista realizados através de boleto bancário.</p>
              <p><strong>PARA PAGAMENTOS COM CARTÕES DE CRÉDITO:</strong> Parcelamos o pagamento do seu curso através de cartões de crédito em até 10x.</p>
              <p><strong>PARA PAGAMENTOS À PRAZO EM CHEQUE</strong><strong>:</strong> Gerar um boleto no valor de R$300,00 para pagamento da primeira parcela e o valor restante deve ser pago em até 5 cheques que devem ser levados no primeiro dia de aula.</p>
             
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
    <script src="https://blueimp.github.io/Gallery/js/jquery.blueimp-gallery.min.js"></script>
    <script src="libs/Bootstrap-Image-Gallery-3.1.1/js/bootstrap-image-gallery.min.js"></script>
    <script src="js/reduce-menu.js"></script>
    <script src="js/match-height.js"></script>

    <script type="text/javascript">
    $(window).load(function(){
      matchHeight($('.info-thumbnail .caption .description'), 3);
    });
    </script>
    <script type="text/javascript">
	/* Máscaras ER */
	function mascara(o,f){
		v_obj=o
		v_fun=f
		setTimeout("execmascara()",1)
	}
	function execmascara(){
		v_obj.value=v_fun(v_obj.value)
	}
	function mtel(v){
		v=v.replace(/\D/g,"");             //Remove tudo o que não é dígito
		v=v.replace(/^(\d{2})(\d)/g,"($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
		v=v.replace(/(\d)(\d{4})$/,"$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
		return v;
	}
	function id( el ){
		return document.getElementById( el );
	}
	window.onload = function(){
		id('txt1_Telefone').onkeypress = function(){
			mascara( this, mtel );
		}
		id('txt1_Celular').onkeypress = function(){
			mascara( this, mtel );
		}
	}
	</script>

    
    
    
    <script>
    function checa (TheForm){
var nFocus, i, j
var radioSelected 
var fieldname 
var msg

TheForm= eval(TheForm);
j=0;
	for (i = 0 ;i < TheForm.elements.length;  i++){
	//	alert(TheForm.elements[i].name + " = " + TheForm.elements[i].type);
			fieldname = TheForm.elements[i].name ;
			if (fieldname.substring(0,5) == "txt1_"){
				if (TheForm.elements[i].value==""){
					msg="Por favor, preenha o campo " + fieldname.substring(5,20);
					alert( msg );
					TheForm.elements[i].focus();
					j++;
					i=TheForm.elements.length;
					return false
				}
			}
	}
	if (TheForm.txt1_Nome.value.indexOf(" ",2) == -1) 
	{
			  alert("Favor informar o nome completo!");
			  return false;
	}
	if(TheForm.txt1_Formacao.value == "0")
	{
		alert("Por favor selecione sua Formação.");	
		return false
	}
	if(TheForm.txt1_TipoDePagamento.value == "Forma de Pagamento")
	{
		alert("Por favor selecione uma forma de pagamento.");	
		return false
	}
	if (TheForm.txt1_Email.value != TheForm.txt_confEmail.value){
		alert("Favor informar o confirmar e-mail corretamente !!!");
		return false	
	}
	if ((TheForm.txt1_Email.value.indexOf('@', 0) == -1 || 
		TheForm.txt1_Email.value.value.indexOf('.', 0) == -1)) { 
		alert("Por favor preencha o campo de E-mail corretamente!"); 
		return false;
	} 
	if (j==0){
		document.form1.submit();		
	}

}
    </script>
  </body>
</html>