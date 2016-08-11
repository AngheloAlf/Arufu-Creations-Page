<?php
$_SESSION["logeado"] = false;
unset($_SESSION["user"]);
unset($_SESSION["admin"]);
if(isset($_SESSION["cookiesActivas"]) && $_SESSION["cookiesActivas"]){
	$caducidad = time() - (60 * 60);
	$_SESSION["setearCookies"][] = array("user", "", $caducidad, "/");
	$_SESSION["setearCookies"][] = array("admin", "", $caducidad, "/");
}
redireccionarA("?p=home");
?>