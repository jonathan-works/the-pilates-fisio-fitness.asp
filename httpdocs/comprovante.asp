<!--#include file = "admin/conexao.asp"-->

 <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/neat-blue.css" media="screen" id="neat-stylesheet">

    <link rel="stylesheet" href="http://blueimp.github.io/Gallery/css/blueimp-gallery.min.css">
    <link rel="stylesheet" href="libs/Bootstrap-Image-Gallery-3.1.1/css/bootstrap-image-gallery.min.css">

    <!-- Use google font -->
    <link href="http://fonts.googleapis.com/css?family=Lato:100,300,400,700,300italic,400italic,700italic|Lustria" rel="stylesheet" type="text/css" />
<%
Conecta()
		Dim id
		id = request.QueryString("id")
		
		Dim sql_pagamento, rs_pagamento
		id = replace(id,";","")
		id = replace(id,"insert","")
		id = replace(id,"update","")
		id = replace(id,"delete","")
		id = replace(id,"'","")
		id = replace(id,",","")
				
		sql_pagamento="select cod_inscricao,nome,email, endereco, estado, cidade, cep,bairro, TipodePagamento from inscricao where Cod_Inscricao = " & id
		set rs_pagamento=cn.execute(sql_pagamento)
		
		
	%>

    <!-- Component: login-registration/registration-alt1.html - START -->
    <section class="">
      <div class="container">
        <h1><span></span></h1>
        <div class="row">
          <div  class="col-sm-12 col-md-offset-3 col-md-6">
            <div class="thumbnail info-thumbnail background-lead color-text">
              <div class="special background-lead color-white">
              <h3><span class="fa fa-user"></span> Comprovante de Pagamento</h3></div>
              <div  class="caption bordered background-white">
                
                <%
				
				 Dim sql_comprovante, rs_comprovante
				 sql_comprovante = "SELECT * FROM Transacao_Cielo WHERE Cod_Inscricao = "&id
			    set rs_comprovante = cn.execute(sql_comprovante)
				
				
				'Pagamentos Feitos por Cartão
				
				%>


<script>
window.print() ;
</script>

<div>
    <br>
    <br>
    Código da Inscrição: <%=rs_comprovante("Cod_Inscricao")%><br>
    <br>
    Nome: <%=rs_pagamento("Nome")%><br>
    <br>
    ID da Transação(TID): <%=rs_comprovante("TID")%><br>
    <br>
    <%
    Dim valor_tratado
    valor_tratado = Left(rs_comprovante("valor"),len(rs_comprovante("valor"))-2)&","&Right(rs_comprovante("valor"),2)
    valor_tratado = formatcurrency(valor_tratado)
    %>
    Valor: <%=valor_tratado%>
    <br>
    <br>
   <!-- <a class="btn btn-primary" href="javascript:window.print();">Imprimir</a>-->
</div>

</div></div></div></div></div></section>