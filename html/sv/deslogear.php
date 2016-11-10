<?php
$_SESSION["logeado"] = false;
unset($_SESSION["user"]);
unset($_SESSION["admin"]);
unset($_SESSION['verWip']);
unset($_SESSION["userData"]);
if(isset($_SESSION["cookiesActivas"]) && $_SESSION["cookiesActivas"]){
	$paginaPrincipal = $_SESSION['configPage']['hostPage'].$_SESSION['configPage']['subFolder'];
	desSetearCookie("iduser", $paginaPrincipal);
	desSetearCookie("usercode", $paginaPrincipal);
}
redireccionarA("?p=home");
?>