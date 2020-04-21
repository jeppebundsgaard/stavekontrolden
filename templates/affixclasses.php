<?php
include($backenddir."affixoptions.php");

?>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm">
			<p><?= _('<span id="numrows">0</span> Affix Classes');?></p>
		</div>
<?php 
	include($templatedir."filtersettings.php");
?>
		<div class="col-sm">
			<div class="form-group">
				<button class="btn btn-small btn-light float-right" id="newword" data-toggle="modal" data-target="#affixmodal"><?= _("New Affix Class");?></button>
			</div>
		</div>
	</div>
	<?php include($templatesdir."navigation.php");?>
	<div class="row">
		<div class="col">
			<table id="wordtable" class="table table-sm table-hover table-striped">
				<thead id="wordhead">
					<tr class="table-info">
					<th scope="col"><?= _('Description');?><br><input class="wordfilter form-control form-control-sm" type="text" name="c_description"  value="<?= $filters["description"];?>"></th>
					<th scope="col"><?= _('Type');?><br><select class="wordfilter custom-select custom-select-sm" name="c_affixclass"><option></option><?=$affixclassoptions;?></select></th>
					<th scope="col"><?= _('Crossproduct');?><br><select class="wordfilter custom-select custom-select-sm" name="c_crossproduct"><option></option><?=$crossproductoptions;?></select></th>
					<th scope="col"><?= _('Corresponding Affix Rules');?><br><input class="wordfilter form-control form-control-sm" type="text" name="r_description"  value="<?= $filters["affixrule"];?>"></th>
					</tr>
				</thead>
				<tbody class="table-striped " id="tablebody">
				</tbody>
			</table>
		</div>
	</div>
	<?php include($templatesdir."navigation.php");?>
</div>

<?php include($templatedir."affixmodal.php");
