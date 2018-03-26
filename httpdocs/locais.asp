<%dim sql_locais, rs_locais

sql_locais = "select studio, endereco, bairro, numero, compl, tel1, tel2 from studio inner join cidade ci on ci.descricao = studio.cidade where ci.url = '"&request.querystring("cidade")&"' and cod_studio in (select cod_studio from turma)"
set rs_locais = cn.execute(sql_locais)

%>

    <section id="studios" class="">
      <div  class="container">
        <div class="row">
          <div style="width:50%" class="col-md-9">
            <div class="content">
              <h1><span>Studios:</span></h1>
			  
			  <%do while not rs_locais.eof%>
			  <p align="left"><strong><%=rs_locais("studio")%></strong></p>
			  <p align="left" style="font-weight: normal"><%=rs_locais("endereco") & ", " & rs_locais("numero") & " - " & rs_locais("bairro") & " " & rs_locais("compl")%></p>
			  <p style="font-weight: normal"><span class="fa fa-phone-square color-lead"></span><%=rs_locais("tel1")%> | <%=rs_locais("tel2")%></p>
			  <hr size="1"/>
			  <%
			  rs_locais.movenext
			  loop
			  %>
            </div>
          </div>
          <div style="width:50%" class="col-md-9">
            <div class="content">
              <h1><span>Público Alvo:</span></h1>
              <p align="left">
              
              - Fisioterapeutas<br>
              - Profissionais da Educação Física;  <br>
              - Terapeutas Ocupacionais; <br>
              - Profissionais da dança e yoga; <br>
              - Acadêmicos a partir do 2º período.
              
              
              (tenha cursado anatomia e fisiologia)</p>
              <p>&nbsp;</p>
            </div>
          </div>
        </div>
      </div>
      </div>
      <!--</div>
      </div>  divs sem fechamentos -->
    </section>