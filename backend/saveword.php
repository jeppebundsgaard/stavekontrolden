<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($backenddir."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$c=array();
parse_str($_POST["word"], $c);
$unescaped=$c;
$numc=count($c);
for($i=0;$i<$numc; $i++) {
	if(!is_numeric($c[$i]))
		$c[$i]=$mysqli->real_escape_string($c[$i]);
}
if(!$c["word"] or !$c["wordclass"]) {
	$res["warning"]=_("Not saved! You need to provide both a word and a word class.");
}
else {
	if($c["wordid"]>0) {
		$cols=array("word","wordclass","alternatives","word_definition","comments","technical_term","fugeelementid","strong_declension","apostroph");
		$colstxt=implode("`,`",$cols);
		$q='select `'.$colstxt.'` from words where lang="'.$_SESSION["lang"].'" and id='.$c["wordid"];
		$result=$mysqli->query($q);
		$r=$result->fetch_assoc();
		$log="";
		for($i=0;$i<count($c);$i++) {
			$log.=($r[$cols[$i]]!=$unescaped[$cols[$i]]?$cols[$i]." => ".$c[$cols[$i]].".\\n":"");
		}
		$q='update words set `word`="'.$c["word"].'", `wordclass`="'.$c["wordclass"].'", `wordstatus`="'.$c["wordstatus"].'", `lastuser`="'.$_SESSION["username"].'", `word_definition`="'.$c["word_definition"].'", `comments`="'.$c["comments"].'", `technical_term`="'.$c["technical_term"].'", `fugeelementid`="'.$c["fugeelementid"].'", `strong_declension`="'.$c["strong_declension"].'", `apostroph`="'.$c["apostroph"].'", `log`=CONCAT("'.date("Y-m-d H:i:s").": ".$_SESSION["username"].': '.$log.'",`log`) where lang="'.$_SESSION["lang"].'" and id='.$c["wordid"];
	}
	else {
	//Status set to 2 when word created
		$q='insert into words (`word`, `wordclass`, `wordstatus`,  `lastuser`, `contributor`, `word_definition`, `comments`, `technical_term`, `fugeelementid`, `strong_declension`, `apostroph`, `log`) 
		VALUES ("'.$c["word"].'", "'.$c["wordclass"].'", 2, "'.$_SESSION["username"].'", "'.$_SESSION["username"].'", "'.$c["word_definition"].'", "'.$c["comments"].'", "'.$c["technical_term"].'", "'.$c["fugeelementid"].'", "'.$c["strong_declension"].'", "'.$c["apostroph"].'", "'.date("Y-m-d H:i:s").": ".$_SESSION["username"].": "._(sprintf("%s created",$c["word"])).'")';

	}
	$result=$mysqli->query($q);
	$res["nextsingle"]=$_POST["nextsingle"];
	$res["next"]=$_POST["next"];
	$res["nextprev"]=$_POST["nextprev"];
}
echo json_encode($res);
