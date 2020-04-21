<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($GLOBALS["backenddir"]."checklogin.php");
if($_SESSION["user_id"]!=1) exit;

$update=$_POST["update"];
$res=array();
// if($_POST["invite"]) {
// 	$q='update users set org_id="'.$_SESSION["user_id"].'" where email="'.$_POST["invite"].'"';
// }
if($_POST["createorg"]) {
	$q='SELECT replace(COLUMN_TYPE,")",",\''.$_POST["orglang"].'\')") as Type FROM INFORMATION_SCHEMA.COLUMNS WHERE  TABLE_NAME = "organizations" AND  COLUMN_NAME = "lang"';
$res["log"].=$q;
	$result=$mysqli->query($q);
	$r=$result->fetch_assoc();
	$q='ALTER TABLE `organizations` modify `lang` '.$r["Type"].' NOT NULL; ';
$res["log"].=$q;
	$result=$mysqli->query($q);
	
	$q='insert into organizations (`orgname`,`lang`,`orgslogan` ,`orgurl`,`settings`) VALUES ("'.$_POST["orgname"].'","'.$_POST["orglang"].'","'.$_POST["orgslogan"].'","'.$_POST["orgurl"].'","{}")';
	$result=$mysqli->query($q);
	$org_id=$mysqli->insert_id;
	copy("../css/basesystem.css","../css/custom/org".$org_id.".css");
}
if($_POST["removeorg"]) {
	$q='delete from organizations where org_id='.$_POST["removeorg"];
	$result=$mysqli->query($q);
}

if((!$result or $mysqli->affected_rows<1) and $_POST["invite"])
		$res["warning"]=_("Unable to invite the user. Are you sure a user with that e-mail address exists?");
elseif(!$result and $_POST["create"])
		$res["warning"]=_("Unable to create the user. A user with that e-mail address might exist already...");

$res["log"].=$q;
echo json_encode($res);
