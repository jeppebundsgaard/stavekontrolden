<?php
include($backenddir."affixoptions.php");

?>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm">
			<p><?= _('<span id="numrows">0</span> Affix Rules');?></p>
		</div>
<?php 
	include($templatedir."filtersettings.php");
?>
		<div class="col-sm">
		</div>
	</div>
	<?php include($templatesdir."navigation.php");?>
	<div class="row">
		<div class="col">
			<table id="wordtable" class="table table-sm table-hover table-striped">
				<thead id="wordhead">
<!-- affixclassid	stripchars	affix	condition	morphdescrid	description				 -->
					<tr class="table-info">
					<th scope="col"><?= _('Description');?><br><input class="wordfilter form-control form-control-sm" type="text" name="r_description"  value="<?= $filters["description"];?>"></th>
					<th scope="col"><?= _('Parent Affix Class');?><br><input class="wordfilter form-control form-control-sm" type="text" name="c_description"  value="<?= $filters["description"];?>"></th>
					<th scope="col"><?= _('Affix');?><br><input class="wordfilter form-control form-control-sm" type="text" name="r_affix"  value="<?= $filters["affix"];?>"></th>
					<th scope="col"><?= _('Strip characters');?><br><input class="wordfilter form-control form-control-sm" type="text" name="r_stripchars"  value="<?= $filters["stripchars"];?>"></th>
					<th scope="col"><?= _('Condition');?><br><input class="wordfilter form-control form-control-sm" type="text" name="r_condition"  value="<?= $filters["condition"];?>"></th>
					<th scope="col"><?= _('Replacement');?><br><input class="wordfilter form-control form-control-sm" type="text" name="r_replacement"  value="<?= $filters["replacement"];?>"></th>
					<th scope="col"><?= _('Morphological description');?><br><select class="wordfilter custom-select custom-select-sm" name="r_morphdescrid"><option></option><?=$morphoptions;?></select></th>
					<th scope="col"><?= _('Corresponding Affix Classes');?><br><input class="wordfilter form-control form-control-sm" type="text" name="cr_description"  value="<?= $filters["affixclass"];?>"></th>
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
