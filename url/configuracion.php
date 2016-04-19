<?php
if(isset($_POST["boton"])){
	if($_POST["boton"] == "guardar"){
		if($_POST["js"] == "js"){
			$_SESSION["js"] = true;
		}
		else{
			$_SESSION["js"] = false;
		}
	}
	elseif("restablecer" == $_POST["boton"]){
		unset($_SESSION["js"]);
	}
	echo '<meta http-equiv="refresh" content="1">';
}
?>

<!DOCTYPE html>
<html>
	<body style="background-color:gainsboro">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 80%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapseConfig">Configuración de la pagina</a>
						</div>
						<div id="collapseConfig" class="panel-collapse in">
							<div class="panel-body">
								<form action="" method="post">
									<label>Activar JavaScript:</label>
									<input type="checkbox" id="js" name="js" value="js" <?php if(!$_SESSION["togglejs"]){echo 'disabled=""';} if($_SESSION["js"]){ echo 'checked=""';} ?> />
									<?php if(!$_SESSION["togglejs"]){ echo "<br><i>No puede activar esta opción debido a que su navegador no parece soportar JavaScript.</i>";} ?>
									<br><br>
									<button class="btn btn-primary" id="boton" name="boton" value="guardar">Guardar cambios</button>
									<button class="btn btn-danger" id="boton" name="boton" value="restablecer">Restablecer valores por defecto</button>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
