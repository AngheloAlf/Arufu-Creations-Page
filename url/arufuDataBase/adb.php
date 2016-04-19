<?php

function getServerUrl(){
	$carpeta = "/";
	$wea = "";
	foreach(explode("/", $_SERVER["REQUEST_URI"]) as $key => $value){
		$carpeta .= $wea;
		if($key > 0){
			$wea = $value."/";
		}
	}
	return "http://{$_SERVER['HTTP_HOST']}".$carpeta;
}

function getMaxID($idArray){
	$max = 0;
	foreach($idArray as $key => $value){
		$numero = intval($value[0]);
		if($numero>$max){
			$max = $numero;
		}
	}
	return $max;
}

class ADBcontainer{
	var $nombre, $heading, $row, $user, $pass;
	function setNameAndPass($id, $user, $pass){
		$this->nombre = $id;
		$this->user = $user;
		$this->pass = $pass;
	}
	function addHeading($j, $th){
		$this->heading[$j] = $th;
	}
	function addRow($k, $td){
		$this->row[$k][] = $td;
	}
	function getHeadingNames(){
		$names = array();
		foreach($this->heading as $key => $value){
			$names[$value] = $key;
		}
		return $names;
	}
}

class ADB{
	var $DBcontainer;
	var $DBerror = "";
	var $showErrors;

	function printearErrores(){
		if($this->showErrors){
			echo $this->DBerror;
		}
	}

	function connect($host, $user, $pass, $nombre, $showErrors = false){
		$DB = fopen($host.$nombre, 'r');
		$this->DBcontainer = new ADBcontainer;
		$this->showErrors = $showErrors;
		$i = 0;
		$j = 0;
		$k = 0;
		$fila = false;
		while(!feof($DB)){
			$linea = trim(preg_replace('/\s+/', ' ', fgets($DB)));
			$line = explode(";", $linea);
			if($i == 0){
				if(!($line[0] == $user && $line[1] == $pass)){
					$this->DBerror = "El usuario o la contraseña no coinciden";
					$this->printearErrores();
					return false;
				}
			}
			elseif($i == 1){
				$this->DBcontainer->setNameAndPass($host.$nombre, $user, $pass);
				foreach($line as $key => $value){
					$th = explode(" ", $value);
					$this->DBcontainer->addHeading($j, $th[0]);
					$j++;
				}
			}
			else{
				foreach($line as $key => $value){
					$this->DBcontainer->addRow($k, $value);
				}
				$k++;
			}
			$i++;
		}
		fclose($DB);
		return true;
	}

	function saveChanges(){
		echo $this->DBcontainer->nombre.".tmp<br>";
		$DB = fopen($this->DBcontainer->nombre.".tmp", 'w');
		if(!$DB){
			echo "no abrir escritura";
			jsAlert("error. no se pudoabrir el archivo para escritura");}
		else{
			echo "si abrir escritura";
		}
		echo "la wea de la wea<br>";
		$lineaEscribir = $this->DBcontainer->user.";".$this->DBcontainer->pass."\n";
		echo "la wea de la wea<br>";
		if(fwrite($DB, $lineaEscribir) === false){
			$this->DBerror = "Se ha producido un error al escribir la linea '{$lineaEscribir}'";
			$this->printearErrores();
			return false;
		}
		$header = array();
		echo "la wea de la wea<br>";
		foreach($this->DBcontainer->heading as $key => $value){
			$header[] = $value;
		}
		echo "la wea de la wea<br>";
		$lineaEscribir = implode(";", $header)."\n";
		if(fwrite($DB, $lineaEscribir) === false){
			$this->DBerror = "Se ha producido un error al escribir la linea '{$lineaEscribir}'";
			$this->printearErrores();
			return false;
		}
		echo "la wea de la wea<br>";
		foreach($this->DBcontainer->row as $key => $value){
			$row = array();
			foreach($value as $key2 => $value2){
				$row[] = $value2;
			}
			$lineaEscribir = implode(";", $row)."\n";
			if(fwrite($DB, $lineaEscribir) === false){
				$this->DBerror = "Se ha producido un error al escribir la linea '{$lineaEscribir}'";
				$this->printearErrores();
				return false;
			}
		}
		echo "la wea de la wea<br>";
		fclose($DB);
		rename($this->DBcontainer->nombre.".tmp", $this->DBcontainer->nombre);
		echo "la wea de la wea<br>";
		return true;
	}

	function select($columnNames, $where = ""){
		$wheres = explode(" AND ", $where);
		$names = array();
		$headingIndex = $this->DBcontainer->getHeadingNames();
		if("*" == $columnNames){
			$names = array_keys($this->DBcontainer->heading);
		}
		else{
			$columns = explode(", ", $columnNames);
			foreach($columns as $key => $value){
				foreach($this->DBcontainer->heading as $key2 => $value2){
					if($value == $value2){
						$names[] = $key2;
					}
				}
			}
		}
		$filasQueCumplen = array();
		foreach($this->DBcontainer->row as $rowKey => $rowValue){
			$cumple = true;
			foreach($wheres as $key => $condicion){
				$subCumple = false;
				$ors = explode(" OR ", $condicion);
				foreach($ors as $key => $orChico){
					$newCondicion = explode(" = ", $orChico);
					if($rowValue[$headingIndex[$newCondicion[0]]] == $newCondicion[1]){
						$subCumple = true;
					}
				}
				if(!$subCumple){
					$cumple = false;
					break;
				}
			}
			if($cumple){
				$temporal = array();
				foreach($rowValue as $keyTemp => $valueTemp) {
					if(in_array($keyTemp, $names)){
						$temporal[] = $valueTemp;
					}
				}
				$filasQueCumplen[] = $temporal;
			}
		}
		return $filasQueCumplen;
	}

	function insert($values, $columnNames){
		$columns = explode(", ", $columnNames);
		$values = explode(", ", $values);
		$headingNames = array_keys($this->DBcontainer->getHeadingNames());
		$headingIndex = $this->DBcontainer->getHeadingNames();
		if((count($columns) != 0) && (count($columns) != count($values))) {
			$this->DBerror = "La cantidad de values y columns no coinciden.";
			$this->printearErrores();
			return false;
		}
		$indexAdd = array();
		foreach($columns as $key => $value){
			if(!in_array($value, $headingNames)){
				$this->DBerror = "Se ha ingresado una columna que no existe. '$value[0]'";
				$this->printearErrores();
				return false;
			}
			$indexAdd[] = $headingIndex[$value];
			$lastIndex = $headingIndex[$value];
		}
		$actual = 0;
		$k = count($this->DBcontainer->row);
		for($i=0; $i < count($headingNames); $i++){ 
			if(in_array($i, $indexAdd)){
				$this->DBcontainer->addRow($k, $values[$actual++]);
			}
			else{
				$this->DBcontainer->addRow($k, "");
			}
		}
		return true;
	}

	function getError(){
		$error = $this->DBerror;
		$this->DBerror = "";
		return $error;
	}
}
/*
$test = new ADB;
$test->connect("http://alumnos.inf.utfsm.cl/~ancarvaj/", "ancarvaj", "Alf95", "url/arufuDataBase/usuarios.adb", true);
print_r($test->select("*", ""));
echo "<br>";
$test->insert("wea, weaita, ma@i.l", "Username, Password, eMail");
print_r($test->select("*", ""));
echo "<br>";*/
//print_r($test->select("*", ""));
/*foreach( as $key => $value){
	print_r($key);
	echo " - ";
	print_r($value);
	echo "<br>";
};*/

?>
