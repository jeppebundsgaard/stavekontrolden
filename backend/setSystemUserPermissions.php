<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($GLOBALS["backenddir"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
#$org_id=($_POST["org_id"]?$_POST["org_id"]:$_SESSION["user_id"]);

$res=array();
#$res["org_id"]=$_POST["org_id"];
if($_POST["user"] and $_POST["permissions"]) {
	$user=$_POST["user"];
	if($_SESSION["realuser_id"]!=1) {
		# Make sure this user is part of the same organization
		$q='select org_id from users where user_id='.$user;
		$result=$mysqli->query($q);
		$r=$result->fetch_assoc();
		if($r["org_id"]!=$_SESSION["user_id"]) exit;
	}
	$q='update users set permissions="'.$_POST["permissions"].'" where user_id='.$user;
	$result=$mysqli->query($q);
}
		
#$res["log"]=$q;

echo json_encode($res);
