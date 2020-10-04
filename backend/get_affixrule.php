<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$res=array();
if($_POST["limit"]>0) $_SESSION["limit"]=$_POST["limit"];
$show=($_SESSION["limit"]?$_SESSION["limit"]:25);

$cols='r.`id`, c.`description` as c_description, r.`description` as r_description, r.`affix`, r.`stripchars`, r.`condition`, r.`replacement`, m.`morphdescr`, rc.`affixclassid`, c1.`description` as rc_description';
$wheres=array();
$f=$_POST["filtersetting"];
$_SESSION["filtersetting"]=$f;
parse_str($_POST["where"], $wheres);
$n=0;
foreach($wheres as $k=>$w) {
	if($w!="") 
		$where.=' AND '.implode(".`",explode("_",$k)).'`'.(is_numeric($w)?"=".$w:' LIKE "'.(in_array($f,array("inword","endword"))?"%":"").''.$w.''.(in_array($f,array("inword","beginword"))?"%":"").'"');
	if($_POST["order"][$n]) $custorder=str_replace("_",".",$k);
	$n++;
}
$custorder=($custorder?$custorder:"r.`description`");
$where=" WHERE r.lang='".$_SESSION["lang"]."' ".$where;
$order=" ORDER BY  ".$custorder." "; #" ORDER BY ".($_POST["order"]?$_POST["order"]: );
$orderdir=implode("",$_POST["order"]);

$baseq=" from affixrule r left join affixclass c on r.`affixclassid`=c.`id` left join affixrule_to_affixclass rc on r.`id`=rc.`affixruleid` left join affixclass c1 on rc.`affixclassid`=c1.`id` left join morphdescr m on m.id=r.morphdescrid ";

#$orderdesc=" ORDER BY  c.`description`";
if($_POST["andThen"]["next"]<0) {
	$reverseorder=array(""=>"DESC","ASC"=>"DESC","DESC"=>"ASC")[$orderdir];
	$orderdir=$reverseorder;
    $_POST["andThen"]["next"]+=1;
}
elseif(!$_POST["andThen"]["next"]){
	$q="SELECT count(*) as numrows ".$baseq.$where;
	$result=$mysqli->query($q);
	if(!$result) $res["log"].=mysqlerror($q); 
	else $res["numrows"]=$result->fetch_assoc()["numrows"];	
}
$res["numshow"]=abs($_POST["andThen"]["next"])*$show;
$limit=" LIMIT ".abs($_POST["andThen"]["next"])*$show.",".$show;

$q=$last1."select distinct(r.id),".$custorder.$baseq.$where.$order.$orderdir.$limit.$last2;
$res["log"]=$q;
$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else $rall=$result->fetch_all();
if(!empty($rall)) {
	$ids=array();
	foreach($rall as $one) $ids[]=$one[0];

	$q='select '.$cols.$baseq.' where r.id in ('.implode(",",$ids).') '.$order;

	$result=$mysqli->query($q);
	if(!$result) $res["log"].=mysqlerror($q); 
	else {
		$res["rows"]=array();
		$prev_wc=0;
		$i=-1;
		while($cr=$result->fetch_assoc()) {
			if($cr["id"]!=$prev_wc) { 
				$prev_wc=$cr["id"];
				$i++; 
				$res["rows"][$i]=array(0=>$cr["id"],1=>$cr["r_description"],2=>$cr["c_description"],3=>$cr["affix"],4=>$cr["stripchars"],5=>$cr["condition"],6=>$cr["replacement"],7=>$cr["morphdescr"],8=>"");
			}
			if($cr["rc_description"])
				$res["rows"][$i][8].='<button class="editaffixclass btn btn-sm btn-light" data-affixclassid="'.$cr["affixclassid"].'">'.$cr["rc_description"].'</button>&nbsp;';
		}
	}
}
else $res["rows"]=array(1=>array(_("No more affix rules")));
// print_r($_POST["andThen"],true);
if(isset($_POST["andThen"]["nextsingle"])) {
	if($_POST["andThen"]["nextprev"]==1 and $res["numrows"]<$_POST["numrows"]) {
		$_POST["andThen"]["nextsingle"]--;
		$res["reducenext"]=true;
	}
	if($_POST["andThen"]["nextsingle"]>=0) { //A next single has been requested
		//Has a word been removed from the list, don't go forward
		$_POST["id"]=$res["rows"][$_POST["andThen"]["nextsingle"]][0];
		include("singleAffixrule.php");
		exit;
	}
} 
echo json_encode($res);
