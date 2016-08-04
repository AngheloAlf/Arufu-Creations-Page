<?php
require_once("sv/common.php");
require ('sv/initPage.php');
include ('url/head.phtml');

if(isset($_GET['s']) && !empty($_GET['s'])){ //Carga scripts
	$pagina = 'url/'.$_GET['s'].'.php';
	if(isset($_GET['wip']) && !empty($_GET['wip'])){
		require ('url/wipPage.phtml');
	}
	elseif(file_exists($pagina)){
		require ($pagina);
	}
	else{
		require ('url/404.phtml');
	}
}
elseif(isset($_GET['p']) && !empty($_GET['p'])){ //Carga paginas con front-end
	$pagina = 'url/'.$_GET['p'].'.phtml';
	if(isset($_GET['wip']) && !empty($_GET['wip'])){
		require ('url/wipPage.phtml');
	}
	elseif(file_exists($pagina)){
		require ($pagina);
	}
	else{
		require ('url/404.phtml');
	}
}
else{
	require ('url/home.phtml');
}

include ('url/footer.phtml');

?>

