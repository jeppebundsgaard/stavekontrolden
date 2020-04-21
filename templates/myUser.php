<?php
	$relative="../";
	include_once($relative."/settings/conf.php");
	include_once($GLOBALS["backenddir"]."checklogin.php");
	
	$q="select * from users u left join organizations o on u.org_id=o.org_id where user_id=".$_SESSION["realuser_id"];
	$result=$mysqli->query($q);
	$r=$result->fetch_assoc();

?>
<div id="usercontentdiv" class="container-fluid">

<div class="row justify-content-center">
		<!-- Header menu -->
		<h3><?= _("User Data"); ?></h3>
</div>
<div class="form-group">
	<label for="name"><?= _('Name') ?></label>
	<input type="text" class="form-control userinput" id="name" value="<?= $r["name"];?>">
</div>
<div class="form-group">
	<label for="username"><?= _('Username') ?></label>
	<input type="text" class="form-control userinput" id="username" value="<?= $r["username"];?>">
</div>
<div class="form-group">
	<label for="email"><?= _('E-mail') ?></label>
	<input type="email" class="form-control userinput" id="email" aria-describedby="emailHelp" value="<?= $r["email"];?>">
	<small id="emailHelp" class="form-text text-muted"><?= _('You are welcome to change your e-mail. Please remember to use the new address for login in the future.') ?></small>
</div>
<div class="form-group">
	<label for="password"><?= _('Password') ?></label>
	<input type="password" class="form-control userinput password" id="password" placeholder="<?= _('Unchanged'); ?>" value="">
</div>
<?php if($r["org_id"]) { ?>
	<h4><?= _('Organization:')." ".$r["orgname"]; ?></h4>
	<div class="custom-control custom-radio custom-control-inline"">
		<input type="radio" class="custom-control-input userinput" checked="checked" name="org_id" id="org1" value="<?= $r["org_id"];?>">
		<label class="custom-control-label" for="org1"><?= _('Stay'); ?></label>
	</div>
	<div class="custom-control custom-radio custom-control-inline">
		<input type="radio" class="custom-control-input userinput" name="org_id" id="org2" value="0" aria-describedby="orgHelp">
		<label class="custom-control-label" for="org2"><?= _('Remove me!'); ?></label>
	</div>
	<small id="orgHelp" class="form-text text-muted"><?= _("If you remove yourself from the organization, you need someone to re-invite you, before you can come back.") ?></small>
<?php } ?>
<!-- <div class="modal-footer"><button class="btn btn-success" id="finish" data-pagetype="user"><?= _('Finish');?></button></div> -->
</div>
