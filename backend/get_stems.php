<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$res=array();
$stemtxt=$mysqli->real_escape_string($_POST["stemtxt"]);
$q='select word, w.id from words w left join wordclass wc on wc.id=w.wordclass where wordstatus>=2 and providestem=0 and word LIKE "'.$stemtxt.'%" LIMIT 20';

$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else {
	$res["stems"]='<h6 class="dropdown-header">'._("Use TAB and arrows to select a stem.").'</h6>';
	$wordarr=$result->fetch_all(MYSQLI_ASSOC);
	foreach($wordarr as $word) {
		// $log.=print_r($word,true);
		$res["stems"].='<a class="dropdown-item stem" href="#" data-stem_id="'.$word["id"].'">'.$word["word"].'</a>';
	}
}
if(empty($res["stems"])) $res["stems"]=array(1=>array(_("No words found")));
$res["log"]=$q;#print_r($_POST,true).$q;
echo json_encode($res);
