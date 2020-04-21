<?php
$relative="../";
include_once($relative."/settings/conf.php");

$update=$_POST["update"];
$res=array();
if($update) {
	if($update["updatekey"]) $update=array($update);
	$vals=array();
	foreach($update as $oneupdate) {
		$vals[]="'$.".$oneupdate["updatekey"]."',".(!is_string($oneupdate["updateval"])?"json_array(\"".implode("\",\"",$oneupdate["updateval"])."\")":"'".$oneupdate["updateval"]."'");
	}
	$q="update organizations set settings=json_set(settings,".implode(",",$vals).") where org_id=".$_SESSION["user_id"];
 	$mysqli->query($q);
}
elseif($_POST["orgvar"]) {
	$q='update organizations set '.$_POST["orgvar"].'="'.$_POST["orgval"].'" where org_id='.$_SESSION["user_id"];
 	$mysqli->query($q);
 	$res["log"]=$q;
}
else 
	$res["log"]="no update";

echo json_encode($res);
