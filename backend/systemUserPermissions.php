<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($GLOBALS["backenddir"]."checklogin.php");
if($_SESSION["user_id"]!=1) exit;
#$org_id=($_POST["org_id"]?$_POST["org_id"]:$_SESSION["user_id"]);

$res=array();
#$res["org_id"]=$_POST["org_id"];
if($_POST["user"]) {
	$user=$_POST["user"];
	$res["user"]=$user;
	$q='select permissions from users where user_id='.$user;
	$result=$mysqli->query($q);
	$r=$result->fetch_assoc();
	$userpermissions=$r["permissions"];
	$q='SHOW COLUMNS FROM users LIKE "permissions"';
	$result=$mysqli->query($q);
	$r=$result->fetch_assoc();
	$perms=explode("','",preg_replace("/set\('(.*)'\)/","$1",$r["Type"]));
	foreach($perms as $p) $options.="<option value='".$p."'".($p==$userpermissions?" selected":"").">".$p."</option>";
	$res["select"]='<select id="doChangePermissions">'.$options.'</select>';
}
#$res["log"]=$res["select"];print_r($r,true);

echo json_encode($res);
