<!--#include file="redirect.asp"-->
<!--#include file = "admin/conexao.asp"-->
<%Conecta()
Dim i 'indice de arrays e listas%>
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
<style type="text/css">
.letra {color: #F3752E;
}
</style>

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
	<!--#include file="top-menu.asp"-->
  <!-- Responsive slider - START -->
 
  <div class="breadcrumbs-container">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="default.asp">Home</a></li>
          
          <li class="active">Depoimentos</li>
          
        </ol>
      </div>
    </div>
 
 	<section class="">
    <div class="container">
      <h1><span>Depoimentos</span></h1>
      <%
	  Dim sql_depoimento, rs_depoimento
	  sql_depoimento = "SELECT * FROM Depoimento WHERE Data BETWEEN '2015-02-13' AND GETDATE() ORDER BY Data desc"
	  set rs_depoimento = cn.execute(sql_depoimento)
	  
	  Dim contador_depoimentos, limite_linha
	  limite_linha = 3
	  contador_depoimentos = 0
	  
	  Do while not rs_depoimento.eof
	  %>
      <%If contador_depoimentos mod limite_linha = 0 Then%>
      
      <section class="background-white color-black">
        <div class="container">
          <div class="row">
          
      <%End If%>
      
      <%
	  contador_depoimentos = contador_depoimentos + 1
	  Dim depoimento_info
	  depoimento_info = split(rs_depoimento("Fonte"),"-")
	  
	  for i=0 to ubound(depoimento_info)-1
	  	
		depoimento_info(i) = ltrim(rtrim(depoimento_info(i)))  
	  
	  next
	  
	  %>
          
            <div style="height:150px" class="col-sm-4 col-md-4">
              <div style="height:150px" class="thumbnail info-thumbnail">
                <div class="caption">
                  <h3><span class="fa fa-group color-lead"></span> <%=depoimento_info(0)%></h3>
                  <p class="description"><strong><%=depoimento_info(1)&" - "&depoimento_info(2)%></strong> – <%=rs_depoimento("Descricao")%></p>
                </div>
              </div>
            </div>
              
      <%If contador_depoimentos mod limite_linha = 0 Then%>
      
          </div>
        </div>
      </section>
      
      <%End If%>
      
      <%
	  
	  rs_depoimento.movenext
	  Loop%>
      
      <%If rs_depoimento.eof and contador_depoimentos mod limite_linha <> 0 Then%>
      
      	  </div>
        </div>
      </section>
      
      <%End If%>
      
    </div>
  </section>
 
<!-- Component: index/info-thumbnails-alt1.asp - END --> 

<!-- Component: index/clients.asp - START 
<section class="image-bg color-white" style="background-image: url(img/image-bg.jpg)">
  <div class="container">
    <div class="reduce-top-margin">
      <h1 class="no-border">They trusted us</h1>
      <div class="row">
        <div class="col-xs-6 col-sm-4 col-md-2"> <a href="http://w3widget.com" class="thumbnail gallery-thumbnail"> <img class="img-circle" src="img/w3w-logo.png" alt="..."> </a> </div>
        <div class="col-xs-6 col-sm-4 col-md-2"> <a href="http://w3widget.com" class="thumbnail gallery-thumbnail"> <img class="img-circle" src="img/w3w-logo-2.png" alt="..."> </a> </div>
        <div class="col-xs-6 col-sm-4 col-md-2"> <a href="http://w3widget.com" class="thumbnail gallery-thumbnail"> <img class="img-circle" src="img/w3w-logo-3.png" alt="..."> </a> </div>
        <div class="col-xs-6 col-sm-4 col-md-2"> <a href="http://w3widget.com" class="thumbnail gallery-thumbnail"> <img class="img-circle" src="img/w3w-logo-4.png" alt="..."> </a> </div>
        <div class="col-xs-6 col-sm-4 col-md-2"> <a href="http://w3widget.com" class="thumbnail gallery-thumbnail"> <img class="img-circle" src="img/w3w-logo.png" alt="..."> </a> </div>
        <div class="col-xs-6 col-sm-4 col-md-2"> <a href="http://w3widget.com" class="thumbnail gallery-thumbnail"> <img class="img-circle" src="img/w3w-logo-3.png" alt="..."> </a> </div>
      </div>
    </div>
  </div>
</section>-->
<!-- Component: index/clients.asp - END -->

	<!--#include file="footer.asp"-->

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
    $(document).ready(function() {
      $('.responsive-calendar').responsiveCalendar({
        time: '2013-05',
        events: {
          "2013-05-30": {"number": 5, "badgeClass": "background-turquoise", "url": "http://w3widgets.com/responsive-slider"},
          "2013-05-26": {"number": 1, "badgeClass": "background-turquoise", "url": "http://w3widgets.com"}, 
          "2013-05-03": {"number": 1, "badgeClass": "background-pomegranate"}, 
          "2013-05-12": {}}
      });

      $('#mixit').mixitup();
    });

    $(window).load(function(){
      if ($(window).width() > 767) {
        matchHeight($('.info-thumbnail .caption .description'), 3);
      }

      $(window).on('resize', function(){
        if ($(window).width() > 767) {
          $('.info-thumbnail .caption .description').height('auto');
          matchHeight($('.info-thumbnail .caption .description'), 3);
        }
      });
    });
    </script>
</body>
</html>