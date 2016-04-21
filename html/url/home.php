<!DOCTYPE html>
<html>
	<body style="background-color:gainsboro">
		<div class="container-fluid" <?php if(!esMobil($uagent_obj)){ echo 'style="padding:0px 15% 0px 15%"';} ?> >
			<div class="row-fluid">
				<div class="col-md-12">
					<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 80%;padding: 00px;"';} ?> >
						<div class="panel-heading">
							<a data-toggle="collapse" href="#collapseHome">Home</a>
						</div>
						<div id="collapseHome" class="panel-collapse in">
							<div class="panel-body">
								<h2><p style="text-align: center;">Bienvenido a Arufu Home Page</p></h2>
								<p style="text-align: center;">Desplácese por el navegador superior.</p>
								<?php
								if($permiteCuentas && !$_SESSION["logeado"]){
									?>
									<p style="text-align: center;">No es necesario tener una cuenta para usar esta pagina.</p>
									<?php
								}
								?>
							</div>
						</div>
					</div>
					<br>
				</div>
				<?php
				if($permiteCuentas && ((isset($_SESSION["logeado"]) && !$_SESSION["logeado"]) || !isset($_SESSION["logeado"]))){
					?>
					<div class="col-md-6">
						<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 90%;padding: 00px;"';} ?> >
							<div class="panel-heading">
								<a data-toggle="collapse" href="#collapseIniciar">Iniciar Sesión</a>
							</div>
							<div id="collapseIniciar" class="panel-collapse in">
								<div class="panel-body">
									<form action="?url=logear" method="post">
										<h3><p style="text-align: center;">Iniciar Sesión</p></h3>
										<label>Usuario:</label>
										<input type="text" required="" class="form-control" id="user" name="user"/>
										<label>Contraseña:</label>
										<input type="password" required="" class="form-control" id="pass" name="pass"/>
										<a href="?url=claveOlvidada&wip=true" style="color:#337ab7;">Olvide mi contraseña</a>
										<br>
										<?php
										if(isset($_SESSION["errores"]["malIngresados"]) && $_SESSION["errores"]["malIngresados"]){
											echo '<br><p style="color:red">El usuario o la contraseña no coinciden</p>';
											$_SESSION["errores"]["malIngresados"] = false;
										}
										if(isset($_SESSION["errores"]["camposLogear"]) && $_SESSION["errores"]["camposLogear"]){
											echo '<br><p style="color:red">Rellena todos los campos.</p>';
											$_SESSION["errores"]["malIngresados"] = false;
										}
										if(isset($_SESSION["errores"]["internoLogear"]) && $_SESSION["errores"]["internoLogear"]){
											echo '<br><p style="color:red">Rellena todos los campos.</p>';
											$_SESSION["errores"]["internoLogear"] = false;
										}
										?>
										<br>
										<button class="btn btn-primary">Iniciar sesión</button>
										<br>
									</form>
								</div>
							</div>
						</div>
						<br>
					</div>

					<div class="col-md-6">
						<div class="panel panel-primary" <?php if(!esMobil($uagent_obj)){ echo 'style="margin: auto;width: 90%;padding: 00px;"';} ?> >
							<div class="panel-heading">
								<a data-toggle="collapse" href="#collapseCrear">Crear Usuario</a>
							</div>
							<div id="collapseCrear" class="panel-collapse in">
								<div class="panel-body">
									<form action="?url=crearCuenta" <?php if($_SESSION["js"]){ echo 'onsubmit="return crearCuenta()"';} ?> method="post">
										<h3><p style="text-align: center;">Crear Usuario</p></h3>
										<label>Usuario:</label>
										<input type="text" required="" class="form-control" id="Cuser" name="Cuser"/>
										<?php
										if(isset($_SESSION["errores"]["usuarioYaExiste"]) && $_SESSION["errores"]["usuarioYaExiste"]){
											echo '<br><p style="color:blue;">El usuario ya existe.</p><br>';
											$_SESSION["errores"]["usuarioYaExiste"] = false;
										}
										?>
										<label>Contraseña:</label>
										<input type="password" required="" class="form-control" id="Cpass" name="Cpass"/>
										<label>Repita contraseña:</label>
										<input type="password" required="" class="form-control" id="Cpass2" name="Cpass2"/>
										<p id="passNo" <?php if(!(isset($_SESSION["errores"]["clavesCoincidencia"]) && $_SESSION["errores"]["clavesCoincidencia"])){echo 'hidden="true"';} $_SESSION["errores"]["clavesCoincidencia"] = false; ?> style="color:red;">Las contraseñas no coinciden.</p>
										<label>e-Mail:</label>
										<input type="email" required="" class="form-control" id="Cmail" name="Cmail"/>
										<br>
										<?php
										if(isset($_SESSION["errores"]["mailCreacion"]) && $_SESSION["errores"]["mailCreacion"]){
											echo '<br><p style="color:red;">Ingrese un e-Mail valido</p><br>';
											$_SESSION["errorMail"] = false;
										}
										if(isset($_SESSION["errores"]["mailCreacion"]) && $_SESSION["errores"]["mailCreacion"]){
											echo '<br><p style="color:red;">Rellene todos los campos</p><br>';
											$_SESSION["errores"]["camposCrear"] = false;
										}
										?>
										<button class="btn btn-primary">Crear cuenta</button>
										<br>
										<?php
										if(isset($_SESSION["errores"]["usuarioCreado"]) && $_SESSION["errores"]["usuarioCreado"]){
											echo '<br><p style="color:blue;">Usuario creado satisfactoriamente.</p>';
											$_SESSION["errores"]["usuarioCreado"] = false;
										}
										if(isset($_SESSION["errores"]["usuarioNoCreado"]) && $_SESSION["errores"]["usuarioNoCreado"]){
											echo '<br><p style="color:blue;">Ocurrio un problema creando el usuario.</p>';
											$_SESSION["errores"]["usuarioNoCreado"] = false;
										}
										if(isset($_SESSION["errores"]["internoCreacion"]) && $_SESSION["errores"]["internoCreacion"]){
											echo '<br><p style="color:red;">Ha ocurrido un problema interno. Intentelo mas tarde.</p>';
											$_SESSION["errores"]["internoCreacion"] = false;
										}
										?>
									</form>
								</div>
							</div>
						</div>
						<br>
					</div>
					<?php
				}
				?>

			</div>
		</div>
	</body>
</html>
