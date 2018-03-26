<section class="">
    <div class="container">
      <h1><span>Depoimentos</span></h1>
      <%
	  Dim sql_depoimento, rs_depoimento
	  sql_depoimento = "SELECT TOP 6 * FROM Depoimento WHERE Data BETWEEN '2015-02-13' AND GETDATE() AND LEN(Descricao) < 120 ORDER BY NewId()"
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
      
    </div>
  </section>