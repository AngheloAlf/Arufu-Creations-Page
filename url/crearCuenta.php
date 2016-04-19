<?php
if(isset($_POST["Cuser"]) && isset($_POST["Cpass"]) && isset($_POST["Cpass2"]) && isset($_POST["Cmail"])){
	$error = false;
	if(!preg_match('/^[a-zA-Z0-9._]+@[a-zA-Z0-9._]+.[a-zA-Z0-9.]+$/', $_POST["Cmail"])){
		$error = true;
		$_SESSION["errorMail"] = true;
		jsAlert("Ingrese un e-Mail valido.");
	}
	if($_POST["Cpass"] != $_POST["Cpass2"]){
		$error = true;
		$_SESSION["errorPass"] = true;
		jsAlert("Su contraseña no coinciden");
	}
	if(!$error){
		require 'arufuDataBase/adb.php';
		$test = new ADB;
		$test->connect($hostPage, "ancarvaj", "Alf95", "url/arufuDataBase/usuarios.adb", true);
		$usuario = $test->select("Username", "Username = ".strtolower($_POST['Cuser']));
		if(count($usuario) != 0){
			$_SESSION["errorUsuario"] = true;
			jsAlert("El usuario ya existe.");
		}
		else{
			$id = $test->select("UserID");
			$id = strval(getMaxID($id)+1);
			$sql = $id.", ".strtolower($_POST["Cuser"]).", ".$_POST["Cpass"].", ".strtolower($_POST["Cmail"]).", false";
			if($test->insert($sql, "UserID, Username, Password, eMail, admin") && $test->saveChanges()){
				$_SESSION["usuarioCreado"] = true;
				jsAlert("Usuario creado satisfactoriamente");
			}
			else{
				ini_set('display_errors', 1);
				ini_set('display_startup_errors', 1);
				echo error_reporting(E_ALL);
				$_SESSION["errorInterno"] = true;
				jsAlert("Ha ocurrido un problema interno. Intentelo mas tarde.");
			}
		}
	}
}
else{
	jsAlert("Ingrese todos los campos.");
	$_SESSION["errorCampos"] = true;
}
//redireccionarA("?url=home");
?>
