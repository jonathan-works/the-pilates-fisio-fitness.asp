<!DOCTYPE html>
<html>
<body>
<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
<script language="javascript">

if (confirm("tem certeza?"))
{
alert("Sim");	
}
else
{
alert("Nao");
}
$(function() {
    /* caixa-confirmacao representa a id onde o caixa de confirmação deve ser criada no html */
    $( "#caixa-confirmacao" ).dialog({
      resizable: false,
      height:140,

      /* 
       * Modal desativa os demais itens da tela, impossibilitando interação com eles,
       * forçando usuário a responder à pergunta da caixa de confirmação
       */ 
      modal: true,

      /* Os botões que você quer criar */
      buttons: {
        "Sim": function() {
          $( this ).dialog( "close" );
          alert("Você clicou em Sim!");
        },
        "Não": function() {
          $( this ).dialog( "close" );
          alert("Você clicou em Não");
        }
      }
    });
  });
</script>
<div id="caixa-confirmacao" title="Quer testar isso?">
  <p>Uma mensagem qualquer para ilustrar.</p>
</div>


<input type="hidden" name="retorno_compra" id="retorno_compra" value="" />
</body>
</html>