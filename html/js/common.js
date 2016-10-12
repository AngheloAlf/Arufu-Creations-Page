function WIP(){
    alert("WIP\nLa pagina esta en construccion");
    return false;
}

function digitoVerificador(sinGuion){ //Algoritmo para generar el digito verificador de el rut
	var contador = 2;
	var suma = 0;
	for(var i = sinGuion.length - 1; i >= 0; i--){
		suma += parseInt(sinGuion[i])*contador++;
		if(contador > 7){
			contador = 2;
		}
	}
	verificador = 11 - suma%11;
	if(verificador == 10){
		return "k";
	}
	if(verificador == 11){
		return "0";
	}
	return verificador.toString();
}

function rutCorrecto(rutCompleto){
	var rut = rutCompleto.split("-");
	if(digitoVerificador(rut[0]) == rut[1]){
		return true;
	}
	else{
		alert("El Rut "+rutCompleto+" no es valido.");
		return false;
	}
}

function generarDV(){
	var rut = document.getElementById("rutDV").value;
	if(!(/^[0-9]+$/.test(rut))){
		alert("Porfavor escriba su rut sin puntos, espacios ni su digito verificador.");
		return false;
	}
	document.getElementById("DV").innerHTML = "<br>Su rut es "+rut+"-"+digitoVerificador(rut);
}

function rutValido(cualRevisar){
	return rutCorrecto(document.forms[cualRevisar]["rut"].value);
}

function generarRamos(){
	var cantRamos = parseInt(document.getElementById("cantRamos").value);
	if(cantRamos <= 0 || isNaN(cantRamos)){
		for(var i = 0; i < 200; i++){
			document.getElementById( "ramo"+(i.toString()) ).setAttribute("hidden", "");
		}
		$('#collapseRamos').collapse("hide");
		//document.getElementById("panelRamos").setAttribute("hidden", "");
		return false;
	}
	//document.getElementById("panelRamos").removeAttribute("hidden");
	$('#collapseRamos').collapse("show");
	for(var i = 0; i < 200; i++){
		if(i < cantRamos){
			document.getElementById("ramo"+(i.toString())).removeAttribute("hidden");
		}
		else{
			document.getElementById("ramo"+(i.toString())).setAttribute("hidden", "");
		}
	}
	return true;
}

function calcularPrioridad(notaXcreditos, semestres, creditosAprobados, creditosTotales, FAE){
	var prioridad = (notaXcreditos/(14*Math.pow(semestres, 1.06)))*(creditosAprobados/creditosTotales)*FAE*100;
	if(isNaN(prioridad)){
		prioridad = 0;
	}
	return prioridad;
}

function calcularRAP(notaXcreditos, creditosTotales){
	var RAP = notaXcreditos/creditosTotales;
	if(isNaN(RAP)){
		RAP = 0;
	}
	return RAP;
}

function calcularLA(RAP, creditosAprobados, creditosTotales){
	var LA = RAP*creditosAprobados/creditosTotales;
	if(isNaN(LA)){
		LA = 0;
	}
	return LA;
}

function calcularAA(creditosAprobados, semestres){
	var AA = creditosAprobados/semestres;
	if(isNaN(AA)){
		AA = 0;
	}
	return AA;
}

function calcularnotaXcreditos(cantRamos){
	var notaI;
	var creditosI;
	var notaXcreditos = 0;
	var creditosAprobados = 0;
	var creditosTotales = 0;
	for(var i = 0; i < cantRamos; i++){
		creditosI = parseInt(document.getElementById("creditos"+i.toString()).value);
		notaI = document.getElementById("nota"+i.toString()).value;
		if(/^0*[s|S]0*$/.test(notaI)){
			creditosAprobados += creditosI;
		}
		else if(!/^[0-9]+$/.test(notaI)){

		}
		else{
			notaI = parseInt(notaI);
			if(notaI >= 55){
				creditosAprobados += creditosI;
			}
			notaXcreditos += notaI*creditosI;
		}
		creditosTotales += creditosI;
	}
	return [notaXcreditos, creditosAprobados, creditosTotales];
}

