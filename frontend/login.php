<?php
$relative="../";
include_once($relative."/settings/conf.php");

$logintype=$_POST["logintype"];
if ($logintype=="signup" and !filter_var($_POST["inputEmail"], FILTER_VALIDATE_EMAIL)) $warning=_("Not a valid e-mail address");
else {
	$email=$_POST["inputEmail"];
	$password=md5($_POST["inputPassword"]);
	if($logintype=="signup") {
		$q='select * from users where email LIKE "'.$email.'"';
		$res=$mysqli->query($q);
		$r=$res->fetch_assoc();
		if($r) $warning=_("E-mail already registered");
		else {
			$q='insert into users (username,email,password) values ("'.strtolower($email).'","'.strtolower($email).'","'.$password.'")';
#			$log.=$q;
			$res=$mysqli->query($q);
			#$_SESSION["user_id"]=$mysqli->insert_id;
			#$_SESSION["realuser_id"]=$_SESSION["user_id"];
			$welcome=_("Welcome to Stavekontrolden!");
		}
	}
	if($logintype=="login" or $welcome) {
		
		$log.=$_POST["newpass"];
		if($_POST["newpass"]) {
			$file=$relative."../newpass/".$_POST["newpass"];
			$log.=$file;
			if(file_exists($file)) {
				$email=file_get_contents($file);
				unlink($file);
				$q='update users set password="'.$password.'" where email LIKE "'.$email.'"';
				$res=$mysqli->query($q);
			}
		}
		$q='select * from users u left join organizations o on u.org_id=o.org_id where (email LIKE "'.$email.'" or username LIKE "'.$email.'") and password="'.$password.'"';
		#$log.=$q;
		$res=$mysqli->query($q);
		$r=$res->fetch_assoc();
		if($r) {
			$_SESSION["realuser_id"]=$r["user_id"];
			$_SESSION["permissions"]=$r["permissions"];
			$_SESSION["lang"]=$r["lang"];
			if($r["org_id"]>0) {
				$r["user_id"]=$r["org_id"];
				$_SESSION["orgMember"]=$r["org_id"];
				$_SESSION["lang"]=$r["lang"];
			}
			$_SESSION["user_id"]=$r["user_id"];
			$_SESSION["user_email"]=$r["email"];
			$_SESSION["username"]=$r["username"];
			if(!$welcome) $welcome=_("Welcome back to Stavekontrolden!");
		}
		else $warning=_("E-mail, username or password was wrong");
	}
	if($welcome and $_POST["rememberMe"]=="true") {
		setcookie("rememberMe","true",time()+60*60*24*365,"/"); //Let Stavekontrolden remember me one more year ...
	}
	else setcookie("rememberMe","dont",0,"/");
#	$log.=print_r($_COOKIE,true);
	
}
echo json_encode(array("log"=>$log,"warning"=>$warning,"user_id"=>$_SESSION["user_id"],"message"=>$welcome,"relogin"=>$_POST["relogin"]));
