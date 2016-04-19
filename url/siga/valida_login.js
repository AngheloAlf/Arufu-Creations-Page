///////////////////////////////////////////////////////////////
function valida_rut(r, r2, d2, texto) {
	rut_val = r.value;
	if ( rut_val.length == 0 )
	{
		alert( "Ingrese su " + texto);
		r.focus();
		return false;
	}
	if ( !checkR(r, texto) )
	{
		return false;
	}

	var tmpstr = "";
	for ( i=0; i < rut_val.length ; i++ )
		if ( rut_val.charAt(i) != ' ' && rut_val.charAt(i) != '.' && rut_val.charAt(i) != '-' )
			tmpstr = tmpstr + rut_val.charAt(i);
	rut_val = tmpstr;
	rut_valor = rut_val.substring(0,rut.length);
        if ( rut_valor > 10000000000)
	{
		alert( "El " + texto + " no es válido.");
		r.value = "";
		r.focus();
		return false;
	}
	r2.value = rut_val.substring(0,rut.length);
	d2.value = rut_val.substring(rut.length,rut.length+1);
	if (d2.value == "k") d2.value = "K";
	r.value = "";
        return true;
}

///////////////////////////////////////////////////////////////

function checkR(r, texto)
{
	rut = r.value;
	var tmpstr = "";
	for ( i=0; i < rut.length ; i++ )
		if ( rut.charAt(i) != ' ' && rut.charAt(i) != '.' && rut.charAt(i) != '-' )
			tmpstr = tmpstr + rut.charAt(i);
	rut = tmpstr;

	largo = rut.length;

	tmpstr = "";
	for ( i=0; rut.charAt(i) == '0' ; i++ );
		for (; i < rut.length ; i++ )
			tmpstr = tmpstr + rut.charAt(i);
	rut = tmpstr;
	largo = rut.length;

	if ( largo < 2 )
	{
          alert("Debe ingresar el " + texto + " completo.");
          r.focus();
          r.value = "";
          return false;
        }
        for (i=0; i < largo ; i++ )
        {
          if ( rut.charAt(i) != "0" && rut.charAt(i) != "1" && rut.charAt(i) !="2" && rut.charAt(i) != "3" && rut.charAt(i) != "4" && rut.charAt(i) !="5" && rut.charAt(i) != "6" && rut.charAt(i) != "7" && rut.charAt(i) !="8" && rut.charAt(i) != "9" && rut.charAt(i) !="k" && rut.charAt(i) != "K" )
          {
          alert("El " + texto + " no es válido.");
          r.focus();
          r.value = "";
          return false;
        }
        }
        var invertido = "";
        for ( i=(largo-1),j=0; i>=0; i--,j++ )
          invertido = invertido + rut.charAt(i);
        var drut = "";
        drut = drut + invertido.charAt(0);
        drut = drut + '-';
        cnt = 0;

        if ( texto.substring(0,3) == 'RUT') {
          for ( i=1,j=2; i<largo; i++,j++ )
          {
            if ( cnt == 3 )
            {
            drut = drut + '.';
            j++;
            drut = drut + invertido.charAt(i);
            cnt = 1;
          }
          else
          {
            drut = drut + invertido.charAt(i);
            cnt++;
          }
          }
        }

        if ( texto == 'ROL') {
          k = 1;
          for ( i=1,j=2; i<largo; i++,j++ )
          {
            if ( (k == 1 && cnt == 3) || (k == 2 && cnt == 2) )
            {
            drut = drut + '.';
            j++;
            drut = drut + invertido.charAt(i);
            cnt = 1;
            k++;
          }
          else
          {
            drut = drut + invertido.charAt(i);
            cnt++;
          }
          }
        }
	invertido = "";
	for ( i=(drut.length-1),j=0; i>=0; i--,j++ )
		invertido = invertido + drut.charAt(i);
        // alert(invertido);
	r.value = invertido;
	if ( checkDVR(rut, r, texto) )
		return true;
	return false;
}

///////////////////////////////////////////////////////////////

