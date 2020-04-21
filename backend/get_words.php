<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$res=array();
if($_POST["limit"]>0) $_SESSION["limit"]=$_POST["limit"];
$show=($_SESSION["limit"]?$_SESSION["limit"]:25);

$cols=array('w.`id`','`word`', 's.`wordstatus`', 'wc.`wordclass`', '`strong_declension`', '`misspellings`', 'f.`fugeelement`', 'IF(`apostroph`>0,"x","") as apo');
if($_SESSION["showdetails"]) $cols=array_merge($cols, array('`contributor`', '`lastuser`', '`word_definition`', '`comments`', 't.`technical_term`', 'REPLACE(`log`,"\n","<br>")',  '`lastchange`'));#'`alternatives`', 
$wheres=array();
$f=$_POST["filtersetting"];
$_SESSION["filtersetting"]=$f;
parse_str($_POST["where"], $wheres);
$n=0;
# $res["log"].=print_r($_POST,true);
foreach($wheres as $k=>$w) {
	if($w!="")
		$where.=' AND w.`'.$k.'`'.(is_numeric($w)?($_POST["negsearch"][$n]=="true"?'!':'').'='.$w:($_POST["negsearch"][$n]=="true"?' NOT':'').' LIKE "'.(in_array($f,array("inword","endword"))?"%":"").''.$w.''.(in_array($f,array("inword","beginword"))?"%":"").'"');
	$n++;
}
$where=" WHERE w.lang='".$_SESSION["lang"]."'".(($wheres["wordstatus"] and !$_POST["negsearch"][1])?"":" AND w.`wordstatus`>0")." ".$where;
$order=" ORDER BY ".($_POST["order"]?$_POST["order"]:"`word`");

$baseq=" from words w left join wordclass wc on w.wordclass=wc.id left join wordstatus s on w.`wordstatus`=s.`id` left join fugeelement f on w.`fugeelementid`=f.`id` ".($_SESSION["showdetails"]?"left join technical_term t on t.id=w.technical_term":"").$where;


if($_POST["next"]<0) {
	$last1="SELECT * FROM (";
    $last2=") sub ".$order;
    $order.=" DESC";
    $_POST["next"]+=1;
}
else {
	$q="SELECT count(*) as numrows ".$baseq;
	$result=$mysqli->query($q);
	if(!$result) $res["log"].=mysqlerror($q); 
	else $res["numrows"]=$result->fetch_assoc()["numrows"];	
}
#$res["numshow"]=($_POST["numshow"]?$_POST["numshow"]:abs($_POST["next"])*$show);
$limit=" LIMIT ".(abs($_POST["next"])*$show).",".$show;
$q=$last1.'select '.implode(",",$cols).$baseq.$order.$limit.$last2;

$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else $res["rows"]=$result->fetch_all();
if(empty($res["rows"])) $res["rows"]=array(1=>array(_("No more words")));

#$res["log"].=$q;
if(isset($_POST["nextsingle"])) {
	if($_POST["nextprev"]==1 and $res["numrows"]<$_POST["numrows"]) {
		$_POST["nextsingle"]--;
		$res["reducenext"]=true;
	}
	if($_POST["nextsingle"]>=0) { //A next single has been requested
		//Has a word been removed from the list, don't go forward
		$_POST["id"]=$res["rows"][$_POST["nextsingle"]][0];
		include("singleWord.php");
		exit;
	}
} 
echo json_encode($res);
