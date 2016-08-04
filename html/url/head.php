<?php

require "common.php";
require "mdetect.php";
require "configPage.php";
require "detectJS.php";

$uagent_obj = new uagent_info();

if(!isset($_SESSION["logeado"])){
	$_SESSION["logeado"] = false;
}

if(isset($_GET["redireccionar"])){
	$redireccionar = $_GET["redireccionar"];
}
else{
	$redireccionar = "home";
	if(isset($_GET["url"])){
		$redireccionar = $_GET["url"];
	}
}

A_detectJS($redireccionar);

/*
if(!isset($_SESSION["js"])){
	$_SESSION["js"] = true;
	$_SESSION["togglejs"] = true;
	$redireccionar = "home";
	if(isset($_GET["url"])){
		$redireccionar = $_GET["url"];
	}
	?>
	<noscript>
		<meta http-equiv="refresh" content="0;URL=?url=noJS&redireccionar=<?php echo $redireccionar; ?>" />
	</noscript>
	<?php
}
else{
	if(isset($_GET["redireccionar"])){
		$redireccionar = $_GET["redireccionar"];
	}
	else{
		$redireccionar = "home";
		if(isset($_GET["url"])){
			$redireccionar = $_GET["url"];
		}
	}
	if(!$_SESSION["togglejs"]){
		?>
		<script type="text/javascript">
			window.location = "?url=siJS&redireccionar=<?php echo $redireccionar; ?>"
		</script>
		<?php
	}
	else{
		?>
		<noscript>
			<meta http-equiv="refresh" content="0;URL=?url=noJS&redireccionar=<?php echo $redireccionar; ?>" />
		</noscript>
		<?php
	}
}
*/

?>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/w3.css" rel="stylesheet">
	<link href="css/common.css" rel="stylesheet">
	<?php
	if($_SESSION["js"]){
		?>
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/common.js"></script>
		<?php
	}
	?>
	<title>Arufu Creations</title>

	<body style="background-color:gainsboro">
		<div class="text-center" style="padding-top:10px">
			<h1>Arufu Creations</h1>
			<h3>Bienvenido <?php if($_SESSION["logeado"]){ echo $_SESSION["user"];} ?></h3>
			<?php
			if(!$_SESSION["js"]){
				echo "<br><h6>Su navegador parece no ser compatible con JavaScript.<br> Puede que algunas caracteristicas de esta pagina no funcionen como deberian.</h6>";
			}
			?>
		</div>
		<?php include 'topnav.php'; ?>
		<br>
	</body>

</head>

<?php
autoRedirect('head.php', 'index.php');
?>
