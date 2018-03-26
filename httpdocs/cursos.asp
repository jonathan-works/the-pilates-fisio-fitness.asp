<!--#include file = "admin/conexao.asp"-->
<%Conecta()%>
<%
dim url_cidade, url_curso, possui_turma

url_curso = request.queryString("cod_curso")
url_cidade = request.queryString("cidade")
%>
<%
'Converto nome do mês para número
Function Mes_para_numero(data)
	dim data2, data3
	if instr(data, " e ") > 0 then
		data = split(data, " e ")
		data2 = data(0)
		data2 = split(data2, ",")
		'response.write()
		
		data3 = data2(ubound(data2) - 1)
		data3 = uCase(data3)
		data3 = replace(data3,"JANEIRO","01")
		data3 = replace(data3,"FEVEREIRO","02")
		data3 = replace(data3,"MARÇO","03")
		data3 = replace(data3,"ABRIL","04")
		data3 = replace(data3,"MAIO","05")
		data3 = replace(data3,"JUNHO","06")
		data3 = replace(data3,"JULHO","07")
		data3 = replace(data3,"AGOSTO","08")
		data3 = replace(data3,"SETEMBRO","09")
		data3 = replace(data3,"OUTUBRO","10")
		data3 = replace(data3,"NOVEMBRO","11")
		data3 = replace(data3,"DEZEMBRO","12")
	
		Mes_para_numero = data3
	else
		data = uCase(data)
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
				
		data = replace(data, " ", "")
		
		Mes_para_numero = data
	end if		
End Function

function tiraVirgula(data)
	
	data = uCase(data)
	data = replace(data, " ", "")
	data = replace(data,",JANEIRO,","/01/")
	data = replace(data,",FEVEREIRO,","/02/")
	data = replace(data,",MARÇO,","/03/")
	data = replace(data,",ABRIL,","/04/")
	data = replace(data,",MAIO,","/05/")
	data = replace(data,",JUNHO,","/06/")
	data = replace(data,",JULHO,","/07/")
	data = replace(data,",AGOSTO,","/08/")
	data = replace(data,",SETEMBRO,","/09/")
	data = replace(data,",OUTUBRO,","/10/")
	data = replace(data,",NOVEMBRO,","/11/")
	data = replace(data,",DEZEMBRO,","/12/")

	data = replace(data, ",", ", ")
	tiraVirgula = data
	
end function

%>

<%
dim curso_descricao

if request.queryString("cod_curso") = 1 then
	curso_descricao = "Patologias"
elseif request.queryString("cod_curso") = 2 then
	curso_descricao = "Completo"
elseif request.queryString("cod_curso") = 3 then
	curso_descricao = "Gestação"
elseif request.queryString("cod_curso") = 4 then
	curso_descricao = "Suspenso"
end if
%>
<!DOCTYPE html>
<html>
<head>
    <title>Curso de Pilates SP e em todo Brasil - The Pilates Fitness</title>
