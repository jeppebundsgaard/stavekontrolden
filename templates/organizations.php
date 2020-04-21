<?php
	$relative="../";
	include_once($relative."/settings/conf.php");
	include_once($GLOBALS["backenddir"]."checklogin.php");
	
	$q="select * from organizations where 1";
// 	echo $q;
	$result=$mysqli->query($q);
	
	
?>
<div class="container-fluid">

	<div class="row">

		<h3><?= _("Organizations"); ?></h3>
		<table class="table table-sm table-hover mt-2">
			<thead>
				<tr>
				<th scope="col"></i><?= _('Name');?></th>
				<th scope="col"></i><?= _('Language');?></th>
				<th scope="col"></i><?= _('Slogan');?></th>
				<th scope="col"></i><?= _('Url');?></th>
				<th scope="col"></i><?= _('Users');?></th>
				<th scope="col"></i><?= _('Remove');?></th>
				</tr>
			</thead>
			<tbody class="table-striped " id="organizationlist">
			<?php
				while($r=$result->fetch_assoc()) { ?>
					<tr><td><?= $r["orgname"];?></td><td><?= $r["lang"];?></td><td><?= $r["orgslogan"];?></td><td><?= $r["orgurl"];?></td><td><button type="button" class="btn btn-primary btn-small editorgusers" data-org_id="<?= $r["org_id"];?>"><?= _('Users');?></button></td><td><button type="button" class="btn btn-danger btn-small removeorg" data-org_id="<?= $r["org_id"];?>"><?= _('Remove');?></button></td><tr>
			<?php	}
			?>
			</tbody>
		</table>
	</div>
	<div class="row">
		<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#createOrg" aria-expanded="false" aria-controls="createOrg"><?= _('Create Organization');?></button>
	</div>
	<div class="row">
		<div class="collapse" id="createOrg">
			<div class="form-group">
				<label for="orgname"><?= _('Name') ?></label>
				<input type="text" class="form-control" id="orgname" value="">
				<label for="orglang"><?= _('Language') ?></label>
				<input type="text" class="form-control" id="orglang" value="">
				<label for="orgslogan"><?= _('Slogan') ?></label>
				<input type="text" class="form-control" id="orgslogan" value="">
				<label for="orgurl"><?= _('URL (shortname)') ?></label>
				<input type="text" class="form-control" id="orgurl" value="">
				
				<button type="button" class="btn btn-success" id="doCreateOrg"><?= _('Create Organization');?></button>
			</div>

		</div>
	</div>
</div>
