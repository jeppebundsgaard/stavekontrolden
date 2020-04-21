<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($GLOBALS["backenddir"]."checklogin.php");

$update=$_POST["update"];
$res=array();
if($_POST["uservar"]) {
	if($_POST["uservar"]=="org_id" and $_POST["userval"]!=0 and $_POST["userval"]!=$_SESSION["user_id"]) $res["warning"]="Don't even try that! You will be watched.";
	else {
		$q='update users set '.$_POST["uservar"].'="'.$_POST["userval"].'" where user_id='.$_SESSION["realuser_id"];
		$mysqli->query($q);
		$res["log"]=$q;
	}
}
else 
	$res["log"]="no update";

echo json_encode($res);
