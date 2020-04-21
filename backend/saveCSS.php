<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($GLOBALS["backenddir"]."checklogin.php");
if(strlen($_POST["CSS"])>0)
	file_put_contents("../css/custom/org".$_SESSION["user_id"].".css",str_replace(" "," ",$_POST["CSS"]));
else $_POST["warning"]=_('Something went wrong while saving. Please try again.');
echo json_encode($_POST);
