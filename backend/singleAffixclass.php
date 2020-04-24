<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
#$res=array();

$cols='`id`,`description`,`affixclass`,`crossproduct`';
$q='select '.$cols.' from affixclass where id='.$_POST["id"];

$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else $res["single"]=$result->fetch_assoc();

$q='select `id`,`description` from affixrule where affixclassid ='.$_POST["id"];
#$res["log"]=$q;

$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else {
	$res["affixrules"]="";
	while($cr=$result->fetch_assoc()) {
		$res["affixrules"].='<button class="editaffixrule btn btn-sm btn-light" data-affixruleid="'.$cr["id"].'">'.$cr["description"].'</button>&nbsp;';
	}
}

#$res["log"]=$q;#print_r($_POST,true).$q;
$res["view"]=$_POST["view"];

#file_put_contents("/home/stavekontrolden.dk/www/stavekontrolden/words.txt",print_r($res,true));
echo json_encode($res);