function checkDVR( v, r, texto )
{
	crut = v;
	largo = crut.length;
	if ( largo < 2 )
	{
		alert("Debe ingresar el " + texto + " completo.");
		r.focus();
		r.value = "";
		return false;
	}
	if ( largo > 2 )
		rut = crut.substring(0, largo - 1);
	else
		rut = crut.charAt(0);
	dv = crut.charAt(largo-1);
	checkCDVR( dv, r );
	if ( rut == null || dv == null )
		return 0;
	var dvr = '0';
	suma = 0;
	mul = 2;
	for (i= rut.length -1 ; i >= 0; i--)
	{
		suma = suma + rut.charAt(i) * mul;
		if (mul == 7)
			mul = 2;
		else
			mul++;
	}
	res = suma % 11;
	if (res==1)
		dvr = 'k';
	else if (res==0)
		dvr = '0';
	else
	{
		dvi = 11-res;
		dvr = dvi + "";
	}

	if ( dvr != dv.toLowerCase() )
	{
		alert("El " + texto + " es incorrecto.");
		r.focus();
		r.value = "";
		return false;
	}
	return true;
}

///////////////////////////////////////////////////////////////

function checkCDVR( dvr, r )
{
	dv = dvr + "";
	if ( dv != '0' && dv != '1' && dv != '2' && dv != '3' && dv != '4' && dv != '5' && dv != '6' && dv != '7' && dv != '8' && dv != '9' && dv != 'k'  && dv != 'K')
	{
		alert("Debe ingresar un dígito verificador válido.");
		r.focus();
		r.value = "";
		return false;
	}
	return true;
}

///////////////////////////////////////////////////////////////
// PARA LOGIN
///////////////////////////////////////////////////////////////
function valida(f) {
	rut_val = f.rut_aux.value;
	clave = f.clave_aux.value;
	if ( rut_val.length == 0 )
	{
		alert( "Ingrese su RUT");
		f.rut_aux.focus();
		return;
	}
	if ( clave.length == 0 )
	{
		alert( "Ingrese su Clave.");
		f.clave_aux.focus();
		return;
	}
	if ( !checkRutField(f.rut_aux.value, f) )
	{
		return;
	}
	if ( clave.length < 4 && clave.length > 8 )
	{
		alert("La clave debe poseer un largo mínimo de 4 dígitos y máximo de 8 dígitos.");
		f.clave_aux.focus();
		f.clave_aux.select();
		return;
	}
	f.password.value = f.clave_aux.value;
	var tmpstr = "";
	for ( i=0; i < rut_val.length ; i++ )
		if ( rut_val.charAt(i) != ' ' && rut_val.charAt(i) != '.' && rut_val.charAt(i) != '-' )
			tmpstr = tmpstr + rut_val.charAt(i);
	rut_val = tmpstr;
	rut_valor = rut_val.substring(0,rut.length);
	if ( rut_valor > 10000000000)
	{
		alert( "El RUT no es válido.");
		// f.rut_aux.value = "";
		f.clave_aux.value = "";
		f.rut_aux.focus();
		return;
	}
	f.rut_usuario.value = rut_val.substring(0,rut.length);
	f.dv_rut_usuario.value = rut_val.substring(rut.length,rut.length+1);
	if (f.dv_rut_usuario.value == "k") f.dv_rut_usuario.value = "K";
	f.rut_aux.value = "";
	f.clave_aux.value = "";
	f.submit();
}

///////////////////////////////////////////////////////////////

