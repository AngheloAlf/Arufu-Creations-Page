<?php
if(isset($_POST["q"])){
	$googlePage = "https://www.google.cl/?gws_rd=ssl#safe=off&q=".str_replace(" ", "+", $_POST["q"]);
	if($_POST["boton"] == "google"){
		redireccionarA($googlePage);
	}
	elseif($_POST["boton"] == "arufu"){
		echo file_get_contents($googlePage);
	}
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
							<a data-toggle="collapse" href="#collapseGoogle">Busqueda de Google</a>
						</div>
						<div id="collapseGoogle" class="panel-collapse in">
							<div class="panel-body">
							<?php
							if(!$_SESSION["js"]){
								?>
								<form action="" method="post">
								<?php
							}
							?>
									<input type="text" autofocus="" required="" class="form-control" id="q" name="q" <?php if(isset($_POST["q"])){echo 'value="'.$_POST["q"].'"';;} ?> />
									<br>
									<button class="btn btn-primary" id="boton" name="boton" value="google" onclick="buscarConGoogle()">Buscar con Google</button>
									<!--<button class="btn btn-warning" id="boton" name="boton" value="arufu" onclick="WIP()"><i>[WIP]</i>Buscar con Arufu <i>[WIP]</i></button>-->
									<br>
							<?php
							if(!$_SESSION["js"]){
								?>
								</form>
								<?php
							}
							?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
