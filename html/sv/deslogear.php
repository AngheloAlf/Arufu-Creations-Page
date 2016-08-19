<?php
$_SESSION["logeado"] = false;
unset($_SESSION["user"]);
unset($_SESSION["admin"]);
if(isset($_SESSION["cookiesActivas"]) && $_SESSION["cookiesActivas"]){
	desSetearCookie("iduser", $hostPage);
	desSetearCookie("usercode", $hostPage);
}
redireccionarA("?p=home");
?>