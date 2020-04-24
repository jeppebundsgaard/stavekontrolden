<?php
if(!$systemdirs["templates"]) { //Then we have a call from js
	$relative="../";
	include_once($relative."/settings/conf.php");
// 	include_once($systemdirs["functions"]."setlang.php");
	echo json_encode(get_template($_POST["template"],$_POST));
	
}
function e($text) {
	echo $text;
}
function get_template($filename,$args=array()) {
	global $log,$relative,$systemdirs,$mysqli,$res;;
	extract($args);
// 	echo ($systemdirs["templates"].$filename.".php");
    if (is_file($systemdirs["templates"].$filename.".php")) {
        ob_start();
        include $systemdirs["templates"].$filename.".php";
        #if($run) echo '<script>var runWhenReady="'.$run.'";var args="'.$args.'"</script>';
        if(!is_array($res)) $res=array();
        return array_merge(array("template"=>ob_get_clean()),$res);
    }
    return false;
}
