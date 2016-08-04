<?php
$_SESSION["js"] = false;
$_SESSION["togglejs"] = false;
?>
<meta http-equiv="refresh" content="0;URL=?p=<?php if(isset($_GET["redireccionar"])){echo $_GET["redireccionar"];} else{echo "home";} ?>" />
