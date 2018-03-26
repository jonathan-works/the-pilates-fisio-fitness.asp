<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="<%= URL_ADMIN&"/js/deleteConfirm.js"%>"></script>

<!--Page Related styles-->
    <link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />

<div id="delete-confirm"></div>
<%
Dim link_edit, link_delete
Response.Buffer = true
Dim qtde_flush, contador_flush
contador_flush = 0
qtde_flush = 1000
%>
<div class="page-content"> 
  <!-- Page Breadcrumb -->
  <div class="page-breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="fa fa-home"></i>
                            <a href="#">Home</a>
                        </li>
                        <li>
                            <a href="#">Tables</a>
                        </li>
                        <li class="active">Data Tables</li>
                    </ul>
                </div>
  <!-- /Page Breadcrumb --> 
  <!-- Page Header -->
  <div class="page-header position-relative">
                    <div class="header-title">
                        <h1>
                            Ve&iacute;culos Admin
                            <small>
                                <i class="fa fa-angle-right"></i>
                                Listagem Ve&iacute;culos
                            </small>
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
                        <div class="col-xs-12 col-md-12">
                            <div class="widget">
                                <div class="widget-header ">
                                    <span class="widget-caption">Listagem Ve&iacute;culos</span>
                                    <div class="widget-buttons">
                                        <a href="#" data-toggle="maximize">
                                            <i class="fa fa-expand"></i>
                                        </a>
                                        <a href="#" data-toggle="collapse">
                                            <i class="fa fa-minus"></i>
                                        </a>
                                        <a href="#" data-toggle="dispose">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                
                                
                                <div class="widget-body">
                                    <div class="table-toolbar">
                                        <a id="simpledatatable_new" href="javascript:void(0);" class="btn btn-default">
                                            Adicionar Novo Usu&aacute;rio
                                        </a>
                                    </div>
                                    
                                    <table class="table table-striped table-hover table-bordered" id="tabela">
                                        <thead role="row">
                                            <tr>
                                                <th> # </th>
                                                <th> Marca </th>
                                                <th> Modelo </th>
                                                <th></th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                        
										<%Do while not Veiculos.eof%>
                                        
                                        <%set marcas = getMarcas(Veiculos("Cod_Marca"))%>
                                        <%link_edit = "init.asp?c="&request.QueryString("c")&"&a=edit&id="&Veiculos("Cod_Veiculo")%>
                                        <%link_delete = "init.asp?c="&request.QueryString("c")&"&a=delete&id="&Veiculos("Cod_Veiculo")%>
                                        <tr>
                                          <td><%= Veiculos("Cod_Veiculo")%></td>
                                          <td><%= marcas("Descricao")%></td>
                                          <td><%= Veiculos("Modelo")%></td>
                                          <td>
                                          	<a href="<%=(link_edit)%>" class="btn btn-default btn-xs blue"><i class="fa fa-edit"></i> Edit</a>
                                            <a href="javascript:confirmBox('<%=(link_delete)%>');" class="btn btn-default btn-xs red"><i class="fa fa-trash-o"></i> Delete</a></td>
                                          
                                        </tr>
                                        <%
										if contador_flush mod qtde_flush = 0 then
											Response.Flush()
										end if
										
										
										contador_flush = contador_flush + 1
										Veiculos.movenext
                                        Loop
										%>
                                        
                                      </tbody>
                                </div>
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

