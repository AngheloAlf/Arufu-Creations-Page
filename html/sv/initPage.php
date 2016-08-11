<!DOCTYPE html>
<?php

require "mdetect.php";
require "configPage.php";
require "detectJS.php";

$uagent_obj = new uagent_info();

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
	if(!$_SESSION["logeado"] && isset($_COOKIE["user"]) && isset($_COOKIE["admin"])){
		$_SESSION["logeado"] = true;
		$_SESSION["user"] = $_COOKIE["user"];
		$_SESSION["admin"] = $_COOKIE["admin"];
		$sql = "SELECT nav FROM user_config, usuarios WHERE user_config.id_user=usuarios.id_user AND username='{$_SESSION["user"]}'";
		$_SESSION["nav"] = comandoMySql($sql)[0];
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
