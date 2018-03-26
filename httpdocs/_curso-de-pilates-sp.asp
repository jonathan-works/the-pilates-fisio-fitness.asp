<!--#include file="redirect.asp"-->
<!--#include file = "admin/conexao.asp"-->
<%Conecta()%>
<%
'Converto nome do mês para número
Function Mes_para_numero(data)
	
	
	data = replace(data,"JANEIRO","01")
	data = replace(data,"FEVEREIRO","02")
	data = replace(data,"MARÇO","03")
	data = replace(data,"ABRIL","04")
	data = replace(data,"MAIO","05")
	data = replace(data,"JUNHO","06")
	data = replace(data,"JULHO","07")
	data = replace(data,"AGOSTO","08")
	data = replace(data,"SETEMBRO","09")
	data = replace(data,"OUTUBRO","10")
	data = replace(data,"NOVEMBRO","11")
	data = replace(data,"DEZEMBRO","12")
	
	
	
	Mes_para_numero = data
	

End Function

%>
<!DOCTYPE html>
<html>
  <head>
    <title>Curso de Pilates SP e em todo Brasil - The Pilates Fitness</title>
<meta name="description" content="Curso de Pilates SP Completo Formando Novas Turmas Semanalmente - Melhor Curso de Pilates de São Paulo, Turmas em todo Brasil" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Style-Type" content="text/css" />
    <!-- Bootstrap -->
    <link rel="stylesheet" href="css/estilopaginacurso.css">
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

    <!-- Component: index/info-thumbnails.html - START --><!-- Component: index/info-thumbnails.html - END -->

    <!-- Component: index/news.html - START --><!-- Component: index/news.html - END -->

    <!-- Component: index/info-thumbnails-alt2.html - START --><!-- Component: index/info-thumbnails-alt2.html - END -->
	<%
	Dim cidade
	cidade = "saopaulo"
	
	Dim sql_turma,rs_turma
	sql_turma = "SELECT * FROM turma t INNER JOIN curso c ON t.cod_curso = c.cod_curso INNER JOIN uf u ON c.cod_uf = u.cod_uf INNER JOIN cidade ci ON replace(replace(replace(replace(replace(replace(replace(lower(c.cidade),'á','a'),'é','e'),'í','i'),'ó','o'),'ú','u'),'ã','a'),' ','') = ci.url WHERE ndisponivel = 0 and ci.url = '"&Lcase(cidade)&"' order by cod_turma DESC"
	set rs_turma = cn.execute(sql_turma)
	
	
	
	%>
    
    
    <!-- Component: index/calendar.html - START -->
    <div class="breadcrumbs-container">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="default.asp">Home</a></li>
          
          <li class="active">Cursos em <%=rs_turma("cidade")%></li>
          
        </ol>
      </div>
    </div>
    <section class="">
      <div class="container">
      	
        <h1><span>Cursos em <%=rs_turma("cidade")%></span></h1>
        
        <div class="row">
        
        <%Do while not rs_turma.eof%>
        
          <div class="col-sm-6 col-md-3">
            <div class="info-thumbnail-link">
              <div class="thumbnail info-thumbnail  background-clouds color-text">
                <div class="pricing-head">
                  <div class="pricing-head-body background-peter-river">
                  <%
				  Dim turma_split
				  turma_split = split(rs_turma("titulo")," ")
				  
				  %>
                    <div class="price-wrapper color-white"> <span class="price"><sup><small><%=turma_split(0)%> </small></sup><%=turma_split(1)%></span><br>
                   </div>
                  </div>
                </div>
                <%
				Dim data_split
				data_split = split(rs_turma("data"),",")
				
				for i = 0 to ubound(data_split)
					if i = 0 Then
						data_split(i) = replace(data_split(i)," ","")
						data_split(i) = replace(data_split(i),":","")
						data_split(i) = replace(data_split(i),"DIAS","")
						data_split(i) = replace(data_split(i),"ESPECIALDURANTESEMANA","")
						data_split(i) = replace(data_split(i),"-","")
					end if
					
					if i = ubound(data_split) Then
						data_split(i) = replace(data_split(i)," ","")
					end if
				Next
				
				
				
				Dim dia,mes,ano
				dia = data_split(0)
				mes = Mes_para_Numero(data_split(ubound(data_split)))
				ano = right(mes,4)
				mes = mid(right(mes,6),1,2)
				
				
				
				'response.Write(dia&"-"&mes&"-"&ano)
				%>                
                <div class="special background-midnight-blue color-white">
                <%
				
				%>
                  <h3>Início <%=dia%>/<%=mes%>/<%=ano%></h3>
                </div>
                <div class="caption bordered background-white">
                  <div class="description" style="height:90px">
                    <p><strong><%
					if inStr(ucase(rs_turma("titulo")),"SEMANA") > 0 or inStr(ucase(rs_turma("data")),"SEMANA") > 0 Then 
					response.Write("Durante a Semana")
					else
					Response.Write("Final de Semana")
					end if
					%></strong></p>
                    <p><%=rs_turma("data")%></p>
                   
                  </div>
                  <p ><a href="inscreva-se.asp?turma=<%=rs_turma("cod_turma")%>" style="background-color:#090; width:140px" class="btn btn-lead btn-lg pull-right">Inscreva-se</a></p>
                </div>
              </div>
            </div>
          </div>
          <% rs_turma.movenext
		  Loop %>
          
          
          
          
        </div>
      </div>
    </section>
    <section class="">
      <div class="container">
        <div class="row">
          <div style="width:100%" class="col-md-9">
            <div class="content">
              <h1><span>Local do Curso:</span></h1>
              <p align="left"><strong>The Pilates Fitness São Paulo - SP</strong></p>
              <p align="left">Rua: Almirante Noronha, 558 - Sala 06 – Jardim São Paulo ( Ao Lado Metrô - Jardim São Paulo)</p>
              <p align="left">Tels:(11) 3297-2335/(11) 96651-3639</p>
              <p>&nbsp;</p>
            </div>
          </div>
        </div>
      </div>
      </div>
      </div>
      </div>
    </section>
    <section class="background-belize-hole color-white">
      <div class="container">
        <h1><span>Curso de Pilates Completo</span></h1>
        <div class="news"> <a class="news-link" href="">
          <div class="media clearfix background-belize-hole color-white">
            <div class="pull-left"> <img class="media-object" src="img/imgsolo.jpg" alt="..."> </div>
            <div class="media-body">
              <h3 class="media-heading">Exercícios de Solo</h3>
              <p>Aparelhos: Small Barrel, Barrel, Chair, Cadillac e Reformer.</p>
            </div>
          </div>
          </a> <a class="news-link" href="">
            <div class="media clearfix background-belize-hole color-white">
              <div class="pull-left"> <img class="media-object" src="img/imgbola.jpg" alt="..."> </div>
              <div class="media-body">
                <h3 class="media-heading">Exercícios de Bola</h3>
                <p>Acessórios: Meia Lua, Disco de Propriocepção, Faixa Elástica, Magic Circle.</p>
              </div>
            </div>
            </a> <a class="news-link" href="">
              <div class="media clearfix background-belize-hole color-white">
                <div class="pull-left"> <img class="media-object" src="img/imgbrinde.jpg" alt="..."> </div>
                <div class="media-body">
                  <h3 class="media-heading">Inscreva-se e Ganhe Brindes!</h3>
                  <p>E pague sue curso no cartão em até 10x R$180,00 ou a vista por R$1560,00</p>
                </div>
              </div>
            </a> </div>
      </div>
    </section>
  <section class="">
      <div class="container">
        <h1><span>Preços</span></h1>
        <div class="row">
          <div class="col-sm-6 col-md-3">
            <div class="info-thumbnail-link"> <br>
              <div class="thumbnail info-thumbnail popular background-background-clouds color-text">
                <div style="background-color:#CCC" class="special background-midnight-blue color-white">
                  <h5 style="color:#555555; size:10px"><strong>A vista: R$1560,00. </strong>Ou em até</h5>
                </div>
                <div class="pricing-head">
                  <div class="pricing-head-body background-peter-river">
                    <div class="price-wrapper color-white"> <span class="price"><sup><small>10x R$</small></sup>180,<small>00</small></span><br>
                      <span class="per">no cartão</span> de crédito</div>
                  </div>
                </div>
                <div class="special background-midnight-blue color-white">
                  <h5>Desconto de 5% para pagamento a vista por boleto: <font color="#FFCC00">R$1482,00</font></h5>
                </div>
                <div style="height:160px" class="caption bordered background-white">
                  <div   class="description">
                    <ul class="pricing-list">
                      <li>No cheque em até 6x R$300
                        
                    </ul>
                    <p>Curso Completo de Formação de Professores de Pilates em SP e Todo Brasil (Completo)</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-3">
            <div class="info-thumbnail-link"> <br>
              <div class="thumbnail info-thumbnail popular background-background-clouds color-text">
                <div style="background-color:#f5f5f5"  class="caption bordered background-white">
                  <div class="description">
                    <p><strong> PARA PAGAMENTOS COM BOLETO BANCÁRIO:</strong> <br>
                    Concedemos 5% de desconto para pagamentos a vista realizados através de boleto bancário.<br>
                    </p>
                  </div>
           
               </div>
              </div>
            </div>
          </div>
          <div class="col-sm-6 col-md-3">
            <div class="info-thumbnail-link"> <br>
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
            <div class="info-thumbnail-link"> <br>
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
  <!-- Component: index/calendar.html - END -->

    <!-- Component: index/info-row-alt1.html - START --><!-- Component: index/info-row-alt1.html - END -->

    <!-- Component: index/portfolio-mixitup.html - START --><!-- Component: index/portfolio-mixitup.html - END -->

    <!-- Component: index/clients.html - START --><!-- Component: index/clients.html - END -->
    <footer class="background-midnight-blue color-white">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <h3>Menu</h3>
            <ul class="nav-footer">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#">Quem Somos</a></li>
              <li><a href="#">Agenda de Cursos</a></li>
              <li><a href="#">Estúdio</a></li>
              <li><a href="#">Aparelhos</a></li>
              <li><a href="precos.html">Preços</a></li>
              <li><a href="#">Galeria</a></li>
              <li><a href="#"></a></li>
            </ul>
          </div>
          <div class="col-md-4">
            <h3>Facebook</h3>
            <p class="testimonial">
              <iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2Fpages%2FFisio-Fitness-Pilates%2F336403333106619%3Ffref%3Dts&amp;width=340&amp;height=170&amp;show_faces=true&amp;colorscheme=light&amp;stream=false&amp;border_color&amp;header=false&amp;appId=129261323829889" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:340px; height:220px; background-color:#FFF" allowTransparency="false"></iframe>
            </p>
          </div>
          <div class="col-md-5">
            <h3>Entre em contato</h3>
            <form class="form-horizontal" role="form">
              <div class="form-group">
                <label for="inputName1" class="col-lg-3 control-label">Nome</label>
                <div class="col-lg-9">
                  <input type="text" class="form-control input-lg" id="inputName1" placeholder="Name">
                </div>
              </div>
              <div class="form-group">
                <label for="inputEmail1" class="col-lg-3 control-label">Email</label>
                <div class="col-lg-9">
                  <input type="email" class="form-control input-lg" id="inputEmail1" placeholder="Email">
                </div>
              </div>
              <div class="form-group">
                <label for="inputContent1" class="col-lg-3 control-label">Comentários</label>
                <div class="col-lg-9">
                  <textarea name="inputContent" rows="3" class="form-control" id="inputContent1"></textarea>
                </div>
              </div>
              <div class="form-group">
                <div class="col-lg-offset-3 col-lg-9">
                  <button type="submit" class="btn btn-lead btn-lg">Enviar</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <hr>
            <div class="row">
              <div class="col-md-6"> Copyright  2015 </div>
              <div class="col-md-6">
                <p class="social"> <a href="https://www.facebook.com/EstudioPilatesFisioFitness?fref=ts"><span class="fa fa-facebook"></span></a>
                  <!--<a href="/"><span class="fa fa-twitter"></span></a> <a href="/"><span class="fa fa-youtube"></span></a> <a href="/"><span class="fa fa-linkedin"></span></a> <a href="/"><span class="fa fa-pinterest"></span></a> -->
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
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