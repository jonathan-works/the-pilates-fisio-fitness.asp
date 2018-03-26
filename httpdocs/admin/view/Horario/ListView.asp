
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<script src="<%= URL_ADMIN&"/js/deleteConfirm.js"%>"></script>
<div id="delete-confirm"></div>
<link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />
<%
Dim link_delete
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
                <div class="col-xs-12 ">
                    <div class="well with-header  with-footer">
                        <div class="header bg-blue">
                            Hor&aacute;rios
                        </div>
                        <table class="table table-striped table-hover table-bordered" id="tabela">
                            <thead class="bordered-darkorange">
                                <tr>
                                    <th>
                                        Dia Semana
                                    </th>
                                    <th>
                                        Hor&aacute;rio Inicial
                                    </th>
                                    <th>
                                        Hor&aacute;rio Final
                                    </th>
                                    <th>
                                        Pr&eacute;dio
                                    </th>
                                    <th>
                                        Servi&ccedil;o
                                    </th>
                                    <th>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <%Do while not horarios.eof%>
                                <%set predios = getPredios(horarios("Cod_Predio"),"")%>
								<%set servicos = getServicos(horarios("Cod_Servico"))%>
                                <%link_delete = "init.asp?c="&request.QueryString("c")&"&a=delete&id="&horarios("Dia_Semana")&"/"&horarios("Horario_Inicial")&"/"&horarios("Horario_Final")&"/"&horarios("Cod_Predio")&"/"&horarios("Cod_Servico")%>
                                <tr>
                                    <td>
                                        <%= weekDayFromID(horarios("Dia_Semana"))%>
                                    </td>
                                    <td>
                                        <%= horarios("Horario_Inicial")%>
                                    </td>
                                    <td>
                                        <%= horarios("Horario_Final")%>
                                    </td>
                                    <td>
                                        <%= predios("Nome_predio")%>
                                    </td>
                                    <td>
                                    	<%= servicos("Descricao")%>
                                    </td>
                                    <td>
                                        <a href="javascript:confirmBox('<%=(link_delete)%>');" class="btn btn-default btn-xs red"><i class="fa fa-trash-o"></i> Delete</a>
                                    </td>
                                </tr>
                                <%horarios.movenext
                                Loop%>
                                
                            </tbody>
                        </table>
                
                        
                    </div>
                </div>

            </div>
        </div>
</div>




<%
'Adiciona mensagem de erro ou sucesso
if not isEmpty(add_msg) Then

	Response.Write(add_msg)

end if
%>

<%Do while not horarios.eof%>
<%set predios = getPredios(horarios("Cod_Predio"), "")%>
<%set servicos = getServicos(horarios("Cod_Servico"))%>

<div>
<%= weekDayFromID(horarios("Dia_Semana"))%> - <%= horarios("Horario_Inicial")&" at&eacute; "&horarios("Horario_Final")%> - <%= predios("Nome_predio")%> - <%= servicos("Descricao")%>
</div>
<%horarios.movenext
Loop%>

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

