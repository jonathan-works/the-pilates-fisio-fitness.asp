<div id="nav-wrapper" class="background-white color-black">
  <nav id="mainMenu" class="navbar navbar-fixed-top" role="navigation" style="background-color:#000;color:#FFF">
    <div class="container"> 
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar background-lead"></span> <span class="icon-bar background-lead"></span> <span class="icon-bar background-lead"></span></button>
        
        
 <style>
						@media (max-width: 767px)
						.outrosprodutos {display: none;}
						.tooltip {opacity:100}
						.tooltip-inner {background:#809e23;}
						.tooltip.top .tooltip-arrow {border-top-color:#809e23;}
						
						</style>
                <style>

				@media screen and (min-width: 401px) and (max-width: 1024px) {		
  .outrosprodutos { display: block; }  /* show it on small screens */
 
}

@media screen and (min-width: 0px) and (max-width: 400px) {
  .outrosprodutos{ display: none; }   /* hide it elsewhere */
}
}

						</style>
                        
        
        <div style="width:180px; height:142px;  float:left; position:absolute;" class="outrosprodutos">
        <a class="navbar-brand" href="default.asp"><img src="img/logo-new.png" alt="logo" style="-webkit-box-shadow: 1px 3px 5px 1px rgba(0,0,0,0.28);
-moz-box-shadow: 1px 3px 5px 1px rgba(0,0,0,0.28);
box-shadow: 1px 3px 5px 1px rgba(0,0,0,0.28);"></a>
</div>


<style>

.outrosprodutos2 {
display: none;
}

@media screen and (max-width: 480px) {
.outrosprodutos2 {
display: block; float:left; clear:left;padding:0px;
}
}

						</style>

 <div style="margin:0 auto; display:block;" class="outrosprodutos2">
        <a class="navbar-brand" href="default.asp"><img src="img/logo-new2.png" alt="logo" style="-webkit-box-shadow: 1px 3px 5px 1px rgba(0,0,0,0.28);
-moz-box-shadow: 1px 3px 5px 1px rgba(0,0,0,0.28);
box-shadow: 1px 3px 5px 1px rgba(0,0,0,0.28);"></a>
</div>



      </div>
      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse navbar-ex1-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="https://facebook.com/FisioFitnessPilates"><img src="face.png" width="27" height="26"  alt=""/></a></li>
          <li><a href="https://www.youtube.com/channel/UC_bdG719cfjaSbcLicmsaqA"><img src="yt.png" width="27" height="26"  alt=""/></a></li>
        
          <li> <a href="default.asp">Home </a></li>
          <li><a href="quem-somos.asp">Quem Somos</a></li>
          <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown">Cursos <b class="caret"></b></a>
            <ul class="dropdown-menu">
                <li><a href="#">Curso de Pilates Completo <b class="caret"></b></a>
                  <ul>
                    <%							
  							sql_cidades = "select distinct c.url, c.Descricao from cidade c, studio s, UF u, curso cu, turma t where t.cod_curso = cu.cod_curso and s.cod_uf = u.Cod_uf and u.Cod_uf = c.cod_uf and cu.descricao = 'completo' order by c.descricao"				
  							set rs_cidades = cn.execute(sql_cidades)
							
  							do while not rs_cidades.eof
  							%>
                    <li><a href="cursos.asp?cod_curso=2&cidade=<%=rs_cidades("url")%>" class="dropdown-toogle" data-toggle="dropdown2"><%=rs_cidades("descricao")%></a></li>
                    <%
  							rs_cidades.movenext
  							loop
  							set rs_cidades = nothing
  							%>
                  </ul>
                </li>
              <li><a href="#">Curso de Pilates em Patologias <b class="caret"></b></a>
                <ul>
                  <%
							dim sql_cidades, rs_cidades
							sql_cidades = "select distinct c.url, c.Descricao from cidade c, studio s, UF u, curso cu, turma t where t.cod_curso = cu.cod_curso and s.cod_uf = u.Cod_uf and u.Cod_uf = c.cod_uf and cu.descricao = 'patologias' order by c.descricao"				
							set rs_cidades = cn.execute(sql_cidades)
							
							do while not rs_cidades.eof
							%>
                  <li><a href="cursos.asp?cod_curso=1&cidade=<%=rs_cidades("url")%>" class="dropdown-toogle" data-toggle="dropdown2"><%=rs_cidades("descricao")%></a></li>
                  <%
							rs_cidades.movenext
							loop
							set rs_cidades = nothing
							%>
                </ul>
              </li>              
              <li><a href="#">Curso de Pilates na Gestação <b class="caret"></b></a>
                <ul>
                  <%							
							sql_cidades = "select distinct c.url, c.Descricao from cidade c, studio s, UF u, curso cu, turma t where t.cod_curso = cu.cod_curso and s.cod_uf = u.Cod_uf and u.Cod_uf = c.cod_uf and cu.descricao = 'gestacao' order by c.descricao"				
							set rs_cidades = cn.execute(sql_cidades)
							
							do while not rs_cidades.eof
							%>
                  <li><a href="cursos.asp?cod_curso=3&cidade=<%=rs_cidades("url")%>" class="dropdown-toogle" data-toggle="dropdown2"><%=rs_cidades("descricao")%></a></li>
                  <%
							rs_cidades.movenext
							loop
							set rs_cidades = nothing
							%>
                </ul>
              </li>
              <li><a href="#">Curso de Pilates Suspenso <b class="caret"></b></a>
                <ul>
                  <%							
							sql_cidades = "select distinct c.url, c.Descricao from cidade c, studio s, UF u, curso cu, turma t where t.cod_curso = cu.cod_curso and s.cod_uf = u.Cod_uf and u.Cod_uf = c.cod_uf and cu.descricao = 'suspenso' order by c.descricao"				
							set rs_cidades = cn.execute(sql_cidades)
							
							do while not rs_cidades.eof
							%>
                  <li><a href="cursos.asp?cod_curso=4&cidade=<%=rs_cidades("url")%>" class="dropdown-toogle" data-toggle="dropdown2"><%=rs_cidades("descricao")%></a></li>
                  <%
							rs_cidades.movenext
							loop
							set rs_cidades = nothing
							%>
                </ul>
              </li>
            </ul>
          </li>
          <!--<li><a href="conteudo-programatico.asp">Conteúdo Programático</a></li>-->
          <li><a href="estudios-de-pilates.asp">Estúdios</a></li>
          <li><a href="aparelhos-de-pilates.asp" >Aparelhos </a></li>
          <li><a href="galeria-fotos-de-pilates.asp">Galeria</a></li>
          <li><a href="http://www.thepilatesfisiofitness.com.br/blog">Blog</a></li>
          <li><a href="contato.asp">Contato</a></li>
        </ul>
      </div>
      <!-- /.navbar-collapse --> 
    </div>
  </nav>
</div>
<%
  Function RemoverAcentosEspacos(palavra)
  	
	palavra = replace(palavra," ","")
	
	palavra = replace(palavra,"á","a")
	palavra = replace(palavra,"é","e")
	palavra = replace(palavra,"í","i")
	palavra = replace(palavra,"ó","o")
	palavra = replace(palavra,"ú","u")
	
	palavra = replace(palavra,"ã","a")
	
  
  	RemoverAcentosEspacos = palavra
  
  End Function
  %>
