<?php

require "mdetect.php";
require "configPage.php";
require "detectJS.php";

$uagent_obj = new uagent_info();

if(count($_COOKIE) == 0){
	setcookie("testCookie", "testCookie",  time() + (60 * 60), "/");
}

if(isset($_SESSION["cookiesActivas"]) && $_SESSION["cookiesActivas"]){
	if(isset($_SESSION["setearCookies"])){
		for ($i=0; $i < count($_SESSION["setearCookies"]); $i++) { 
			$ite = $_SESSION["setearCookies"][$i];
			setcookie($ite[0], $ite[1], $ite[2], $ite[3]);
		}
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

if(isset($_SESSION["cookiesActivas"]) && $_SESSION["cookiesActivas"]){
	if(!$_SESSION["logeado"] && isset($_COOKIE["user"])){
		$_SESSION["logeado"] = true;
		$_SESSION["user"] = $_COOKIE["user"];
		$sql = "SELECT admin, nav FROM user_config, usuarios WHERE user_config.id_user=usuarios.id_user AND username='{$_SESSION["user"]}'";
		$logeandoCookies = comandoMySql($sql);
		$_SESSION["admin"] = $logeandoCookies[0];
		$_SESSION["nav"] = $logeandoCookies[1];
		unset($logeandoCookies);
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

?>
