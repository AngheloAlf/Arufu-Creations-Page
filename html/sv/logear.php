<?php
if(isset($_POST["user"]) && isset($_POST["pass"]) && $_POST["user"] && $_POST["pass"]){
	$SQLdata = cargarJson('loginData');
	$dbconn = new mysqli($SQLdata['SQLhost'], $SQLdata['SQLusuario'], $SQLdata['SQLpass'], $SQLdata['SQLname']);
	if(mysqli_connect_error()){
		//Poner wea de la wea para devolverse
		$_SESSION["errores"]["internoLogear"] = true;
		jsAlert("Ha ocurrido un problema interno. Intentelo mas tarde.");
		die('Error de Conexión ('.mysqli_connect_errno().') '.mysqli_connect_error());
	}
	//echo 'Éxito... ' . $dbconn->host_info . "\n";
	$usuario = strtolower($_POST["user"]);
	$sql = "SELECT usuarios.id_user, username, admin, nav, verWip FROM usuarios, user_config WHERE LCASE(username) = '{$usuario}' AND password = '{$_POST["pass"]}' AND user_config.id_user=usuarios.id_user";
	$check = $dbconn->query($sql);
	if($check && $check->num_rows == 1){
		$resultado = $check->fetch_array(MYSQLI_NUM);
		$_SESSION["logeado"] = true;
		$_SESSION["user"] = $resultado[1];
		$_SESSION["admin"] = $resultado[2];
		$_SESSION["nav"] = $resultado[3];
		$_SESSION['verWip'] = ($resultado[4] == 1);
		$verWip = ($resultado[4] == 1);

		$_SESSION["userData"] = array('id' => $resultado[0], 'user' => $resultado[1], "admin" => $resultado[2], "nav" => $resultado[3], 'verWip' => $verWip);

		$codeData = generarCode($resultado[0]);

		$sql2 = "INSERT INTO user_logs_register(id_user, code, fecha, ip, ip_forward) VALUES ('{$resultado[0]}', '{$codeData[0]}', '{$codeData[1]}', '{$codeData[2]}', '{$codeData[3]}')";
		$dbconn->query($sql2);

		if(isset($_POST["mantenerSesion"]) && isset($_SESSION["cookiesActivas"]) && $_SESSION["cookiesActivas"]){
			$caducidad =  time() + (60 * 60 * 24 * 28);
			$_SESSION["setearCookies"][] = array("iduser", $resultado[0], $caducidad, $_SESSION['configPage']['hostPage']);
			$_SESSION["setearCookies"][] = array("usercode", $codeData[0], $caducidad, $_SESSION['configPage']['hostPage']);
		}
	}
	else{
		jsAlert("El usuario y/o la clave ingresada no son correctos.");
		$_SESSION["errores"]["malIngresados"] = true;
	}
	$dbconn->close();
}
else{
	jsAlert("Rellena todos los campos");
	$_SESSION["errores"]["camposLogear"] = true;
}
redireccionarA("?p=home");
?>