

<table width="80%" border="0" cellpadding="2" cellspacing="0">
          <tbody><tr>
            <td width="19%" align="right" valign="baseline" class="ArialBlanca">Usuario</td>
            <td width="1%" valign="baseline">&nbsp;</td>
            <td width="80%" valign="baseline" nowrap="">
              <input name="login" type="TEXT" size="15" maxlength="30" class="Select" onkeypress="enter(event,1)" ismxfilled="1" style="background-color: rgb(250, 255, 189); background-position: initial initial; background-repeat: initial initial;">
              <select name="server" class="Select">
                <option value="alumnos.usm.cl" selected="">@alumnos.usm.cl</option>
                <option value="sansano.usm.cl">@sansano.usm.cl</option>
                <option value="titulados.usm.cl">@titulados.usm.cl</option>
                <option value="postgrado.usm.cl">@postgrado.usm.cl</option>
                <option value="usm.cl">@usm.cl</option>
              </select><br>
              <font class="Cgris" color="#996600">
              Ejemplo: nombre.apellido@usm.cl</font></td>
          </tr>
          <tr>
            <td width="19%" height="50%" align="right" valign="top"><strong class="ArialBlanca">Contraseña<br>
            Email USM</strong></td>
            <td width="1%">&nbsp;</td>
            <td width="80%" nowrap="">
            <input name="passwd" type="password" size="15" maxlength="30" class="Select" onkeypress="enter(event,2)" ismxfilled="1" style="background-color: rgb(250, 255, 189); background-position: initial initial; background-repeat: initial initial;">
            <a href="javascript:ValidaLogin(document.Formulario)" onmouseover="status='Ingresar'; return true;"><img src="imagen/jpg/btn_flecha.gif" alt="Ingresar" width="22" height="20" border="0" align="absmiddle"></a>
            <font color="#996600" onmouseover="JavaScript:CursorOn(this); window.status='¿problemas con su contraseña?'; this.style.color='#F9EAD5'; return true; " onmouseout="JavaScript:CursorOff(this); this.style.color='#996600'; window.status=''; return true; " onclick="JavaScript:ProblemaClave();" class="Cgris">
            &nbsp;&nbsp;<br>
            ¿problemas con su contraseña?</font> </td>
          </tr>
        </tbody></table>