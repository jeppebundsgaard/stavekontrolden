<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$c=explode("\n",$_POST["newwords"]);
$numc=count($c);
$w=array();
foreach($c as $v) {
	$v=trim($v);
	if($v)
		$w[]='("'.$mysqli->real_escape_string($v).'", 1, '.$GLOBALS["nowordclassid"].', "'.$_SESSION["username"].'", "'._('Uploaded by user').'", "'.date("Y-m-d H:i:s").': '.$_SESSION["username"].': '._(sprintf("%s created by upload.",$c["word"])).'")';
}
	//Status set to 1 when word created
	
if($w) {
	$q='insert into words (`word`, `wordstatus`, `wordclass`,  `contributor`, `comments`, `log`) 
	VALUES '.implode(",",$w);

	$res["log"]=$q;
	$result=$mysqli->query($q);
}
echo json_encode($res);