function checkRutField(rut, f)
{
	var tmpstr = "";

	for ( i=0; i < rut.length ; i++ )
		if ( rut.charAt(i) != ' ' && rut.charAt(i) != '.' && rut.charAt(i) != '-' )
			tmpstr = tmpstr + rut.charAt(i);
	rut = tmpstr;
	largo = rut.length;

	tmpstr = "";
	for ( i=0; rut.charAt(i) == '0' ; i++ );
		for (; i < rut.length ; i++ )
			tmpstr = tmpstr + rut.charAt(i);
	rut = tmpstr;
	largo = rut.length;

	if ( largo < 2 )
	{
		alert("Debe ingresar el RUT completo.");
		f.rut_aux.focus();
		f.rut_aux.select();
		return false;
	}

	for (i=0; i < largo ; i++ )
	{
		if ( rut.charAt(i) != "0" && rut.charAt(i) != "1" && rut.charAt(i) !="2" && rut.charAt(i) != "3" && rut.charAt(i) != "4" && rut.charAt(i) !="5" && rut.charAt(i) != "6" && rut.charAt(i) != "7" && rut.charAt(i) !="8" && rut.charAt(i) != "9" && rut.charAt(i) !="k" && rut.charAt(i) != "K" )
		{
			alert("El RUT no es válido.");
                        error = 1;
			f.rut_aux.focus();
			f.rut_aux.select();
			return false;
		}
	}
	var invertido = "";
	for ( i=(largo-1),j=0; i>=0; i--,j++ )
		invertido = invertido + rut.charAt(i);
	var drut = "";
	drut = drut + invertido.charAt(0);
	drut = drut + '-';
	cnt = 0;
	for ( i=1,j=2; i<largo; i++,j++ )
	{
		if ( cnt == 3 )
		{
			drut = drut + '.';
			j++;
			drut = drut + invertido.charAt(i);
			cnt = 1;
		}
		else
		{
			drut = drut + invertido.charAt(i);
			cnt++;
		}
	}
	invertido = "";
	for ( i=(drut.length-1),j=0; i>=0; i--,j++ )
		invertido = invertido + drut.charAt(i);
	f.rut_aux.value = invertido;


        if ( checkDV(rut, f) )
	 return true;
	return false;

}

///////////////////////////////////////////////////////////////

function checkDV( crut, f )
{
	largo = crut.length;
	if ( largo < 2 )
	{
		alert("Debe ingresar el RUT completo.");
		f.rut_aux.focus();
		f.rut_aux.select();
		return false;
	}
	if ( largo > 2 )
		rut = crut.substring(0, largo - 1);
	else
		rut = crut.charAt(0);
	dv = crut.charAt(largo-1);
	checkCDV( dv, f );
	if ( rut == null || dv == null )
		return 0;
	var dvr = '0';
	suma = 0;
	mul = 2;
	for (i= rut.length -1 ; i >= 0; i--)
	{
		suma = suma + rut.charAt(i) * mul;
		if (mul == 7)
			mul = 2;
		else
			mul++;
	}
	res = suma % 11;
	if (res==1)
		dvr = 'k';
	else if (res==0)
		dvr = '0';
	else
	{
		dvi = 11-res;
		dvr = dvi + "";
	}
	if ( dvr != dv.toLowerCase() )
	{
		alert("EL RUT es incorrecto.");
		f.rut_aux.focus();
		// f.rut_aux.value = "";
		return false;
	}
	return true;
}

///////////////////////////////////////////////////////////////

function checkCDV( dvr, f )
{
	dv = dvr + "";
	if ( dv != '0' && dv != '1' && dv != '2' && dv != '3' && dv != '4' && dv != '5' && dv != '6' && dv != '7' && dv != '8' && dv != '9' && dv != 'k'  && dv != 'K')
	{
		alert("Debe ingresar un dígito verificador válido.");
		f.rut_aux.focus();
		f.rut_aux.select();
		return false;
	}
	return true;
}

///////////////////////////////////////////////////////////////

function formatear_numero2(numero)
{
	var nroFormateado = '';
	var indice=0;
	var band=false;
	var numero2 = new String(numero);
	for (i=0;i<=numero2.length && indice<=2;i++){
		if ( numero2.charAt(i)=="." || numero2.charAt(i)==","){
			nroFormateado = formato_miles(nroFormateado) + ",";
			band=true;
		}else{
			nroFormateado = nroFormateado +  numero2.charAt(i);
		}
		if(band)
			indice++;
	}
	return nroFormateado;
}

///////////////////////////////////////////////////////////////

function numeros()
{
if (document.all)
 {
  t=event.keyCode;
  if ((t>=48 && t<=57) || t==8 )
    {t=0}
  else
   {event.keyCode= 0;}
 }
}

///////////////////////////////////////////////////////////////

function esDigito(sChr){
  var sCod = sChr.charCodeAt(0);
  return ((sCod > 47) && (sCod < 58));
}

///////////////////////////////////////////////////////////////

