<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$res=array();
if($_POST["limit"]>0) $_SESSION["limit"]=$_POST["limit"];
$show=($_SESSION["limit"]?$_SESSION["limit"]:25);

$cols='w.`id`, w.`wordclass`, wa.`affixclassid`, a.`description`';
$wheres=array();
$f=$_POST["filtersetting"];
$_SESSION["filtersetting"]=$f;
parse_str($_POST["where"], $wheres);
$n=0;
foreach($wheres as $k=>$w) {
	if($w!="")
		$where.=' AND `'.$k.'` LIKE "'.(in_array($f,array("inword","endword"))?"%":"").''.$w.''.(in_array($f,array("inword","beginword"))?"%":"").'"';
	if($_POST["order"][$n]) $order=$k." ".$_POST["order"][$n];
	$n++;
}
$where=" WHERE w.lang='".$_SESSION["lang"]."' ".$where;
$order=" ORDER BY ".($order?$order:" `wordclass`, a.`description`"); #" ORDER BY ".($_POST["order"]?$_POST["order"]: );

$baseq=" from wordclass w left join wordclass_to_affixclass wa on w.`id`=wa.`wordclassid` left join affixclass a on wa.`affixclassid`=a.`id` ";

$orderdesc=" ORDER BY  `wordclass`";
if($_POST["andThen"]["next"]<0) {
// // 	$last1="SELECT * FROM (";
// //     $last2=") sub ";
    $orderdesc.=" DESC";
    $_POST["andThen"]["next"]+=1;
}
elseif(!$_POST["andThen"]["next"]){
	$q="SELECT count(distinct(w.id)) as numrows ".$baseq.$where;
	$result=$mysqli->query($q);
	if(!$result) $res["log"].=mysqlerror($q); 
	else $res["numrows"]=$result->fetch_assoc()["numrows"];	
}
$res["numshow"]=abs($_POST["andThen"]["next"])*$show;
$limit=" LIMIT ".abs($_POST["andThen"]["next"])*$show.",".$show;

$q=$last1."select distinct(w.id),wordclass".$baseq.$where.$orderdesc.$limit.$last2;
#$res["log"]=$q;
$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else $rall=$result->fetch_all();
if(!empty($rall)) {
	$ids=array();
	foreach($rall as $one) $ids[]=$one[0];

	$q='select '.$cols.$baseq.' where w.id in ('.implode(",",$ids).') '.$order;

	$result=$mysqli->query($q);
	if(!$result) $res["log"].=mysqlerror($q); 
	else {
		$res["rows"]=array();
		$prev_wc=0;
		$i=-1;
		while($wc=$result->fetch_assoc()) {
			if($wc["id"]!=$prev_wc) { 
				$prev_wc=$wc["id"];
				$i++; 
				$res["rows"][$i]=array(0=>$wc["id"],1=>$wc["wordclass"],2=>"");
			}
			if($wc["description"])
				$res["rows"][$i][2].='<button class="editaffixclass btn btn-sm btn-light" data-affixclassid="'.$wc["affixclassid"].'">'.$wc["description"].'</button>&nbsp;';
		}
	}
}
else $res["rows"]=array(1=>array(_("No more word classes")));
#$res["log"].=print_r($res["rows"],true);
$res["log"].=print_r($_POST,true);
$res["andThen"]=$_POST["andThen"];
if($_POST["andThen"]["nextsingle"]>-1) {
	if($_POST["andThen"]["nextprev"]==1 and $res["numrows"]<$_POST["numrows"]) {
		$_POST["andThen"]["nextsingle"]--;
		$res["reducenext"]=true;
	}
	if($_POST["andThen"]["nextsingle"]>=0) { //A next single has been requested
		//Has a word been removed from the list, don't go forward
		$_POST["id"]=$res["rows"][$_POST["andThen"]["nextsingle"]][0];
		include("singleWordclass.php");
		exit;
	}
} 
echo json_encode($res);
