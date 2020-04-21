<?php
$relative="../";
include_once($relative."/settings/conf.php");

$res=array();
$allowedtypes=array("odt","txt","html","tex","latex","sgml","xml","nroff","troff");
$filetypeflag=array("odt"=>"-O","html"=>"-H","tex"=>"-t","latex"=>"-t","sgml"=>"-H","xml"=>"-X","nroff"=>"-n","troff"=>"-n");
if (isset($_FILES['wordfile']) ) {
	$fileparts=explode(".",$_FILES['wordfile']['name']);
	$filetype=array_pop($fileparts);
	$filename=implode(".",$fileparts);
	if(in_array($filetype,$allowedtypes)) {
			$tmp_name = $_FILES['wordfile']['tmp_name'];
			// move the file to a directory
// 			move_uploaded_file( $tmp_name, $scoresheetsdir.$userfilename);
	}
	else
		$res["warning"]=sprintf(_("The file was not one of the allowed types (%s)"),implode(", ",$allowedtypes));
}
else
	$res["warning"]=_("The upload went wrong for unknown reasons");

#$res["log"].=$tmp_name;
if($tmp_name and !$res["warning"]) {
	$dicfile=pathinfo($_SERVER['SCRIPT_FILENAME'])["dirname"]."/../dictionaries/".$_SESSION["lang"]."/".$_SESSION["lang"];
	$cmd=$GLOBALS["hunspell"]." -l -i UTF-8 -d '".$dicfile."' ".$filetypeflag[$filetype]." '".$tmp_name."'";
	$res["log"].=$cmd;
	exec($cmd,$newwords , $retval);
	$res["newwords"]=$newwords;
} 
$res["log"].=print_r($newwords,true);
echo json_encode($res);
