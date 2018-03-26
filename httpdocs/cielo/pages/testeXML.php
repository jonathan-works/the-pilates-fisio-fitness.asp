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
    /* caixa-confirmacao representa a id onde o caixa de confirma��o deve ser criada no html */
    $( "#caixa-confirmacao" ).dialog({
      resizable: false,
      height:140,

      /* 
       * Modal desativa os demais itens da tela, impossibilitando intera��o com eles,
       * for�ando usu�rio a responder � pergunta da caixa de confirma��o
       */ 
      modal: true,

      /* Os bot�es que voc� quer criar */
      buttons: {
        "Sim": function() {
          $( this ).dialog( "close" );
          alert("Voc� clicou em Sim!");
        },
        "N�o": function() {
          $( this ).dialog( "close" );
          alert("Voc� clicou em N�o");
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