<?php
if(isset($_POST["user"]) && isset($_POST["pass"]) && $_POST["user"] && $_POST["pass"]){
	require "loginData.php";
	$dbconn = new mysqli($SQLhost, $SQLusuario, $SQLpass, $SQLname);
	if(mysqli_connect_error()){
		//Poner wea de la wea para devolverse
		die('Error de Conexión ('.mysqli_connect_errno().') '.mysqli_connect_error());
	}
	//echo 'Éxito... ' . $dbconn->host_info . "\n";
	$usuario = strtolower($_POST["user"]);
	$sql = "SELECT admin FROM usuarios WHERE username = '{$usuario}' AND password = '{$_POST["pass"]}'";
	$check = $dbconn->query($sql);
	if($check->num_rows == 1){
		$_SESSION["logeado"] = true;
		$_SESSION["user"] = $_POST["user"];
		$_SESSION["admin"] = $check->fetch_array(MYSQLI_NUM);
		$_SESSION["admin"] = $_SESSION["admin"][0];
		//print_r($check);
		//$_SESSION["admin"] = $check[0];
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
redireccionarA("?url=home");
?>