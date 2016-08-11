<?php

if(count($_COOKIE) == 0){
	setcookie("testCookie", "testCookie",  time() + (60 * 60), "/");
}
if(isset($_SESSION["cookiesActivas"]) && $_SESSION["cookiesActivas"]){
	if(isset($_SESSION["setearCookies"])){
		for ($i=0; $i < count($_SESSION["setearCookies"]); $i++) { 
			$ite = $_SESSION["setearCookies"][$i];
			setcookie($ite[0], $ite[1], $ite[2], $ite[3]);
		}
		unset($_SESSION["setearCookies"]);
	}
	
}
?>