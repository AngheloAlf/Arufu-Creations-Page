<?php
if(isset($_POST["user"]) && isset($_POST["pass"])){
	require 'arufuDataBase/adb.php';
	$test = new ADB;
	$test->connect($hostPage, "ancarvaj", "Alf95", "url/arufuDataBase/usuarios.adb", true);
	$usuario = $test->select("Password, admin", "Username = ".strtolower($_POST['user']))[0];
	if($usuario[0] == $_POST["pass"]){
		$_SESSION["logeado"] = true;
		$_SESSION["user"] = $_POST["user"];
		if($usuario[1] = "true"){
			$_SESSION["admin"] = true;
		}
		else{
			$_SESSION["admin"] = false;
		}
	}
	else{
		$_SESSION["errorLogIn"] = true;
		jsAlert("El usuario o la contraseña no coinciden.");
	}
}
redireccionarA("?url=home");
?>