<?php
// Base URL
$GLOBALS=array(
"baseurl"=>"stavekontrolden.dk",
// Letter Classes for replacement in affix rules
"letterclasses"=>array(
				"KONS"=>"b,c,d,f,g,h,j,k,l,m,n,p,q,r,s,t,v,w,x,z",
				"VOKAL"=>"a,e,i,o,u,y,æ,ø,å",
				"ALFABET"=>"a:z,æ,ø,å"),
"hunspell"=>"/usr/bin/hunspell",
"nowordclassid"=>24,
"langtoorg"=>array("da_DK"=>1)
					
);

//////////////////////////////
// Leave these as they are ...
//////////////////////////////
session_start(array('cookie_lifetime' => 60*60*24*365)); //Let Stavekontrolden remember me one more year ...);
// ini_set("display_errors","true");
if(!$relative) $relative="./";
$settingsdir=$relative."settings/";
$templatesdir=$relative."templates/";
$frontenddir=$relative."frontend/";
$functionsdir=$relative."functions/";
$backenddir=$relative."backend/";
$imgdir=$relative."img/";
$jsdir=$relative."js/";
$pagesdir=$relative."pages/";

include_once($functionsdir."database.php");
include_once($functionsdir."setlang.php");
list($locale,$lang)=set_lang($relative);
