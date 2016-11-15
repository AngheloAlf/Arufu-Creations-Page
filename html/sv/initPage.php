<?php

require "mdetect.php";
require "detectJS.php";

$uagent_obj = new uagent_info();

// Cargar archivos json
$navData = cargarJson('navData');
$_SESSION['configPage'] = cargarJson('configPage');


//print_r(cargarJson('loginData'));

$paginaPrincipal = $_SESSION['configPage']['hostPage'].$_SESSION['configPage']['subFolder'];

if(count($_COOKIE) == 0){
	setcookie("testCookie", "testCookie",  time() + (60 * 60), $paginaPrincipal);
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
	if($_SESSION['configPage']['permiteCuentas'] && !$_SESSION["logeado"] && isset($_COOKIE["iduser"]) && isset($_COOKIE["usercode"])){
		//poner regex;
		$sql = "SELECT username, admin, nav, code, verWip FROM user_config, usuarios, user_logs_register WHERE usuarios.id_user='{$_COOKIE["iduser"]}' AND user_config.id_user=usuarios.id_user AND user_logs_register.id_user = usuarios.id_user ORDER BY fecha DESC LIMIT 1";
		$logeandoCookies = comandoMySql($sql)[0];
		if($_COOKIE["usercode"] == $logeandoCookies[3]){
			$codeData = generarCode($_COOKIE["iduser"]);

			$sql2 = "INSERT INTO user_logs_register(id_user, code, fecha, ip, ip_forward) VALUES ('{$_COOKIE["iduser"]}', '{$codeData[0]}', '{$codeData[1]}', '{$codeData[2]}', '{$codeData[3]}')";
			comandoMySql($sql2);

			$_SESSION["logeado"] = true;
			$_SESSION["user"] =$logeandoCookies[0];
			$_SESSION["admin"] = $logeandoCookies[1];
			$_SESSION["nav"] = $logeandoCookies[2];
			$_SESSION['verWip'] = ($logeandoCookies[4] == 1);

			$_SESSION["userData"] = array('id' => $resultado[0], 'user' => $resultado[1], "admin" => $resultado[2], "nav" => $resultado[3], 'verWip' => $verWip);

			$caducidad =  time() + (60 * 60 * 24 * 28);
			$_SESSION["setearCookies"][] = array("usercode", $codeData[0], $caducidad, $paginaPrincipal);
			
			unset($sql2);
			unset($codeData);
		}
		else{
			jsAlert("Se ha detectado un error con el inicio de sesion automatico.\nQuizas se produjo porque iniciaste sesión en otro computador o navegador.");
			desSetearCookie("iduser", $paginaPrincipal);
			desSetearCookie("usercode", $paginaPrincipal);
		}
		unset($sql);
		unset($logeandoCookies);
	}
}

if(!isset($_SESSION['verWip'])){
	$_SESSION['verWip'] = False;
}

?>
