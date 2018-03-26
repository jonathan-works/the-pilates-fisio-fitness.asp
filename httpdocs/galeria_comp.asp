<!--#include file="redirect.asp"-->
<!--#include file="admin/conexao.asp"-->
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
	<!--#include file="top-menu.asp"-->
<!-- Breadcrumbs - START -->
    <div class="breadcrumbs-container">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="default.asp">Home</a></li>
        
          <li class="active">Galeria</li>
        </ol>
      </div>
    </div>
    <!-- Breadcrumbs - END -->

    <!-- Component: gallery/gallery.html - START -->
    <section class="">
      <div class="container">
        <h1><span>Galeria</span></h1>
        
        <%
		
		Dim id
		id = request.QueryString("id")
		id = replace(id,";","")
		id = replace(id,"insert","")
		id = replace(id,"delete","")
		id = replace(id,"update","")
		id = replace(id,",","")
		id = replace(id,"'","")
		
		Dim sql_turma, rs_turma
		'sql_turma = "SELECT  t.titulo, t.cod_turma,s.cidade,u.descricao FROM turma t, curso c, uf u, studio s WHERE t.cod_curso = c.cod_curso AND s.cod_uf = u.cod_uf and t.cod_turma in (select cod_turma from imagem) AND t.cod_turma = "&id
		sql_turma =  "select t.titulo, t.cod_turma, s.cidade, u.descricao, s.cod_uf  from turma t inner join studio s on t.cod_studio = s.cod_studio inner join UF u on s.cod_uf = u.Cod_uf where t.cod_studio in (select cod_studio from studio) and t.cod_turma =" &id
		set rs_turma = cn.execute(sql_turma)
		
		
		%>
        
        <p><%=rs_turma("titulo")%> - <%=rs_turma("cidade")%> / <%=rs_turma("descricao")%></p><p>&nbsp;</p>
        
        <div class="row">
        
        <%
		Dim sql_imagens, rs_imagens
		sql_imagens = "SELECT * FROM Imagem WHERE Cod_Turma = "&id
		set rs_imagens = cn.execute(sql_imagens)
		
		Do while not rs_imagens.eof
		%>
        
          <div class="col-xs-6 col-sm-4 col-md-3">
            <a class="info-thumbnail-link" href="<%="http://"&request.ServerVariables("HTTP_HOST")%>/images/p_<%=rs_imagens("imagem")%>" data-gallery>
            <div class="thumbnail info-thumbnail background-clouds color-text">
              <div class="service">
                <div class="service-name"><span class="fa fa-search-plus"></span></div>
              </div>
              <img class="round" height="197" style="height:197px; width:262px" width="262" src="<%="http://"&request.ServerVariables("HTTP_HOST")%>/images/p_<%=rs_imagens("imagem")%>" alt="...">
            </div>
            </a>
          </div>
          <% rs_imagens.movenext
		  Loop %>
          
        </div></div>
    </section>
    <!-- Component: gallery/gallery.html - END -->
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