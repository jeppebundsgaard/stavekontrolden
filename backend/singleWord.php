<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;

#$res=array();
$cols='w1.`id`,w1.`word`,w1.`wordstatus`,w1.`wordclass`,w1.`stem`,w2.word as `stemtxt`,w1.`strong_declension`,w1.`misspellings`,w1.`fugeelementid`,w1.`word_definition`,w1.`comments`,w1.`technical_term`,w1.`log`,w1.`contributor`,w1.`lastuser`,w1.`omitsuggestion` ';
if($_POST["id"]) {
	$q='select '.$cols.' from words w1 left join words w2 on w2.id=w1.stem where w1.id='.$_POST["id"];

	$result=$mysqli->query($q);
	if(!$result) $res["log"].=mysqlerror($q); 
	else $res["single"]=$result->fetch_assoc();
} else $res["log"]=print_r($_POST,true);
#file_put_contents("/home/stavekontrolden.dk/www/stavekontrolden/words.txt",print_r($res,true));
echo json_encode($res);
