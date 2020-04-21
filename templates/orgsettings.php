<?php
	global $backenddir;
	$relative="../";
	include_once($relative."/settings/conf.php");
	include_once($GLOBALS["backenddir"]."checklogin.php");
	include_once($functionsdir."templatefunctions.php");
	
	$q="select settings from organizations where org_id=".$_SESSION["user_id"];
	$result=$mysqli->query($q);
	$r=$result->fetch_assoc();
	$args=array();
	$args["settings"]=json_decode($r["settings"]);
	$args["settingstype"]="org";
	$t='<div class="row justify-content-center"><h3>'._('Standard Settings').'</h3></div>';
	$t.=get_template("settings",$args)["template"];

	$res=array('settings'=>$args["settings"],'settingstemplate'=>$t,'contentdiv'=>"orgcontentdiv","settingsfile"=>"orgsettingsupdate");
	return $res;
