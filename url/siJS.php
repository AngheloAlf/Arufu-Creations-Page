<?php
$_SESSION["js"] = true;
$_SESSION["togglejs"] = true;
?>
<script type="text/javascript">
	window.location = "?url=<?php echo $_GET["redireccionar"]; ?>"
</script>