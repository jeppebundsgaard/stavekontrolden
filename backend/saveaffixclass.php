<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$c=array();
parse_str($_POST["affixclass"], $c);
$unescaped=$c;
$numc=count($c);
foreach($c as $i=>$v) {
	if(is_string($c[$i]))
		$c[$i]=$mysqli->real_escape_string($c[$i]);
}
$oldaff=(empty($_POST["affixrules"])?array():$_POST["affixrules"]);
$res["log"]="";
if(!$c["description"]) {
	$res["warning"]=_("Not saved! You need to provide a description of the affix class.");
}
else {
	if($c["affixclassid"]>0) {
		$q='update affixclass set `affixclass`="'.$c["affixclass"].'",`crossproduct`="'.$c["crossproduct"].'" ,`description`="'.$c["description"].'"  where lang="'.$_SESSION["lang"].'" and id='.$c["affixclassid"];
// 		$res["log"]=$q;
		$result=$mysqli->query($q);
		
		$q='select `id` from affixrule where lang="'.$_SESSION["lang"].'" and `affixclassid`='.$c["affixclassid"];
#		$res["log"].=$q;
		$result=$mysqli->query($q);
#		$res["log"].=print_r($oldaff,true);
		$rall=$result->fetch_all();
		if(!empty($rall)) {
			$r=call_user_func_array('array_merge',$rall);
			$delete=array_diff($r,$oldaff);
#			$res["log"].=print_r($delete,true);
			if(count($delete)>0) {
				$q='delete from affixrule where lang="'.$_SESSION["lang"].'" and id IN ('.implode(",",$delete).')';
				$result=$mysqli->query($q);
 				#$res["log"].=$q;
			}
		}
	}
	else {
	//Status set to 2 when word created
		$q='insert into affixclass (`lang`,`affixclass`,`crossproduct`,`description`) values ("'.$_SESSION["lang"].'","'.$c["affixclass"].'","'.$c["crossproduct"].'","'.$c["description"].'")'; 

// 		$res["log"]=$q;
		$result=$mysqli->query($q);
		$c["affixclassid"]=$mysqli->insert_id;
		$insert=$oldaff;
	}
	$res["nextsingle"]=$_POST["nextsingle"];
	$res["next"]=$_POST["next"];
	$res["nextprev"]=$_POST["nextprev"];
}
echo json_encode($res);
