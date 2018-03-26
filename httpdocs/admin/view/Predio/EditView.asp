<div class="page-content">
                <!-- Page Breadcrumb -->
                <div class="page-breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="#">Home</a>
                        </li>
                        <li class="active">Pr&eacute;dios Admin</li>
                    </ul>
                </div>
                <!-- /Page Breadcrumb -->
                <!-- Page Header -->
                <div class="page-header position-relative">
                    <div class="header-title">
                        <h1>
                            Pr&eacute;dios Admin
                        </h1>
                    </div>
                    <!--Header Buttons-->
                    <div class="header-buttons">
                        <a class="sidebar-toggler" href="#">
                            <i class="fa fa-arrows-h"></i>
                        </a>
                        <a class="refresh" id="refresh-toggler" href="">
                            <i class="glyphicon glyphicon-refresh"></i>
                        </a>
                        <a class="fullscreen" id="fullscreen-toggler" href="#">
                            <i class="glyphicon glyphicon-fullscreen"></i>
                        </a>
                    </div>
                    <!--Header Buttons End-->
                </div>
                <!-- /Page Header -->
                <!-- Page Body -->
                <div class="page-body">
                    <div class="row">
                   	   <div class="col-lg-6 col-sm-6 col-xs-12">
                        <div class="widget  radius-bordered">
                            <div class="widget-header">
                                <span class="widget-caption">Altera&ccedil;&atilde;o de Cadastro</span>
                            </div>
                            <div class="widget-body">
								<div align="center"><span><%= add_msg %></span></div>
                                <form id="form_Predio" name="form_Predio" method="post" class="form-horizontal" enctype="multipart/form-data"
                                      data-bv-message="Este valor n&atilde;o &eacute; v&aacute;lido"
                                      data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                                      data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
                                      data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Nome do Pr&eacute;dio </label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control" name="nome_Predio" id="nome_Predio"
                                                   data-bv-message="Pr&eacute;dio inv&aacute;lido."
                                                   required
                                                   data-bv-notempty-message="Preencha o Nome do Pr&eacute;dio."
                                                  
                                                   value="<%= Predios("Nome_Predio")%>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Endere&ccedil;o </label>
                                        <div class="col-lg-8">
                                             <input type="text" class="form-control" name="endereco" id="endereco"
                                                   data-bv-message="Endee&ccedil;o inv&aacute;lido."
                                                   required
                                                   data-bv-notempty-message="Preencha o endere&ccedil;o." 
                                                   value="<%= Predios("Endereco")%>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Bairro</label>
                                        <div class="col-lg-8">
                                             <input type="text" class="form-control" name="bairro" id="bairro"
                                                   data-bv-message="Bairro inv&aacute;lido."
                                                   required
                                                   data-bv-notempty-message="Preencha o Bairro."
                                                   value="<%= Predios("Bairro") %>"/>
                                                   
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label class="col-lg-3 control-label">Condom&iacute;nio</label>
                                        <div class="col-lg-8">
                                            <select class="form-control" name="condominio" id="condominio">
                                                <option value="">Selecionar tipo</option>
                                                <option <%if not Predios("condominio") Then Response.Write("selected")%> value="0">N&atilde;o</option>
                                                <option <%if Predios("condominio") Then Response.Write("selected")%> value="1">Sim</option>                                                
                                            </select><i class="form-control-feedback" data-bv-field="country" style="display: none;"></i>
                                        </div>
                                     </div>
                                     <div id="nome_condominio" class="form-group">
                                        <label class="col-lg-3 control-label">Nome do Condom&iacute;nio </label>
                                        <div class="col-lg-8">
                                             <input type="text" class="form-control" name="Nome_Condominio" id="Nome_Condominio"
                                                   data-bv-message="Nome do condom&iacute; inv&aacute;lido."
                                                   required
                                                   data-bv-notempty-message="Preencha o nome do condom&iacute;." 
                                                   value="<%= Predios("Nome_Condominio")%>" />
                                        </div>
                                    </div>
                                    <div id="foto1" class="form-group">
                                    	<label class="col-lg-3 control-label">Foto 1</label>
                                        <div class="col-lg-8">
                                        	<input type="file" name="foto1"/>
                                        </div>
                                    </div>
                                    <div id="foto1" class="form-group">
                                    	<label class="col-lg-3 control-label">Foto 2</label>
                                        <div class="col-lg-8">
                                        	<input type="file" name="foto2"/>
                                        </div>
                                    </div>
                                    <div id="foto1" class="form-group">
                                    	<label class="col-lg-3 control-label">Foto 3</label>
                                        <div class="col-lg-8">
                                        	<input type="file" name="foto3"/>
                                        </div>
                                    </div>
                                    <div id="foto1" class="form-group">
                                    	<label class="col-lg-3 control-label">Foto 4</label>
                                        <div class="col-lg-8">
                                        	<input type="file" name="foto4"/>
                                        </div>
                                    </div>       
                                    <div class="form-group">
                                        <div align="center">
                                        	<input type="hidden" id="btnSubmit" name="btnSubmit" value="n" />
                                            <button type="submit" name="sub_submit" id="sub_submit" onClick="return validar(this.form)" class="btn btn-palegreen">Alterar</button>
                                        </div>
                                    </div>
                                </form>

                                <div class="form-group">
                                	<form method="post" enctype="multipart/form-data">
                                        <table width="100%" border = "0" align = "center" cellspacing = "4" cellppadding = "1">
                                            <tr>
                                                <th>Foto 1</th>
                                                <th>Foto 2</th>
                                                <th>Foto 3</th>
                                                <th>Foto 4</th>                                            
                                            </tr>
                                            <tr>
                                            	<%
                                                if Predios("foto1") = "" then												
                                                %>
                                                    <td>Sem imagem</td>
                                                <%else %>	
                                                    <td><img width="150" src="../images/predio-images/<%= Predios("foto1")%>" /></td>	
                                                <%end if%>  
                                                <%
                                                if Predios("foto2") = "" then												
                                                %>
                                                    <td>Sem imagem</td>
                                                <%else %>	
                                                    <td><img width="150" src="../images/predio-images/<%= Predios("foto2")%>" /></td>	
                                                <%end if%>  
                                                <%
                                                if Predios("foto3") = "" then												
                                                %>
                                                    <td>Sem imagem</td>
                                                <%else %>	
                                                    <td><img width="150" src="../images/predio-images/<%= Predios("foto3")%>" /></td>	
                                                <%end if%>                                       
                                                <%
                                                if Predios("foto4") = "" then												
                                                %>
                                                    <td>Sem imagem</td>
                                                <%else %>	
                                                    <td><img width="150" src="../images/predio-images/<%= Predios("foto4")%>" /></td>	
                                                <%end if%>                                         
                                            </tr>
                                            <tr>
                                            	<%if not Predios("foto1") = "" then%>
                                                	<td><input type="submit" value="excluir" name="excluir1"/></td>	
                                                <%else%>
                                                	<td></td>
                                                <%end if%>  
                                                <%if not Predios("foto2") = "" then%>
                                                	<td><input type="submit" value="excluir" name="excluir2"/></td>	
                                                <%else%>
                                                	<td></td>
												<%end if%>
                                                <%if not Predios("foto3") = "" then%>
                                                	<td><input type="submit" value="excluir" name="excluir3"/></td>	
												<%else%>
                                                	<td></td>
                                                <%end if%>
                                                <%if not Predios("foto4") = "" then%>										                                               
                                                	<td><input type="submit" value="excluir" name="excluir4"/></td>	
                                                <%end if%>  
                                            </tr>
                                        </table>
                                    </form>	                            	
                                </div>                              
                            </div>                                                                               
                        </div>
                      </div>


			</div>
		</div>
</div>

<!--Related Scripts-->

<script src="assets/js/validation/bootstrapValidator.js"></script>
    
<script>
	$(document).ready(function () {		
		$('#form_Predio').bootstrapValidator();
		$('#btnSubmit').val('n');
		if($('#condominio').val() == 1){
			$('#nome_condominio').show();
		}else {
			$('#nome_condominio').hide();
			$('#Nome_Condominio').val(' ');
		}
		
		$('#condominio').change(function(){						
			if($('#condominio').val() == 0 ) {				
				$('#nome_condominio').hide();
				$('#Nome_Condominio').val(' ');
			}else {				
				$('#nome_condominio').show();				
			}			
		});		
					
		$('#sub_submit').click(function() {
			$('#btnSubmit').val('s');
		});
	});
</script>


