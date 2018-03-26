
<footer class="background-midnight-blue color-white">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <h3>Menu</h3>
            <ul class="nav-footer">
              <li class="active"><a href="default.asp">Home</a></li>
              <li><a href="quem-somos.asp">Quem Somos</a></li>
              <li><a href="estudio-de-pilates.asp">Estúdio</a></li>
              <li><a href="aparelhos-de-pilates.asp">Aparelhos</a></li>
              <li><a href="precos.asp">Preços</a></li>
              <li><a href="galeria-fotos-de-pilates.asp">Galeria</a></li>
              <li><a href="contato.asp">Contato</a></li>
            </ul>
          </div>
          <div class="col-md-4">
            <h3>Facebook</h3>
            <p class="testimonial">
            
            <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.5&appId=129261323829889";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
            
              <div class="fb-page" data-href="https://www.facebook.com/The-Pilates-Fisio-Fitness-466204420244314" data-tabs="timeline" data-width="340" data-height="220" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"></div>
            </p>
          </div>
          <div class="col-md-5">
            <h3>Entre em contato</h3>
            <form onSubmit="return checa ('form_contatoHome')" method="post" class="form-horizontal" role="form" name="form_contatoHome" id="form_contatoHome"  action="addCadastroRapido.asp">
            <input type="hidden" name="nome_form" id="nome_form" value="form_contatoHome" />
              <div class="form-group">
                <label for="inputName1" class="col-lg-3 control-label">Nome</label>
                <div class="col-lg-9">
                  <input name="txt1_Nome" type="text" class="form-control input-lg" id="txt1_nome" placeholder="Nome">
                </div>
              </div>
              <div class="form-group">
                <label for="inputEmail1" class="col-lg-3 control-label">Email</label>
                <div class="col-lg-9">
                  <input name="txt1_Email" type="email" class="form-control input-lg" id="txt1_email" placeholder="E-mail">
                </div>
              </div>
             <div class="form-group">
                <label for="inputEmail1" class="col-lg-3 control-label">Telefone</label>
                <div class="col-lg-9">
                  <input name="txt1_Celular" type="tel" class="form-control input-lg" id="txt1_Celular" placeholder="DDD+Telefone" maxlength="15">
                </div>
              </div>
              <div class="form-group">
                <label for="inputContent1" class="col-lg-3 control-label">Comentários</label>
                <div class="col-lg-9">
                  <textarea name="txt1_Mensagem" rows="3" class="form-control" id="txt1_mensagem"></textarea>
                </div>
              </div>
              <div class="form-group">
                <div class="col-lg-offset-3 col-lg-9">
                  <button name="sub_submit" type="submit" class="btn btn-lead btn-lg">Enviar</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <hr>
            <div class="row">
              <div class="col-md-6"> Copyright  2015 </div>
              <div class="col-md-6">
                <p class="social"> <a href="https://www.facebook.com/EstudioPilatesFisioFitness?fref=ts"><span class="fa fa-facebook"></span></a>
                  <!--<a href="/"><span class="fa fa-twitter"></span></a> <a href="/"><span class="fa fa-youtube"></span></a> <a href="/"><span class="fa fa-linkedin"></span></a> <a href="/"><span class="fa fa-pinterest"></span></a> -->
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <script type="text/javascript">
	/* Máscaras ER */
	function mascara(o,f){
		v_obj=o
		v_fun=f
		setTimeout("execmascara()",1)
	}
	function execmascara(){
		v_obj.value=v_fun(v_obj.value)
	}
	function mtel(v){
		v=v.replace(/\D/g,"");             //Remove tudo o que não é dígito
		v=v.replace(/^(\d{2})(\d)/g,"($1) $2"); //Coloca parênteses em volta dos dois primeiros dígitos
		v=v.replace(/(\d)(\d{4})$/,"$1-$2");    //Coloca hífen entre o quarto e o quinto dígitos
		return v;
	}
	function id( el ){
		return document.getElementById( el );
	}
	window.onload = function(){
		id('txt1_Celular').onkeypress = function(){
			mascara( this, mtel );
		}
	}
	</script>
    <script>
    function checa (TheForm){
	var nFocus, i, j
	var radioSelected 
	var fieldname 
	var msg
	
	TheForm= eval(TheForm);
	j=0;
	for (i = 0 ;i < TheForm.elements.length;  i++){
	//	alert(TheForm.elements[i].name + " = " + TheForm.elements[i].type);
			fieldname = TheForm.elements[i].name ;
			if (fieldname.substring(0,5) == "txt1_"){
				if (TheForm.elements[i].value==""){
					msg="Por favor, preenha o campo " + fieldname.substring(5,20);
					alert( msg );
					TheForm.elements[i].focus();
					j++;
					i=TheForm.elements.length;
					return false
				}
			}
	}
	if(TheForm.txt1_TipoDePagamento.value == "Forma de Pagamento")
	{
		alert("Por favor selecione uma forma de pagamento.");	
		return false
	}
	if (TheForm.txt1_Email.value != TheForm.txt_confEmail.value){
		alert("Favor informar o confirmar e-mail corretamente !!!");
		return false	
	}
	if ((TheForm.txt1_Email.value.indexOf('@', 0) == -1 || 
		TheForm.txt1_Email.value.value.indexOf('.', 0) == -1)) { 
		alert("Por favor preencha o campo de E-mail corretamente!"); 
		return false;
	} 
	if (j==0){
		document.form1.submit();		
	}

}
    </script>
<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-53BVM3"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-53BVM3');</script>
<!-- End Google Tag Manager -->



<!-- livezilla.net code (PLEASE PLACE IN BODY TAG) -->
<div id="livezilla_tracking" style="display:none"></div><script type="text/javascript">
var script = document.createElement("script");script.async=true;script.type="text/javascript";var src = "https://thepilatesfisiofitness.com.br/livezilla/server.php?a=7f1d5&rqst=track&output=jcrpt&el=cHQtYnI_&ovlc=IzczYmUyOA__&eca=MQ__&ecsp=MQ__&nse="+Math.random();setTimeout("script.src=src;document.getElementById('livezilla_tracking').appendChild(script)",1);</script><noscript><img src="http://thepilatesfisiofitness.com.br/livezilla/server.php?a=7f1d5&amp;rqst=track&amp;output=nojcrpt" width="0" height="0" style="visibility:hidden;" alt=""></noscript>
<!-- http://www.livezilla.net -->

<!-- Facebook Pixel Code -->
<script>
!function(f,b,e,v,n,t,s){if(f.fbq)return;n=f.fbq=function(){n.callMethod?
n.callMethod.apply(n,arguments):n.queue.push(arguments)};if(!f._fbq)f._fbq=n;
n.push=n;n.loaded=!0;n.version='2.0';n.queue=[];t=b.createElement(e);t.async=!0;
t.src=v;s=b.getElementsByTagName(e)[0];s.parentNode.insertBefore(t,s)}(window,
document,'script','https://connect.facebook.net/en_US/fbevents.js');

fbq('init', '1014232115331276');
fbq('track', "PageView");</script>
<noscript><img height="1" width="1" style="display:none"
src="https://www.facebook.com/tr?id=1014232115331276&ev=PageView&noscript=1"
/></noscript>
<!-- End Facebook Pixel Code -->
