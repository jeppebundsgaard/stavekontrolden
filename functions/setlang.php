<?php
function set_lang($relative) {
	global $mysqli;
	if($_GET["setlang"]) $_SESSION["locale"]=$_GET["setlang"];

	//Just delete this line when you think you are ready....
	if($_SESSION["locale"]=="da_DK.UTF-8") 
		$_SESSION["locale"]="";

	if(!$_SESSION["locale"]) {
		#global $relative;	file_put_contents($relative."secrets/lang.txt",$_SERVER['HTTP_ACCEPT_LANGUAGE']."\n",FILE_APPEND);
		$ip=$_SERVER['REMOTE_ADDR'];
#		$ip="132.130.21.130";
		$q="select country_code from ip2location_db1 where INET_ATON('".$ip."') <= ip_to LIMIT 1";
		$re=$mysqli->query($q);
		$cntry=strtolower($re->fetch_assoc()["country_code"]);
// 		echo $cntry;
		$accept=explode(",",$_SERVER['HTTP_ACCEPT_LANGUAGE']);
		$keyaccept=array();
		foreach($accept as $la) {
			$tmp=explode(";q=",$la);
			$keyaccept[$tmp[0]]=($tmp[1]?$tmp[1]:1);
		}
		if($cntry and $cntry!="-")
			$keyaccept[$cntry]=2;
		arsort($keyaccept);
		$langs=array("en"=>"en_US","us"=>"en_US","au"=>"en_US","sg"=>"en_US","hk"=>"en_US","nz"=>"en_US","da"=>"da_DK","en_US"=>"en_US","da_DK"=>"da_DK");
		$preferred=key(array_intersect_key($keyaccept,$langs));
		$_SESSION["locale"]=$langs[$preferred];
 		if(!$_SESSION["locale"]) $_SESSION["locale"]=$langs["da"];//"da_DK";
	}
	$locale=$_SESSION["locale"];
// 	echo $locale;
	putenv("LANGUAGE=".$locale.".UTF-8");
	setlocale(LC_ALL,$locale.".UTF-8",$locale);
	$domain="messages";
	$pathToDomain = __DIR__ . "/../locale";
	$realpath=bindtextdomain($domain, $pathToDomain);
	bind_textdomain_codeset($domain,"UTF-8");

	$results = textdomain($domain);
	$lang=explode("_",$locale)[0];
	return array($locale,$lang);
}
#Copy all gamefiles...
#ls | grep -E "^e?[0-9]+" | xargs  -I '{}' mv {}  da_DK
