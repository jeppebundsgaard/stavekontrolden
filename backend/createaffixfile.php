<?php
$dictionarydir=$relative."dictionaries/".$_SESSION["lang"]."/";
$versionfile=$dictionarydir."version.txt";
$version=explode(".",file_get_contents($versionfile));
$version[2]+=1; # Microversion increased by 1
$version=implode(".",$version);
file_put_contents($versionfile,$version);
echo "<p>"._(sprintf("Version %s",$version))."</p>";

$q="select * from start_definitions where lang='".$_SESSION["lang"]."' order by start_definitions";
$result=$mysqli->query($q);

if(!$result) $res["log"].=mysqlerror($q); 
else { 
	while($r=$result->fetch_assoc())
	{
		$aff.=str_replace("___YEAR___",date("Y"),str_replace("___VERSION___",$version,$r["start_definitions"]))."\n";
	}
}
# Get the affix classes
$q="select * from affixclass ORDER BY id";
$result=$mysqli->query($q);

###########Hacks - til løsning af dobbeltkonsonant-problemet ######
#$hacks=array(9,46,132,133,254,267);

while($r=$result->fetch_assoc())
{
	$affixclass=$r["affixclass"];
	$affixclassid=$r["id"];
	
	$aff.="\n\n#".$r["description"];
	if($affixclass=="SFX" or $affixclass=="PFX")
	{	
		$q="select `stripchars`, `affix`, (select GROUP_CONCAT(rc.affixclassid SEPARATOR ',') from affixrule_to_affixclass rc where lang='".$_SESSION["lang"]."' and rc.affixruleid=r.`id` ORDER BY affixclassid) as affixclassids, `condition`, `morphdescr`, `replacement` from affixrule r left join morphdescr m on m.`id`=r.`morphdescrid` where r.`lang`='".$_SESSION["lang"]."' and `affixclassid`=".$affixclassid." ORDER BY r.id";
// 		$res["log"].=$q;
		$result2=$mysqli->query($q);
		$num=$result2->num_rows;
		if($num)
		{
			$affrules="";
			while($r2=$result2->fetch_assoc())
			{
// 				$q="select affixclassid from affixrule_to_affixclass where lang='".$_SESSION["lang"]."' and affixruleid=".$r2["affixruleid"]." ORDER BY affixclassid";
// 				$result3=$mysqli->query($q);
// 				$r3=$result3->fetch_all();
// 				$ass=($r3?call_user_func_array('array_merge',$r3):array());
				$ass=$r2["affixclassids"];
				$affclasses=($ass?"/".$ass:"")." ".$r2["condition"].($r2["morphdescr"]?"\t+".$r2["morphdescr"]:"");
				$affrule=$affixclass." ".$affixclassid." ".$r2["stripchars"]." ".$r2["affix"].$affclasses;
				if($r2["replacement"]) {
					$replacement=$r2["replacement"];
					$replacement=str_replace(array_keys($GLOBALS["letterclasses"]),$GLOBALS["letterclasses"],$replacement);
					$replacement=preg_replace_callback("/(\w):(\w)/i",function($x) {return implode(",",range($x[1],$x[2]));},$replacement);
					$replacement=str_replace(" ","",$replacement);
					#print_r($replacement);
					$replacement=explode(",",$replacement);
					$num+=count($replacement)-1;
					$affrulearr=array();
					foreach($replacement as $i=>$x) $affrulearr[$i]=str_replace("#",$x,$affrule);
					#print_r($affrulearr);
					
				} else $affrulearr=array($affrule);
				$affrules.="\n".implode("\n",$affrulearr);
			}
			$aff.="\n".$affixclass." ".$affixclassid." ".$r["crossproduct"]." ".$num.$affrules;
			
		}
	}
	else $aff.="\n".$affixclass." ".$affixclassid;
}
$aff=str_replace("\r\n","\n",$aff);
file_put_contents($dictionarydir.$_SESSION["lang"].".aff",$aff);	

echo '<p><a class="" href="'.str_replace("../","",$dictionarydir).'da_DK.aff?v='.date("YmdHis").'" target="_blank">'._("Affix File Created")."</a></p>";


