<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="<%= URL_ADMIN&"/js/deleteConfirm.js"%>"></script>
<div id="delete-confirm"></div>

<link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />
<div class="page-content">
        <!-- Page Breadcrumb -->
        <div class="page-breadcrumbs">
            <ul class="breadcrumb">
                <li>
                    <i class="fa fa-home"></i>
                    <a href="#">Home</a>
                </li>
                <li class="active">Servi&ccedil;os Admin</li>
            </ul>
        </div>
        <!-- /Page Breadcrumb -->
        <!-- Page Header -->
        <div class="page-header position-relative">
            <div class="header-title">
                <h1>
                    Servi&ccedil;os Admin
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
                <div class="col-xs-12 ">
                    <div class="well with-header  with-footer">
                        <div class="header bg-blue">
                            Listagem
                        </div>
                        <table class="table table-hover" id="tabela">
                            <thead class="bordered-darkorange">
                                <tr>
                                	<th>
                                        #
                                    </th>
                                    <th>
                                        Servico
                                    </th>
                                    <th>
                                        Tam. Ve&iacute;culo
                                    </th>
                                    <th>
                                        Valor
                                    </th>
                                    <th>
                                        Dura&ccedil;&atilde;o
                                    </th>
                                    <th>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%Do while not servicos.eof%>
                                
                                	<%link_edit = "init.asp?c="&request.QueryString("c")&"&a=edit&id="&servicos("Cod_Servico")
									
                                    link_delete = "init.asp?c="&request.QueryString("c")&"&a=delete&id="&servicos("Cod_Servico")&"/"&servicos("Cod_TamanhoVeiculo")
                                	
									set TamanhoVeiculos = getTamanhoVeiculos(servicos("cod_tamanhoVeiculo"))
									if not isNull(servicos("Cod_TamanhoVeiculo")) Then
										
										link_editValores = "init.asp?c="&request.QueryString("c")&"Tamanho&a=edit&id="&servicos("Cod_Servico")&"/"&servicos("Cod_TamanhoVeiculo")
									end if		
                                    %>
                                    <tr>
                                        <td>
                                            <%= servicos("Cod_Servico")%>
                                        </td>
                                        <td>
                                            <%= servicos("Descricao")%>
                                        </td>
                                        <td>
                                            <%if not isNull(servicos("Cod_TamanhoVeiculo")) Then Response.Write(TamanhoVeiculos("Descricao")) Else Response.Write("-")%>
                                        </td>
                                        <td>
                                            <%if not isNull(servicos("Cod_TamanhoVeiculo")) Then Response.Write(formatcurrency(servicos("Valor"))) Else Response.Write("-")%>
                                        </td>
                                        <td>
                                        	
                                            <%if not isNull(servicos("Cod_TamanhoVeiculo")) Then Response.Write(servicos("Duracao") min) Else Response.Write("-")%>
                                        </td>
                                        <td>
                                            <a href="<%=(link_edit)%>" class="btn btn-default btn-xs blue"><i class="fa fa-edit"></i> Edit</a>
                                            <%if not isNull(servicos("Cod_TamanhoVeiculo")) Then%>
                                            <a href="<%=(link_editValores)%>" class="btn btn-default btn-xs blue"><i class="fa fa-edit"></i> Edit Valores</a>
                                            <%end if%>
                                            <a href="javascript:confirmBox('<%=(link_delete)%>');" class="btn btn-default btn-xs red"><i class="fa fa-trash-o"></i> Delete</a>
                                        </td>
                                    </tr>
                                <%servicos.movenext
                                Loop%>
                                
                            </tbody>
                        </table>
                
                        
                    </div>
                </div>

            </div>
        </div>
</div>

<!--Page Related Scripts--> 
<script src="assets/js/datatable/jquery.dataTables.min.js"></script> 
<script src="assets/js/datatable/ZeroClipboard.js"></script> 
<script src="assets/js/datatable/dataTables.tableTools.min.js"></script> 
<script src="assets/js/datatable/dataTables.bootstrap.min.js"></script> 
<script src="assets/js/datatable/datatables-init.js"></script> 
<script>
	$(document).ready(function () {	
		iniciarTabela.iniciar(); 
	});
</script> 







