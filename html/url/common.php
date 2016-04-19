<?php

session_start();
date_default_timezone_set("America/Santiago");

/*
include "Bt51\NTP\Socket.php";
include "Bt51\NTP\Client.php";

function fechaADia($tiempo){
	return $tiempo/(60*60*24);
}
function __getDateNTP(){
	$socket = new Socket('ntp.shoa.cl', 123); 
	$ntp = new Client($socket);
	$time = $ntp->getTime();
	foreach ($time as $key => $value) {
		if($key == "date"){
			return strtotime($value) - 3*60*60;
		}
	}
	return strtotime("1970-01-01 00:00:00");
}
function obtenerAno(){
	return date('Y', __getDateNTP());
}
function obtenerMes(){
	return date('m', __getDateNTP());
}
function obtenerDia(){
	return date('d', __getDateNTP());
}
function obtenerFechaHora(){
	return date('Y-m-d G:i:s', __getDateNTP());
	return date('Y-m-d G:i:s');
}
function convertirFechaUsuario($fecha){
	$entradaExplotada = explode(" ", $fecha);
	$fechaExplotada = explode("-", $entradaExplotada[0]);
	return $fechaExplotada[2]."/".$fechaExplotada[1]."/".$fechaExplotada[0]." ".$entradaExplotada[1];
}
function obtenerFechaHoraParaUsuario(){
	return date("d/m/Y G:i:s", __getDateNTP());
	return date('d/m/Y G:i:s');
}
*/

function redireccionarA($Pagina){
	echo '<html><meta http-equiv="refresh" content="0;URL='.$Pagina.'" /></html>';
}

function logOut(){
	session_unset();
	//session_destroy();
}

function autoRedirect($nombreActual, $haciaDonde){
	$urlActual = explode("/",$_SERVER["REQUEST_URI"]);
	$urlActual = explode(".", end($urlActual));
	$urlActual = $urlActual[0].".php";
	if(($urlActual == $nombreActual.'.php') || ($urlActual == $nombreActual)){
		redireccionarA($haciaDonde);
	}
}

function verificarCorreo($correo, $error){
	if(!strpos($correo,"@")){ //revisa que el correo tenga arroba;
		jsAlert("e-Mail no valido.");
		$error = true;
	}
	else{
		$mailPartido = explode("@",$correo);
		if(!strpos(end($mailPartido),".")){ //revisa que exista un punto despues del arroba
			jsAlert("e-Mail no valido.");
			$error = true;
		}
	}
	return $error;
}

function revisarNumero($fono, $error){
	if(!is_numeric($fono)){ //revisa si no es numerico
		jsAlert("Numero no valido");
		$error = true;
	}
	return $error;

}

function jsAlert($mensaje){
	echo '<script language="javascript">alert("'.$mensaje.'");</script>';
}

function llaveEnArreglo($llave, $arreglo){
	return isset($arreglo) && in_array($llave, array_keys($arreglo));
}

function digitoVerificador($sinGuion){
	$ceroAscii = 48;
	$contador = 2;
	$suma = 0;
	for($i = strlen($sinGuion)-1; $i > -1; $i--){
		$numero = ord($sinGuion[$i]) - $ceroAscii;
		$suma += $numero*$contador;
		$contador += 1;
		if($contador>7){
			$contador = 2;
		}
	}
	$verificador = 11 - $suma%11;
	if($verificador == 10){
		return "k";
	}
	if($verificador == 11){
		return "0";
	}
	return chr($verificador+$ceroAscii);
}

function esMobil($uagent_obj){
	return ($uagent_obj->isTierIphone == $uagent_obj->true || $uagent_obj->DetectMobileQuick() == $uagent_obj->true);
}

function calcularPrioridad($notas, $creditos, $semestres, $cantRamos, $FAE){
	$notasXcreditos = 0;
	$creditosAprobados = 0;
	$creditosTotales = 0;
	for($i=0; $i < intval($cantRamos); $i++){ 
		if(preg_match('/0*[s|S]0*/', $notas[$i])){
			$creditosAprobados += intval($creditos[$i]);
		}
		elseif(!preg_match('/^[0-9]+$/', $notas[$i])){

		}
		else{
			if(intval($notas[$i])>=55){
				$creditosAprobados += $creditos[$i];
			}
			$notasXcreditos += intval($notas[$i])*intval($creditos[$i]);
		}
		$creditosTotales += intval($creditos[$i]);
	}
	$wea = floatval($FAE)*100*$notasXcreditos*($creditosAprobados/$creditosTotales)/(14*pow(intval($semestres), 1.06));
	echo $wea;
	return $wea;
}

autoRedirect("common.php", "index.php");

?>
