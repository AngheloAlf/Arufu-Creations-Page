<?php
$_SESSION["logeado"] = false;
unset($_SESSION["user"]);
unset($_SESSION["admin"]);
redireccionarA("?url=home");
?>