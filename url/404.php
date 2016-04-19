<?php 
include_once("common.php");
autoRedirect("404", "index.php");
?>

<!DOCTYPE html>

<html>

<body style="background-color:gainsboro">
	<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style=";padding:0px 15% 0px 15%"';} ?> >
		<div class="row-fluid">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-body" id="easter_egg" <?php if($_SESSION["js"]){echo "onmouseout='easter_eggColor()' onmouseover='easter_eggImage()'";} ?> >
						<div class="text-center" style="padding-top:10px">
							<br>
							<div id="easter_egg2" class="panel w3-topnav w3-blue" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto; width: 45%; padding: 10px;"';} ?> >
								<div class="panel-heading">
									<h1> Error 404 </h1>
								</div>
							</div>
							<br>
							<h2 id="easter_egg3"> No se ha encontrado la pagina que estabas buscando. </h2>
							<h3 id="easter_egg4"> Presiona aqui para volver a la pagina principal. </h3>
							<br>
							<form id="easter_egg5" action="<?php echo $hostPage; ?>" method="post">
								<button type="submit" class="btn btn-primary text-right">Volver</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
