<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$res=array();
if($_POST["limit"]>0) $_SESSION["limit"]=$_POST["limit"];
$show=($_SESSION["limit"]?$_SESSION["limit"]:25);

$cols='c.`id`, c.`description`,c.`crossproduct`,c.`affixclass`, r.`id` as affixruleid, r.`description` as rdescription' ;
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
$custorder=($custorder?$custorder:"c.`description`");
$where=" WHERE c.lang='".$_SESSION["lang"]."' ".$where;
$order=" ORDER BY  ".$custorder." "; #" ORDER BY ".($_POST["order"]?$_POST["order"]: );
$orderdir=implode("",$_POST["order"]);

#$baseq=" from affixclass c left join affixrule_to_affixclass cr on c.`id`=cr.`affixclassid` left join affixrule r on cr.`affixruleid`=r.`id` ";
$baseq=" from affixclass c left join affixrule r on r.`affixclassid`=c.`id` ";

if($_POST["andThen"]["next"]<0) {
	$reverseorder=array(""=>"DESC","ASC"=>"DESC","DESC"=>"ASC")[$orderdir];
	$orderdir=$reverseorder;
    $_POST["andThen"]["next"]+=1;
}
elseif(!$_POST["andThen"]["next"]) {
	$q="SELECT count(distinct(c.id)) as numrows ".$baseq.$where;
	$result=$mysqli->query($q);
	if(!$result) $res["log"].=mysqlerror($q); 
	else $res["numrows"]=$result->fetch_assoc()["numrows"];	
}
$res["numshow"]=abs($_POST["andThen"]["next"])*$show;
$limit=" LIMIT ".abs($_POST["andThen"]["next"])*$show.",".$show;

$q=$last1."select distinct(c.id),".$custorder.$baseq.$where.$order.$orderdir.$limit.$last2;
	$res["log"]=$q;
$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else 
	$rall=$result->fetch_all();
if(!empty($rall)) {
	$ids=array();
	foreach($rall as $one) $ids[]=$one[0];
#	$ids=call_user_func_array(function($x) {return $x[0];},$rall);

	$q='select '.$cols.$baseq.' where c.id in ('.implode(",",$ids).') '.$order." ".$orderdir;
#$res["log"]=print_r($rall,true);

	$result=$mysqli->query($q);
	$res["rows"]=array();
	$prev_wc=0;
	$i=-1;
	if(!$result) $res["log"].=mysqlerror($q); 
	else {
		while($cr=$result->fetch_assoc()) {
			if($cr["id"]!=$prev_cr) { 
				$prev_cr=$cr["id"];
				$i++; 
				$res["rows"][$i]=array(0=>$cr["id"],1=>$cr["description"],2=>$cr["affixclass"],3=>$cr["crossproduct"],4=>"");
			}
			if($cr["rdescription"])
				$res["rows"][$i][4].='<button class="editaffixrule btn btn-sm btn-light" data-affixruleid="'.$cr["affixruleid"].'">'.$cr["rdescription"].'</button>&nbsp;';
		}
	}
}
else $res["rows"]=array(1=>array(_("No more affix classes")));
#$res["log"].=print_r($_POST,true);
#file_put_contents("/home/stavekontrolden.dk/www/stavekontrolden/rows.txt",print_r($res,true));
if(isset($_POST["andThen"]["nextsingle"])) {
	if($_POST["andThen"]["nextprev"]==1 and $res["numrows"]<$_POST["numrows"]) {
		$_POST["andThen"]["nextsingle"]--;
		$res["reducenext"]=true;
	}
	if($_POST["andThen"]["nextsingle"]>=0) { //A next single has been requested
		//Has a word been removed from the list, don't go forward
		$_POST["id"]=$res["rows"][$_POST["andThen"]["nextsingle"]][0];
		include("singleAffixclass.php");
		exit;
	}
} 
echo json_encode($res);
