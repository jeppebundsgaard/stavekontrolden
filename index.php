<?php
// print_r($_SERVER);
$local=($_SERVER["HTTP_HOST"]=="localhost");
if($local) 
	ini_set("display_errors","true");

$relative="./";
include_once("settings/conf.php");

#print_r($_SESSION);
// print_r($_COOKIE);
if($_POST["logout"] or !$_COOKIE["rememberMe"]) { //If rememberme not set, the browser has been closed. Reset user...
	unset($_SESSION["user_id"]);
	unset($_SESSION["realuser_id"]);
	unset($_SESSION["orgMember"]);
	unset($_SESSION["permissions"]);
	unset($_SESSION["rememberMe"]);
	unset($_SESSION["lang"]);
	unset($_SESSION["user_email"]);
	unset($_SESSION["username"]);
 	setcookie("rememberMe", "", time() - 3600,"/");
} 
// print_r($_SESSION);
$user_id=$_SESSION["user_id"];
if($_GET["istest"]) $_SESSION["isTest"]=true;

include($functionsdir."database.php");
include_once($functionsdir."templatefunctions.php");

if($_GET["o"]) {
	$o=$_GET["o"];
	$q="select * from organizations where orgurl='".$o."'";
	$result=$mysqli->query($q);
	if($result->num_rows==0) {$warning= _("Error: No organization with that name");$error=true;}
	else {
		$r=$result->fetch_assoc();
		$isOrg=$r["org_id"];
	}
}
if($user_id and ($_GET["edit"] or $_GET["backend"])) $isBackend=true;
// echo $q;
		
include_once("header.php");

if(!$error) {
	if($_GET["contact"]) {
		echo get_template("contact")["template"];
	}
	elseif($_GET["dictionaries"]) {
		echo get_template("dictionaries")["template"];
	}
	elseif($_GET["cookies"]) {
		echo get_template("cookies")["template"];
	}
	elseif($_GET["page"]) {
		echo get_template("page")["template"];
	}
	elseif(!$user_id and ($_GET["backend"] or $_GET["edit"])) {
		echo get_template("login")["template"];
	}
	else if($_GET["backend"] and $user_id) {
		echo get_template("frontpage",array("run"=>"doNothing","args"=>"{}"))["template"];
	}
	elseif($_GET["newpass"]) {
		echo get_template("newpass",array("newpass"=>$_GET["newpass"]))["template"];
	}
	else {
		echo get_template("frontpage",array("r"=>$r,"isOrg"=>$isOrg))["template"];
	}
} else echo "<div><h3>".$warning."</h3></div>";
include_once("footer.php");
