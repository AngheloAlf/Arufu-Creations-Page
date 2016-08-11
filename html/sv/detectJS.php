<?php

function A_detectJS($redireccionar){
	$irANoJS = '<noscript><meta http-equiv="refresh" content="0;URL=?s=noJS&redireccionar='.$redireccionar.'" /></noscript>';
	$irASiJS = '<script type="text/javascript">window.location = "?s=siJS&redireccionar='.$redireccionar.'"</script>';
	if(!isset($_SESSION["js"])){
		$_SESSION["js"] = true;
		$_SESSION["togglejs"] = true;
		echo $irANoJS;
	}
	else{
		if(!$_SESSION["togglejs"]){
			echo $irASiJS;
		}
		elseif($_SESSION["js"]){
			echo $irANoJS;
		}
	}
}
?>
