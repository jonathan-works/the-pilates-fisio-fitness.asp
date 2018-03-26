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
<!-- Smartsupp Live Chat script -->
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
	<!--#include file="top-menu2.asp"-->
  <!-- Responsive slider - START -->
  <div class="responsive-slider-parallax" data-spy="responsive-slider" data-parallax="true" data-parallax-direction="-1" data-transitiontime="1000" data-autoplay="true">
    <div class="slides-container" data-group="slides">
      <ul>
        <li>
          <div class="slide-body" data-group="slide">
            <div class="container">
              <div class="wrapper">
                <div class="caption header" data-animate="slideAppearRightToLeft" data-delay="0" data-length="300">
                  <h2>Faça a Diferença,</h2>
                  <p class="sub text-left" data-animate="slideAppearLeftToRight" data-delay="300" data-length="300"><span>Faça The Pilates FisioFitness.</span></p>
                  <p class="sub text-left" data-animate="slideAppearLeftToRight" data-delay="500" data-length="300"><span>Pilates Mais Perto de Você!</span></p>
                
                </div>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="slide-body" data-group="slide">
            <div class="container">
              <div class="wrapper">
                <div class="caption header text-center" data-animate="slideAppearUpToDown" data-delay="0" data-length="300">
                  <h2>Curso de Formação</h2>
                  <p class="sub" data-animate="slideAppearDownToUp" data-delay="300" data-length="300"><span>A The Pilates FisioFitness é uma</span></p>
                  <p class="sub" data-animate="slideAppearDownToUp" data-delay="500" data-length="300"><span>Escola Reconhecida e Oferece Cursos</span> de</p>
                  <p class="sub" data-animate="slideAppearDownToUp" data-delay="700" data-length="300"><span> Pilates Completo e Avançados em Patologias, Suspenso e Gestação.</span></p>
                </div>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="slide-body" data-group="slide">
            <div class="container">
              <div class="wrapper">
                <div class="caption header text-right" data-animate="slideAppearDownToUp" data-delay="0" data-length="300">
                  <h2>Inscreva-se já!</h2>
                  <p class="sub" data-animate="slideAppearUpToDown" data-delay="300" data-length="300"><span>Parcele em Até 10x Sem Juros</span></p>
                  <p class="sub" data-animate="slideAppearUpToDown" data-delay="500" data-length="300"><span>e Ganhe Brindes ao Inscrever-se.</span></p>
                </div>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <a class="slider-control left hidden-xs hidden-sm" href="#" data-jump="prev"><i class="fa fa-angle-left"></i></a> <a class="slider-control right hidden-xs hidden-sm" href="#" data-jump="next"><i class="fa fa-angle-right"></i></a>
    <div class="pages-wrapper background-black">
      <ol class="pages">
        <li><a data-jump-to="1">1</a></li>
        <li><a data-jump-to="2">2</a></li>
        <li><a data-jump-to="3">3</a></li>
      </ol>
    </div>
  </div>
  <!-- Responsive slider - END --> 
</div>

