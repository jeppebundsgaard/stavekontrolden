<?php
$relative="../";
include_once($relative."/settings/conf.php");
include_once($GLOBALS["backenddir"]."checklogin.php");
file_put_contents($systemdirs["pages"].$_POST["pagetype"]."/".$_POST["id"].".html",$_POST["pagecontent"]);
echo json_encode($_POST);
