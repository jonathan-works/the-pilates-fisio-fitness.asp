
<div class="page-content"> 
  <!-- Page Breadcrumb -->
  <div class="page-breadcrumbs">
    <ul class="breadcrumb">
      <li> <i class="fa fa-home"></i> <a href="#">Home</a> </li>
      <li class="active">Servi&ccedil;os Admin</li>
    </ul>
  </div>
  <!-- /Page Breadcrumb --> 
  <!-- Page Header -->
  <div class="page-header position-relative">
    <div class="header-title">
      <h1> Servi&ccedil;os Admin </h1>
    </div>
    <!--Header Buttons-->
    <div class="header-buttons"> <a class="sidebar-toggler" href="#"> <i class="fa fa-arrows-h"></i> </a> <a class="refresh" id="refresh-toggler" href=""> <i class="glyphicon glyphicon-refresh"></i> </a> <a class="fullscreen" id="fullscreen-toggler" href="#"> <i class="glyphicon glyphicon-fullscreen"></i> </a> </div>
    <!--Header Buttons End--> 
  </div>
  <!-- /Page Header --> 
  <!-- Page Body -->
  
  <div class="page-body">
    <div class="row">
      <div class="col-lg-6 col-sm-6 col-xs-12">
        <div class="widget  radius-bordered">
          <div class="widget-header"> <span class="widget-caption">Novo Cadastro</span> </div>
          <div class="widget-body">
          	<div align="center"><span><%= add_msg %></span></div>
            <form id="form_Servico" name="form_Servico" method="post" class="form-horizontal"
                                              data-bv-message="Este valor n&atilde;o &eacute; v&aacute;lido"
                                              data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                                              data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
                                              data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
              <div class="form-group">
                <label class="col-lg-3 control-label">Nome do Servi&ccedil;o </label>
                <div class="col-lg-8">
                  <input type="text" class="form-control" name="descricao" id="descricao"
                                                           data-bv-message="Servi&ccedil;o inv&aacute;lido."
                                                           required
                                                           data-bv-notempty-message="Preencha o Nome do Servi&ccedil;o." />
                </div>
              </div>
              <div class="form-group ">
                <div class="col-lg-8 col-lg-offset-9">
                  <button type="submit" name="sub_submit" id="sub_submit" class="btn btn-palegreen btn btn-default btn-sm btn-next">Incluir</button>
                </div>
              </div>
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

<!--Page Related Scripts--> 
<script src="assets/js/fuelux/wizard/wizard-custom.js"></script> 
<script src="assets/js/toastr/toastr.js"></script> 
<script type="text/javascript">
        jQuery(function ($) {
            $('#simplewizardinwidget').wizard();
        });
    </script> 
<script>
        $(document).ready(function () {

            $('#form_Servico').bootstrapValidator();
        });
    </script> 
