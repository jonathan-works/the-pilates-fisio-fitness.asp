


<div id="msg">
<%if not isEmpty(add_msg) Then Response.Write(add_msg)%>
</div>
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
                                <form id="form_Predio" name="form_Predio" method="post" class="form-horizontal"
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
                                     <div class="form-group">
                                        <label class="col-lg-3 control-label">Nome do Condom&iacute;nio </label>
                                        <div class="col-lg-8">
                                             <input type="text" class="form-control" name="Nome_Condominio" id="Nome_Condominio"
                                                   data-bv-message="Nome do condom&iacute; inv&aacute;lido."
                                                   required
                                                   data-bv-notempty-message="Preencha o nome do condom&iacute;." 
                                                   value="<%= Predios("Nome_Condominio")%>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-lg-8 col-lg-offset-9">
                                            <button type="submit" name="sub_submit" id="sub_submit" class="btn btn-palegreen">Alterar</button>
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
	});
</script>


