<?php
$limitoptions="";
$limitnow=($_SESSION["limit"]?$_SESSION["limit"]:25);
foreach(array(10,25,50,100,200,500,1000) as $r) $limitoptions.='<option value="'.$r.'" '.($r==$limitnow?"selected":"").'>'._("Show").' '.$r.'</option>';

$filteroptions="";
$filternow=($_SESSION["filtersetting"]?$_SESSION["filtersetting"]:"inword");
foreach(array("inword"=>_("In word"),"beginword"=>_("Beginning of word"),"endword"=>_("End of word"),"strict"=>_("Strict"),) as $k=>$f) $filteroptions.='<option value="'.$k.'" '.($k==$filternow?"selected":"").'>'.$f.'</option>';

?>
		<div class="col-sm">
			<div class="form-group">
				<select class="custom-select custom-select-sm" id="limit"><option></option><?=$limitoptions;?></select>
			</div>
		</div>
		<div class="col-sm">
			<div class="form-group row">
				<label for="filtersetting" class="col-sm-6 col-form-label"><span class=" float-right"><?= _('Search');?></span></label>
				<div class="col-sm-6">
					<select class="custom-select custom-select-sm" id="filtersetting"><?=$filteroptions;?></select>
				</div>
			</div>
		</div>
