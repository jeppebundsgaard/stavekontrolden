<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");
if(!$_SESSION["user_id"]) exit;

$res=array();

$q='delete from '.$_POST["table"].' where id='.$_POST["id"];

$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
echo json_encode($res);
