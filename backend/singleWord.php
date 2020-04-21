<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");
if(!$_SESSION["user_id"]) exit;

#$res=array();
$cols='`id`,`word`,`wordstatus`,`wordclass`,`strong_declension`,`fugeelementid`,`apostroph`,`word_definition`,`comments`,`technical_term`,`log`,`contributor`,`lastuser` ';

$q='select '.$cols.' from words where id='.$_POST["id"];

$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else $res["single"]=$result->fetch_assoc();
#$res["log"]=$q;#print_r($_POST,true).$q;
#file_put_contents("/home/stavekontrolden.dk/www/stavekontrolden/words.txt",print_r($res,true));
echo json_encode($res);
