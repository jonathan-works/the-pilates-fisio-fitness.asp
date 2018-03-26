<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="<%= URL_ADMIN&"/js/deleteConfirm.js"%>"></script>
<div id="delete-confirm"></div>

<!--Page Related styles-->
    <link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />
<%
Dim link_edit
%>
<div class="page-content"> 
	<!-- Page Breadcrumb -->
    <div class="page-breadcrumbs">
        <ul class="breadcrumb">
            <li>
                <i class="fa fa-home"></i>
                <a href="#">Home</a>
            </li>
            <li class="active">Usu&aacute;rios</li>
        </ul>
    </div>
    <!-- /Page Breadcrumb -->
    <!-- Page Header -->
    <div class="page-header position-relative">
        <div class="header-title">
            <h1>
                Usu&aacute;rios
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
                		Usu&aacute;rios
	                </div>
                    <table class="table table-striped table-hover table-bordered" id="tabela">
                        <thead class="bordered-darkorange">
                            <tr>
                                <th> # </th>
                                <th> Nome Usu&aacute;rio </th>
                                <th> Tipo Usu&aacute;rio </th>
                                <th>
                                </th>
                            </tr>
                        </thead>
    
                        <tbody>
                        <%Do while not Usuarios.eof%>
                        <%link_edit = "init.asp?c="&request.QueryString("c")&"&a=edit&id="&Usuarios("Cod_Usuario")%>
                        <%link_delete = "init.asp?c="&request.QueryString("c")&"&a=delete&id="&Usuarios("Cod_Usuario")%>
                        <tr>
                          <td><%= Usuarios("Cod_Usuario")%></td>
                          <td><%= Usuarios("Nome_Usuario")%></td>
                          <td><%= tipoUsuarioFromID(Usuarios("Tipo_Usuario"))%></td>
                          <td>
                            <a href="<%=(link_edit)%>" class="btn btn-default btn-xs blue"><i class="fa fa-edit"></i> Edit</a> 
                            <a href="javascript:confirmBox('<%=(link_delete)%>');" class="btn btn-default btn-xs red"><i class="fa fa-trash-o"></i> Delete</a>
                            </td>
                        </tr>
                        <%Usuarios.movenext
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
