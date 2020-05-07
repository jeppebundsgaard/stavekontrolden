<?php
 $relative="../";
include_once($relative."/settings/conf.php");
// include_once($systemdirs["backend"]."checklogin.php");
// if(!$_SESSION["user_id"]) exit;
if($_POST["showdetails"]=="true") $_SESSION["showdetails"]=!$_SESSION["showdetails"];
if($_POST["showlog"]=="true") $_SESSION["showlog"]=!$_SESSION["showlog"];

$filters=array();
parse_str($_POST["filters"], $filters);

$q='select `id`, wordstatus from wordstatus s where wordstatus!="" AND lang="'.$_SESSION['lang'].'" ORDER BY `id` DESC';
$result=$mysqli->query($q);
$statusoptions='';
while($r=$result->fetch_assoc()) $statusoptions.='<option value="'.$r["id"].'" '.($filters["wordstatus"]==$r["id"]?"selected":"").'>'.$r["wordstatus"].'</option>';

$q='select `id`, `fugeelement` from fugeelement f where lang="'.$_SESSION['lang'].'" ORDER BY `fugeelement` ASC';
$result=$mysqli->query($q);
$fugeelementoptions='';
while($r=$result->fetch_assoc()) $fugeelementoptions.='<option value="'.$r["id"].'" '.($filters["fugeelementid"]==$r["id"]?"selected":"").'>'.$r["fugeelement"].'</option>';

$q='select `wordclass`, id from wordclass where lang="'.$_SESSION['lang'].'" ORDER BY `wordclass` ';
$result=$mysqli->query($q);
$wordclassoptions='';
while($r=$result->fetch_assoc()) $wordclassoptions.='<option value="'.$r["id"].'" '.($filters["wordclass"]==$r["id"]?"selected":"").'>'.$r["wordclass"].'</option>';

$q='select `id`,`technical_term` from technical_term where lang="'.$_SESSION['lang'].'" ORDER BY `technical_term`';
$result=$mysqli->query($q);
$technical_termoptions='';
while($r=$result->fetch_assoc()) $technical_termoptions.='<option value="'.$r["id"].'" '.($filters["technical_term"]==$r["id"]?"selected":"").'>'.$r["technical_term"].'</option>';

include($systemdirs["backend"]."affixoptions.php");

?>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm">
			<p><?= _('<span id="numrows">0</span> Words');?></p>
		</div>
<?php 
	include($templatedir."filtersettings.php");
