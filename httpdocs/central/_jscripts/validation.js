function validarCPF(cpf){
	var filtro = /^\d{3}.\d{3}.\d{3}-\d{2}$/i;
	
	if(!filtro.test(cpf))
	{
		return false;
	}
   
	cpf = remove(cpf, ".");
	cpf = remove(cpf, "-");
	
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
 
function remove(str, sub) {
	i = str.indexOf(sub);
	r = "";
	if (i == -1) return str;
	{
		r += str.substring(0,i) + remove(str.substring(i + sub.length), sub);
	}
	return r;
}

/**
   * MASCARA ( mascara(o,f) e execmascara() ) CRIADAS POR ELCIO LUIZ
   * elcio.com.br
   */
function mascara(o,f){
	v_obj=o
	v_fun=f
	setTimeout("execmascara()",1)
}

function execmascara(){
	v_obj.value=v_fun(v_obj.value)
}

function cpf_mask(v){
	v=v.replace(/\D/g,"")                 //Remove tudo o que não é dígito
	v=v.replace(/(\d{3})(\d)/,"$1.$2")    //Coloca ponto entre o terceiro e o quarto dígitos
	v=v.replace(/(\d{3})(\d)/,"$1.$2")    //Coloca ponto entre o setimo e o oitava dígitos
	v=v.replace(/(\d{3})(\d)/,"$1-$2")   //Coloca ponto entre o decimoprimeiro e o decimosegundo dígitos
	return v
}

function IsEmail(email)
{
	var txt = email;
	if ((txt.length != 0) && ((txt.indexOf("@") < 1)))
	{
		return false;
	}else{
		return true;
	}
}

function checkCard(num){
	var msg = Array();
	var tipo = null;
	var num = num.replace(" ", "");
	var num = num.replace(" ", "");
	var num = num.replace(" ", "");

	if(num.length > 15 || num[0]==0){
		return false;
	}else {
		var total = 0;
		var arr = Array();
		for(i = 0;i < num.length;i++){
			if(i % 2 == 0){
				dig = num[i] * 2;	
				if(dig > 9){
					dig1 = dig.toString().substr(0,1);
					dig2 = dig.toString().substr(1,1);
					arr[i] = parseInt(dig1)+parseInt(dig2);
				} else {
					arr[i] = parseInt(dig);
				}		
				total += parseInt(arr[i]);
			} else {
				arr[i] = parseInt(num[i]);
				total += parseInt(arr[i]);
			} 
		}
	}
	if(msg.length > 0){	
		return false;
	}else{
		if(total % 10 == 0){
			return true;
		}else{
			return false;
		}
	}
}

function check_form(){
	var nome = document.getElementById('name').value;
	var email = document.getElementById('email').value;
	var cpf = document.getElementById('cpf').value;
	var dia_nascimento = document.getElementById('dia_nascimento').value;
	var mes_nascimento = document.getElementById('mes_nascimento').value;
	var ano_nascimento = document.getElementById('ano_nascimento').value;
	var checkCPF = validarCPF(cpf);
	var checkMail 	= IsEmail(email);

	document.getElementById('name').style.borderBottom = '1px solid #1796d4';
	document.getElementById('email').style.borderBottom = '1px solid #1796d4';
	document.getElementById('cpf').style.borderBottom = '1px solid #1796d4';
	document.getElementById('dia_nascimento').style.border = '1px solid #1796d4';
	document.getElementById('mes_nascimento').style.border = '1px solid #1796d4';
	document.getElementById('ano_nascimento').style.border = '1px solid #1796d4';

	document.getElementById('nome_card').style.borderBottom = '1px solid #1796d4';
	document.getElementById('num_card').style.borderBottom = '1px solid #1796d4';
	document.getElementById('cvv').style.borderBottom = '1px solid #1796d4';
	document.getElementById('mes_card').style.border = '1px solid #1796d4';
	document.getElementById('ano_card').style.border = '1px solid #1796d4';

	document.getElementById('erName').style.display = 'none';
	document.getElementById('erMail').style.display = 'none';
	document.getElementById('erCpf').style.display = 'none';
	document.getElementById('erNascimento').style.display = 'none';

	document.getElementById('erNameCard').style.display = 'none';
	document.getElementById('erNumCard').style.display = 'none';
	document.getElementById('erCvv').style.display = 'none';
	document.getElementById('erValCard').style.display = 'none';

	if(nome == ''){
		document.getElementById('erName').innerText = "";
		document.getElementById('name').style.borderBottom = '1px solid red';

		document.getElementById('erName').innerText = "Informe seu nome corretamente!";
		document.getElementById('erName').style.display = 'block';
		document.getElementById('name').focus();
		return false;
	}
	if(nome.length < 8){
		document.getElementById('erName').innerText = "";
		document.getElementById('name').style.borderBottom = '1px solid red';

		document.getElementById('erName').innerText = "O nome informado não é válido!";
		document.getElementById('erName').style.display = 'block';
		document.getElementById('name').focus();
		return false;
	}

	if(email == ''){
		document.getElementById('erMail').innerText = "";
		document.getElementById('email').style.borderBottom = '1px solid red';

		document.getElementById('erMail').innerText = "Informe seu e-mail corretamente!";
		document.getElementById('erMail').style.display = 'block';
		document.getElementById('email').focus();
		return false;
	}
	if(!checkMail){
		document.getElementById('erMail').innerText = "";
		document.getElementById('email').style.borderBottom = '1px solid red';

		document.getElementById('erMail').innerText = "O e-mail informado não é válido!";
		document.getElementById('erMail').style.display = 'block';
		document.getElementById('email').focus();
		return false;
	}
	if(email.length < 8){
		document.getElementById('erMail').innerText = "";
		document.getElementById('email').style.borderBottom = '1px solid red';

		document.getElementById('erMail').innerText = "O e-mail informado não é válido!";
		document.getElementById('erMail').style.display = 'block';
		document.getElementById('email').focus();
		return false;
	}

	if(cpf == ''){
		document.getElementById('erCpf').innerText = "";
		document.getElementById('cpf').style.borderBottom = '1px solid red';

		document.getElementById('erCpf').innerText = "Preenchimento do CPF é obrigatório!";
		document.getElementById('erCpf').style.display = 'block';
		document.getElementById('cpf').focus();
		return false;
	}
	if(!checkCPF){
		document.getElementById('erCpf').innerText = "";
		document.getElementById('cpf').style.borderBottom = '1px solid red';

		document.getElementById('erCpf').innerText = "CPF informado não é válido!";
		document.getElementById('erCpf').style.display = 'block';
		document.getElementById('cpf').focus();
		return false;
	}
	if(email.length < 11){
		document.getElementById('erCpf').innerText = "";
		document.getElementById('cpf').style.borderBottom = '1px solid red';

		document.getElementById('erCpf').innerText = "O e-mail informado não é válido!";
		document.getElementById('erCpf').style.display = 'block';
		document.getElementById('cpf').focus();
		return false;
	}
	if(dia_nascimento == 'DIA'){
		document.getElementById('erNascimento').innerText = "";
		document.getElementById('dia_nascimento').style.border = '1px solid red';

		document.getElementById('erNascimento').innerText = "Informe sua data de nascimento corretamente!";
		document.getElementById('erNascimento').style.display = 'block';
		return false;
	}
	if(mes_nascimento == 'MES'){
		document.getElementById('erNascimento').innerText = "";
		document.getElementById('mes_nascimento').style.border = '1px solid red';

		document.getElementById('erNascimento').innerText = "Informe sua data de nascimento corretamente!";
		document.getElementById('erNascimento').style.display = 'block';
		return false;
	}
	if(ano_nascimento == 'ANO'){
		document.getElementById('erNascimento').innerText = "";
		document.getElementById('ano_nascimento').style.border = '1px solid red';

		document.getElementById('erNascimento').innerText = "Informe sua data de nascimento corretamente!";
		document.getElementById('erNascimento').style.display = 'block';
		return false;
	}

	var nome_card = document.getElementById('nome_card').value;
	var num_card = document.getElementById('num_card').value;
	var cvv = document.getElementById('cvv').value;
	var mes_card = document.getElementById('mes_card').value;
	var ano_card = document.getElementById('ano_card').value;

	if(nome_card == ''){
		document.getElementById('erNameCard').innerText = "";
		document.getElementById('nome_card').style.borderBottom = '1px solid red';

		document.getElementById('erNameCard').innerText = "O nome do cartão não está correto!";
		document.getElementById('erNameCard').style.display = 'block';
		return false;
	}
	if(nome_card.length < 8){
		document.getElementById('erNameCard').innerText = "";
		document.getElementById('nome_card').style.borderBottom = '1px solid red';

		document.getElementById('erNameCard').innerText = "Informe o nome do cartão corretamente!";
		document.getElementById('erNameCard').style.display = 'block';
		return false;
	}

	if(num_card == ''){
		document.getElementById('erNumCard').innerText = "";
		document.getElementById('num_card').style.borderBottom = '1px solid red';

		document.getElementById('erNumCard').innerText = "Informe os 16 dígitos do número do cartão";
		document.getElementById('erNumCard').style.display = 'block';
		return false;
	}
	if(num_card.length < 15){
		document.getElementById('erNumCard').innerText = "";
		document.getElementById('num_card').style.borderBottom = '1px solid red';

		document.getElementById('erNumCard').innerText = "Informe o número do cartão corretamente!";
		document.getElementById('erNumCard').style.display = 'block';
		return false;
	}

	if(cvv == ''){
		document.getElementById('erCvv').innerText = "";
		document.getElementById('cvv').style.borderBottom = '1px solid red';

		document.getElementById('erCvv').innerText = "Necessário informar o código de segurança!";
		document.getElementById('erCvv').style.display = 'block';
		return false;
	}
	if(cvv.length < 4){
		document.getElementById('erCvv').innerText = "";
		document.getElementById('cvv').style.borderBottom = '1px solid red';

		document.getElementById('erCvv').innerText = "Código de Segurança informado não é válido!";
		document.getElementById('erCvv').style.display = 'block';
		return false;
	}

	if(mes_card == 'MES'){
		document.getElementById('erValCard').innerText = "";
		document.getElementById('mes_card').style.border = '1px solid red';

		document.getElementById('erValCard').innerText = "Mês da validade do cartão está incorreto!";
		document.getElementById('erValCard').style.display = 'block';
		return false;
	}
	if(ano_card == 'ANO'){
		document.getElementById('erValCard').innerText = "";
		document.getElementById('ano_card').style.border = '1px solid red';

		document.getElementById('erValCard').innerText = "Ano da validade do cartão está incorreto!";
		document.getElementById('erValCard').style.display = 'block';
		return false;
	}
}