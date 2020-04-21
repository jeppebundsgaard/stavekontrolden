<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");

if(!$_SESSION["user_id"]) exit;
$orgpagesdir=$pagesdir."org/".$_SESSION["user_id"]."/";
$res["rename"]=rename($orgpagesdir.$_POST["oldtitle"].".html",$orgpagesdir.$_POST["pagetitle"].".html");
echo json_encode($res);