?>
		<div class="col-2-sm">
			<div class="form-group">
				<button class="btn btn-small btn-light float-right" id="showdetails"><?= ($_SESSION["showdetails"]?_("Hide details"):_("Show details"));?></button>&nbsp;
				<button class="btn btn-small btn-light float-right" id="showlog"><?= ($_SESSION["showlog"]?_("Hide log"):_("Show log"));?></button>&nbsp;
			</div>
		</div>
		<div class="col-sm">
				<button class="btn btn-small btn-light float-right" id="newword" data-toggle="modal" data-target="#wordsmodal"><?= _("New Word");?></button>
		</div>

	</div>
	<?php include($systemdirs["templates"]."navigation.php");?>
	<div class="row">
		<div class="col">
			<small class="form-text text-muted"><?=_("Click on the word to edit all values. Click on a value to edit directly. Use Shift+Arrows or TAB to move between values. Cancel with Esc key.");?></small>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<table id="wordtable" class="table table-sm table-hover table-striped">
				<thead id="wordhead">
					<tr class="table-info">
					<!-- `word`, `wordclass`, `status`, `alternatives`, `lastuser`, `contributor`, `word_definition`, `comments`, `technical_term`, `fugeelementid`, `strong_declension`, `apostroph`, `log`,  `lastchange` -->
					<th scope="col"><?= _('Word');?><br><input class="wordfilter form-control form-control-sm" type="text" name="word" value="<?= $filters["word"];?>"></th>
					<th scope="col"><?= _('Status');?><br><select class="wordfilter custom-select custom-select-sm" name="wordstatus"><option></option><?=$statusoptions;?></select></th>
					<th scope="col"><?= _('Word Class');?><br><select class="wordfilter custom-select custom-select-sm" name="wordclass"><option></option><?=$wordclassoptions;?></select></th>
					<th scope="col"><?= _('Strong Declension');?><br><input class="wordfilter form-control form-control-sm" type="text" name="strong_declension"  value="<?= $filters["strong_declension"];?>"></th>
					<th scope="col"><?= _('Misspellings');?><br><input class="wordfilter form-control form-control-sm" type="text" name="misspellings"  value="<?= $filters["misspellings"];?>"></th>
					<th scope="col"><?= _('Fuge Element');?><br><select class="wordfilter custom-select custom-select-sm" name="fugeelementid"><option></option><?=$fugeelementoptions;?></select></th>
					<th scope="col"><?= _('Apostroph');?><br><select class="wordfilter custom-select custom-select-sm" name="apostroph"><option></option><option value=1><?=_("With");?></option><option value=0><?=_("Without");?></option></select></th></th>
					<?php if($_SESSION["showdetails"]) { ?>
					<th scope="col"><?= _('Contributor');?><br><input class="wordfilter form-control form-control-sm" type="text" name="contributor"  value="<?= $filters["contributor"];?>"></th>
					<th scope="col"><?= _('Last User');?><br><input class="wordfilter form-control form-control-sm" type="text" name="lastuser"  value="<?= $filters["lastuser"];?>"></th>
					<th scope="col"><?= _('Word Definition');?><br><input class="wordfilter form-control form-control-sm" type="text" name="word_definition" value="<?= $filters["word_definition"];?>"></th>
					<th scope="col"><?= _('Comments');?><br><input class="wordfilter form-control form-control-sm" type="text" name="comments" value="<?= $filters["comments"];?>"></th>
					<th scope="col"><?= _('Technical Term');?><br><select class="wordfilter custom-select custom-select-sm" name="technical_term"><option></option><?= $technical_termoptions;?></select></th>
					<th scope="col"><?= _('Last Change');?><br><input class="wordfilter form-control form-control-sm" type="text" name="lastchange"  value="<?= $filters["lastchange"];?>"></th>
					<?php } ?>
					<?php if($_SESSION["showlog"]) { ?>
					<th scope="col"><?= _('Log');?><br><input class="wordfilter form-control form-control-sm" type="text" name="log" value="<?= $filters["log"];?>"></th>
					<?php } ?>
					</tr>
				</thead>
				<tbody class="table-striped " id="tablebody">
				</tbody>
			</table>
		</div>
	</div>
	<?php include($systemdirs["templates"]."navigation.php");?>
</div>

