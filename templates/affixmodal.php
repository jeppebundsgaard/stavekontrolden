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
				<h5 class="modal-title"><span class="editwd collapse"><?=_("Edit Word Class");?></span><span class="viewwd collapse"><?=_("View Word Class");?></span><span class="addwd collapse show"><?=_("Add Word Class");?></span></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Cancel">
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
							<button class="btn btn-sm btn-light newaffixclass" data-targetmodal="affixclassmodal" name="newaffixclass" ><?= _("Create New Affix Class");?></button>
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal"><?=_("Cancel");?></button>
				<?= (checkpermissions("affix","admin")?'<div class="col ">
					<span class="float-right">
						<small class="text-muted associaterow wcedit collapse show">'. _("Save and").'</small>
						<button type="button" class="btn btn-info prevsave associaterow wcedit wordclasssave collapse show">'._("Previous").'</button>
						<button type="button" class="btn btn-primary associaterow wcedit wordclasssave collapse show">'._("Close").'</button>
						<button type="button" class="btn btn-info nextsave associaterow wcedit wordclasssave collapse show">'._("Next").'</button>
						<button type="button" class="btn btn-info newsave associaterow wcedit wordclasssave collapse show">'._("New Wordclass").'</button>
					</span>
				</div>':'');?>
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
				<button type="button" class="close" data-dismiss="modal" aria-label="Cancel">
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
							<input class="newword dontreset" type="hidden" name="newaffixclass">
							<input class="newword" type="hidden" name="numshow" data-numshow="">
							<label for="crossproduct" class="col-form-label"><?= _('Crossproduct');?></label>
							<select class="newword custom-select custom-select-sm" name="crossproduct" id="crossproduct"><option></option><?=$crossproductoptions;?></select>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label class="col-form-label"><strong><?= _('Associated Affix Rules');?></strong></label>
						</div>
						<div class="col collapse show associaterow associateclassrow">
							<button class="btn btn-sm btn-light newaffixrule float-right" data-targetmodal="affixrulemodal" name="newaffixrule" ><?= _("Create New Affix Rule");?></button>
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal"><?=_("Cancel");?></button>
				<?= (checkpermissions("affix","admin")?'<div class="col ">
					<span class="float-right">
						<small class="text-muted associaterow associateclassrow collapse show">'. _("Save and").'</small>
						<button type="button" class="btn btn-info prevsave associaterow associateclassrow affixclasssave collapse show">'._("Previous").'</button>
						<button type="button" class="btn btn-primary associaterow associateclassrow affixclasssave closesave collapse show">'._("Close").'</button>
						<button type="button" class="btn btn-info nextsave associaterow associateclassrow affixclasssave collapse show">'._("Next").'</button>
						<button type="button" class="btn btn-info newsave associaterow associateclassrow affixclasssave collapse show">'._("New Affix Class").'</button>
					</span>
				</div>':'');?>
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
				<button type="button" class="close" data-dismiss="modal" aria-label="Cancel">
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
							<input class="newword dontreset" type="hidden" name="newaffixrule">
							<input class="newword" type="hidden" name="numshow" data-numshow="">
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label class="col-form-label"><?= _('Parent Affix Class');?></label>
							<input class="form-control form-control-sm dontreset" disabled="disabled" type="text" name="c_description">
							<input class="newword dontreset" type="hidden" name="affixclassid" >
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal"><?=_("Cancel");?></button>
				<?= (checkpermissions("affix","admin")?'<div class="col ">
					<span class="float-right">
						<small class="text-muted associaterow associaterulerow collapse show">'. _("Save and").'</small>
							<button type="button" class="btn btn-info associaterow associaterulerow affixrulesave prevsave collapse show">'._("Previous").'</button>
							<button type="button" class="btn btn-primary associaterow associaterulerow affixrulesave closesave collapse show">'._("Close").'</button>
							<button type="button" class="btn btn-info associaterow associaterulerow nextsave affixrulesave collapse show">'._("Next").'</button>
							<button type="button" class="btn btn-info associaterow associaterulerow newsave affixrulesave collapse show">'._("New Affix Rule").'</button>
						</span>
				</div>':'');?>
			</div>
		</div>
	</div>
</div>
	
