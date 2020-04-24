<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");

if(!$_SESSION["user_id"]) exit;
$orgpagesdir=$systemdirs["pages"]."org/".$_SESSION["user_id"]."/";
$res["rename"]=rename($orgpagesdir.$_POST["oldtitle"].".html",$orgpagesdir.$_POST["pagetitle"].".html");
echo json_encode($res);
