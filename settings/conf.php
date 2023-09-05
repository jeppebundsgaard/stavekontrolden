<?php
// Base URL
$globals=array(
"baseurl"=>"stavekontrolden.dk",
// Letter Classes for replacement in affix rules
"letterclasses"=>array(
				"KONS"=>"b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,z",
				"VOKAL"=>"a,e,i,o,u,y,æ,ø,å",
				"ALFABET"=>"a:z,æ,ø,å"),
"hunspell"=>"/usr/bin/hunspell",
"nowordclassid"=>24,
"langtoorg"=>array("da_DK"=>1, "en_US"=>2),
"collation"=>array("da_DK"=>"utf8mb4_danish_ci", "en_US"=>"utf8mb4_unicode_ci")
);
foreach ($globals as $key => $value) {
    $GLOBALS[$key] = $value;
}
//////////////////////////////
// Leave these as they are ...
//////////////////////////////
session_start(array('cookie_lifetime' => 60*60*24*365)); //Let Stavekontrolden remember me one more year ...);
// ini_set("display_errors","true");
if(!$relative) $relative="./";
$systemdirs=array(
	"settings"=>$relative."settings/",
	"templates"=>$relative."templates/",
	"frontend"=>$relative."frontend/",
	"functions"=>$relative."functions/",
	"backend"=>$relative."backend/",
	"img"=>$relative."img/",
	"js"=>$relative."js/",
	"pages"=>$relative."pages/"
);
include_once($systemdirs["functions"]."database.php");
include_once($systemdirs["functions"]."setlang.php");
list($locale,$lang)=set_lang($relative);
