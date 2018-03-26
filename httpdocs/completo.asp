<%
if request.queryString("cidade") = "saopaulo" then
valor_curso_exibicao1 = formatCurrency(1400) 'valor do curso'
valor_curso_exibicao2 = "150" 'valor da parcela'
valor_curso_exibicao3 = formatCurrency(1289) 'valor do pagamento a vista'
valor_cheque = formatCurrency(2000) 'valor total em cheque - coloque o valor total que divide automaticamente por 10'
else
valor_curso_exibicao1 = formatCurrency(1710)
valor_curso_exibicao2 = "180"
valor_cheque = formatCurrency(1800)
end if
%>
	     
    
    <div class="row">
      <div class="container">
        <h1><span>Investimento</span></h1>
        <div class="row">
          <div class="col-sm-6 col-md-3">
            <div class="info-thumbnail-link"> <br>
              <div class="thumbnail info-thumbnail popular background-background-clouds color-text">
                <div style="background-color:#CCC" class="special background-midnight-blue color-white">
                  <h5 style="color:#555555; size:10px"><strong>Valor: <%=valor_curso_exibicao1%></strong> Ou em até</h5>
                </div>
                <div class="pricing-head">
                  <div class="pricing-head-body background-peter-river">
                    <div class="price-wrapper color-white"> 
                      <span class="price valor-curso"><sup><small>10x R$</small></sup><%=valor_curso_exibicao2%>,<small>00</small></span><br>
                      <span class="span-valor"><span class="per">no cartão</span> de crédito via Pagseguro.</span>
                    </div>
                  </div>
                </div>
                <div class="special background-midnight-blue color-white">
                  <h5>Desconto  para pagamento a vista por Depósito ou Boleto: <font color="#FFCC00"><%=valor_curso_exibicao3%></font>*<br>
                    Veja regras ao lado &gt; <br>
                  </h5>
                </div>
                <div style="height:160px" class="caption bordered background-white">
                  <div class="description" style="height: 176px;">
                    <ul class="pricing-list">
                      <li>No cheque em até <br/> 10x <%=formatCurrency(valor_cheque / 10)%>
                        
                    </li></ul>
                    <p>Curso de Pilates Completo</p>
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
                      * Promoção válida por apenas 3 dias após geração do boleto. Após essa data, o desconto concedido no boleto cairá para <%=valor_curso_exibicao3%> <br>
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
                      Gerar um boleto no valor de R$100,00 para pagamento da primeira parcela e o valor restante deve ser pago em até 10 cheques que devem ser levados no primeiro dia de aula.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
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
        <div class="panel-body"><strong>- 100 horas </strong>– (54 horas/aula + 46 horas/aula de estágio opcional)<br>
          <em>*Seguindo os padrões de ensino do MEC onde a hora/aula é representada por 45 minutos. <br>
** Pratica supervisionada opcional de acordo com a disponibilidade do aluno. </em></div>
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading" role="tab" id="headingOne">
        <h4 class="panel-title"> <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo" class="collapsed"> MATERIAL DIDÁTICO ENTREGUE AO ALUNO:</a> </h4>
      </div>
      <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne" aria-expanded="false" style="height: 0px;">
        <div class="panel-body">- Camiseta e ou meia da escola, <br>
          - Bolsa da escola com lápis<br>
          - Apostila com fotos coloridas contendo 230 páginas<br>
        </div>
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading" role="tab" id="headingThree">
        <h4 class="panel-title"> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseTwo"> CERTIFICAÇÃO: </a> </h4>
      </div>
      <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" aria-expanded="false">
        <div class="panel-body"><img src="images/diploma.png" width="164" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><br>
