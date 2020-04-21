<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$res=array();
if($_POST["limit"]>0) $_SESSION["limit"]=$_POST["limit"];
$show=($_SESSION["limit"]?$_SESSION["limit"]:25);

$cols='`id` ,`'.$_POST["singlevalue"].'` ';
$wheres=array();
$f=$_POST["filtersetting"];
$_SESSION["filtersetting"]=$f;
parse_str($_POST["where"], $wheres);
foreach($wheres as $k=>$w) {
	if($w!="")
		$where.=' AND `'.$k.'`'.(is_numeric($w)?'='.$w:' LIKE "'.(in_array($f,array("inword","endword"))?"%":"").''.$w.''.(in_array($f,array("inword","beginword"))?"%":"").'"');
}
$where=" WHERE lang='".$_SESSION["lang"]."' ".$where;
$order=" ORDER BY ".($_POST["order"]?$_POST["order"]:"`".$_POST["singlevalue"]."`");

$baseq=" from ".$_POST["singlevalue"]." ".$where;


if($_POST["next"]<0) {
    $orderdesc.=" DESC";
    $_POST["next"]+=1;
}
$res["numshow"]=abs($_POST["next"])*$show;
$limit=" LIMIT ".abs($_POST["next"])*$show.",".$show;
$q='select '.$cols.$baseq.$order.$limit;

$result=$mysqli->query($q);
if(!$result) $res["log"].=mysqlerror($q); 
else $res["rows"]=$result->fetch_all();
if(empty($res["rows"])) $res["rows"]=array(1=>array(_("No more values")));
$res["log"]=$q;#print_r($_POST,true).$q;
echo json_encode($res);
