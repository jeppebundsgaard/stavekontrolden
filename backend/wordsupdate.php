<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$val=$mysqli->real_escape_string($_POST["val"]);
$q='update words set `'.$_POST["col"].'`="'.trim($val).'", `lastuser`="'.$_SESSION["username"].'", `log`=concat(\''.date("Y-m-d H:i:s").": ".$_SESSION["username"].': '.$_POST["col"].' => "'.$val.'"\n'.'\',`log`) where lang="'.$_SESSION["lang"].'" AND id='.$_POST["id"];

$result=$mysqli->query($q);
$res["log"]=$q;

echo json_encode($res);
