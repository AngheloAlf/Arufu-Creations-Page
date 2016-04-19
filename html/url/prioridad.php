<?php
if(isset($_POST["cantRamos"])){
	$_SESSION["semestres"] = $_POST["semestres"];
	$_SESSION["FAE"] = $_POST["FAE"];
	$_SESSION["cantRamos"] = $_POST["cantRamos"];
}
elseif(!isset($_SESSION["cantRamos"])){
	$_SESSION["semestres"] = 0;
	$_SESSION["FAE"] = "1";
	$_SESSION["cantRamos"] = 0;
}

if(isset($_POST["nota0"])){
	for($i=0; $i < intval($_SESSION["cantRamos"]); $i++){
		$_SESSION["notas"][$i] = $_POST["nota$i"];
		$_SESSION["creditos"][$i] = $_POST["creditos$i"];
	}
	$prioridad = calcularPrioridad($_SESSION["notas"], $_SESSION["creditos"], $_SESSION["semestres"], $_SESSION["cantRamos"], $_SESSION["FAE"]);
}

?>

<!DOCTYPE html>
<html>
	<body style="background-color:gainsboro">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 60%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapsePrioridad">Seleccionar cantidad de ramos y semestres</a>
						</div>
						<div id="collapsePrioridad" class="panel-collapse in">
							<div class="panel-body">
								<?php
								if(!$_SESSION["js"]){
									echo '<form action="" method="post">';
								}
								?>
								<label>Ingrese cuantos semestres lleva en la universidad:</label>
								<input type="number" required="" class="form-control" id="semestres" name="semestres" value="<?php echo $_SESSION["semestres"]; ?>" min="0"/>
								<label>Ingrese su FAE: </label><i>(Factor Academico Extracurricular)</i>
								<input type="text" required="" class="form-control" id="FAE" name="FAE" value="<?php echo $_SESSION["FAE"]; ?>"/>
								<label>Ingrese cuantos ramos ha tomado:</label>
								<input type="number" required="" <?php if($_SESSION["js"]){ echo 'ontouchend="generarRamos()" onkeyup="generarRamos()" onclick="generarRamos()"';} ?> class="form-control" id="cantRamos" name="cantRamos" value="<?php echo $_SESSION["cantRamos"]; ?>" min="0" max="200" />
								<?php
								if(!$_SESSION["js"]){
									echo '<br><button class="btn btn-primary">Generar</button>';
									echo '</form>';
								}
								?>
							</div>
						</div>
					</div>
					<br>
					
					<?php
					if(!$_SESSION["js"]){
						echo '<form action="" method="post">';
					}
					?>
					<div <?php if(!$_SESSION["js"] && $_SESSION["cantRamos"]=="0"){echo 'hidden=""';} ?> class="panel panel-primary" id="panelRamos" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 80%;padding: 00px;"';}?> >
						<div class="panel-heading">Ingresar ramos</div>
						<div id="collapseRamos" class="panel-collapse <?php if($_SESSION["js"]){ echo 'collapse';}?> ">
							<div class="panel-body">
								<table>
									<th>Ramo</th>
									<th>Nota</th>
									<th>Creditos</th>
									<?php
									if($_SESSION["js"]){
										$total = 200;
									}
									else{
										$total = intval($_SESSION["cantRamos"]);
									}
									for($i=0; $i < $total; $i++){ 
										?>
										<tr <?php if($_SESSION["js"]){ echo 'hidden=""';} echo 'id="ramo'.$i.'"'; ?> >
											<td>
												Ramo <?php echo $i+1; ?>
											</td>
											<td>
												<input type="text" class="form-control" <?php echo 'id="nota'.$i.'"'; echo 'name="nota'.$i.'"'; ?> value="<?php if(isset($_SESSION["notas"][$i])){echo $_SESSION["notas"][$i];}else{echo'0';} ?>" />
											</td>
											<td>
												<input type="number" class="form-control" <?php echo 'id="creditos'.$i.'"'; echo 'name="creditos'.$i.'"'; ?> value="<?php if(isset($_SESSION["creditos"][$i])){echo $_SESSION["creditos"][$i];}else{echo'0';} ?>"/>
											</td>
										</tr>
										<?php
									}
									?>
								</table>
								<br>
								<button <?php if($_SESSION["js"]){ echo 'onclick="calcularIndicadores()"';}?> class="btn btn-primary">Calcular prioridad</button>
								<br>
								<?php
								if(isset($prioridad)){
									echo '<p style="text-align: center">Su prioridad es '.$prioridad.'</p>';
								}
								?>
								<p hidden="" style="text-align: center" id="prioridad"></p>
								<p hidden="" style="text-align: center" id="RAP"></p>
								<p hidden="" style="text-align: center" id="LA"></p>
								<p hidden="" style="text-align: center" id="AA"></p>
							</div>
						</div>
					</div>
					<?php
					if(!$_SESSION["js"]){
						echo '</form>';
					}
					?>

				</div>
			</div>
		</div>
	</body>
</html>
