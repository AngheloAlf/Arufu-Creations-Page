<?php
include ('url/head.php');

if(isset($_GET['url']) && !empty($_GET['url'])){
	$pagina = 'url/'.$_GET['url'].'.php';
	if(isset($_GET['wip']) && !empty($_GET['wip'])){
		require ('url/wipPage.php');
	}
	elseif(file_exists($pagina)){
		require ($pagina);
	}
	else{
		require ('url/404.php');
	}
}
else{
	require ('url/home.php');
}

include ('url/footer.php');

?>