function valSep(oTxt){
  var bOk = false;
  bOk = bOk || ((oTxt.value.charAt(2) == "-") && (oTxt.value.charAt(5) == "-"));
  bOk = bOk || ((oTxt.value.charAt(2) == "/") && (oTxt.value.charAt(5) == "/"));
  return bOk;
}

///////////////////////////////////////////////////////////////

function finMes(oTxt){
  var nMes = parseInt(oTxt.value.substr(3, 2), 10);
  var nRes = 0;
  switch (nMes){
    case 1: nRes = 31; break;
    case 2: nRes = 29; break;
    case 3: nRes = 31; break;
    case 4: nRes = 30; break;
    case 5: nRes = 31; break;
    case 6: nRes = 30; break;
    case 7: nRes = 31; break;
    case 8: nRes = 31; break;
    case 9: nRes = 30; break;
    case 10: nRes = 31; break;
    case 11: nRes = 30; break;
    case 12: nRes = 31; break;
  }
  return nRes;
}

///////////////////////////////////////////////////////////////

function valDia(oTxt){
  var bOk = false;
  var nDia = parseInt(oTxt.value.substr(0, 2), 10);
  bOk = bOk || ((nDia >= 1) && (nDia <= finMes(oTxt)));
  return bOk;
}

///////////////////////////////////////////////////////////////

function valMes(oTxt){
  var bOk = false;
  var nMes = parseInt(oTxt.value.substr(3, 2), 10);
  bOk = bOk || ((nMes >= 1) && (nMes <= 12));
  return bOk;
}

///////////////////////////////////////////////////////////////

function valAno(oTxt){
  var bOk = true;
  var nAno = oTxt.value.substr(6);
  bOk = bOk && ((nAno.length == 2) || (nAno.length == 4));
  if (bOk){
    for (var i = 0; i < nAno.length; i++){
      bOk = bOk && esDigito(nAno.charAt(i));
    }
  }
  return bOk;
}

///////////////////////////////////////////////////////////////

function valFecha(oTxt, tipo){
  var bOk = true;
  if (oTxt.value != ""){
    bOk = bOk && (valAno(oTxt));
    bOk = bOk && (valMes(oTxt));
    bOk = bOk && (valDia(oTxt));
    bOk = bOk && (valSep(oTxt));
    if (!bOk){
      if (tipo == 1) {
        alert("Fecha inválida");
        oTxt.value = "";
        oTxt.focus();
      }
      if (tipo == 2) { // fecha de inicio en periodo.jsp (sistmat)
        document.getElementById("f1").innerHTML = "&nbsp;(*)";
        document.getElementById("f2").innerHTML = "&nbsp;";
        alert("        La fecha de inicio es inválida.\n El formato de la fecha es dd/mm/aaaa.  ");
        oTxt.value = "";
        oTxt.focus();
      }
      if (tipo == 3) { // fecha de término en periodo.jsp (sistmat)
        document.getElementById("f1").innerHTML = "&nbsp;";
        document.getElementById("f2").innerHTML = "&nbsp;(*)";
        alert("        La fecha de término es inválida.\n El formato de la fecha es dd/mm/aaaa.  ");
        oTxt.value = "";
        oTxt.focus();
      }
    }
  }
}

function valida_rut2(r, r2, d2, texto) {
        rut_val = r.value;

        if ( !checkR(r, texto) )
        {
                return false;
        }

        var tmpstr = "";
        for ( i=0; i < rut_val.length ; i++ )
                if ( rut_val.charAt(i) != ' ' && rut_val.charAt(i) != '.' && rut_val.charAt(i) != '-' )
                        tmpstr = tmpstr + rut_val.charAt(i);
        rut_val = tmpstr;
        rut_valor = rut_val.substring(0,rut.length);
        if ( rut_valor > 10000000000)
        {
                alert( "El " + texto + " no es válido.");
                r.value = "";
                r.focus();
                return false;
        }
        r2.value = rut_val.substring(0,rut.length);
        d2.value = rut_val.substring(rut.length,rut.length+1);
        if (d2.value == "k") d2.value = "K";
        return true;
}
///////////////////////////////////////////////////////////////