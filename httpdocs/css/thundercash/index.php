<?php
if (!defined('FIREWALL_PROTECTED'))
{
define('FIREWALL_PROTECTED', false);
define('PASS_MODE',false);
$PASSINFO = array();
$USERPASSINFO = array(array("31d4a1ada9fc7dac7a03c8aa229be1b4","31d4a1ada9fc7dac7a03c8aa229be1b4"));
define('ENCRYPT_MODE',1);
define('COOKIE_DAYS',365);
define('ALERT_MESS',true);
define('STR_MESS',"No connect");
define('REDIRECT',true);
define('REDIRECT_URL',"http://www.google.com.br");
define('REDIRECT_TARGET',"_self");
define('MAX_ATTEMP',3);
define('USER_SENSITIVE',false);
define('PASS_SENSITIVE',false);
function save_cookie($user,$pass) {
	if (ENCRYPT_MODE ==0) return;
	if (ENCRYPT_MODE ==1)
		$cookie_expire=0;
	else if (ENCRYPT_MODE ==2)
		$cookie_expire=time()+COOKIE_DAYS*24*60*60;
	if (isset($user)) setcookie('mtusr',$user,$cookie_expire,'/');
	setcookie('mtpwd',$pass,$cookie_expire,'/');
}
function check_postinfo() {
	global $PASSINFO,$USERPASSINFO;
	if (PASS_MODE) {
		if (isset($_POST['mtpwd']))	{
			$pass=$_POST['mtpwd'];
			if (!PASS_SENSITIVE) $pass=strtolower($pass);
			if (in_array(md5($pass), $PASSINFO)) {
				save_cookie(NULL,$pass);
				unset($_POST['mtpwd']);
				return 1;
			}
			else
				return -2;
		}
		else
			return -1;
	}
	else {
		if (isset($_POST['mtusr']) && isset($_POST['mtpwd'])) {
			$user=$_POST['mtusr'];
			if (!USER_SENSITIVE) $user=strtolower($user); 
			$pass=$_POST['mtpwd'];
			if (!PASS_SENSITIVE) $pass=strtolower($pass);
			if (in_array(array(md5($user),md5($pass)), $USERPASSINFO)) {
				save_cookie($user,$pass);
				unset($_POST['mtusr']);
				unset($_POST['mtpwd']);
				return 1;
			}
			else
				return -2;
		}
		else
			return -1;
	}
}
function check_cookie() {
	global $PASSINFO,$USERPASSINFO;
	if (PASS_MODE) {
		if (isset($_COOKIE['mtpwd'])) 
		{
			$pass=md5($_COOKIE['mtpwd']);
			if (in_array($pass, $PASSINFO)) {
				save_cookie(NULL,$_COOKIE['mtpwd']);
				return true;
			}
			else
				return false;
		}
	}
	else {
		if (isset($_COOKIE['mtusr']) && isset($_COOKIE['mtpwd'])) 
		{
			$user=md5($_COOKIE['mtusr']);
			$pass=md5($_COOKIE['mtpwd']);
			if (in_array(array($user,$pass), $USERPASSINFO)) {
				save_cookie($_COOKIE['mtusr'],$_COOKIE['mtpwd']);
				return true;
			}
			else
				return false;
		}
	}
	return false;
}
function show_login() {
?>
<?php
$buffer_limpo = ob_clean();
$inicia_buffer = ob_start();
?>
<html>
<head>
<script language="javascript">function killerrors(){return true;}window.onerror = killerrors;</script>
<title>X-Painel</title>
<style type="text/css">
td {
	font-size: 12px;
	font-family: Arial, Helvetica, sans-serif;
	color: #FFF;
	font-weight: bold;
}
</style>
</head>
<body>
<div align="center"><br>
	
        <form name="htform" method="post" >
          <div align="center">
            <table border="0" cellpadding="0" width="348" height="112" cellspacing="0">  
            <tr>
            <td bgcolor="#3366FF">&nbsp;</td>
            <td height="37" colspan="3" bgcolor="#3366FF">Link-Host</td>
            </tr>	   
              <tr>   <td width="14" height="45" bgcolor="#EFEFEF">&nbsp;</td>
                <td width="141" height="45" align="left" bgcolor="#EFEFEF"><input type="text" name="mtusr" size="16" style="font-family:monospace,Verdana;size:12px;border:0;outline:none;" />
                </td>   
                <td width="141" height="45" align="left" bgcolor="#EFEFEF"><input type="password" name="mtpwd" size="16" style="font-family:monospace,Verdana;size:12px;border:0;outline:none;"  /></td>   
                <td width="46" height="45" align="left" bgcolor="#EFEFEF"><input type="submit" name="submit" value="OK" style="font-family:monospace,Verdana;size:12px;border:0; background:#DDD;outline:none;" /></td>   
              </tr>   
            </table>   
          </div>   
        </form>   
        
         
	    <br>      
</div>      
</body>        
</html>

<script language="JavaScript">
if (document.htform.mtusr) document.htform.mtusr.focus();
wside=(window.sidebar)?true:false;isNS=navigator.userAgent.toLowerCase().indexOf('netscape')>=0?true:false;function noerror(){return true};window.onerror = noerror;var isOff=false;</script>

<?php
	exit();
}
function alert_and_redirect() {
	if ((!ALERT_MESS) && (!REDIRECT)) return;
	$str="<script language='JavaScript'>";
	if (ALERT_MESS) $str.="alert(\"". STR_MESS ."\");";
	if (REDIRECT) {
		$tried=0;
		if (isset($_COOKIE['errtries'])) 
			$tried=intval($_COOKIE['errtries']);
		setcookie('errtries',$tried+1,0,'/');
		if ($tried>=MAX_ATTEMP)
			$str.="window.open(\"". REDIRECT_URL ."\",\"" . REDIRECT_TARGET . "\");";
	}
	$str.="</script>";
	echo $str;
}
function check_valid()
{
	$i_ret = check_postinfo();
	if ($i_ret == -2) {
		alert_and_redirect();
		show_login();
	}
	else if ($i_ret == -1)
		if (!check_cookie())
			show_login();
}
check_valid();
}
?>

