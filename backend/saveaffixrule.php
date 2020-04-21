<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$c=array();
parse_str($_POST["affixrule"], $c);
$unescaped=$c;
$numc=count($c);
foreach($c as $i=>$v) {
	if(is_string($c[$i]))
		$c[$i]=$mysqli->real_escape_string($c[$i]);
}
$oldaff=(empty($_POST["affixclasses"])?array():$_POST["affixclasses"]);

if(!$c["r_description"]) {
	$res["warning"]=_("Not saved! You need to provide a description of the affix rule.");
}
else {
	if($c["affixruleid"]>0) {
		$q='update affixrule set `description`="'.$c["r_description"].'" , `affix`="'.$c["affix"].'",`morphdescrid`='.($c["morphdescrid"]?$c["morphdescrid"]:0).' ,`condition`="'.$c["condition"].'" ,`replacement`="'.$c["replacement"].'" ,`stripchars`="'.$c["stripchars"].'"   where lang="'.$_SESSION["lang"].'" and id='.$c["affixruleid"];
		$res["log"]=$q;
		$result=$mysqli->query($q);
		
		$q='select `affixclassid` from affixrule_to_affixclass where lang="'.$_SESSION["lang"].'" and `affixruleid`='.$c["affixruleid"];
		#$res["log"].=$q;
		$result=$mysqli->query($q);
		#$res["log"].=print_r($oldaff,true);
		$rall=$result->fetch_all();
		if(empty($rall)) {
			$insert=$oldaff;
		} else {
			$r=call_user_func_array('array_merge',$rall);
			#$res["log"].=print_r($r,true);
			$insert=array_diff($oldaff,$r);
			$delete=array_diff($r,$oldaff);
			if(count($delete)>0) {
				$q='delete from affixrule_to_affixclass where lang="'.$_SESSION["lang"].'" and affixruleid='.$c["affixruleid"].' and affixclassid IN ('.implode(",",$delete).')';
				$result=$mysqli->query($q);
				$res["log"].=$q;
			}
		}
	}
	else {
	//Status set to 2 when word created
		$q='insert into affixrule (`lang`,`description`,`affixclassid`,`affix`,`condition`,`stripchars`,`replacement`,`morphdescrid`) values ("'.$_SESSION["lang"].'","'.$c["description"].'",'.$c["affixclassid"].',"'.$c["affix"].'","'.$c["condition"].'","'.$c["stripchars"].'","'.$c["replacement"].'",'.($c["morphdescrid"]?$c["morphdescrid"]:0).')'; 

		$res["log"]=$q;
		$result=$mysqli->query($q);
		$c["affixruleid"]=$mysqli->insert_id;
		$res["affixruleid"]=$c["affixruleid"];
		$res["description"]=$c["description"];
		$insert=$oldaff;
	}
	if(count($insert)>0) {
		$res["log"].=print_r($insert,true);
		$values=array();
		foreach($insert as $i) $values[]='("'.$_SESSION["lang"].'", '.$i.','.$c["affixruleid"].')'; 
		$q='insert into affixrule_to_affixclass (`lang`,`affixclassid`, `affixruleid`) VALUES '.implode(",",$values);
		$result=$mysqli->query($q);
		$res["log"].=$q;
	}
	$res["nextsingle"]=$_POST["nextsingle"];
	$res["next"]=$_POST["next"];
	$res["nextprev"]=$_POST["nextprev"];

}
echo json_encode($res);
