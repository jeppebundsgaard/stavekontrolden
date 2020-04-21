<?php
$t_id=$_POST["t_id"];
$relative="../";
include_once($relative."/settings/conf.php");
if(file_exists($settingsdir.$t_id.".json")) {
	echo file_get_contents($settingsdir.$t_id.".json");
	
}
else {
	#include_once($functionsdir."commonfunctions.php");
	
	$settings=get_settings($t_id);
	echo json_encode($settings);
}