<br>
- Certificado de conclusão de curso impresso com carga horaria de 100 h.  <br>
- Certificado serve para complemento de horas extracurriculares, obrigatório para obtenção de diploma de graduação. <br>
- Metodologia aplicada e reconhecida mundialmente. <br>
** sorteio de viagens e equipamentos. </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading" role="tab" id="headingFour">
        <h4 class="panel-title"> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour"> CONTEÚDO PROGRAMÁTICO (CURSO DE PILATES COMPLETO): </a> </h4>
      </div>
      <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour" aria-expanded="false">
        <div class="panel-body"><strong>I  </strong> – HISTÓRIA DO MÉTODO PILATES E SEU CRIADOR;<br>
            <strong>II </strong>– BENEFÍCIOS DA PRÁTICA DO PILATES;<br>
            <strong>III </strong>– EXPANSÃO DO MÉTODO PILATES;<br>
            <strong>IV </strong>– USUFRUTO DA MARCA PILATES;<br>
            <strong>V  –</strong> PRINCIPIOS DO MÉTODO (CONCENTRAÇÃO, CENTRALIZAÇÃO (POWERHOUSE), RESPIRAÇÃO,  FLUIDEZ DOS MOVIMENTOS, PRECISÃO E CONTROLE);<br>
            <strong>VI  –</strong> PILATES E BIOMECANICA – BASEADO EM EVIDENCIAS;<br>
            <strong>VII </strong>- CONSEQUÊNCIAS DOS DESIQUILÍBRIOS MUSCULARES;<br>
            <strong>VIII </strong>– PILATES NA TERCEIRA IDADE – INDICAÇÕES E CONTRAINDICAÇÕES;<br>
            <strong>IX</strong> – PILATES NA GRAVIDEZ – INDICAÇÕES E CONTRAINDICAÇÕES;<br>
            <strong>X </strong>– PILATES NA INFÂNCIA – INDICAÇÕES E CONTRAINDICAÇÕES;<br>
            <strong>XI </strong>– PATOLOGIAS ORTOPÉDICAS (HÉRNIAS DISCAIS, ESPODILÓLISE, ESPONDILOLISTESE,  ESCOLIÓSE, HIPERCIFOSE, HIPERLORDOSE, INSTABILIDADE GLENOUMERAL, INSTABILIDADE  MULTIDIRECIONAL, SÍNDROME DO IMPACTO, PATOLOGIAS DO CARPO, DISFUNÇÕES  FEMURO-PATELAR). <br>
            <strong>XII</strong> – REABILITAÇÃO ATRAVÉS DO PILATES;<br>
            <strong>XIII </strong>– INDICAÇÃO E CONTRAINDICAÇÃO DE CADA EXERCICIO PROPOSTO;<br>
            <strong>XIV </strong>– APRESENTAÇÃO DOS APARELHOS E SEUS ACESSÓRIOS;<br>
            <strong>XV </strong>– ORGANIZAÇÃO E MONTAGEM DE AULAS PARA DIFERENTES PÚBLICOS;<br>
            <strong>XVI</strong> – PRESCRIÇÃO DOS EXERCICIOS, QUANTIDADE DE AULAS E EXERCÍCIOS;<br>
            <strong>XVII</strong> – DINÂMICA DE AULAS;<br>
            <strong>XVIII</strong> – ROTINA DO DIA A DIA, PRÁTICAS;<br>
            <strong>XIX</strong> – REGULAMENTAÇÃO SOBRE O MÉTODO (CONFEF, CREF, COFFITO, CREFITO, MEC);<br>
            <strong>XX</strong> – PRÁTICA (EXERCÍCIOS DE SOLO, CADILLAC, REFOMER, STEP CHAIR, BARREL,  ACESSÓRIOS E BOLA – TODOS OS EXERCÍCIOS DE NÍVEIS INICIANTES/ INTERMEDIÁRIOS/ AVANÇADOS).<br>
            <strong>XXI</strong> – ADAPTAÇÕES DOS EXERCÍCIOS A DIFERENTES PÚBLICOS, PATOLOGIAS E NÍVEL DE  APRENDIZADO;<br>
            <strong>XXII</strong> – INFORMAÇÕES ESSENCIAIS SOBRE MARKETING, SITE, PROPAGANDA (PARTICIPAÇÃO DE UM  ESPECIALISTA NA ÁREA); <br>
            <strong>XXIII</strong> – INFORMAÇÕES ESSENCIAIS PARA MONTAGEM DE ESTÚDIO E ABERTURA DE EMPRESA  (PARTICIPAÇÃO DE UM CONTADOR ESPECIALIZADO EM ABERTURA DE EMPRESAS);        </div>
      </div>
    </div>
    
    <div class="panel panel-default">
      <div class="panel-heading" role="tab" id="headingFive">
        <h4 class="panel-title"> <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive"> MINISTRANTES: </a> </h4>
      </div>
      <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour" aria-expanded="false">
        <div class="panel-body"> 
        
        