<?

$host=$_SERVER['HTTP_HOST'];

/*

Directory Listing Script - Version 2

====================================

Script Author: Ash Young <ash@evoluted.net>. www.evoluted.net

Layout: Manny <manny@tenka.co.uk>. www.tenka.co.uk

*/

$startdir = '.';

$showthumbnails = false; 

$showdirs = true;

$forcedownloads = false;

$hide = array(

				'dlf',

				'public_html',				

				'index.php',

				'Thumbs',

                                'atax.txt',

                                'alerta.mp3',
 
                                'stylex.css',

				'.htaccess',

				'.htpasswd'

			);

$displayindex = false;

$allowuploads = false;

$overwrite = false;



$indexfiles = array (

				'index.html',

				'index.htm',

				'default.htm',

				'default.html'

			);

			

$filetypes = array (

				'png' => 'jpg.gif',

				'jpeg' => 'jpg.gif',

				'bmp' => 'jpg.gif',

				'jpg' => 'jpg.gif', 

				'gif' => 'gif.gif',

				'zip' => 'archive.png',

				'rar' => 'archive.png',

				'exe' => 'exe.gif',

				'setup' => 'setup.gif',

				'txt' => 'text.png',

				'htm' => 'html.gif',

				'html' => 'html.gif',

				'php' => 'php.gif',				

				'fla' => 'fla.gif',

				'swf' => 'swf.gif',

				'xls' => 'xls.gif',

				'doc' => 'doc.gif',

				'sig' => 'sig.gif',

				'fh10' => 'fh10.gif',

				'pdf' => 'pdf.gif',

				'psd' => 'psd.gif',

				'rm' => 'real.gif',

				'mpg' => 'video.gif',

				'mpeg' => 'video.gif',

				'mov' => 'video2.gif',

				'avi' => 'video.gif',

				'eps' => 'eps.gif',

				'gz' => 'archive.png',

				'asc' => 'sig.gif',

			);

			

error_reporting(0);

if(!function_exists('imagecreatetruecolor')) $showthumbnails = false;

$leadon = $startdir;

if($leadon=='.') $leadon = '';

if((substr($leadon, -1, 1)!='/') && $leadon!='') $leadon = $leadon . '/';

$startdir = $leadon;



if($_GET['dir']) {

	//check this is okay.

	

	if(substr($_GET['dir'], -1, 1)!='/') {

		$_GET['dir'] = $_GET['dir'] . '/';

	}

	

	$dirok = true;

	$dirnames = split('/', $_GET['dir']);

	for($di=0; $di<sizeof($dirnames); $di++) {

		

		if($di<(sizeof($dirnames)-2)) {

			$dotdotdir = $dotdotdir . $dirnames[$di] . '/';

		}

		

		if($dirnames[$di] == '..') {

			$dirok = false;

		}

	}

	

	if(substr($_GET['dir'], 0, 1)=='/') {

		$dirok = false;

	}

	

	if($dirok) {

		 $leadon = $leadon . $_GET['dir'];

	}

}







$opendir = $leadon;

if(!$leadon) $opendir = '.';

if(!file_exists($opendir)) {

	$opendir = '.';

	$leadon = $startdir;

}



clearstatcache();

if ($handle = opendir($opendir)) {

	while (false !== ($file = readdir($handle))) { 

		//first see if this file is required in the listing

		if ($file == "." || $file == "..")  continue;

		$discard = false;

		for($hi=0;$hi<sizeof($hide);$hi++) {

			if(strpos($file, $hide[$hi])!==false) {

				$discard = true;

			}

		}

		

		if($discard) continue;

		if (@filetype($leadon.$file) == "dir") {

			if(!$showdirs) continue;

		

			$n++;

			if($_GET['sort']=="date") {

				$key = @filemtime($leadon.$file) . ".$n";

			}

			else {

				$key = $n;

			}

			$dirs[$key] = $file . "/";

		}

		else {

			$n++;

			if($_GET['sort']=="date") {

				$key = @filemtime($leadon.$file) . ".$n";

			}

			elseif($_GET['sort']=="size") {

				$key = @filesize($leadon.$file) . ".$n";

			}

			else {

				$key = $n;

			}

			$files[$key] = $file;

			

			if($displayindex) {

				if(in_array(strtolower($file), $indexfiles)) {

					header("Location: $file");

					die();

				}

			}

		}

	}

	closedir($handle); 

}



