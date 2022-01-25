<?php
	$relative="../";
	include_once($relative."/settings/conf.php");
	include_once($GLOBALS["backenddir"]."checklogin.php");
	
$dictionarydir=$relative."dictionaries/".$_SESSION["lang"]."/";
$versionfile=$dictionarydir."version.txt";

file_put_contents($versionfile,$_POST["version"]);

$res=array("log"=>$log);
echo json_encode($res);
