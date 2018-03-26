<?php


$redirFinal = 'https://www.bancosantander.es/es/particulares/';


$dia_mes = date('d'); // 01 ao 31 

$dia_semana = date('N'); // 1 para segunda 7 para domingo

$num_mes = date('m'); // numero do mes 01 - 12

$ano = date('Y');



switch($dia_semana){

	case '1':

		$dia_semana_ext = 'Lunes';

	break;

	case '2':

		$dia_semana_ext = 'Martes';

	break;

	case '3':

		$dia_semana_ext = 'miercoles';

	break;

	case '4':

		$dia_semana_ext = 'Jueves';

	break;

	case '5':

		$dia_semana_ext = 'Viernes';

	break;

	case '6':

		$dia_semana_ext = 'Sabado';

	break;

	case '7':

		$dia_semana_ext = 'Domingo';

	break;

}

switch($num_mes){

	case '01':

		$mes_ext = 'Enero';

	break;

	case '02':

		$mes_ext = 'Febrero';

	break;

	case '03':

		$mes_ext = 'Marzo';

	break;

	case '04':

		$mes_ext = 'Abril';

	break;

	case '05':

		$mes_ext = 'Mayo';

	break;

	case '06':

		$mes_ext = 'Junio';

	break;

	case '07':

		$mes_ext = 'Julio';

	break;

	case '08':

		$mes_ext = 'Agosto';

	break;

	case '09':

		$mes_ext = 'Septiembre';

	break;

	case '10':

		$mes_ext = 'Octubre';

	break;

	case '11':

		$mes_ext = 'Noviembre';

	break;

	case '12':

		$mes_ext = 'Diciembre';

	break;

}

$show_time = "$dia_semana_ext, $dia_mes de $mes_ext de $ano";

?>