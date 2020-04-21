<?php $relative="../";
	include_once($relative."/settings/conf.php"); 
	include_once($GLOBALS["backenddir"]."checklogin.php");
	
	$q="select * from organizations where org_id='".$_SESSION["user_id"]."'";
	$result=$mysqli->query($q);
	$r=$result->fetch_assoc();
?>
<div class="row">
	<div class="col-3">
		<div id="csseditor" style="height:800px">
			<pre ><?php echo file_get_contents("../css/custom/org".$_SESSION["user_id"].".css"); ?></pre>
		</div>
		<div class="modal-footer"><button class="btn btn-success" id="editCSSsave"><?= _('Finish');?></button>
			<button class="btn btn-success" id="refreshStyle"><?= _('Use changes');?></button>
		</div>
	</div>
	
	</div>
</div>
