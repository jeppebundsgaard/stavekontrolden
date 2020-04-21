<?php
$q='select `id`, `description` from affixclass where lang="'.$_SESSION['lang'].'" ORDER BY `description` ASC';
$result=$mysqli->query($q);
$affixoptions='';
while($r=$result->fetch_assoc()) $affixoptions.='<option value="'.$r["id"].'" >'.$r["description"].'</option>';

include($backenddir."affixoptions.php");

?>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm">
			<p><?= _('<span id="numrows">0</span> Fuge Elements');?></p>
		</div>
<?php 
	include($templatedir."filtersettings.php");
?>
		<div class="col-sm">
			<div class="form-group float-right">
				<button class="btn btn-small btn-light float-right" id="newword" data-toggle="modal" data-target="#fugeelementmodal"><?= _("New Fuge Element");?></button>
			</div>
		</div>
	</div>
	<?php include($templatesdir."navigation.php");?>
	<div class="row">
		<div class="col">
			<table id="fugeelementtable" class="table table-sm table-hover table-striped">
				<thead id="fugeelementhead">
					<tr class="table-info">
					<th scope="col"><?= _('Fuge Element');?><br><input class="wordfilter form-control form-control-sm" type="text" name="fugeelement" value="<?= $filters["fugeelement"];?>"></th>
					<th scope="col"><?= _('Corresponding Affix Classes');?><br><input class="wordfilter form-control form-control-sm" type="text" name="description"  value="<?= $filters["affixclass"];?>"></th>
					</tr>
				</thead>
				<tbody class="table-striped " id="tablebody">
				</tbody>
			</table>
		</div>
	</div>
	<?php include($templatesdir."navigation.php");?>

</div>

<!-- Modal -->
<div class="modal fade" id="fugeelementmodal" tabindex="-1" role="dialog" aria-labelledby="fugeelementmodal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><span class="editwd collapse"><?=_("Edit Fuge Element");?></span><span class="addwd collapse show"><?=_("Add Fuge Element");?></span></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="fugeelementform">
					<div class="form-row">
						<div class="col">
							<label for="fugeelement" class="col-form-label"><strong><?= _('Fuge Element');?></strong></label>
							<input class="newword form-control form-control-sm" type="text" name="fugeelement" id="fugeelementtxt">
							<input class="newword" type="hidden" name="fugeelementid" val="" id="fugeelementid">
							<input class="newword" type="hidden" name="numshow" data-numshow="">
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label class="col-form-label"><strong><?= _('Associated Affix Classes');?></strong></label>
							
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<select class="custom-select custom-select-sm associateaffixclass"><option disabled selected value="0"><?=_('Select Affix Class');?></option><?=$affixoptions;?></select>
						</div>
						<div class="col">
							<button class="btn btn-sm btn-light newaffixclass" name="newaffixclass"><?= _("Create New Affix Class");?></button>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<div class="fepool affixpool"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal"><?=_("Close");?></button>
				<button type="button" class="btn btn-info fugeelementsave prevsave"><?=_("Previous");?></button>
				<button type="button" class="btn btn-primary fugeelementsave"><?=_("Save");?></button>
				<button type="button" class="btn btn-info fugeelementsave nextsave"><?=_("Next");?></button>
			</div>
		</div>
	</div>
</div>
	

<?php include($templatedir."affixmodal.php");
