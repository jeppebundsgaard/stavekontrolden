<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$res=array();
$res["log"].=print_r($_POST,true);
$w=$_POST["word"];
if($w) {
	$dicfile=pathinfo($_SERVER['SCRIPT_FILENAME'])["dirname"]."/../dictionaries/".$_SESSION["lang"]."/".$_SESSION["lang"];
	$cmd="/bin/echo \"".addslashes($w)."\" | ".$GLOBALS["hunspell"]." -i UTF-8 ".($_POST["spellcheck"]=="spellcheck"?"":"-m")." -d '".$dicfile."'";
	$res["log"].=$cmd;
	exec($cmd,$analysisresult , $retval);
	$res["analysisresult"]=$analysisresult;
} else $res["warning"]=_("No word given to analyze.");
	echo json_encode($res);
