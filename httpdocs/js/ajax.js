// a funcao abaixo funciona em qualquer
 // browser ou versão.  
 function createXMLHTTP() 
 {
  var ajax;
  

	if (window.XMLHttpRequest)
		ajax = new XMLHttpRequest();
	else if (window.ActiveXObject)
		ajax = new ActiveXObject("Microsoft.XMLHTTP");
	else 
		alert('AJAX não suportado. Atualize a versão deste browser');
	
	return ajax;
  
}
