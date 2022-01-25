<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$res=array();
if($_POST["limit"]>0) $_SESSION["limit"]=$_POST["limit"];
$show=($_SESSION["limit"]?$_SESSION["limit"]:25);

$cols=array('w.`id`','`word`', 's.`wordstatus`', 'wc.`wordclass`', '`strong_declension`', '`misspellings`', 'f.`fugeelement`');
if($_SESSION["showdetails"]) $cols=array_merge($cols, array('`contributor`', '`lastuser`', '`word_definition`', '`comments`', 't.`technical_term`', '`omitsuggestion`', '`lastchange`'));
if($_SESSION["showlog"]) $cols=array_merge($cols, array('REPLACE(`log`,"\n","<br>")'));
$wheres=array();
$f=$_POST["filtersetting"];
$_SESSION["filtersetting"]=$f;
parse_str($_POST["where"], $wheres);
$n=0;
#$res["log"].=print_r($_POST,true);
foreach($wheres as $k=>$w) {
	if($w!="")
		$where.=' AND w.`'.$k.'`'.(is_numeric($w)?($_POST["negsearch"][$n]=="true"?'!':'').'='.$w:($_POST["negsearch"][$n]=="true"?' NOT':'').' LIKE "'.(in_array($f,array("inword","endword"))?"%":"").''.$w.''.(in_array($f,array("inword","beginword"))?"%":"").'"');
	if($_POST["order"][$n]) $order=$k." ".$_POST["order"][$n];
	$n++;
}
$where=" WHERE w.lang='".$_SESSION["lang"]."'".(($wheres["wordstatus"]!="" and $_POST["negsearch"][1]=="false")?"":" AND w.`wordstatus`>0")." ".$where.($_POST["strictsearch"]=="true"?" collate ".$GLOBALS["collation"][$_SESSION["locale"]]:"");
$order=" ORDER BY ".($order?$order:"`word`");
// $res["log"].=print_r($wheres,true);

$baseq=" from words w left join wordclass wc on w.wordclass=wc.id left join wordstatus s on w.`wordstatus`=s.`id` left join fugeelement f on w.`fugeelementid`=f.`id` ".($_SESSION["showdetails"]?"left join technical_term t on t.id=w.technical_term":"").$where;


if($_POST["andThen"]["next"]<0) {
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
$res["numshow"]=abs($_POST["andThen"]["next"])*$show;
#$res["numshow"]=($_POST["numshow"]?$_POST["numshow"]:abs($_POST["next"])*$show);
$limit=" LIMIT ".(abs($_POST["andThen"]["next"])*$show).",".$show;
$q=$last1.'select '.implode(",",$cols).$baseq.$order.$limit.$last2;

$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else $res["rows"]=$result->fetch_all();
if(empty($res["rows"])) $res["rows"]=array(1=>array(_("No more words")));

// $res["log"].=$q;
$res["andThen"]=$_POST["andThen"];
// $res["log"].=$res["numshow"];
if($_POST["andThen"]["nextsingle"]>-1) {
	if($_POST["andThen"]["nextprev"]==1 and $res["numrows"]<$_POST["numrows"]) {
		$_POST["andThen"]["nextsingle"]--;
		$res["reducenext"]=true;
	}
	if($_POST["andThen"]["nextsingle"]>=0) { //A next single has been requested
		//Has a word been removed from the list, don't go forward
		$_POST["id"]=$res["rows"][$_POST["andThen"]["nextsingle"]][0];
		include("singleWord.php");
		exit;
	}
} 
echo json_encode($res);
