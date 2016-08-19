<?php

require "configPage.php";
require "mdetect.php";
require "detectJS.php";

$uagent_obj = new uagent_info();

if(count($_COOKIE) == 0){
	setcookie("testCookie", "testCookie",  time() + (60 * 60), $hostPage);
}

if(isset($_SESSION["cookiesActivas"]) && $_SESSION["cookiesActivas"]){
	if(isset($_SESSION["setearCookies"])){
		setearCookies($_SESSION["setearCookies"]);
		unset($_SESSION["setearCookies"]);
	}
}

?>

<!DOCTYPE html>

<?php
if(!isset($_SESSION["logeado"])){
	$_SESSION["logeado"] = false;
}

if(!isset($_SESSION["cookiesActivas"])){
	if(isset($_COOKIE) && (count($_COOKIE) > 0)){
		$_SESSION["cookiesActivas"] = true;
	}
	else{
		$_SESSION["cookiesActivas"] = false;

	}
}

if(isset($_GET["redireccionar"])){
	$redireccionar = $_GET["redireccionar"];
}
else{
	$redireccionar = "home";
	if(isset($_GET["p"])){
		$redireccionar = $_GET["p"];
	}
}
A_detectJS($redireccionar);

if(!isset($_SESSION["nav"]) || !$_SESSION["js"]){
	$_SESSION["nav"] = "topnav";
}

if(isset($_SESSION["cookiesActivas"]) && $_SESSION["cookiesActivas"]){
	if(!$_SESSION["logeado"] && isset($_COOKIE["iduser"]) && isset($_COOKIE["usercode"])){
		//poner regex;
		$sql = "SELECT username, admin, nav, code, verWip FROM user_config, usuarios, user_logs_register WHERE usuarios.id_user='{$_COOKIE["iduser"]}' AND user_config.id_user=usuarios.id_user AND user_logs_register.id_user = usuarios.id_user ORDER BY fecha DESC LIMIT 1";
		$logeandoCookies = comandoMySql($sql);
		if($_COOKIE["usercode"] == $logeandoCookies[3]){
			$codeData = generarCode($_COOKIE["iduser"]);

			$sql2 = "INSERT INTO user_logs_register(id_user, code, fecha, ip, ip_forward) VALUES ('{$_COOKIE["iduser"]}', '{$codeData[0]}', '{$codeData[1]}', '{$codeData[2]}', '{$codeData[3]}')";
			comandoMySql($sql2);

			$_SESSION["logeado"] = true;
			$_SESSION["user"] =$logeandoCookies[0];
			$_SESSION["admin"] = $logeandoCookies[1];
			$_SESSION["nav"] = $logeandoCookies[2];
			$_SESSION['verWip'] = ($logeandoCookies[4] == 1);

			$caducidad =  time() + (60 * 60 * 24 * 28);
			$_SESSION["setearCookies"][] = array("usercode", $codeData[0], $caducidad, $hostPage);
			
			unset($sql2);
			unset($codeData);
		}
		else{
			jsAlert("Se ha detectado un error con el inicio de sesion automatico.\nQuizas se produjo porque iniciaste sesión en otro computador o navegador.");
			desSetearCookie("iduser", $hostPage);
			desSetearCookie("usercode", $hostPage);
		}
		unset($sql);
		unset($logeandoCookies);
	}
}

$navData = array(
	'<img src="resources/home-white.png" width="32" height="38" alt="Home" style="border:0;">' => array("?p=home", 0), 
	'Digito verificador' => array("?p=verificador", 0), 
	'Calculadora de prioridad' => array("?p=prioridad", 0), 
	'Calculadoras de notas' => array("?p=notas", 1), 
	'Fibonacci' => array("?p=fibonacci", 0), 
	'Google' => array("?p=google", 0), 
	'Facebook' => array("?p=facebook", 2), 
	'Configuración' => array('?p=configuracion', 0), 
	'Acerca de' => array("?p=acercade", 1)
);

if(!isset($_SESSION['verWip'])){
	$_SESSION['verWip'] = False;
}

?>
