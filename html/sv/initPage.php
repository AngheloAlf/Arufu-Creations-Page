<?php

require "mdetect.php";
require "configPage.php";
require "detectJS.php";

$uagent_obj = new uagent_info();

if(!isset($_SESSION["logeado"])){
	$_SESSION["logeado"] = false;
}

if(isset($_GET["redireccionar"])){
	$redireccionar = $_GET["redireccionar"];
}
else{
	$redireccionar = "home";
	if(isset($_GET["url"])){
		$redireccionar = $_GET["url"];
	}
}

A_detectJS($redireccionar);

?>
