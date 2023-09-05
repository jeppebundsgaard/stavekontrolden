<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($systemdirs["backend"]."checklogin.php");
if(!$_SESSION["user_id"]) exit;
$c=array();
parse_str($_POST["word"], $c);
// $res["log"].=print_r($c,true);
$unescaped=$c;
$numc=count($c);
foreach($c as $i=>$v) {
	if(!is_numeric($c[$i]))
		$c[$i]=$mysqli->real_escape_string($c[$i]);
}
if(!$c["word"] or !$c["wordclass"]) {
	$res["warning"]=_("Not saved! You need to provide both a word and a word class.");
}
else {
	if($c["wordid"]>0) {
		$cols=array("word","wordclass","wordstatus","misspellings","word_definition","comments","technical_term","fugeelementid","strong_declension","omitsuggestion");
		$colstxt=implode("`,`",$cols);
		$q='select `'.$colstxt.'` from words where lang="'.$_SESSION["lang"].'" and id='.$c["wordid"];
		$result=$mysqli->query($q);
		$r=$result->fetch_assoc();
		$log="";
//  		$res["log"].=print_r($r,true);
		for($i=0;$i<count($cols);$i++) {
			if(is_numeric($r[$cols[$i]]) and $r[$cols[$i]]==0 and !$unescaped[$cols[$i]]) $unescaped[$cols[$i]]=0;
// 			$res["log"].="-$cols[$i]:".$r[$cols[$i]]."!=".$unescaped[$cols[$i]]."-\n";
			$log.=($r[$cols[$i]]!=$unescaped[$cols[$i]]?$cols[$i]." => ".$unescaped[$cols[$i]].".\n":"");
		}
		if($log) { #Changes made
// 		$res["log"].="#Changes made";
			$q='update words set `word`="'.$c["word"].'", `wordclass`="'.$c["wordclass"].'", `wordstatus`="'.$c["wordstatus"].'", `lastuser`="'.$_SESSION["username"].'", `misspellings`="'.$c["misspellings"].'",`word_definition`="'.$c["word_definition"].'", `comments`="'.$c["comments"].'", `technical_term`="'.($c["technical_term"]?$c["technical_term"]:0).'", `fugeelementid`="'.($c["fugeelementid"]?$c["fugeelementid"]:0).'", `strong_declension`="'.$c["strong_declension"].'", `omitsuggestion`='.($c["omitsuggestion"]?1:0).', `log`=CONCAT("'.date("Y-m-d H:i:s").": ".$_SESSION["username"].': '.$mysqli->real_escape_string($log).'",`log`) where lang="'.$_SESSION["lang"].'" and id='.$c["wordid"];
// 			$res["log"].=$q;
			$result=$mysqli->query($q);
		}
	}
	else {
	//Status set to 2 when word created
		$q='insert into words (`word`, `wordclass`, `wordstatus`,  `lastuser`, `contributor`, `misspellings`,`word_definition`, `comments`, `technical_term`, `fugeelementid`, `strong_declension`, `omitsuggestion`,`log`) 
		VALUES ("'.$c["word"].'", "'.$c["wordclass"].'", 2, "'.$_SESSION["username"].'", "'.$_SESSION["username"].'", "'.$c["misspellings"].'", "'.$c["word_definition"].'", "'.$c["comments"].'", "'.$c["technical_term"].'", "'.$c["fugeelementid"].'", "'.$c["strong_declension"].'",'.($c["omitsuggestion"]?1:0).', "'.date("Y-m-d H:i:s").": ".$_SESSION["username"].": "._(sprintf("%s created",$c["word"])).'")';
		$result=$mysqli->query($q);
// 			$res["log"].=$q;
	}
	// $res["log"].=$q;
	$res["andThen"]=$_POST["andThen"];
// 		$res["log"].=print_r($res["andThen"],true);
}
echo json_encode($res);
