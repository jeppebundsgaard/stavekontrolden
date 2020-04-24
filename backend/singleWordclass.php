<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
#$res=array();

if($_POST["wordid"]) {
	$q='select wc.`id`, wc.`wordclass` from words w left join wordclass wc on w.wordclass=wc.id where w.id='.$_POST["wordid"];
} else {
	$q='select `id`, `wordclass` from wordclass wc where id='.$_POST["id"];
}
#$res["log"].=$q;
$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else $r=$result->fetch_assoc();
$res["single"]=$r;
#$res["log"].=print_r($r,true);
$wordclassid=$r["id"];

$q='select ac.`id`, ac.`description` from wordclass_to_affixclass wa left join affixclass ac on wa.`affixclassid`=ac.`id` where wordclassid ='.$wordclassid;
#$res["log"].=$q;

$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else {
	$res["affixclasses"]="";
	while($cr=$result->fetch_assoc()) {
		$res["affixclasses"].='<button class="editaffixclass btn btn-sm btn-light" data-affixclassid="'.$cr["id"].'">'.$cr["description"].'</button>&nbsp;';
	}
}

#$res["log"]=$q;#print_r($_POST,true).$q;
$res["view"]=$_POST["view"];

echo json_encode($res);