function calcularIndicadores(){
	var cantRamos = parseInt(document.getElementById("cantRamos").value);
	var semestres = parseFloat(document.getElementById("semestres").value);
	var FAE = document.getElementById("FAE").value;
	if(cantRamos <= 0 || cantRamos > 200){
		alert("Ingrese una cantidad valida de ramos.");
		return 0;
	}
	if(!/^[0-9]*[.]?[0-9]*$/.test(FAE)){
		alert("Ingrese un FAE valido.");
		return false;
	}
	if(semestres < 0){
		alert("Ingrese una cantidad valida de semestres.");
		return false;
	}
	FAE = parseFloat(FAE);

	var temporal = calcularnotaXcreditos(cantRamos);
	var notaXcreditos = temporal[0];
	var creditosAprobados = temporal[1];
	var creditosTotales = temporal[2];

	var prioridad = calcularPrioridad(notaXcreditos, semestres, creditosAprobados, creditosTotales, FAE);
	document.getElementById("prioridad").innerHTML = "<br>Su prioridad academica (PA) es: "+prioridad.toString();
	document.getElementById("prioridad").removeAttribute("hidden");
	var RAP = calcularRAP(notaXcreditos, creditosTotales);
	document.getElementById("RAP").innerHTML = "<br>Su rendimiento academico ponderado (RAP) es: "+RAP.toString();
	//document.getElementById("RAP").removeAttribute("hidden");
	var LA = calcularLA(RAP, creditosAprobados, creditosTotales);
	document.getElementById("LA").innerHTML = "<br>Su LA es: "+LA.toString();
	//document.getElementById("LA").removeAttribute("hidden");
	var AA = calcularAA(creditosAprobados, semestres);
	document.getElementById("AA").innerHTML = "<br>Su avance academico (AA) es: "+AA.toString();
	//document.getElementById("AA").removeAttribute("hidden");
	return prioridad;
}

function revisarPassword(pass1, pass2){
	if(pass1 == pass2){
		return true;
	}
	alert("Las contraseñas no coinciden.");
	return false;
}

function revisarMail(mail){
	if(/^[a-zA-Z0-9._]+@[a-zA-Z0-9._]+.[a-zA-Z0-9.]+$/.test(mail)){
		return true;
	}
	alert("El e-Mail no es valido");
	return false;
}

function crearCuenta(){
	return revisarPassword(document.getElementById('Cpass').value, document.getElementById('Cpass2').value) && revisarMail(document.getElementById('Cmail').value);
}

function easter_eggColor(){
	document.getElementById("easter_egg").style.backgroundColor = "white";
	document.getElementById("easter_egg").style.backgroundImage = "";
	document.getElementById("easter_egg2").style.opacity = "1.0";
	document.getElementById("easter_egg3").style.opacity = "1.0";
	document.getElementById("easter_egg4").style.opacity = "1.0";
	document.getElementById("easter_egg5").style.opacity = "1.0";
}

function easter_eggImage(){
	document.getElementById("easter_egg").style.backgroundImage = "url('resources/konga.gif')";
	document.getElementById("easter_egg").style.backgroundSize = "70px 70px";
	document.getElementById("easter_egg2").style.opacity = "0.6";
	document.getElementById("easter_egg3").style.opacity = "0.7";
	document.getElementById("easter_egg4").style.opacity = "0.7";
	document.getElementById("easter_egg5").style.opacity = "0.7";
}

function buscarConGoogle(){
	var q = document.getElementById("q").value;
	var busq = q.replace(/\s+/," ");
	window.location = " https://www.google.cl/?gws_rd=ssl#safe=off&q="+busq;
}

function generarFibonacci(cantidad, conCero){
	var numerosFibonacci = [];
	if(cantidad < 0){
		return -1;
	}
	if(cantidad >= 1){
		if(!conCero){
			numerosFibonacci.push(1);
		}
		else{
			numerosFibonacci.push(0);
		}
	}
	if(cantidad >= 2){
		numerosFibonacci.push(1);
	}
	var uno, dos, total;
	for(var i = 3; i <= cantidad; i++){
		uno = numerosFibonacci[numerosFibonacci.length - 2];
		dos = numerosFibonacci[numerosFibonacci.length - 1];
		total = uno + dos;
		numerosFibonacci.push(total);
		if(total == Infinity){
			break;
		}
	}
	return numerosFibonacci;
}

function ponerFibonacci(){
	var cantidad = document.getElementById("numFib").value;
	var conCero = document.getElementById("conCero").checked;
	document.getElementById("fiboGene").innerHTML = generarFibonacci(cantidad, conCero);
}

