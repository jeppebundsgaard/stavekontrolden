<?php
	$relative="../";
	include_once($relative."/settings/conf.php");
	include_once($GLOBALS["backenddir"]."checklogin.php");
	
	if($_POST["org_id"] and $_SESSION["user_id"]!=1) exit;
	global $res;
	$res["org_id"]=$_POST["org_id"];
	$q="select * from users where org_id=".($_POST["org_id"]?$_POST["org_id"]:$_SESSION["user_id"]);
// 	echo $q;
	$result=$mysqli->query($q);
	
	
?>
<div class="container-fluid">

	<div class="row">

		<h3><?= _("Users in the organization"); ?></h3>
		<table class="table table-sm table-hover mt-2">
			<thead>
				<tr>
				<th scope="col"><?= _('Name');?></th>
				<th scope="col"><?= _('Username');?></th>
				<th scope="col"><?= _('E-mail');?></th>
				<th scope="col"><?= _('Permissions');?></th>
				<th scope="col"><?= _('Last Change');?></th>
				<th scope="col"><?= _('Remove');?></th>
				</tr>
			</thead>
			<tbody class="table-striped " id="userlist">
			<?php
				while($r=$result->fetch_assoc()) { ?>
					<tr><td><?= $r["name"];?></td><td><?= $r["username"];?></td><td><?= $r["email"];?></td><td class="changePermissions" data-user="<?= $r["user_id"];?>"><?= $r["permissions"];?></td><td><?= $r["lastchange"];?></td><td><button type="button" class="btn btn-danger remove" data-user="<?= $r["user_id"];?>"><?= _('Remove');?></button></td><tr>
			<?php	}
			?>
			</tbody>
		</table>
	</div>
	<div class="row">
		<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#inviteUser" aria-expanded="false" aria-controls="inviteUser"><?= _('Invite user');?></button>
	</div>
	<div class="row">
		<div class="collapse" id="inviteUser">
			<div class="form-group">
				<label for="username"><?= _('Username') ?></label>
				<input type="text" class="form-control userinput" id="username" value="">
				<label for="email"><?= _('E-mail') ?></label>
				<input type="text" class="form-control userinput" id="email" aria-describedby="emailHelp" value="">
				<small id="emailHelp" class="form-text text-muted"><?= _('Invite existing users by username or e-mail. The user will have instant access to your organization.') ?></small>
				<input type="password" class="form-control userinput" id="password" aria-describedby="passHelp" placeholder="<?=_('Only needed if you create a new user');?>">
				<small id="passHelp" class="form-text text-muted"><?= _('You only need to provide a password if you create a new user.') ?></small>
				<button type="button" class="btn btn-success" id="invite"><?= _('Invite user');?></button> <button type="button" class="btn btn-secondary" id="create"><?= _('Create user');?></button>
			</div>
		</div>
	</div>
</div>
