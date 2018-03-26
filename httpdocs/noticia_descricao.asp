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
         
          <li class="active">Noticia</li>
        </ol>
      </div>
    </div>
    <!-- Breadcrumbs - END -->

    <!-- Component: entry/entry.html - START -->
    <%
	Dim sql_noticia, rs_noticia
	sql_noticia = "SELECT * FROM Noticia WHERE Cod_Noticia = "&request.QueryString("id")
	set rs_noticia = cn.execute(sql_noticia)
	
	%>
    
    <section class="">
      <div class="container">
        <div class="row">
          <div class="col-md-9">
            <div class="blog-entry">
              <div class="blog-entry-content no-border">
                <div class="category">The Pilates Fitness</div>
                <h1><span><%=rs_noticia("titulo")%></span></h1>
                <div class="date"><%=rs_noticia("data")%></div>
                <div class="content">
                <img class="pull-left" src="<%="http://"&request.ServerVariables("HTTP_HOST")&"/images/noticia/"&rs_noticia("Imagem")%>" alt="..." style="width: 400px">
                <%=rs_noticia("texto")%>
                </div>
              </div>
            </div>
            <h3>&nbsp;</h3>
          </div>
          <div class="col-md-3">
            <!-- Responsive calendar - START --><!-- Responsive calendar - END -->
            <h3>Outras Notícias</h3>
            <ul class="side-list">
            <%
			Dim sql_todasNoticias, rs_todasNoticias
			sql_todasNoticias = "SELECT TOP 45 * FROM Noticia"
			set rs_todasNoticias = cn.execute(sql_todasNoticias)
			
			Do while not rs_todasNoticias.eof
			%>
              <li><a href="noticia_descricao.asp?id=<%=rs_todasNoticias("Cod_Noticia")%>"><%=rs_todasNoticias("titulo")%></a></li>
            <%rs_todasNoticias.movenext
			Loop%>
            </ul>
            <h3>&nbsp;</h3>
          </div>
        </div>      </div>
    </section>
    <!-- Component: entry/entry.html - END -->

    <!-- Component: commons/this-is-us.html - START --><!-- Component: commons/this-is-us.html - END -->
    
    <!--#include file = "footer.asp"
    
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
    $(document).ready(function() {
      $('.responsive-calendar').responsiveCalendar({
        time: '2013-05',
        events: {
          "2013-05-30": {"badgeClass": "background-nephritis", "url": "http://w3widgets.com/responsive-slider"},
          "2013-05-26": {"badgeClass": "background-nephritis", "url": "http://w3widgets.com"}, 
          "2013-05-03": {"badgeClass": "background-pomegranate"}, 
          "2013-05-12": {}}
      });
    });

    $(window).load(function(){
      matchHeight($('.info-thumbnail .caption .description'), 3);
    });
    </script>
  </body>
</html>