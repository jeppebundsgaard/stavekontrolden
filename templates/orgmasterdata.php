<?php
	$relative="../";
	include_once($relative."/settings/conf.php");
	include_once($GLOBALS["backenddir"]."checklogin.php");
	
	$q="select * from organizations where org_id=".$_SESSION["user_id"];
	$result=$mysqli->query($q);
	$r=$result->fetch_assoc();

?>
<div class="row justify-content-center">
		<!-- Header menu -->
		<h3><?= _("Master Data"); ?></h3>
</div>
<div class="form-group">
	<label for="orgname"><?= _('Name') ?></label>
	<input type="text" class="form-control orginput" id="orgname" value="<?= $r["orgname"];?>">
</div>
<div class="form-group">
	<label for="orgslogan"><?= _('Slogan') ?></label>
	<input type="text" class="form-control orginput" id="orgslogan" aria-describedby="sloganHelp" value="<?= $r["orgslogan"];?>">
	<small id="sloganHelp" class="form-text text-muted"><?= _('The slogan is shown at the front page') ?></small>
</div>
<div class="form-group">
	<label for="orgurl"><?= _('URL') ?></label>
	<div class="input-group mb-2">
        <div class="input-group-prepend">
          <div class="input-group-text">https://<?=$baseurl;?>?o=</div>
        </div>
		<input type="text" class="form-control orginput" id="orgurl" value="<?= $r["orgurl"];?>" aria-describedby="urlHelp">
	</div>
	<small id="urlHelp" class="form-text text-muted"><?= _("This is the direct link to your organization's front page") ?></small>
</div>

<div class="modal-footer"><button class="btn btn-success" id="finish" data-pagetype="org"><?= _('Finish');?></button></div>
