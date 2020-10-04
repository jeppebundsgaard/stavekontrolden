<?php
if(!$mysqli) {
# .htdatabase has the following form: 
# localhost,user,password,database

	$database=trim(file_get_contents($systemdirs["settings"].".htdatabase"));
	$db=explode(",",$database);
	// print_r($db);
	$mysqli = new mysqli($db[0],$db[1],$db[2],$db[3]);
	if (mysqli_connect_errno($mysqli)) {
		echo "Failed to connect to MySQL: " . mysqli_connect_error();
		exit;
	}
#	$mysqli->set_charset("utf8");

	function mysqlerror($q) {
		return "\nError in query: ".$q;
	}
	function checkpermissions() {
		$users=func_get_args();
		return (in_array($_SESSION["permissions"],$users));
	}
}
