

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
                        <li class="active">Usu&aacute;rios Admin</li>
                    </ul>
                </div>
                <!-- /Page Breadcrumb -->
                <!-- Page Header -->
                <div class="page-header position-relative">
                    <div class="header-title">
                        <h1>
                            Usu&aacute;rios Admin
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
                                <form id="form_Usuario" name="form_Usuario" method="post" class="form-horizontal"
                                      data-bv-message="Este valor n&atilde;o &eacute; v&aacute;lido"
                                      data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                                      data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
                                      data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Nome do Usu&aacuterio</label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control" name="nome_Usuario" id="nome_Usuario"
                                                   data-bv-message="Usu&aacute;rio inv&aacute;lido."
                                                   required
                                                   data-bv-notempty-message="Preencha o Nome do Usu&aacute;rio."
                                                   pattern="[a-zA-Z0-9]+"
                                                   data-bv-regexp-message="O usu&aacute;rio n&atilde;o pode conter caracteres especiais." 
                                                   value="<%= Usuarios("Nome_Usuario")%>" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Senha do Usu&aacute;rio</label>
                                        <div class="col-lg-8">
                                             <input type="text" class="form-control" name="Senha_Usuario" id="Senha_Usuario"
                                                   data-bv-message="Senha inv&aacute;lido."
                                                   required
                                                   data-bv-notempty-message="Preencha a senha do Usu&aacute;rio."
                                                   pattern="[a-zA-Z0-9]+"
                                                   data-bv-regexp-message="A senha n&atilde;o pode conter caracteres especiais."
                                                   value="<%= Usuarios("Senha_Usuario")%>" />
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label class="col-lg-3 control-label">Tipo Usu&aacute;rio</label>
                                        <div class="col-lg-8">
                                            <select class="form-control" name="Tipo_Usuario" id="Tipo_Usuario">
                                                <option value="">Selecionar tipo</option>
                                                <option <%if not Usuarios("Tipo_Usuario") Then Response.Write("selected")%> value="0">Operador</option>
                                                <option <%if Usuarios("Tipo_Usuario") Then Response.Write("selected")%> value="1">Administrador</option>                                                
                                            </select><i class="form-control-feedback" data-bv-field="country" style="display: none;"></i>
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

		$('#form_Usuario').bootstrapValidator();
	});
</script>