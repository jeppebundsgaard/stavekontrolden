<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($GLOBALS["backenddir"]."checklogin.php");
if(!$_SESSION["orgMember"] or !$_SESSION["user_id"]) {echo json_encode(array("log"=>"Ikke adgang"));exit;}
$org_id=($_SESSION["user_id"]);
// $log.=print_r($_POST,true);
$update=$_POST["update"];
$res=array();
$res["org_id"]=$_POST["org_id"];
if($_POST["invite"]) {
	$q='update users set org_id="'.$org_id.'" where email="'.$_POST["invite"].'" or username="'.$_POST["invite"].'"';
}
if($_POST["create"]) {
	$q='insert into users (`org_id`,`email` ,`username` ,`password`) VALUES ("'.$org_id.'","'.$_POST["create"].'","'.$_POST["user"].'","'.$_POST["password"].'")';
}
if($_POST["remove"]) {
	$q='update users set org_id=0 where user_id='.$_POST["remove"];
}

$result=$mysqli->query($q);
if((!$result or $mysqli->affected_rows<1) and $_POST["invite"])
		$res["warning"]=_("Unable to invite the user. Are you sure a user with that e-mail address exists?");
elseif(!$result and $_POST["create"])
		$res["warning"]=_("Unable to create the user. A user with that e-mail address might exist already...");
// $log.=$q;
$res["log"]=$log;

echo json_encode($res);
