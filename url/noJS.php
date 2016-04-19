<?php
$_SESSION["js"] = false;
$_SESSION["togglejs"] = false;
?>
<meta http-equiv="refresh" content="0;URL=?url=<?php if(isset($_GET["redireccionar"])){echo $_GET["redireccionar"];} else{echo "home";} ?>" />