<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<link href="assets/css/dataTables.bootstrap.css" rel="stylesheet" />
<div class="page-content">
  <!-- Page Breadcrumb -->
  <div class="page-breadcrumbs">
    <ul class="breadcrumb">
      <li><i class="fa fa-home"></i><a href="#">Home</a></li>
      <li class="active">Cadastro Usu&aacute;rio</li>
    </ul>
  </div>
  <!-- /Page Breadcrumb -->
  <!-- Page Header -->
  <div class="page-header position-relative">
    <div class="header-title">
      <h1>Cadastro Usu&aacute;rio</h1>
    </div>
    <!--Header Buttons-->
    <div class="header-buttons"><a class="sidebar-toggler" href="#"><i class="fa fa-arrows-h"></i></a><a class="refresh" id="refresh-toggler" href=""><i class="glyphicon glyphicon-refresh"></i></a><a class="fullscreen" id="fullscreen-toggler" href="#"><i class="glyphicon glyphicon-fullscreen"></i></a></div>
    <!--Header Buttons End-->
  </div>
  <!-- /Page Header -->
  <!-- Page Body -->
  <div class="page-body">
    <div class="row">
      <div class="col-xs-12 ">
        <div class="well with-header  with-footer">
          <div class="header bg-blue">Listagem</div>
          <table class="table table-striped table-hover table-bordered" id="tabela">
				<thead class="bordered-darkorange">
				  <tr>
					<th>#</th>
					<th>Nome</th>
					<th>E-mail</th>
					<th>Telefone</th>
					<th>Endereco</th>
				  </tr>
				</thead>
            <tbody>
              <%Do while not CadastroUsuarios.eof%>
              <%link_edit = "init.asp?c="&request.QueryString("c")&"&a=edit&id="&CadastroUsuarios("Cod_CadastroUsuario")%>
              <tr>
                <td><%= CadastroUsuarios("Cod_CadastroUsuario")%></td>
                <td><%= CadastroUsuarios("Nome")& " " & CadastroUsuarios("Sobrenome")%></td>
                <td><%= CadastroUsuarios("Email")%></td>
                <td><%= CadastroUsuarios("Telefone")%></td>
                <td><%= CadastroUsuarios("Endereco")%></td>
              </tr>
              <%CadastroUsuarios.movenext
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