<img src="images/avatar1.png" width="144" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><strong>CAMILO BARBOSA JUNIOR</strong><br>
- Fisioterapeuta Crefito 3 150302-F;<br>
- Pós-graduado em Fisiologia do Exercício (Unicid);<br>
- Pós-graduando em Formação Docente no Ensino Superior (Unicid);<br>
- Pós Graduado em Reabilitação Aplicada ao Esporte (Unifesp);<br>
- Formação em Pilates Completo (EVP); Formação em Pilates Completo (Caeffis);<br>
- Formação em Pilates na Gravidez (korper); Formação alongamento consciente (Inélia Garcia); Formação em Pilates Completo (The Pilates Fisio Fitness); Formação Pilates on the Ball (Collen Craig Canadá); Formação em Pilates: Treinamento Avançado na Atuação do Instrutor (Silvia Gomes).<br>
- Formação no Método de Mckenzie (IM).<br><br>

<img src="images/avatar5.png" width="144" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><strong>GILSIMAR RIZZARDI</strong><br>
- Educador Físico Cref-sp;<br>
- Fisioterapeuta Crefito 3;<br>
- Pós-graduado em Fisioterapia Traumato-ortopedica (UGF);<br>
- Formação em Pilates solo (Pilates Fisio Fitness); Formação em Pilates Completo (ITALIA FIT); Formação em Kinésio Tapping (FK); Formação em Eletroterapia Aplicada (CEFAI); Formação em Core 360.<br><br><br>
<img src="images/avatar2.png" width="144" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><strong>NATHÁLIA NARCISO GOMES</strong><br>
- Fisioterapeuta, Crefito 3;<br>
- Pós Graduada em Fisioterapia Traumato-Ortopedia e Desportiva (UniNove);<br>
- Pós graduada em Osteopatia (IDOT);<br>
- Formação em Pilates Completo (The Fisio Fitness Pilates);<br>
- Formação em Pilates solo, bola e acessórios (UniNove);<br>
- Formação em bandagem funcional “Kinesio tapping” (Uninove);<br>
- Formação em RPG/RPM (CBN)<br><br>

<img src="images/avatar4.png" width="144" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><strong>CAUE FELIX DA SILVA</strong><br>
- Fisioterapeuta, Crefito 3;<br>
- Fisiologia do Exercício pela Escola Paulista de Medicina – UNIFESP<br>
- Afecções da coluna vertebral pela Escola de Medicina da Santa Casa de Misericórdia de São Paulo<br>
- Especialista em Acupuntura - FACIS <br>
- Fisioterapia Ortopédica e Desportiva (Cursando) – UNICID<br>
- Formação em RPG, (Centro Paulista de Reeducação e Fisioterapia);<br>
- Formação em Pilates Completo (The Fisio Fitness Pilates);<br>
- Formação em Pilates solo, bola e acessórios (The Pilates Fisio Fitness);<br>
- Formação em Pilates suspenso (The Fisio Fitness Pilates).<br><br>

<img src="images/avatar3.png" width="144" height="168" style="padding-right:10px; padding-bottom:10px; float:left;"><strong>DÉBORA PAULA DOS SANTOS</strong><br>
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
                  <p>E pague seu curso no cartão em até 10x <%=formatCurrency(valor_curso_exibicao2)%> ou a vista por <%=valor_curso_exibicao3%></p>
                </div>
              </div>
            </a> </div>
      </div>
    </section>