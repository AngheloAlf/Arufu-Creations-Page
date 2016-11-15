<?php

//ErrorDocument 404 http://localhost/arufucreations/?p=404
//FallbackResource /arufucreations/index.php

require_once("sv/common.php");
require ('sv/initPage.php');
include ('includes/head.phtml');

if(isset($_GET['wip']) && !empty($_GET['wip']) && ($_GET['wip'] != 'false')){
	require ('url/wipPage.phtml');
}
elseif(isset($_GET['s']) && !empty($_GET['s'])){ //Carga scripts
	if(isset($_GET['wip']) && ($_GET['wip'] == 'false')){
		require ('url/wipPage.phtml');
	}
	
	$pagina = 'sv/'.$_GET['s'].'.php';
	if(file_exists($pagina)){
		require ($pagina);
	}
	elseif(!(isset($_GET['wip']) && ($_GET['wip'] == 'false'))){
		require ('url/404.phtml');
	}
}
elseif(isset($_GET['p']) && !empty($_GET['p'])){ //Carga paginas con front-end
	if(isset($_GET['wip']) && ($_GET['wip'] == 'false')){
		require ('url/wipPage.phtml');
	}

	$pagina = 'url/'.$_GET['p'].'.phtml';
	if(file_exists($pagina)){
		require ($pagina);
	}
	elseif(!(isset($_GET['wip']) && ($_GET['wip'] == 'false'))){
		require ('url/404.phtml');
	}
}
else{
	require ('url/home.phtml');
}
/*

echo "HTTP_HOST ". $_SERVER['HTTP_HOST'];
echo "<br>";
echo "REQUEST_URI ".$_SERVER['REQUEST_URI'];
echo "<br>";
echo stristr($_SERVER['REQUEST_URI'], $_SESSION["configPage"]["subFolder"]);
echo "<br>";
$a = stripos($_SERVER['REQUEST_URI'], $_SESSION["configPage"]["subFolder"]);
echo $a;
echo "<br>";
print_r(explode("/", substr($_SERVER['REQUEST_URI'], strlen( $_SESSION["configPage"]["subFolder"]))));
echo "<br>";
print_r(explode("/", $_SERVER['REQUEST_URI']));
echo "<br>";
print_r(explode("/", $_SESSION["configPage"]["subFolder"]));
echo "<br>";
if(count(explode("/", $_SERVER['REQUEST_URI'])) > count(explode("/", $_SESSION["configPage"]["subFolder"]))){
	if(explode("/", $_SERVER['REQUEST_URI'])[count(explode("/", $_SESSION["configPage"]["subFolder"]))] != ""){
		$pagina = explode("/", $_SERVER['REQUEST_URI'])[count(explode("/", $_SESSION["configPage"]["subFolder"]))];
		echo "Cargar ".$pagina;
		$pagina = $_SESSION["configPage"]["subFolder"]."/url/".$pagina.".phtml";
		echo "<br>";
		echo $pagina;
		if(file_exists($pagina)){
			echo "cargado";
			require ($pagina);
		}
	}
	else{
		echo "Cargar home";
	}
}
else{
	echo "cargar home";
}
*/
//print_r(parse_url("http://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI']));

include ('includes/footer.phtml');

?>