<meta name="description" content="Curso de Pilates SP <%=curso_descricao%> Formando Novas Turmas Semanalmente - Melhor Curso de Pilates de São Paulo, Turmas em todo Brasil" />
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
    <style type="text/css">
    .letra {color: #F3752E;}
    @media (min-width:992px) {
		.valor-curso {		
		    position: absolute;
		    top: 40px;
		    left: 15px;
		    font-size: 45px !important;
		}

		.span-valor {			
    		position: absolute;
    		left: 15px;
		}
	}
    </style>

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

    <!-- Component: index/info-thumbnails.html - START --><!-- Component: index/info-thumbnails.html - END -->

    <!-- Component: index/news.html - START --><!-- Component: index/news.html - END -->

    <!-- Component: index/info-thumbnails-alt2.html - START --><!-- Component: index/info-thumbnails-alt2.html - END -->	
	<%
	Dim cidade
	cidade = url_cidade
	
	Dim sql_turma,rs_turma
	sql_turma = "SELECT * FROM turma t INNER JOIN studio s ON t.cod_studio = s.cod_studio INNER JOIN uf u ON s.cod_uf = u.cod_uf INNER JOIN cidade ci ON s.cidade = ci.descricao WHERE disponivel = 0 AND t.cod_curso = '"&url_curso&"' AND ci.url = '"&Lcase(cidade)&"' AND t.status = 'A' order by cod_turma DESC"	
	set rs_turma = cn.execute(sql_turma)
	
	
	
	%>
    
    
    <!-- Component: index/calendar.html - START -->
    <div class="breadcrumbs-container">
      <div class="container">
        <ol class="breadcrumb">
          <li><a href="default.asp">Home</a></li>
          
          <li class="active"><%if not rs_turma.eof then response.write("Cursos em " & rs_turma("cidade")) else response.write("Cursos")%></li>
          
        </ol>
      </div>
    </div>
			      
    <section class="">
		<div class="container">      	
		<% 
		if not rs_turma.eof then 
			possui_turma = "sim"
		%>
        <h1><span>Curso de Pilates - <%=curso_descricao%> em <%=rs_turma("cidade")%></span><br>
        </h1>
		<%
		else
		possui_turma = "nao"
		%>
		<h1><span>Nenhuma curso/turma disponível</span><br>
        </h1>		
		<%end if%>
       
         
			
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
				if instr(rs_turma("data"), " e ") > 0 then
					mes = Mes_para_Numero(rs_turma("data"))
				else
					mes = Mes_para_Numero(data_split(ubound(data_split) -1))
				end if
				
				'mes = data_split(ubound(data_split))
				ano = data_split(ubound(data_split))
				'mes = mid(right(mes,6),1,2)
				
				
				
				'response.Write(dia&"-"&mes&"-"&ano)
				%>                
                <div class="special background-midnight-blue color-white">
                <%
				
				%>
                  <h3>Início <%=dia%>/<%=mes%>/<%=ano%></h3>
                </div>
                <div class="caption bordered background-white">
                  <div class="description" style="height:150px">
                    <p><strong><%
					if inStr(ucase(rs_turma("titulo")),"SEMANA") > 0 or inStr(ucase(rs_turma("data")),"SEMANA") > 0 Then 
					response.Write("Durante a Semana")
					else
					Response.Write("Final de Semana")
					end if
					%></strong></p>
					<%if not instr(rs_turma("data"), " e ") > 0 then %>
                    <p><%=tiraVirgula(rs_turma("data"))%></p>                   
					<%else
						dim data_separada
						data_separada = split(rs_turma("data"), " e ")
						
					%>
						<p><%=tiraVirgula(data_separada(0)) & " e " & tiraVirgula(data_separada(1))%></p>
					<%end if%>
					<p><strong>Local:</strong> <a href="#studios"> <%=rs_turma("studio")%></p></a>
					<p><strong>Horário:</strong> <%=rs_turma("hora")%></p>
				  </div>
				  
                  <p ><a href="https://www.thepilatesfisiofitness.com.br/inscreva-se.asp?turma=<%=rs_turma("cod_turma")%>" style="background-color:#090; width:140px" class="btn btn-lead btn-lg pull-right">Inscreva-se</a></p>
                </div>
              </div>
            </div>
          </div>
          <% rs_turma.movenext
		  Loop 		  
		  %>
          
          
          
          
        </div>
      </div>
    </section>
	<%	
	if possui_turma = "sim" then 		
		if url_curso = 1 then %>			
			<!--#include file = "patologias.asp"-->
		<%elseif url_curso = 2 then%>
			
			<!--#include file = "completo.asp"-->
		<%elseif url_curso = 3 then%>
			<!--#include file = "gestacao.asp"-->
		<%elseif url_curso = 4 then%>
			<!--#include file = "suspenso.asp"-->
		<%end if%>
		<!--#include file = "locais.asp"-->
	<%end if%>
 
  
	<!-- Component: index/calendar.html - END -->

    <!-- Component: index/info-row-alt1.html - START --><!-- Component: index/info-row-alt1.html - END -->

    <!-- Component: index/portfolio-mixitup.html - START --><!-- Component: index/portfolio-mixitup.html - END -->

    <!-- Component: index/clients.html - START --><!-- Component: index/clients.html - END -->
    
    <!--#include file = "footer.asp"-->
    
    <!-- The Bootstrap Image Gallery lightbox, should be a child element of the document body -->
    <div id="blueimp-gallery" class="blueimp-gallery">
      <!-- The container for the modal slides -->
      <div class="slides"></div>
      <!-- Controls for the borderless lightbox -->
      
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