<!--#include file="redirect.asp"-->
<!--#include file = "admin/conexao.asp"-->
<%Conecta()%>

<!DOCTYPE html>
<html>
  <head>
    <title>The Pilates Fitness</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/bootstrap-min.css">
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
    <!--#include file = "top-menu.asp"-->
    
    <!-- Breadcrumbs - START -->
    <div class="breadcrumbs-container">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="default.asp">Home</a></li>
          
          <li class="active">Preços</li>
        </ol>
      </div>
    </div>
    <!-- Breadcrumbs - END -->

    <!-- Component: pricing/pricing.html - START -->
    <section class="">
      <div class="container">
        <h1><span>Preços</span></h1>
        <div class="row">
          <div class="col-sm-6 col-md-3">
            <div class="info-thumbnail-link">
            <br>
            <div class="thumbnail info-thumbnail popular background-background-clouds color-text">
             <div style="background-color:#CCC" class="special background-midnight-blue color-white">
               <h5 style="color:#555555; size:10px"><strong>Valor: R$1800,00. </strong>Ou em até</h5></div>
              <div class="pricing-head">
                <div class="pricing-head-body background-peter-river">
                  <div class="price-wrapper color-white">
                    <span class="price"><sup><small>10x R$</small></sup>180,<small>00</small></span><br> 
                    <span class="per">no cartão</span>
                  de crédito</div>
                </div>
              </div>
              <div class="special background-midnight-blue color-white">
                <h5>Desconto de 15% para pagamento a vista por Cartão de Crédito ou Boleto: <font color="#FFCC00">R$1530,00</font>*<br>
                  Veja regras ao lado &gt;
                  <br>
                </h5>
              </div>
              <div style="height:160px" class="caption bordered background-white">
                <div   class="description">
                  <ul class="pricing-list">
                    <li>No cheque em até 6x R$300
                      
                  </ul>
              <p>Curso Completo de Formação de Professores de Pilates em SP e Todo Brasil (Completo)</p></div></div>
            </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-3">
            <div class="info-thumbnail-link">
             <br>
             <div class="thumbnail info-thumbnail popular background-background-clouds color-text">
                <div style="background-color:#f5f5f5"  class="caption bordered background-white">
                  <div class="description">
                    <p><strong> * PARA PAGAMENTOS COM BOLETO BANCÁRIO COM 15% DESCONTO:</strong> <br>
                      * Promoção válida por apenas 3 dias após geração do boleto. Após essa data, o desconto concedido no boleto cairá para 5%, totalizando R$1710,00 <br>
                    </p>
                  </div>
           
               </div>
              </div>
            
            </div>
          </div>
          
          <div class="col-sm-6 col-md-3">
            <div class="info-thumbnail-link">
             <br>
             <div class="thumbnail info-thumbnail popular background-background-clouds color-text">
                <div style="background-color:#f5f5f5"  class="caption bordered background-white">
                  <div class="description">
                    <p><strong> PARA PAGAMENTOS COM CARTÕES DE CRÉDITO:</strong> <br>
                    Parcelamos o pagamento do seu curso através de cartões de crédito em até 10x.</p>
                  </div>
           
               </div>
              </div>
            
            </div>
          </div>
          
          <div class="col-sm-6 col-md-3">
            <div class="info-thumbnail-link">
             <br>
             <div class="thumbnail info-thumbnail popular background-background-clouds color-text">
                <div style="background-color:#f5f5f5"  class="caption bordered background-white">
                  <div class="description">
                    <p><strong> PARA PAGAMENTOS À PRAZO EM CHEQUE:</strong><br>
                    Gerar um boleto no valor de R$300,00 para pagamento da primeira parcela e o valor restante deve ser pago em até 5 cheques que devem ser levados no primeiro dia de aula.</p>
                  </div>
           
               </div>
              </div>
            
            </div>
          </div>
        </div>      
      </div>
  </section>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <!-- Component: pricing/pricing.html - END -->

    <!-- Component: pricing/pricing-alt1.html - START --><!-- Component: pricing/pricing-alt1.html - END -->

    <!-- Component: pricing/pricing-alt2.html - START --><!-- Component: pricing/pricing-alt2.html - END -->

    <!-- Component: pricing/pricing-alt3.html - START --><!-- Component: pricing/pricing-alt3.html - END -->
  
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
      matchHeight($('.info-thumbnail .caption .description'), 4);
    });
    </script>
  </body>
</html>