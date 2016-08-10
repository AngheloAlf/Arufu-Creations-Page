<?php
if(isset($_POST["Cuser"]) && isset($_POST["Cpass"]) && isset($_POST["Cpass2"]) && isset($_POST["Cmail"]) && $_POST["Cuser"] && $_POST["Cpass"] && $_POST["Cpass2"] && $_POST["Cmail"]){
	$error = false;
	if($_POST["Cpass"] != $_POST["Cpass2"]){
		$error = true;
		$_SESSION["errores"]["clavesCoincidencia"] = true;
		jsAlert("Las contraseñas no coinciden.");

	}
	if(!preg_match("/^[a-zA-Z0-9._]+@[a-zA-Z0-9._]+.[a-zA-Z0-9.]+$/", $_POST["Cmail"])){
		$error = true;
		$_SESSION["errores"]["mailCreacion"] = true;
		jsAlert("Ingrese un e-Mail valido.");
	}
	if(!$error){
		require "loginData.php";
		$dbconn = new mysqli($SQLhost, $SQLusuario, $SQLpass, $SQLname);
		if(mysqli_connect_error()){
			//Poner wea de la wea para devolverse
			$_SESSION["errores"]["internoCreacion"] = true;
			jsAlert("Ha ocurrido un problema interno. Intentelo mas tarde.");
			die('Error de Conexión ('.mysqli_connect_errno().') '.mysqli_connect_error());
		}
		$usuario = strtolower($_POST["Cuser"]);
		$mail = strtolower($_POST["Cmail"]);
		$sql = "SELECT username FROM usuarios WHERE LCASE(username) = '{$usuario}'";
		$check = $dbconn->query($sql);
		if($check && $check->num_rows == 0){
			$sql2 = "INSERT INTO usuarios(username, password, mail, admin) VALUES('{$_POST["Cuser"]}', '{$_POST["Cpass"]}', '{$mail}', '0')";
			$check2 = $dbconn->query($sql2);
			if($check2){
				$_SESSION["errores"]["usuarioCreado"] = true;
				jsAlert("Usuario creado satisfactoriamente");
			}
			else{
				$_SESSION["errores"]["usuarioNoCreado"] = true;
				jsAlert("Ocurrio un problema creando el usuarioe");
			}
		}
		else{
			$_SESSION["errores"]["usuarioYaExiste"] = true;
			jsAlert("El usuario ya existe.");
		}
		$dbconn->close();
	}
}
else{
	jsAlert("Rellena todos los campos");
	$_SESSION["errores"]["camposCrear"] = true;
}
redireccionarA("?p=home");
?>