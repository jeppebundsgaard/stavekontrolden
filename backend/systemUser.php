<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($GLOBALS["backenddir"]."checklogin.php");
if($_SESSION["user_id"]!=1) exit;
$org_id=($_POST["org_id"]?$_POST["org_id"]:$_SESSION["user_id"]);

$update=$_POST["update"];
$res=array();
$res["org_id"]=$_POST["org_id"];
if($_POST["newpass"]) {
	$alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
	$alphaLength = strlen($alphabet);
    for ($i = 0; $i < 8; $i++) {
        $n = rand(0, $alphaLength);
        $newpass.= $alphabet[$n];
    }
	$newpassmd5=md5($newpass);
	$q='update users set password="'.$newpassmd5.'" where user_id='.$_POST["newpass"];
	$res["newpass"]=$newpass;
}
if($_POST["remove"]) {
	$q='update users set org_id=0 where user_id='.$_POST["remove"];
}

$result=$mysqli->query($q);
if((!$result or $mysqli->affected_rows<1) and $_POST["invite"])
		$res["warning"]=_("Unable to invite the user. Are you sure a user with that e-mail address exists?");
elseif(!$result and $_POST["create"])
		$res["warning"]=_("Unable to create the user. A user with that e-mail address might exist already...");

$res["log"]=$q;

echo json_encode($res);
