<?php
if(!$templatesdir) { //Then we have a call from js
	$relative="../";
	include_once($relative."/settings/conf.php");
// 	include_once($functionsdir."setlang.php");
	echo json_encode(get_template($_POST["template"],$_POST));
	
}
function e($text) {
	echo $text;
}
function get_template($filename,$args=array()) {
	global $log,$relative,$templatesdir,$functionsdir,$backenddir,$pagesdir,$mysqli,$res;;
	extract($args);
// 	echo ($templatesdir.$filename.".php");
    if (is_file($templatesdir.$filename.".php")) {
        ob_start();
        include $templatesdir.$filename.".php";
        #if($run) echo '<script>var runWhenReady="'.$run.'";var args="'.$args.'"</script>';
        if(!is_array($res)) $res=array();
        return array_merge(array("template"=>ob_get_clean()),$res);
    }
    return false;
}
