<?php
	$relative="../";
	include_once($relative."/settings/conf.php");
	include_once($GLOBALS["backenddir"]."checklogin.php");
	
	if($_SESSION["user_id"]!=1) exit;
	global $res;
	$res["org_id"]=$_POST["org_id"];
	$q="select * from users where 1 order by lastchange desc";//org_id=".($_POST["org_id"]?$_POST["org_id"]:$_SESSION["user_id"]);
// 	echo $q;
	$result=$mysqli->query($q);
	
	
?>
<div class="container-fluid">

	<div class="row">

		<h3><?= _("Stavekontrolden Users"); ?></h3>
		<table class="table table-sm table-hover mt-2">
			<thead>
				<tr>
				<th scope="col"></i><?= _('User-id');?></th>
				<th scope="col"></i><?= _('Name');?></th>
				<th scope="col"></i><?= _('Username');?></th>
				<th scope="col"></i><?= _('E-mail');?></th>
				<th scope="col"></i><?= _('Organization');?></th>
				<th scope="col"></i><?= _('Permissions');?></th>
				<th scope="col"></i><?= _('Last Change');?></th>
				<th scope="col"></i><?= _('Remove');?></th>
				</tr>
			</thead>
			<tbody class="table-striped " id="userlist">
			<?php
				while($r=$result->fetch_assoc()) { ?>
					<tr><td><?= $r["user_id"];?></td><td><?= $r["name"];?></td><td><?= $r["username"];?></td><td><?= $r["email"];?></td><td><?= $r["org_id"];?></td><td class="changePermissions" data-user="<?= $r["user_id"];?>"><?= $r["permissions"];?></td><td><?= $r["lastchange"];?></td><td><button type="button" class="btn btn-danger remove" data-user="<?= $r["user_id"];?>"><?= _('Remove');?></button><button type="button" class="btn btn-primary newpass" data-user="<?= $r["user_id"];?>"><?= _('New password');?></button></td><tr>
			<?php	}
			?>
			</tbody>
		</table>
	</div>
</div>
