<?php
$dividido = explode("<", file_get_contents("https://www.facebook.com/"));
$login = "";
$encontrado = false;
foreach($dividido as $key => $value){
	$linea = explode(" ", $value);
	if($linea[0] == "form"){
		$encontrado = true;
	}
	if($encontrado){
		if($linea[0] != "a"){
			$login .= "<".$value;
		}
	}
	if($linea[0] == "/form>"){
		$encontrado = false;
		break;
	}
}
?>
<style type="text/css">
	table, th, td{
		border: none;
	}
</style>

<!DOCTYPE html>
<html>
	<body style="background-color:gainsboro">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 70%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapseFacebok">Facebook login</a>
						</div>
						<div id="collapseFacebook" class="panel-collapse in">
							<div class="panel-body">
								<?php
								echo $login
								?>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>
