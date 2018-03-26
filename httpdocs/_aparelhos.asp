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
  <!-- Smartsupp Live Chat script -->
<script type="text/javascript">
  var _smartsupp = _smartsupp || {};
  _smartsupp.key = 'e928ff29bd4f8b4caa9ebba69e4dec9ec402234a';
  window.smartsupp||(function(d) {
    var s,c,o=smartsupp=function(){ o._.push(arguments)};o._=[];
    s=d.getElementsByTagName('script')[0];c=d.createElement('script');
    c.type='text/javascript';c.charset='utf-8';c.async=true;
    c.src='https://www.smartsuppchat.com/loader.js?';s.parentNode.insertBefore(c,s);
  })(document);
  </script>
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
          <li><a href="index.asp">Home</a></li>
          <li class="active">Aparelhos</li>
          
        </ol>
      </div>
    </div>
    <!-- Breadcrumbs - END -->

    <!-- Component: faq/faq.html - START -->
    <section class="">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="list-group bright background-clouds color-text">
              <div class="list-group-item"><h3>Aparelhos de Pilates</h3>
              </div>
              <a href="aparelhos.html" class="list-group-item active"> Kit Madeira</a>
            <a href="kit-metal-ego.html" class="list-group-item"> Kit Metal Ego</a></div>
          </div>
          <div class="col-md-9">
            <div class="content">
              <h1><span> Kit Madeira</span></h1>
              
              <div class="panel-group faq" id="accordion">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    <h4 class="panel-title">
                      <a data-toggle="collapse" data-parent="#accordion" >
                         Aparelhos
                      </a>
                    </h4>
                  </div>
                  <div id="collapseOne" >
                    <div class="panel-body background-clouds">
                      <div style="  padding-right:30px"></div>
                      <div style=" float:left; padding-right:30px">
                      <strong><img src="mad1.jpg"  alt="" width="222" height="229"/></strong></div>
                      <div style=" float:left; height:250px; padding-right:30px"> <strong><img src="mad2.jpg"  alt=""/></strong></div>
                      <div style=" float:left; padding-right:30px"> <strong><img src="mad3.jpg"  alt=""/></strong></div>
                      <div style=" float:left; padding-right:30px"> <strong><img src="mad4.jpg"  alt=""/></strong></div>
                    </div>
                  </div>
                </div>
                
                
              </div>
            </div>
          </div>
        </div>      </div>
    </section>
    <!-- Component: faq/faq.html - END -->

    <!-- Component: commons/this-is-us.html - START --><!-- Component: commons/this-is-us.html - END -->
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