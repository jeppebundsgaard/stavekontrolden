<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$val=$mysqli->real_escape_string($_POST["val"]);
$q='insert into `'.$_POST["table"].'` (`lang`,`'.$_POST["table"].'`) values("'.$_SESSION["lang"].'","'.$val.'")';

$result=$mysqli->query($q);
$res["log"]=$q;

echo json_encode($res);
