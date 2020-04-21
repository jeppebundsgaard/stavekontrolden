<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");
if(!$_SESSION["user_id"]) exit;
#$res=array();

#$cols='`id`,`description`,`affixclass`,`crossproduct`';
$cols='r.`id`, c.`description` as c_description, r.affixclassid, r.`description` as r_description, r.`affix`, r.`stripchars`, r.`condition`, r.`replacement`, r.`morphdescrid`';

$q='select '.$cols.' from affixrule r left join affixclass c on r.`affixclassid`=c.`id` where r.id='.$_POST["id"];

$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else $res["single"]=$result->fetch_assoc();

$q='select c.`id`, c.`description` from affixrule_to_affixclass rc left join affixclass c on rc.`affixclassid`=c.`id` where affixruleid ='.$_POST["id"];
#$res["log"]=$q;

$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else {
	$res["affixclasses"]="";
	while($cr=$result->fetch_assoc()) {
		$res["affixclasses"].='<button class="editaffixclass btn btn-sm btn-light" data-affixclassid="'.$cr["id"].'">'.$cr["description"].'</button>&nbsp;';
	}
}

$res["log"]=print_r($_POST,true);
$res["view"]=$_POST["view"];

#file_put_contents("/home/stavekontrolden.dk/www/stavekontrolden/words.txt",print_r($res,true));
echo json_encode($res);
