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
    <style type="text/css">
    .letra {color: #F3752E;
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
      	
        <h1><span>Curso de Pilates Completo em <%=rs_turma("cidade")%>  das 8:00 às 18:00hrs</span></h1>
        
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
                  <div class="description" style="height:150px">
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
          <div style="width:50%" class="col-md-9">
            <div class="content">
              <h1><span>Local do Curso:</span></h1>
              <p align="left"><strong>The Pilates Fitness São Paulo - SP</strong></p>
              <p align="left">Rua: Nome da Rua, XX – Bairro</p>
              <p align="left">Tels:(11) XXXX-XXXX/(11) XXXX-XXXX</p>
              <p>&nbsp;</p>
            </div>
          </div>
          <div style="width:50%" class="col-md-9">
            <div class="content">
              <h1><span>Público Alvo:</span></h1>
              <p align="left">
              
              - Fisioterapeutas; <br>
              - Profissionais da Educação Física;  <br>
              - Terapeutas Ocupacionais; <br>
              - Profissionais da dança e yoga; <br>
              - Acadêmicos a partir do 2º período.
              
              
              </p>
              <p>&nbsp;</p>
            </div>
          </div>
        </div>
      </div>
      </div>
      </div>
      </div>
    </section>
    
    
     <section class="">
      <div class="container">
        <div class="row">
    
    <div class="bs-example" data-example-id="collapse-accordion">
  <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
    <div class="panel panel-default">
      <div class="panel-heading" role="tab" id="headingOne">
        <h4 class="panel-title"> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne" class="collapsed"> CARGA HORÁRIA:</a> </h4>
      </div>
      <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne" aria-expanded="false" style="height: 0px;">
        <div class="panel-body"><strong>- 100 horas:</strong><br>
            (54 horas/aula + 46 horas/aula de estágio opcional)<br>
  <em>*Seguindo os padrões de ensino do MEC onde a hora/aula é representada por 45  minutos.</em><br>
  <em>** Pratica supervisionada opcional de acordo com a disponibilidade do aluno.</em>
        </div>
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading" role="tab" id="headingTwo">
        <h4 class="panel-title"> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="collapsed"> MATERIAL DIDÁTICO ENTREGUE AO ALUNO:</a> </h4>
      </div>
      <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" aria-expanded="false" style="height: 0px;">
        <div class="panel-body">- Camiseta e ou meia da escola<br>
 - Bolsa da escola com lápis<br>
- Apostila com fotos coloridas contendo 230 páginas. </div>
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading" role="tab" id="headingThree">
        <h4 class="panel-title"> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree"> CERTIFICAÇÃO: </a> </h4>
      </div>
      <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree" aria-expanded="false">
        <div class="panel-body"><img src="images/diploma.png" width="164" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><br>
<br>
- Certificado de conclusão de curso impresso com carga horaria de 100 h. <br>
- Certificado serve para complemento de horas extracurriculares, obrigatório para obtenção de diploma de graduação.<br>
- Metodologia aplicada e reconhecida mundialmente.<br>
** sorteio de viagens e equipamentos.
</div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading" role="tab" id="headingFour">
        <h4 class="panel-title"> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour"> CONTEÚDO PROGRAMÁTICO (CURSO COMPLETO DE PILATES): </a> </h4>
      </div>
      <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour" aria-expanded="false">
        <div class="panel-body"> 
        
<strong>I –</strong> HISTÓRIA DO MÉTODO PILATES E SEU CRIADOR;<br>
<strong>II –</strong> BENEFÍCIOS DA PRÁTICA DO PILATES;<br>
<strong>III –</strong> EXPANSÃO DO MÉTODO PILATES;<br>
<strong>IV –</strong> USUFRUTO DA MARCA PILATES;<br>
<strong>V –</strong> PRINCIPIOS DO MÉTODO (CONCENTRAÇÃO, CENTRALIZAÇÃO (POWERHOUSE), RESPIRAÇÃO, FLUIDEZ DOS MOVIMENTOS, PRECISÃO E CONTROLE);<br>
<strong>VI –</strong> PILATES E BIOMECANICA – BASEADO EM EVIDENCIAS;<br>
<strong>VII -</strong> CONSEQUÊNCIAS DOS DESIQUILÍBRIOS MUSCULARES;<br>
<strong>VIII –</strong> PILATES NA TERCEIRA IDADE – INDICAÇÕES E CONTRAINDICAÇÕES;<br>
<strong>IX –</strong> PILATES NA GRAVIDEZ – INDICAÇÕES E CONTRAINDICAÇÕES;<br>
<strong>X –</strong> PILATES NA INFÂNCIA – INDICAÇÕES E CONTRAINDICAÇÕES;<br>
<strong>XI –</strong> PATOLOGIAS ORTOPÉDICAS (HÉRNIAS DISCAIS, ESPODILÓLISE, ESPONDILOLISTESE, ESCOLIÓSE, HIPERCIFOSE, HIPERLORDOSE, INSTABILIDADE GLENOUMERAL, INSTABILIDADE MULTIDIRECIONAL, SÍNDROME DO IMPACTO, PATOLOGIAS DO CARPO, DISFUNÇÕES FEMURO-PATELAR). <br>
<strong>XII –</strong> REABILITAÇÃO ATRAVÉS DO PILATES;<br>
<strong>XIII –</strong> INDICAÇÃO E CONTRAINDICAÇÃO DE CADA EXERCICIO PROPOSTO;<br>
<strong>XIV –</strong> APRESENTAÇÃO DOS APARELHOS E SEUS ACESSÓRIOS;<br>
<strong>XV –</strong> ORGANIZAÇÃO E MONTAGEM DE AULAS PARA DIFERENTES PÚBLICOS;<br>
<strong>XVI –</strong> PRESCRIÇÃO DOS EXERCICIOS, QUANTIDADE DE AULAS E EXERCÍCIOS;<br>
<strong>XVII –</strong> DINÂMICA DE AULAS;<br>
<strong>XVIII –</strong> ROTINA DO DIA A DIA, PRÁTICAS;<br>
<strong>XIX –</strong> REGULAMENTAÇÃO SOBRE O MÉTODO (CONFEF, CREF, COFFITO, CREFITO, MEC);<br>
<strong>XX –</strong> PRÁTICA (EXERCÍCIOS DE SOLO, CADILLAC, REFOMER, STEP CHAIR, BARREL, ACESSÓRIOS E BOLA – TODOS OS EXERCÍCIOS DE NÍVEIS INICIANTES/ INTERMEDIÁRIOS/ AVANÇADOS).<br>
<strong>XXI –</strong> ADAPTAÇÕES DOS EXERCÍCIOS A DIFERENTES PÚBLICOS, PATOLOGIAS E NÍVEL DE APRENDIZADO;<br>
<strong>XXII –</strong> INFORMAÇÕES ESSENCIAIS SOBRE MARKETING, SITE, PROPAGANDA (PARTICIPAÇÃO DE UM ESPECIALISTA NA ÁREA); <br>
<strong>XXIII –</strong> INFORMAÇÕES ESSENCIAIS PARA MONTAGEM DE ESTÚDIO E ABERTURA DE EMPRESA (PARTICIPAÇÃO DE UM CONTADOR ESPECIALIZADO EM ABERTURA DE EMPRESAS);

        
         </div>
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading" role="tab" id="headingFive">
        <h4 class="panel-title"> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive"> MINISTRANTES: </a> </h4>
      </div>
      <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive" aria-expanded="false">
        <div class="panel-body"> 
        
        
<img src="images/avatar.png" width="144" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><strong>CAMILO BARBOSA JUNIOR</strong><br>
- Fisioterapeuta Crefito 3 150302-F;<br>
- Pós-graduado em Fisiologia do Exercício (Unicid);<br>
- Pós-graduando em Formação Docente no Ensino Superior (Unicid);<br>
- Pós Graduado em Reabilitação Aplicada ao Esporte (Unifesp);<br>
- Formação em Pilates Completo (EVP); Formação em Pilates Completo (Caeffis);<br>
- Formação em Pilates na Gravidez (korper); Formação alongamento consciente (Inélia Garcia); Formação em Pilates Avançado (The Pilates Fisio Fitness); Formação Pilates on the Ball (Collen Craig Canadá); Formação em Pilates: Treinamento Avançado na Atuação do Instrutor (Silvia Gomes).<br>
- Formação no Método de Mckenzie (IM).<br><br>

<img src="images/avatar.png" width="144" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><strong>GILSIMAR RIZZARDI</strong><br>
- Educador Físico Cref-sp;<br>
- Fisioterapeuta Crefito 3;<br>
- Pós-graduado em Fisioterapia Traumato-ortopedica (UGF);<br>
- Formação em Pilates solo (Pilates Fisio Fitness); Formação em Pilates Completo (ITALIA FIT); Formação em Kinésio Tapping (FK); Formação em Eletroterapia Aplicada (CEFAI); Formação em Core 360.<br><br><br>


<img src="images/avatar.png" width="144" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><strong>NATHÁLIA NARCISO GOMES</strong><br>
- Fisioterapeuta, Crefito 3;<br>
- Pós Graduada em Fisioterapia Traumato-Ortopedia e Desportiva (UniNove);<br>
- Pós graduada em Osteopatia (IDOT);<br>
- Formação em Pilates Completo (The Fisio Fitness Pilates);<br>
- Formação em Pilates solo, bola e acessórios (UniNove);<br>
- Formação em bandagem funcional “Kinesio tapping” (Uninove);<br>
- Formação em RPG/RPM (CBN)<br><br>

<img src="images/avatar.png" width="144" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><strong>CAUE FELIX DA SILVA</strong><br>
- Fisioterapeuta, Crefito 3;<br>
- Fisiologia do Exercício pela Escola Paulista de Medicina – UNIFESP<br>
- Afecções da coluna vertebral pela Escola de Medicina da Santa Casa de Misericórdia de São Paulo<br>
- Especialista em Acupuntura - FACIS <br>
- Fisioterapia Ortopédica e Desportiva (Cursando) – UNICID<br>
- Formação em RPG, (Centro Paulista de Reeducação e Fisioterapia);<br>
- Formação em Pilates Completo (The Fisio Fitness Pilates);<br>
- Formação em Pilates solo, bola e acessórios (The Pilates Fisio Fitness);<br>
- Formação em Pilates suspenso (The Fisio Fitness Pilates).<br><br>

<img src="images/avatar.png" width="144" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><strong>DÉBORA PAULA DOS SANTOS</strong><br>
- Fisioterapeuta, Crefito 3;<br>
- Pós- Graduação em fisioterapia pneumo-funcional (UGF);<br>
- Pós-Graduação em fisioterapia dermato-funcional (UGF);<br>
- Formação em Pilates Completo (The Fisio Fitness Pilates);<br>
- Formação em Pilates suspenso (The Fisio Fitness Pilates).<br>
- Curso de Técnica de Apresentação em Oratória com PNL;<br>
- Curso de Liderança Pessoal e Profissional.<br><br>

        
        
         </div>
      </div>
    </div>
  </div>
</div>
<br>
<br>

    </div></div></section>
    
    
    
    <section class="background-belize-hole color-white">
      <div class="container">
        <h1><span>Curso de Pilates Completo</span></h1>
        <div class="news"> <a class="news-link" href="">
          <div class="media clearfix background-belize-hole color-white">
            <div class="pull-left"> <img class="media-object" src="img/imgsolo.jpg" alt="..."> </div>
            <div class="media-body">
              <h3 class="media-heading">• Exercícios de Solo</h3>
                <h3 class="media-heading">• Exercícios de Bola</h3>
            </div>
          </div>
          </a> <a class="news-link" href="">
            <div class="media clearfix background-belize-hole color-white">
              <div class="pull-left"> <img class="media-object" src="img/imgbola.jpg" alt="..."> </div>
              <div class="media-body">
                <h3 class="media-heading">• Aparelhos ( Cadillac, Reformer, Chair e Barrel)</h3>
                 <h3 class="media-heading">• Acessórios (  Meia Lua, Disco de Propriocepção, Faixa Elástica e Magic Circle)</h3>
              </div>
            </div>
            </a> <a class="news-link" href="">
              <div class="media clearfix background-belize-hole color-white">
                <div class="pull-left"> <img class="media-object" src="img/imgbrinde.jpg" alt="..."> </div>
                <div class="media-body">
                  <h3 class="media-heading">Inscreva-se e Ganhe Brindes!</h3>
                  <p>E pague seu curso no cartão em até 10x R$180,00 ou a vista por R$1610,00</p>
                </div>
              </div>
            </a> </div>
      </div>
    </section>
  <section class="">
      <div class="container">
        <h1><span>Investimento</span></h1>
        <div class="row">
          <div class="col-sm-6 col-md-3">
            <div class="info-thumbnail-link"> <br>
              <div class="thumbnail info-thumbnail popular background-background-clouds color-text">
                <div style="background-color:#CCC" class="special background-midnight-blue color-white">
                  <h5 style="color:#555555; size:10px"><strong>Valor: R$1800,00. </strong>Ou em até</h5>
                </div>
                <div class="pricing-head">
                  <div class="pricing-head-body background-peter-river">
                    <div class="price-wrapper color-white"> <span class="price"><sup><small>10x R$</small></sup>180,<small>00</small></span><br>
                      <span class="per">no cartão</span> de crédito</div>
                  </div>
                </div>
                <div class="special background-midnight-blue color-white">
                  <h5>Desconto  para pagamento a vista por Depósito Bancário ou Boleto: <font color="#FFCC00">R$1610,00</font>*<br>
                    Veja regras ao lado &gt; <br>
                  </h5>
                </div>
                <div style="height:160px" class="caption bordered background-white">
                  <div   class="description">
                    <ul class="pricing-list">
                      <li>No cheque em até 10x R$189
                        
                    </ul>
                    <p>Curso Completo de Formação de Professores de Pilates em SP (Completo)</p>
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
                    <p><strong> * PARA PAGAMENTOS COM BOLETO BANCÁRIO COM  DESCONTO:</strong> <br>
                      * Promoção válida por apenas 3 dias após geração do boleto. Após essa data, o desconto concedido no boleto cairá para  R$1610,00 <br>
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
                      Gerar um boleto no valor de R$189,00 para pagamento da primeira parcela e o valor restante deve ser pago em até 10 cheques que devem ser levados no primeiro dia de aula.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  
  <!--#include file = "depoimentos_cursos.asp"-->
  
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