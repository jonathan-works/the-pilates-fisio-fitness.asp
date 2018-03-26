<!--#include file="redirect.asp"-->
<!--#include file = "admin/conexao.asp"-->
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
    <div class="caption"> </div>
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
      <li class="active">Contato</li>
    </ol>
  </div>
</div>
<!-- Breadcrumbs - END --> 

<!-- Component: login-registration/registration-alt1.html - START -->
<section class="">
  <div class="container">
    <h1><span>Contato</span></h1>
    <div class="row">
      <div  class="col-sm-12 col-md-offset-3 col-md-6">
        <div class="thumbnail info-thumbnail background-lead color-text">
          <div class="special background-lead color-white">
            <h3><span class="fa fa-user"></span> Seu contato foi enviado com sucesso!</h3>
          </div>
          <div align="center"  class="caption bordered background-white">
            
            <img src="../images/1362075408_Thumbs_Up.png" alt="" width="256" height="256" />
				
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