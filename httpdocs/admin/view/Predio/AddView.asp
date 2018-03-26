
<div class="page-content">
                <!-- Page Breadcrumb -->
                <div class="page-breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="#">Home</a>
                        </li>
                        <li class="active">Pr&eacute;dio Admin</li>
                    </ul>
                </div>
                <!-- /Page Breadcrumb -->
                <!-- Page Header -->
                <div class="page-header position-relative">
                    <div class="header-title">
                        <h1>
                            Pr&eacute;dio Admin
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
                                <span class="widget-caption">Novo Cadastro</span>
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
                                                   data-bv-message="Nome de Pr&eacute; inv&aacute;lido."
                                                   required
                                                   data-bv-notempty-message="Preencha o nome do pr&eacute;dio."/>
                                                   
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Endere&ccedil;o</label>
                                        <div class="col-lg-8">
                                             <input type="text" class="form-control" name="endereco" id="endereco"
                                                   data-bv-message="Endere&ccedil;o inv&aacute;lido."
                                                   required
                                                   data-bv-notempty-message="Preencha o endere&ccedil;o."/>
                                                   
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Bairro</label>
                                        <div class="col-lg-8">
                                             <input type="text" class="form-control" name="bairro" id="bairro"
                                                   data-bv-message="Bairro inv&aacute;lido."
                                                   required
                                                   data-bv-notempty-message="Preencha o Bairro."/>
                                                   
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label class="col-lg-3 control-label">Condom&iacute;nio</label>
                                        <div class="col-lg-8">
                                            <select class="form-control" name="condominio" id="condominio">
                                                <option value="">Selecionar tipo</option>
                                                <option value="0">N&atilde;o</option>
                                                <option value="1">Sim</option>                                                
                                            </select><i class="form-control-feedback" data-bv-field="country" style="display: none;"></i>
                                        </div>
                                     </div>
                                     <div id="nome_condominio" class="form-group">
                                        <label class="col-lg-3 control-label">Nome do Condom&iacute;nio</label>
                                        <div class="col-lg-8">
                                             <input type="text" class="form-control" name="nome_condominio" id="nome_condominio"
                                                   data-bv-message="Senha inv&aacute;lido."
                                                   required
                                                   data-bv-notempty-message="Preencha o nome do condom&iacute;nio."/>
                                                   
                                        </div>
                                    </div>
                                    <div id="foto1" class="form-group">
                                    	<label class="col-lg-3 control-label">Foto 1</label>
                                        <div class="col-lg-8">
                                        	<input type="file" id="foto1" name="foto1"/>
                                        </div>
                                    </div>  
                                    <div id="foto1" class="form-group">
                                    	<label class="col-lg-3 control-label">Foto 2</label>
                                        <div class="col-lg-8">
                                        	<input type="file" id="foto2" name="foto2"/>
                                        </div>
                                    </div>
                                    <div id="foto1" class="form-group">
                                    	<label class="col-lg-3 control-label">Foto 3</label>
                                        <div class="col-lg-8">
                                        	<input type="file" id="foto3" name="foto3"/>
                                        </div>
                                    </div>
                                    <div id="foto1" class="form-group">
                                    	<label class="col-lg-3 control-label">Foto 4</label>
                                        <div class="col-lg-8">
                                        	<input type="file" id="foto4" name="foto4"/>
                                        </div>
                                    </div>                                                            
                                    <div class="form-group">
                                        <div class="col-lg-8 col-lg-offset-9">
                                        	<input type="hidden" name="btnSubmit" id="btnSubmit" value="n" />
                                            <button type="submit" name="sub_submit" id="sub_submit" class="btn btn-palegreen" onclick="return validar(this.form)">Incluir</button>
                                        </div>
                                    </div>
                                </form>
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
		$('#nome_condominio').hide();		
		$('#condominio').change(function(){
				
			if($('#condominio').val() == 0){
				$('#nome_condominio').hide();
				
			}else{
				$('#nome_condominio').show();
			}				
		});	
		
		$('#sub_submit').click(function() {
			$('#btnSubmit').val('s');
		});
		
	});
</script>