<div class="container">
	<div class="row">
			<div class="well">
            <!-- Carousel
            ================================================== -->            
            <div id="myCarousel" class="carousel slide">
               <h1 class="info-head"><span>Não perca os próximos cursos!</span></h1>
                <div class="carousel-inner">
                    <%
					Dim sql_cursoTurma, rs_cursoTurma
					sql_cursoTurma = "SELECT *, case when c.descricao = 'completo' then 'Pilates Completo' when c.descricao = 'suspenso' then 'Pilates Suspenso' when c.descricao ='patologias' then 'Pilates Patologias' when c.descricao = 'gestacao' then 'Pilates Gestação' end as descricao_curso FROM Turma t INNER JOIN Studio s ON t.cod_studio = s.cod_studio inner join curso c on c.cod_curso = t.cod_curso WHERE disponivel = 0 and t.status = 'A'"
					set rs_cursoTurma = cn.execute(sql_cursoTurma)
					
					Dim contadorCursos
					contadorCursos = 1
					'Dim listaRandom
					'		set listaRandom = Server.CreateObject("Scripting.Dictionary")
					'Dim numArray
					
							
					'		for i = 0 to 11
					'			nuumArray = i+1
					'			if numArray < 10 Then numArray = "0"&numArray
								
							
								'Response.Write(i)
					'			listaRandom.Add i,numArray
					'		Next
					'		a = listaRandom.Items
					'		for i = 0 to listaRandom.count-1
					'			Response.Write(a(i))
					'		Next
							
							'Randomize
							'indLista = int(Rnd * 11)
							'Dim randomNumber
							'randomNumber = listaRandom.Item(indLista)
							
					%>
                      <% Do while not rs_cursoTurma.eof  %>
                            
						<%if (contadorCursos mod 4 = 1) Then%>
                        	<%if contadorCursos = 1 Then%>
                        <div class="item active">
                        	<%else%>
                        <div class="item">  
                            <%end if%>
                        	<div class="row">
                        <%end if%>
                            <%
							
							
							
							
							'indLista = int(Rnd * 11)
							Dim randomNumber, randomAnterior
							Randomize
							randomNumber = int(Rnd * 11)+1
							if randomNumber < 10 Then randomNumber = "0"&randomNumber
							'listaRandom.Remove(indLista)
							
							%>
                            <div class="col-md-3">
                                <div class="thumbnail">
                                  <img src="<%="http://"&request.ServerVariables("HTTP_HOST")%>/images/index/<%=randomNumber%>.jpg" alt="Slide<%=contadorCursos%>">
                                  <div class="caption">
                                    <h3><%=rs_cursoTurma("descricao_curso")%></h3>
                                    <p><%=rs_cursoTurma("titulo") & " - " & rs_cursoTurma("data")%></p>
                                 <p><a href="cursos.asp?cod_curso=<%=rs_cursoTurma("cod_curso")%>&cidade=<%=rs_cursoTurma("url")%>" class="btn btn-primary" role="button">Veja Mais</a></p>
                                  </div>
                                </div>        
                            </div>
                            
						<%if (contadorCursos mod 4 = 0) Then%>
                            </div>
                        </div>
                        <%end if%>
                            
					<% contadorCursos = contadorCursos + 1 %>
                    <% rs_cursoTurma.movenext 
                    Loop %>
                    
                    <%if (rs_cursoTurma.eof) Then%>
                    	</div>
                    </div>
                    <%end if%>
                    
                </div>
                
                
                
                <a class="left carousel-control" href="#myCarousel" data-slide="prev"><i class="fa fa-chevron-left fa-2x"></i></a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next"><i class="fa fa-chevron-right fa-2x"></i></a>
                
                <ol class="carousel-indicators">
                	<%
					For i = 0 to int((contadorCursos - 1)/4)%>
                    
                    <%if i = 0 Then%>
                    <li data-target="#myCarousel" data-slide-to="<%=i%>" class="active"></li>
                    <%else%>
                    <li data-target="#myCarousel" data-slide-to="<%=i%>" class=""></li>
                    <%end if%>
                    
                    <%Next%>
                    
                </ol>                
            </div><!-- End Carousel --> 
        </div><!-- End Well -->
    </div>
</div>

<!-- Component: index/info-thumbnails.asp - START -->
<section class="background-white color-black">
  <div class="container">
    <div class="row">
      <div class="col-sm-4 col-md-4"> <a class="info-thumbnail-link" href="quem-somos.asp">
        <div class="thumbnail info-thumbnail">
          <div class="caption">
            <h3><span class="fa fa-flag color-lead"></span> Quem Somos</h3>
            <p class="description">THE PILATES FISIO FITNESS iniciou seus trabalhos em 2009 na Itália com cursos e aulas personalizadas. Com o rápido crescimento do Pilates no mundo, fundou-se o THE PILATES FISIO FITNESS no Brasil em 2011...</p>
          </div>
        </div>
        </a> </div>
      <div class="col-sm-4 col-md-4"> <a class="info-thumbnail-link" href="/">
        <div class="thumbnail info-thumbnail">
          <div class="caption">
            <h3><span class="fa fa-group color-lead"></span> Nossos Cursos</h3>
            <p class="description"><strong>Curso de Pilates Completo</strong> – Teórico e prático (aparelhos, solo, bola e acessórios) o melhor conteúdo de cursos do Brasil, fotos coloridas de todos os exercícios, indicação e contra-indicação de cada exercício, com ênfase em reabilitação e condicionamento físico.</p>
          </div>
        </div>
        </a> </div>
      <font color="#FFFFFF" size="5" face="Geneva, Verdana, sans-serif" class="letra"><strong><font color="#FF6600"><a name="newsletter" id="newsletter"></a></font></strong></font>
      
      <%
	  Dim sql_depoimento, rs_depoimento
	  sql_depoimento = "SELECT TOP 1 * FROM Depoimento ORDER BY Data Desc "
	  set rs_depoimento = cn.execute(sql_depoimento)
	  %>
      
      <div class="col-sm-4 col-md-4"> <a class="info-thumbnail-link" href="depoimentos.asp">
        <div class="thumbnail info-thumbnail">
          <div class="caption">
            <h3><span class="fa fa-group color-lead"></span> Depoimentos</h3>
            <p class="description"><strong>"</strong><%if not rs_depoimento.eof then response.write(rs_depoimento("Descricao")) else response.write("") end if%> <strong>"</strong><br>
            <em><strong><%if not rs_depoimento.eof then response.write(rs_depoimento("Fonte")) end if%></strong></em></p>
          </div>
        </div>
        </a> </div>
    </div>
  </div>
</section>
<!-- Component: index/info-thumbnails.asp - END --> 

