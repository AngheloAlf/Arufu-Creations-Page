<?php

function A_detectJS($redireccionar){
	if(!isset($_SESSION["js"])){
		$_SESSION["js"] = true;
		$_SESSION["togglejs"] = true;
		?>
		<noscript>
			<meta http-equiv="refresh" content="0;URL=?s=noJS&redireccionar=<?php echo $redireccionar; ?>" />
		</noscript>
		<?php
	}
	else{
		if(!$_SESSION["togglejs"]){
			?>
			<script type="text/javascript">
				window.location = "?s=siJS&redireccionar=<?php echo $redireccionar; ?>"
			</script>
			<?php
		}
		elseif($_SESSION["js"]){
			?>
			<noscript>
				<meta http-equiv="refresh" content="0;URL=?s=noJS&redireccionar=<?php echo $redireccionar; ?>" />
			</noscript>
			<?php
		}
	}
}
?>
