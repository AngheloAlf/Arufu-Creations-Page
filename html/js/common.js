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
	return WIP() && revisarPassword(document.getElementsByID('Cpass').value, document.getElementsByID('Cpass2').value) && revisarMail(document.getElementsByID('Cmail').value);
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
