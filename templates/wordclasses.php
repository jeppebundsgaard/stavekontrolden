<?php

include($systemdirs["backend"]."affixoptions.php");

?>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm">
			<p><?= _('<span id="numrows">0</span> Word classes');?></p>
		</div>
<?php 
	include($templatedir."filtersettings.php");
?>
		<div class="col-sm">
			<div class="form-group float-end">
				<button class="btn btn-small btn-light float-end newwordclass" data-bs-toggle="modal" data-bs-target="#wordclassmodal" data-bs-target="wordclassmodal"><?= _("New Word Class");?></button>
			</div>
		</div>
	</div>
	<?php include($systemdirs["templates"]."navigation.php");?>
	<div class="row">
		<div class="col">
			<table id="wordtable" class="table table-sm table-hover table-striped">
				<thead id="wordhead">
					<tr class="table-info">
					<th scope="col"><?= _('Word Class');?><br><input class="wordfilter form-control form-control-sm" type="text" name="wordclass" value="<?= $filters["wordclass"];?>"></th>
					<th scope="col"><?= _('Corresponding Affix Classes');?><br><input class="wordfilter form-control form-control-sm" type="text" name="description"  value="<?= $filters["affixclass"];?>"></th>
					<th scope="col" class="delcol"><?= _('Delete');?></th>
					</tr>
				</thead>
				<tbody class="table-striped " id="tablebody">
				</tbody>
			</table>
		</div>
	</div>
	<?php include($systemdirs["templates"]."navigation.php");?>

</div>

<?php include($templatedir."affixmodal.php");