<!-- Modal -->
<div class="modal fade" id="wordsmodal" tabindex="-1" role="dialog" aria-labelledby="wordsmodal" aria-hidden="true" data-backdrop="static">
	<div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><span class="editwd collapse"><?=_("Edit Word");?></span><span class="addwd collapse show"><?=_("Add Word");?></span></h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Cancel">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div id="wordsform">
					<div class="form-row">
						<div class="col">
							<label for="word" class="col-form-label"><strong><?= _('Word');?></strong></label>
							<input class="newword form-control form-control-sm" type="text" name="word">
							<input class="newword" type="hidden" name="wordid" id="wordid">
							<input class="newword dontreset" type="hidden" name="numshow" data-numshow="0">
						</div>
						<div class="col">
							<label for="wordstatus" class="col-form-label"><?= _('Status');?></label>
							<div class="input-group"><input type="text" class="form-control form-control-sm wordstatusbefore wordstatusbeforeelem collapse" disabled="disabled" value=""><div class="input-group-append wordstatusbefore wordstatusbeforeelem collapse"><div class="input-group-text"><i class="fas fa-arrow-right fa-sm"></i></div></div>
							<select class="newword custom-select custom-select-sm" name="wordstatus"><option></option><?=$statusoptions;?></select></div>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label for="wordclass" class="col-form-label"><?= _('Word Class');?></label>
							<select class="newword custom-select custom-select-sm" name="wordclass"><option></option><?=$wordclassoptions;?></select>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label for="strong_declination" class="col-form-label"><?= _('Strong Declension');?></label>
							<textarea class="newword form-control form-control-sm" name="strong_declension"></textarea>
						</div>
						<div class="col">
							<label for="misspellings" class="col-form-label"><?= _('Misspellings');?></label>
							<textarea class="newword form-control form-control-sm" name="misspellings"></textarea>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label for="fugeelementid" class="col-form-label"><?= _('Fugelement');?></label>
							<select class="newword custom-select custom-select-sm" name="fugeelementid"><option></option><?=$fugeelementoptions;?></select>
						</div>
						<div class="col">
							<label for="apostroph" class="col-form-label"><?= _('Apostroph');?></label>
							<select class="newword custom-select custom-select-sm" name="apostroph"><option></option><option value=1><?=_("With");?></option><option value=0><?=_("Without");?></option></select>
						</div>
						<div class="col">
							<label for="technical_term" class="col-form-label"><?= _('Technical Term');?></label>
							<select class="newword custom-select custom-select-sm" name="technical_term"><option></option><?= $technical_termoptions;?></select>
						</div>
					</div>
					<div class="form-row">
						<div class="col">
							<label for="word_definition" class="col-form-label"><?= _('Word Definition');?></label>
							<textarea class="newword form-control form-control-sm" type="text" name="word_definition"></textarea>
						</div>
<!--						<div class="col">
							<label for="alternatives" class="col-form-label"><?= _('Alternatives');?></label>
							<textarea class="newword form-control form-control-sm" type="text" name="alternatives"></textarea>
						</div>-->
<!-- 					</div> -->
						<div class="col">
							<label for="comments" class="col-form-label"><?= _('Comments');?></label>
							<textarea class="newword form-control form-control-sm" type="text" name="comments"></textarea>
						</div>
					</div>
					<div class="form-row">
						<div class="col-6">
							<label for="log" class="col-form-label"><?= _('Log');?></label>
							<textarea class="form-control form-control-sm disabled-words"  disabled="disabled" name="log"></textarea>
						</div>
						<div class="col">
							<label for="contributor" class="col-form-label"><?= _('Contributor');?></label>
							<input class="form-control form-control-sm disabled-words" type="text" disabled="disabled" name="contributor"></textarea>
						</div>
						<div class="col">
							<label for="lastuser" class="col-form-label"><?= _('Last User');?></label>
							<input class="form-control form-control-sm disabled-words" type="text" disabled="disabled" name="lastuser"></textarea>
						</div>
					</div>

				</div>
			</div>
			<div class="modal-footer">
				<div class="col float-left"><button type="button" class="btn btn-secondary" data-dismiss="modal"><?=_("Cancel");?></button></div>
				<div class="col ">
					<span class="float-right">
						<small class="text-muted"><?= _("Save and");?></small>
						<button type="button" class="btn btn-info wordsave prevsave collapse show"><?=_("Previous");?></button>
						<button type="button" class="btn btn-primary wordsave" id="wordsave"><?=_("Close");?></button>
						<button type="button" class="btn btn-info wordsave nextsave collapse show"><?=_("Next");?></button>
						<button type="button" class="btn btn-info wordsave newsave collapse show"><?=_("New word");?></button>
					</span>
				</div>
			</div>
		</div>
	</div>
</div>
<?php 
$res=array("showdetails"=>($_SESSION["showdetails"]?"true":"false"));  
include($templatedir."affixmodal.php");