<!-- Component: index/info-row.asp - START -->
<section class="background-belize-hole color-white">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="info-row">
          <div class="content info">
            <h1 class="info-head"><span>Cadastre-se </span></h1>
            <p>Receba gratuitamente novidades em seu email.</p>
            
            <script type="text/javascript" src="js/FunctionsJS.js"></script>
            
            <form id="form_cadastroRapido" name="form_cadastroRapido" method="post" action="addCadastroRapido.asp">
            
            <input onKeyPress="return EnterSubmit(event);" type="text" style="width:235px; float:left; margin-right:10px" class="form-control input-lg" name="txt1_Nome" id="inputName2" placeholder="Nome"> 
                  
         	<input onKeyPress="return EnterSubmit(event);" type="text" style="width:235px; float:left; margin-right:10px" class="form-control input-lg" id="inputName2" name="txt1_Email" placeholder="Email"> 
         
          	<input onKeyPress="return EnterSubmit(event);" type="text" style="width:235px; float:left; margin-right:10px" class="form-control input-lg" id="inputName2" name="txt1_Celular" placeholder="Celular com DDD" maxlength="15"> 
            
          	<a href="javascript:ChecarCampos();" style="background-color:#090; width:140px" class="btn btn-lead btn-lg pull-right">Enviar</a>
          
          </form>
          </div>
     
        </div>
      </div>
    </div>
  </div>
</section>
<!-- Component: index/info-row.asp - END --> 

<!-- Component: index/info-thumbnails-alt1.asp - START -->
<section class="background-white color-black">
  <div class="container">
    <h1 class="text-center x-large">Fique por dentro</h1>
    <p class="lead text-center">Acompanhe constantemente nossas publicações! Além de notícias sobre assuntos relacionados ao Pilates e seus benefícios, deixaremos sempre atualizada nossa Galeria de Imagens, com as fotos de todas as turmas formadas conosco.</p>
    <div class="row">
    <%
	Dim sql_noticia, rs_noticia
	sql_noticia = "SELECT TOP 2 * FROM Noticia ORDER BY Data Desc"
	set rs_noticia = cn.execute(sql_noticia)
	
	
	Do while not rs_noticia.eof
	%>
      <div class="col-sm-4 col-md-4">
        <div class="info-thumbnail-link">
          <div class="thumbnail info-thumbnail with-icon background-clouds color-text"> <img src="<%="http://"&request.ServerVariables("HTTP_HOST")&"/images/noticia/"&rs_noticia("Imagem")%>" alt="...">
            <div class="icon"> <span class="fa-stack"> <i class="fa fa-circle fa-stack-2x color-lead"></i> <i class="fa fa-flag fa-stack-1x color-white"></i> </span> </div>
            <div class="caption bordered background-white">
              <h3><%=rs_noticia("titulo")%> </h3>
              <p class="description"><%=left(rs_noticia("Texto_Resumido"),instr(rs_noticia("Texto_Resumido"),"."))&".."%></p>
              <p class="buttons"><a href="noticia_descricao.asp?id=<%=rs_noticia("cod_noticia")%>" class="btn btn-lead">Leia mais</a></p>
            </div>
          </div>
        </div>
      </div>
      <% rs_noticia.movenext
	  Loop %>
            
      <%
	  Dim sql_turmas, rs_turmas
	  sql_turmas = "SELECT  top 1 t.titulo, t.cod_turma,s.cidade,u.descricao, i.imagem FROM turma t, studio s, uf u, imagem i WHERE t.cod_turma = i.cod_turma and t.cod_studio = s.cod_studio AND s.cod_uf = u.cod_uf and t.cod_turma in (select cod_turma from imagem) order by cod_turma DESC, i.imagem asc"
	  set rs_turmas = cn.execute(sql_turmas)
	  
	  if not rs_turmas.eof then
	  %>
      <div class="col-sm-4 col-md-4">
        <div class="info-thumbnail-link">
          <div class="thumbnail info-thumbnail with-icon background-clouds color-text"> <img src="<%="http://"&request.ServerVariables("HTTP_HOST")%>/images/p_<%=rs_turmas("imagem")%>" alt="..."  height="220">
            <div class="icon"> <span class="fa-stack"> <i class="fa fa-circle fa-stack-2x color-alizarin"></i> <i class="fa fa-eye fa-stack-1x color-white"></i> </span> </div>
            <div class="caption bordered background-white">
              <h3>Galeria de Fotos de Turmas Finalizadas</h3>
              <p class="description color-text">Veja as fotos da <strong><%=rs_turmas("titulo")&" - "&rs_turmas("cidade")&"/ "&rs_turmas("descricao")%></strong>. Profissionais formados e mostrando com orgulho seus certificados.</p>
              <p class="buttons"><a style="background-color:#E74C3C; border-color:#E74C3C" href="galeria-fotos-de-pilates.asp" class="btn btn-lead">Leia Mais</a></p>
            </div>
          </div>
        </div>
      </div>
	  <%end if%>
      
    </div>
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
<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/59e60aa74854b82732ff6160/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
</html>