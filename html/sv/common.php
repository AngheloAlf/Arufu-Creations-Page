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
}*/
function obtenerFechaHora(){
	//return date('Y-m-d G:i:s', __getDateNTP());
	return date('Y-m-d G:i:s');
}
function convertirFechaUsuario($fecha){
	$entradaExplotada = explode(" ", $fecha);
	$fechaExplotada = explode("-", $entradaExplotada[0]);
	return $fechaExplotada[2]."/".$fechaExplotada[1]."/".$fechaExplotada[0]." ".$entradaExplotada[1];
}/*
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
	$urlActualphp = $urlActual[0].".php";
	$urlActualphtml = $urlActual[0].".phtml";
	if(($urlActualphp == $nombreActual.'.php') || ($urlActualphp == $nombreActual) || ($urlActualphtml == $nombreActual.'.phtml') || ($urlActualphtml == $nombreActual)){
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
	$prioridad = floatval($FAE)*100*$notasXcreditos*($creditosAprobados/$creditosTotales)/(14*pow(intval($semestres), 1.06));
	return $prioridad;
}

function generarFibonacci($cantidad, $conCero){
	$numerosFibonacci = array();
	if($cantidad < 0){
		return -1;
	}
	if($cantidad >= 1){
		if(!$conCero){
			array_push($numerosFibonacci, 1);
		}
		else{
			array_push($numerosFibonacci, 0);
		}
	}
	if($cantidad >= 2){
		array_push($numerosFibonacci, 1);
	}
	for($i = 3; $i <= $cantidad; $i++){
		$uno = $numerosFibonacci[count($numerosFibonacci) - 2];
		$dos = $numerosFibonacci[count($numerosFibonacci) - 1];
		$total = $uno + $dos;
		array_push($numerosFibonacci, $total);
		if($total == INF){
			break;
		}
	}
	return $numerosFibonacci;
}

function comandoMySql($sql){
	$retornar = null;
	$SQLdata = cargarJson('loginData');
	$dbconn = new mysqli($SQLdata['SQLhost'], $SQLdata['SQLusuario'], $SQLdata['SQLpass'], $SQLdata['SQLname']);
	if(mysqli_connect_error()){
		jsAlert("Ha ocurrido un problema interno. Intentelo mas tarde.");
	}
	else{
		$check = $dbconn->query($sql);
		if(!is_bool($check)){
			$retornar = $check->fetch_all(MYSQLI_NUM);
		}
		else{
			$retornar = $check;
		}
	}
	echo $dbconn->error;
	$dbconn->close();
	return $retornar;
}

function scriptJS($jsString){
	echo '<script language="javascript">'.$jsString.';</script>';
}

function imprimirNavData($arreglo){
	foreach($arreglo as $key => $value){
		if(($value[1] > 0) && (!$_SESSION["logeado"] || ($_SESSION["logeado"] && ($_SESSION["admin"] < $value[1])))){
			continue;
		}
		$navegacion = '<a href="'.$value[0];
		if($value[2] > 0){
			$navegacion .= '&wip=';
			if(!$_SESSION['verWip']){
				$navegacion .= "true";
			}
			else{
				$navegacion .= "false";
			}
			$navegacion .= '">[WIP]';
			
		}
		else{
			$navegacion .= '">';
		}
		$navegacion .= $key.'</a>';
		echo $navegacion;
	}
}

function desSetearCookie($cookieName, $hostPage){
	$caducidad = time() - (3600);
	$_SESSION["setearCookies"][] = array($cookieName, "", $caducidad, $hostPage);
	if($_SESSION["js"]){
		$cookieDesabilitar = 'document.cookie = "'.$cookieName.'=; expires=Thu, 01 Jan 1970 00:00:00 UTC";';
		scriptJS($cookieDesabilitar);
	}
}

function setearCookies($arregloDeCookies){
	foreach($arregloDeCookies as $key => $galleta){
		setcookie($galleta[0], $galleta[1], $galleta[2], $galleta[3]);
	}		
}

function generarCode($idUsuario){
	$fecha = time();
	$ipUsuario = $_SERVER['REMOTE_ADDR'];
	if(isset($_SERVER['HTTP_X_FORWARDED_FOR'])){
		$ipForward = $_SERVER['HTTP_X_FORWARDED_FOR'];
	}
	else{
		$ipForward = "";
	}
	$code = dechex(($fecha*10)/($idUsuario*8));
	$fecha = date('Y-m-d G:i:s', $fecha);
	return array($code, $fecha, $ipUsuario, $ipForward);
}

function cargarJson($json){
	return json_decode(file_get_contents('json/'.$json.'.json'), JSON_FORCE_OBJECT);
}

autoRedirect("common.php", "index.php");

?>
