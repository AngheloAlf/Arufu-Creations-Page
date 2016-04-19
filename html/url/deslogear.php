<?php
$_SESSION["logeado"] = false;
unset($_SESSION["user"]);
redireccionarA("?url=home");
?>