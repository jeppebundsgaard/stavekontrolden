<?php 
session_start();
if(!$_SESSION["user_id"]) {//
	$_POST["loggedout"]=1;
	echo json_encode($_POST); //
	exit;
}
