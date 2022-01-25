<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$res=array();
$res["log"].=print_r($_POST,true);
$w=$_POST["word"];
if($w) {
	$dictionarydir=pathinfo($_SERVER['SCRIPT_FILENAME'])["dirname"]."/../dictionaries/".$_SESSION["lang"]."/";
	$version=file_get_contents($dictionarydir."version.txt");

	$cmd="/bin/echo \"".addslashes($w)."\" | ".$GLOBALS["hunspell"]." -i UTF-8 ".($_POST["spellcheck"]=="spellcheck"?"":"-m")." -d '".$dictionarydir.$_SESSION["lang"]."-".$version."'";
	$res["log"].=$cmd;
	exec($cmd,$analysisresult , $retval);
	$res["analysisresult"]=$analysisresult;
} else $res["warning"]=_("No word given to analyze.");
	echo json_encode($res);