function generarTablaFibonacci(){
	//$('#fiboGene').collapse("hide");
	var cantidad = document.getElementById("numFib").value;
	var conCero = document.getElementById("conCero").checked;
	var uno, dos, tres, achetemele;
	achetemele = "<table><th>Posicion</th><th>Número</th>";
	if(cantidad < 0){
		return -1;
	}
	if(cantidad >= 1){
		if(!conCero){
			uno = 1;
		}
		else{
			uno = 0;
		}
		achetemele += "<tr><td>1</td><td>"+uno+"</td></tr>";
	}
	if(cantidad >= 2){
		dos = 1;
		achetemele += "<tr><td>2</td><td>"+dos+"</td></tr>";
	}
	for(var i = 3; i <= cantidad; i++){
		tres = uno + dos;
		achetemele += "<tr><td>"+i+"</td><td>"+tres+"</td></tr>";
		if(tres == Infinity){
			break;
		}
		uno = dos;
		dos = tres;
	}
	achetemele += "</table>";
	document.getElementById("fiboGene").innerHTML = achetemele;
	$('#fiboGene').collapse("show");
}

function abrirSidenav(){
	var sidenav = document.getElementById("sidenav");
	sidenav.style.display = "block";
	for(var i = 0; i < sidenav.classList.length; i++){
		if("mobile" == sidenav.classList[i]){
			sidenav.style.width = "100%";
		}
	}

}
function cerrarSidenav(){
	document.getElementById("sidenav").style.display = "none";
}

function cambioDeTamano(){
	if($(document).width() >= 992){
		abrirSidenav();
	}
	else{
		cerrarSidenav();
	}
}

function revisarClavesOnTheFly(){
	var pass1 = document.getElementById("Cpass").value;
	var pass2 = document.getElementById("Cpass2").value;
	if(pass1 && pass2 && (pass1 != pass2)){
		$('#passNo').collapse("show");
	}
	else{
		$('#passNo').collapse("hide");
	}
}

function testIfNumber(string){
	return /^[0-9]+$/.test(string);
}

function getNumberFromInput(Id){
	var number = document.getElementById(Id).value;
	if(!testIfNumber(number)){
		return 0;
	}
	return parseInt(number);
}

function formulaDanosDofus(danoHechizo, elemento, pot, danos, danosEle){
	if(danoHechizo <= 0){
		return 0;
	}
	return danoHechizo*((elemento + pot + 100)/100) + danos + danosEle;
}

function aplicarResisDanos(danoTotal, resisPor, resisFija){
	if(resisPor >= 100){
		return 0;
	}
	var danoCalculado = danoTotal*((100 - resisPor)/100) - resisFija;
	if(danoCalculado < 0){
		return 0;
	}
	return danoCalculado;
}

function calcularDanos(){
	var cantidadHechizos = getNumberFromInput("cantidadHechizos");
	var danMin, danMax, elemento, pot, danos, danosEle;
	var resisPor, resisFija;
	var totalMin, totalMax;
	var danosMinTotales = new Array();
	var danosMaxTotales = new Array();

	pot = getNumberFromInput("pot");

	for(var i = 0; i < cantidadHechizos; i++){
		danMin = getNumberFromInput("danMin"+i);
		danMax = getNumberFromInput("danMax"+i);
		elemento = getNumberFromInput("elemento"+i);
		danos = getNumberFromInput("danos"+i);
		danosEle = getNumberFromInput("danosEle"+i);

		totalMin = formulaDanosDofus(danMin, elemento, pot, danos, danosEle);
		totalMax = formulaDanosDofus(danMax, elemento, pot, danos, danosEle);

		resisPor = getNumberFromInput("resisPor"+i);
		resisFija = getNumberFromInput("resisFija"+i);

		totalMin = aplicarResisDanos(totalMin, resisPor, resisFija);
		totalMax = aplicarResisDanos(totalMax, resisPor, resisFija);

		totalMin = Math.floor(totalMin);
		totalMax = Math.floor(totalMax);
		danosMinTotales.push(totalMin);
		danosMaxTotales.push(totalMax);
		document.getElementById("danosTotalMin"+i).innerHTML = totalMin;
		document.getElementById("danosTotalMax"+i).innerHTML = totalMax;
	}
	return [danosMinTotales, danosMaxTotales];
}

function cambiarCantidadHechizos(){
	var cantidadHechizos = getNumberFromInput("cantidadHechizos");
}

window.addEventListener("resize", cambioDeTamano);