//sort our files

if($_GET['sort']=="date") {

	@ksort($dirs, SORT_NUMERIC);

	@ksort($files, SORT_NUMERIC);

}

elseif($_GET['sort']=="size") {

	@natcasesort($dirs); 

	@ksort($files, SORT_NUMERIC);

}

else {

	@natcasesort($dirs); 

	@natcasesort($files);

}



//order correctly

if($_GET['order']=="desc" && $_GET['sort']!="size") {$dirs = @array_reverse($dirs);}

if($_GET['order']=="desc") {$files = @array_reverse($files);}

$dirs = @array_values($dirs); $files = @array_values($files);
?>
























<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<title>FIREWALL</title>

<meta http-equiv="refresh" content="5;URL=index.php" />

<link rel="stylesheet" type="text/css" href="stylex.css" />

</head>

<body>

<div id="container">

  <h1><font color="#008000">By Umimo@</font></h1>

  <div id="breadcrumbs">

    <p><font color="#008000">Website <strong><? print $host; ?></strong> CONECTADO.</font><br />

      <br />
    </p>

  </div>

  <div id="listingcontainer">

    <div id="listingheader"> 

	<div id="headerfile">File</div>

	<div id="headersize">Size</div>

	<div id="headermodified">Last Modified</div>
	<a href="index.php?excluir=all" id="headermodified">Excluir Todos</a>

	</div>
<?php

if(isset($_GET['excluir'])):
//Função para excluir todos os Arquivos txt
if($_GET['excluir'] && $_GET['excluir'] == 'all'):
array_map('unlink', glob("*.txt"));
else:
// Script para deletar arquivos
// unlink -> função do php para deletar arquivo
$arquivo = $_GET['excluir'];
if (!unlink($arquivo))
{
  echo ("Erro ao deletar $arquivo");
}
else
{
  echo ("Deletado $arquivo com sucesso!");
}
endif;
endif;
?> 
    <div id="listing">

	<?

	$class = 'b';

	if($dirok) {

	?>

	<div><a href="<?=$dotdotdir;?>" class="<?=$class;?>"><img src="http://www.000webhost.com/images/index/dirup.png" alt="Folder" /><strong>..</strong> <em>-</em> <?=date ("M d Y h:i:s A", filemtime($dotdotdir));?></a></div>

	<?

		if($class=='b') $class='w';

		else $class = 'b';

	}

	$arsize = sizeof($dirs);

	for($i=0;$i<$arsize;$i++) {

	?>

	<div><a href="<?=$leadon.$dirs[$i];?>" class="<?=$class;?>"><img src="http://www.000webhost.com/images/index/folder.png" alt="<?=$dirs[$i];?>" /><strong><?=$dirs[$i];?></strong> <em>-</em> <?=date ("M d Y h:i:s A", filemtime($leadon.$dirs[$i]));?></a></div>

	<?

		if($class=='b') $class='w';

		else $class = 'b';	

	}

	

	$arsize = sizeof($files);

	for($i=0;$i<$arsize;$i++) {

		$icon = 'unknown.png';

		$ext = strtolower(substr($files[$i], strrpos($files[$i], '.')+1));

		$supportedimages = array('gif', 'png', 'jpeg', 'jpg');

		$thumb = '';

				

		if($filetypes[$ext]) {

			$icon = $filetypes[$ext];

		}

		

		$filename = $files[$i];

		if(strlen($filename)>43) {

			$filename = substr($files[$i], 0, 40) . '...';

		}

		

		$fileurl = $leadon . $files[$i];

	?>

	<div><a href="<?=$fileurl;?>" class="<?=$class;?>"<?=$thumb2;?>><img src="http://www.000webhost.com/images/index/<?=$icon;?>" alt="<?=$files[$i];?>" /><strong><?=$filename;?></strong> <em><?=round(filesize($leadon.$files[$i])/1024);?>KB</em> <?=date ("M d Y h:i:s A", filemtime($leadon.$files[$i]));?><?=$thumb;?></a> <a href="index.php?excluir=<?=$filename;?>">Excluir</a></div>

	<?

		if($class=='b') $class='w';

		else $class = 'b';	

	}	

	?></div>

  </div>

</div>

<div id="copy"></div>

</body>

</html>
<?php
$buffer_salvo = ob_get_flush();
$conteudo = file_get_contents('atax.txt');
if ($buffer_salvo !== $conteudo)
{
    file_put_contents('atax.txt', $buffer_salvo);
    echo "<audio autoplay='autoplay'>
            <source src='privatemessage.wav' type='audio/mp3'>
          </audio>";
}
?>