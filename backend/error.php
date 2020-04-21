<?php
function errorMessage($error) {
	global $log;
	echo json_encode(array("warning"=>$error,"log"=>$log));
	exit;
}
