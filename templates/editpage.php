<?php
	include_once($backenddir."checklogin.php");
	global $pagesdir;
// 	print_r($_POST);
	$is=$_POST["id"];
	if($id==0) $id=$_SESSION["user_id"]; //This is for organizations...
	if($_POST["pagetype"]=="org") {
		$id=$id."/".$_POST["pagetitle"];
		$pagename=$_POST["pagetitle"];
	} 
	else $pagename=array("frontpage"=>_("Front Page"),"org"=>_("Organization Info Page"),"header"=>_("Site Header"),"user"=>_("User Page"))[$_POST["pagetype"]];
	$pagecontent=(file_exists($pagesdir.$_POST["pagetype"]."/".$id.".html")?file_get_contents($pagesdir.$_POST["pagetype"]."/".$id.".html"):"");
	if($_POST["newpage"] and $pagecontent) {$res["warning"]=_("Page already exists"); exit;}

 	$res=array("pagetype"=>$_POST["pagetype"],"id"=>$id);
	if($_POST["pagetype"]=="header") { 
		preg_match_all("/(?sim)<div[^>]*class=\"(.*?)\".*?>\\s*(.*?)\\s*<\/div>/",$pagecontent,$blocks,PREG_PATTERN_ORDER);
		$pagecontent="";
		if(!$blocks[0]) $blocks[1][0]=$pagecontent;
		$blocks[0]=array();
		$res["headers"]=$blocks;
		$sizes=array("sm"=>_("Small"),"md"=>_("Medium"),"lg"=>_("Large"),"xl"=>_("Extra Large"));
		$showoptions=array_reduce(array_keys($sizes),function($c,$i) use(&$sizes) {return $c.'<option value="d-'.$i.'-block">'.$sizes[$i].'</option>';});
		$hideoptions=array_reduce(array_keys($sizes),function($c,$i) use(&$sizes) {return $c.'<option value="d-'.$i.'-none">'.$sizes[$i].'</option>';});
	}
?>
<div class="container">
	<div class="row justify-content-center">
		<div class="col">
			<h3><?= $pagename;?></h3>
		</div>
	</div>
	<?php if($_POST["pagetype"]=="header") {  ?>
		<div class="row">
				<div class="col-2 form-group">
					<lable for="#headernum"><?= _('Header number');?></lable>
					<select class="form-control" id="headernum"><option><?= implode("</option><option>",array_keys($blocks[2]));?></option></select>
				</div>
				<div class="col-3 form-group">
					<lable for="#defaultvisibility"><?= _('Default visiblity');?></lable>
					<select class="form-control" id="defaultvisibility"><option value="d-block"><?= _('Show All');?></option><option value="d-none"><?= _('Show None');?></option></select>
				</div>
				<div class="col-3 form-group">
					<lable for="#showfrom"><?= _('Show from');?></lable>
					<select class="form-control" id="showfrom"><option></option><?= $showoptions;?></select>
				</div>
				<div class="col-3 form-group">
					<lable for="#hidefrom"><?= _('Hide from');?></lable>
					<select class="form-control" id="hidefrom"><option></option><?= $hideoptions;?></select>
				</div>
				<div class="col-1 form-group ">
					<button class="btn btn-warning btn-small" id="deleteheader"><?= _('Delete');?></button>
				</div>
		</div>
		<div class="row">
			<div class="col">
				<button class="btn btn-success btn-small" id="addheader"><?= _('Add header');?></button>
			</div>
		</div>
	<?php } ?>
	<div class="row justify-content-center">
		<div class="editor-full col">
			<div id="editor" class="ql-editor ql-scroll-y" style="height: <?= ($_POST["pagetype"]=="header"?200:600);?>px;">
				<?= $pagecontent;?>
			</div>
		</div>
	</div>
</div>

<div class="modal-footer"><button class="btn btn-success" id="pageeditsave"><?= _('Finish');?></button></div>
