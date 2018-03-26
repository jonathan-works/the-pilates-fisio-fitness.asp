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
                <div class="col-xs-12 ">
                    <div class="well with-header  with-footer">
                        <div class="header bg-blue">
                            Listagem
                        </div>
                        <table class="table table-striped table-hover table-bordered" id="tabela">
                            <thead class="bordered-darkorange">
                                <tr role="row">
                                    <th>#</th>
                                    <th>
                                        Nome Pr&eacute;dio
                                    </th>
                                    <th>
                                        Endere&ccedil;o
                                    </th>
                                    <th>
                                    	Bairro
                                    </th>
                                    <th>
                                        Condom&iacute;nio
                                    </th>
                                    <th>
                                        Nome Condom&iacute;nio
                                    </th>
                                    <th>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%Do while not Predios.eof%>
                                <%link_edit = "init.asp?c="&request.QueryString("c")&"&a=edit&id="&Predios("Cod_Predio")%>
                                <%link_delete = "init.asp?c="&request.QueryString("c")&"&a=delete&id="&Predios("Cod_Predio")%>
                                <tr>
                                    <td>
                                        <%= Predios("Cod_Predio")%>
                                    </td>
                                    <td>
                                        <%= Predios("Nome_Predio")%>
                                    </td>
                                    <td>
                                        <%= Predios("Endereco")%>
                                    </td>
                                    <td>
                                    	<%= Predios("Bairro") %>
                                    </td>
                                    <td>
                                        <%= condominioFromID(Predios("Condominio"))%>
                                    </td>
                                    <td>
                                        <%= Predios("Nome_Condominio")%>
                                    </td>
                                    <td>
                                    	<a href="<%=(link_edit)%>" class="btn btn-default btn-xs blue"><i class="fa fa-edit"></i> Edit</a>
                                        <a href="javascript:confirmBox('<%=(link_delete)%>');" class="btn btn-default btn-xs red"><i class="fa fa-trash-o"></i> Delete</a>
                                    </td>
                                </tr>
                                <%Predios.movenext
                                Loop%>
                                
                            </tbody>
                        </table>                                        
                    </div>
                </div>

            </div>
        </div>
</div>


<%
Dim link_edit

'Adiciona mensagem de erro ou sucesso
if not isEmpty(msg_retorno) Then

	Response.Write(msg_retorno)

end if
%>

<%Do while not predios.eof%>
<%link_edit = "init.asp?c="&request.QueryString("c")&"&a=edit&id="&predios("Cod_Predio")%>
<div>
<a href="<%=(link_edit)%>"><%= predios("Cod_Predio")&" - "&predios("Nome_predio") %></a>
</div>
<%predios.movenext
Loop%>

<script src="assets/js/datatable/jquery.dataTables.min.js"></script> 
<script src="assets/js/datatable/ZeroClipboard.js"></script> 
<script src="assets/js/datatable/dataTables.tableTools.min.js"></script> 
<script src="assets/js/datatable/dataTables.bootstrap.min.js"></script> 
<script src="assets/js/datatable/datatables-init.js"></script> 
<script>        
	$(document).ready(function () {
		iniciarTabela.iniciar(); 
		//initiateTestDataTable.init(); 
	});
</script> 



