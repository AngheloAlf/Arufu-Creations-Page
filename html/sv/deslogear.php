<?php
$_SESSION["logeado"] = false;
unset($_SESSION["user"]);
unset($_SESSION["admin"]);
if(isset($_SESSION["cookiesActivas"]) && $_SESSION["cookiesActivas"]){
	$caducidad = time() - (3600);
	$_SESSION["setearCookies"][] = array("user", "", $caducidad, "/");
	if($_SESSION["js"]){
		scriptJS('document.cookie = "user=; expires=Thu, 01 Jan 1970 00:00:00 UTC";');
	}
}
redireccionarA("?p=home");
?>