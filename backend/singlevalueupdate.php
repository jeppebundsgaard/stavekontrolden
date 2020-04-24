<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$val=$mysqli->real_escape_string($_POST["val"]);
$q='update '.$_POST["singlevalue"].' set `'.$_POST["singlevalue"].'`="'.$val.'" where lang="'.$_SESSION["lang"].'" AND id='.$_POST["id"];

$result=$mysqli->query($q);
$res["log"]=$q;

echo json_encode($res);
