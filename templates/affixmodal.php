<?php /*$q='select `id`, `description` from affixrule where lang="'.$_SESSION['lang'].'" ORDER BY `description` ASC';
$result=$mysqli->query($q);
$affixoptions='';
while($r=$result->fetch_assoc()) $affixoptions.='<option value="'.$r["id"].'" >'.$r["description"].'</option>';*/
?>
<!-- wordclass Modal -->
<div class="modal fade" id="wordclassmodal" tabindex="-1" role="dialog" aria-labelledby="wordclassmodal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><span class="editwd collapse"><?=_("Edit Word Class");?></span><span class="viewwd collapse"><?=_("View Word Class");?><span class="addwd collapse show"><?=_("Add Word Class");?></span></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="wordclassform">
					<div class="form-row">
						<div class="col">
							<label for="wordclass" class="col-form-label"><strong><?= _('Word Class');?></strong></label>
							<input class="newword form-control form-control-sm" type="text" name="wordclass" id="wordclass">
							<input class="newword" type="hidden" name="wordclassid"  id="wordclassid">
							<input class="newword" type="hidden" name="numshow" data-numshow="">
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label class="col-form-label"><strong><?= _('Associated Affix Classes');?></strong></label>
							
						</div>
					</div>
					<div class="form-row collapse show associaterow wcedit">
						<div class="col">
							<select class="custom-select custom-select-sm associateaffixclass"><option disabled selected value="0"><?=_('Select Affix Class');?></option><?=$affixoptions;?></select>
						</div>
						<div class="col">
							<button class="btn btn-sm btn-light newaffixclass" name="newaffixclass"><?= _("Create New Affix Class");?></button>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<div class="wcpool affixpool"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal"><?=_("Close");?></button>
				<?= (checkpermissions("affix","admin")?'<button type="button" class="btn btn-info prevsave collapse associaterow wcedit wordclasssave show">'._("Previous").'</button>
				</button><button type="button" class="btn btn-primary  collapse show associaterow wcedit wordclasssave">'._("Save").'</button>
				<button type="button" class="btn btn-info wordsave nextsave collapse associaterow wcedit wordclasssave show">'._("Next").'</button>':'');?>
			</div>
		</div>
	</div>
</div>
	

<!-- Affix Class Modal -->
<div class="modal fade wordmodal" id="affixclassmodal" tabindex="-1" role="dialog" aria-labelledby="affixclassmodal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><span class="editwd collapse"><?=_("Edit Affix Class");?></span><span class="viewwd collapse"><?=_("View Affix Class").(checkpermissions("affix","admin")?'&nbsp;<i class="fas fa-edit" id="doeditaffixclass"></i>':'');?></span><span class="addwd collapse show"><?=_("Add Affix Class");?></span></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="affixclassform">
					<div class="form-row">
						<div class="col">
							<label for="description" class="col-form-label"><strong><?= _('Description');?></strong></label>
							<input class="newword form-control form-control-sm" type="text" name="description">
							<label for="affixclass" class="col-form-label"><?= _('Affix Class');?></label>
							<select class="newword custom-select custom-select-sm" name="affixclass"><option></option><?=$affixclassoptions;?></select>
							<input class="newword" type="hidden" name="affixclassid" >
							<input class="newword" type="hidden" name="numshow" data-numshow="">
							<label for="crossproduct" class="col-form-label"><?= _('Crossproduct');?></label>
							<select class="newword custom-select custom-select-sm" name="crossproduct" id="crossproduct"><option></option><?=$crossproductoptions;?></select>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label class="col-form-label"><strong><?= _('Associated Affix Rules');?></strong></label>
						</div>
					</div>
					<div class="form-row collapse show associaterow associateclassrow">
						<div class="col-3">
							<button class="btn btn-sm btn-light" name="newaffixrule" id="newaffixrule"><?= _("Create New Affix Rule");?></button>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<div class="acpool affixpool"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal"><?=_("Close");?></button>
				<?= (checkpermissions("affix","admin")?'<button type="button" class="btn btn-info associaterow associateclassrow prevsave collapse show">'._("Previous").'</button>
				</button><button type="button" class="btn btn-primary  collapse show associaterow associateclassrow affixclasssave">'._("Save").'</button>
				<button type="button" class="btn btn-info wordsave nextsave collapse associaterow associateclassrow affixclasssave show">'._("Next").'</button>':'');?>
			</div>
		</div>
	</div>
</div>
	
<!-- Affix Rule Modal -->
<div class="modal fade wordmodal" id="affixrulemodal" tabindex="-1" role="dialog" aria-labelledby="affixrulemodal" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><span class="editwd collapse"><?=_("Edit Affix Rule");?></span><span class="viewwd collapse"><?=_("View Affix Rule").(checkpermissions("affix","admin")?'&nbsp;<i class="fas fa-edit" id="doeditaffixrule"></i>':'');?></span><span class="addwd collapse show"><?=_("Add Affix Rule");?></span></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="affixruleform">
					<div class="form-row">
						<div class="col">
							<label for="description" class="col-form-label"><strong><?= _('Description');?></strong></label>
							<input class="newword form-control form-control-sm" type="text" name="r_description">
							<input class="newword" type="hidden" name="affixruleid">
							<input class="newword" type="hidden" name="numshow" data-numshow="">
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label class="col-form-label"><?= _('Parent Affix Class');?></label>
							<input class="form-control form-control-sm" disabled="disabled" type="text" name="c_description">
							<input class="newword" type="hidden" name="affixclassid" >
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label for="affix" class="col-form-label"><?= _('Affix');?></label>
							<input class="newword form-control form-control-sm" type="text" name="affix">
						</div>
						<div class="col">
							<label for="stripchars" class="col-form-label"><?= _('Strip Characters');?></label>
							<input class="newword form-control form-control-sm" type="text" name="stripchars">
						</div>
						<div class="col">
							<label for="condition" class="col-form-label"><?= _('Condition');?></label>
							<input class="newword form-control form-control-sm" type="text" name="condition">
						</div>
						<div class="col">
							<label for="replacement" class="col-form-label"><?= _('Replacement');?></label>
							<input class="newword form-control form-control-sm" type="text" name="replacement">
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label for="morphdescr" class="col-form-label"><?= _('Morphological Description');?></label>
							<select class="newword custom-select custom-select-sm" name="morphdescrid"><option></option><?=$morphoptions;?></select>
						</div>
					
					
					</div>
					<div class="form-row">
						<div class="col">
							<label class="col-form-label"><strong><?= _('Associated Affix Classes');?></strong></label>
							
						</div>
					</div>
					<div class="form-row collapse show associaterow associaterulerow">
						<div class="col">
							<select class="custom-select custom-select-sm associateaffixclass" ><option disabled selected value="0"><?=_('Select Affix Class');?></option><?=$affixoptions;?></select>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<div class="arpool affixpool"></div>
						</div>
					</div>
					
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal"><?=_("Close");?></button>
				<?= (checkpermissions("affix","admin")?'<button type="button" class="btn btn-info associaterow associaterulerow affixrulesave prevsave collapse show">'._("Previous").'</button>
				</button><button type="button" class="btn btn-primary  collapse show associaterow associaterulerow affixrulesave">'._("Save").'</button>
				<button type="button" class="btn btn-info wordsave associaterow associaterulerow nextsave affixrulesave collapse show">'._("Next").'</button>':'');?>
			</div>
		</div>
	</div>
</div>
	
