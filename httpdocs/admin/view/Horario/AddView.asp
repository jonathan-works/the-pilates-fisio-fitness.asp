<%
'Adiciona mensagem de erro ou sucesso
if not isEmpty(add_msg) Then

	Response.Write(add_msg)

end if
%>

<div class="page-content">
                <!-- Page Breadcrumb -->
                <div class="page-breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="#">Home</a>
                        </li>
                        <li class="active">Hor&aacute;rios</li>
                    </ul>
                </div>
                <!-- /Page Breadcrumb -->
                <!-- Page Header -->
                <div class="page-header position-relative">
                    <div class="header-title">
                        <h1>
                            Hor&aacute;rios
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
                                <form id="form_Horario" name="form_Horario" method="post" class="form-horizontal"
                                      data-bv-message="Este valor n&atilde;o &eacute; v&aacute;lido"
                                      data-bv-feedbackicons-valid="glyphicon glyphicon-ok"
                                      data-bv-feedbackicons-invalid="glyphicon glyphicon-remove"
                                      data-bv-feedbackicons-validating="glyphicon glyphicon-refresh">
                                      
                                    <div class="form-group has-feedback">
                                        <label class="col-lg-3 control-label">Dia da Semana</label>
                                        <div class="col-lg-8">
                                        	<select class="form-control" name="dia_semana" id="dia_semana">
                                                <option value="0">Domingo</option>
                                                <option value="1">Segunda</option>
                                                <option value="2">Ter&ccedil;a</option>
                                                <option value="3">Quarta</option>
                                                <option value="4">Quinta</option>
                                                <option value="5">Sexta</option>
                                                <option value="6">S&aacute;bado</option>
                                            </select>
                                        </div>
                                     </div>
                                     
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Hor&aacute;rio Inicial </label>
                                        <div class="col-lg-8">
                                            <input type="text" class="form-control" name="horario_inicial" id="horario_inicial"
                                                   data-mask="99:99" placeholder="00:00"
                                                   required
                                                   data-bv-notempty-message="Preencha este campo." />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Hor&aacute;rio Final</label>
                                        <div class="col-lg-8">
                                             <input type="text" class="form-control" name="horario_final" id="horario_final"
                                                    data-mask="99:99" placeholder="00:00"
                                                   required
                                                   data-bv-notempty-message="Preencha este campo." />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Quantidade</label>
                                        <div class="col-lg-8">
                                             <input type="text" class="form-control" name="quantidade" id="quantidade"
                                                    required
                                                   data-bv-notempty-message="Preencha este campo." />
                                        </div>
                                    </div>
                                    <div class="form-group has-feedback">
                                        <label class="col-lg-3 control-label">Pr&eacute;dio</label>
                                        <div class="col-lg-8">
                                            <select class="form-control" name="cod_predio" id="cod_predio">
                                                <%Do while not predios.eof%>
                                                <option value="<%= predios("Cod_Predio")%>"><%= predios("Nome_Predio")%></option>
                                                <%predios.movenext
                                                Loop%>
                                            </select>
                                        </div>
                                     </div>
                                     <div class="form-group has-feedback">
                                        <label class="col-lg-3 control-label">Servi&ccedil;o</label>
                                        <div class="col-lg-8">
                                            <select class="form-control" name="cod_servico" id="cod_servico">
												<%Do while not servicos.eof%>
                                                <option value="<%= servicos("Cod_Servico")%>"><%= servicos("Descricao")%></option>
                                                <%servicos.movenext
                                                Loop%>
                                            </select>
                                        </div>
                                     </div>
                                    
                                    <div class="form-group">
                                        <div class="col-lg-8 col-lg-offset-9">
                                            <button type="submit" name="sub_submit" id="sub_submit" class="btn btn-palegreen">Incluir</button>
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
    <script src="assets/js/inputmask/jasny-bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {

            $('#form_Horario').bootstrapValidator();
        });
    </script>



</body>
</html>
