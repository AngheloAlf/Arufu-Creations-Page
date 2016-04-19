<?php
$_SESSION["js"] = true;
$_SESSION["togglejs"] = true;
?>
<script type="text/javascript">
	window.location = "?url=<?php if(isset($_GET["redireccionar"])){echo $_GET["redireccionar"];} else{echo "home";} ?>"
</script>