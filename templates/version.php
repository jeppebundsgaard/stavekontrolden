<?php
	$relative="../";
	include_once($relative."/settings/conf.php");
	include_once($GLOBALS["backenddir"]."checklogin.php");
	
$dictionarydir=$relative."dictionaries/".$_SESSION["lang"]."/";
$versionfile=$dictionarydir."version.txt";

$oldversion=file_get_contents($versionfile);

?>
<div class="row justify-content-center">
		<!-- Header menu -->
		<h3><?= _("Version"); ?></h3>
</div>
<div class="form-group">
	<label for="versioninput"><?= _('Change Version Number') ?></label>
	<input type="text" class="form-control versioninput" id="versioninput" value="<?= $oldversion;?>">
</div>

<div class="modal-footer"><button class="btn btn-success" id="finish" data-pagetype="org"><?= _('Finish');?></button></div>
