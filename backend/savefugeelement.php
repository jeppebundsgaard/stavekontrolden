<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$c=array();
parse_str($_POST["fugeelement"], $c);
$unescaped=$c;
$numc=count($c);
foreach($c as $i=>$v) {
	if(is_string($c[$i]))
		$c[$i]=$mysqli->real_escape_string($c[$i]);
}
$oldaff=(empty($_POST["affixclasses"])?array():$_POST["affixclasses"]);

if(!$c["fugeelement"]) {
	$res["warning"]=_("Not saved! You need to provide the name of the word class.");
}
else {
	if($c["fugeelementid"]>0) {
		$q='update fugeelement set `fugeelement`="'.$c["fugeelement"].'" where lang="'.$_SESSION["lang"].'" and id='.$c["fugeelementid"];
		$res["log"]=$q;
		$result=$mysqli->query($q);
		
		$q='select `affixclassid` from fugeelement_to_affixclass where lang="'.$_SESSION["lang"].'" and `fugeelementid`='.$c["fugeelementid"];
		$res["log"].=$q;
		$result=$mysqli->query($q);
		$res["log"].=print_r($oldaff,true);
		$rall=$result->fetch_all();
		if(empty($rall)) {
			$insert=$oldaff;
		} else {
			$r=call_user_func_array('array_merge',$rall);
			$res["log"].=print_r($r,true);
			$insert=array_diff($oldaff,$r);
			$delete=array_diff($r,$oldaff);
			if(count($delete)>0) {
				$q='delete from fugeelement_to_affixclass where lang="'.$_SESSION["lang"].'" and fugeelementid='.$c["fugeelementid"].' and affixclassid IN ('.implode(",",$delete).')';
				$result=$mysqli->query($q);
				$res["log"].=$q;
			}
		}
	}
	else {
	//Status set to 2 when word created
		$q='insert into fugeelement (`lang`,`fugeelement`) values ("'.$_SESSION["lang"].'","'.$c["fugeelement"].'")'; 

		$res["log"]=$q;
		$result=$mysqli->query($q);
		$c["fugeelementid"]=$mysqli->insert_id;
		$insert=$oldaff;
	}
	if(count($insert)>0) {
		$res["log"].=print_r($insert,true);
		$values=array();
		foreach($insert as $i) $values[]='("'.$_SESSION["lang"].'", '.$c["fugeelementid"].','.$i.')'; 
		$q='insert into fugeelement_to_affixclass (`lang`,`fugeelementid`, `affixclassid`) VALUES '.implode(",",$values);
		$result=$mysqli->query($q);
		$res["log"].=$q;
	}
	$res["nextsingle"]=$_POST["nextsingle"];
	$res["next"]=$_POST["next"];
	$res["nextprev"]=$_POST["nextprev"];


}
echo json_encode($res);
