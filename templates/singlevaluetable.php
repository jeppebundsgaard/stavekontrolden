<div class="container-fluid">
	<div class="row">
		<div class="col-sm">
			<p><?= $numtxt;?></p>
		</div>
<?php 
	include($templatedir."filtersettings.php");
?>
		<div class="col-sm">
			<div class="form-group float-right">
				<button class="btn btn-small btn-light float-right" data-toggle="modal" data-target="#promptmodal"><?= $new;?></button>
			</div>
		</div>
	</div>
	<?php include($templatesdir."navigation.php");?>
	<div class="row">
		<div class="col">
			<table id="wordtable" class="table table-sm table-hover table-striped">
				<thead id="wordhead">
					<tr class="table-info">
					<th scope="col"><?= $colname;?><br><input class="wordfilter form-control form-control-sm" type="text" name="singlevalue" value="<?= $filters["singlevalue"];?>"></th>
					</tr>
				</thead>
				<tbody class="table-striped " id="tablebody">
				</tbody>
			</table>
		</div>
	</div>
	<?php include($templatesdir."navigation.php");?>

</div>
<div class="modal fade " id="promptmodal" tabindex="-1" role="dialog" aria-labelledby="promptmodal" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title"><?=$colname;?></h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<div class="row">
				<div class="col">
					<?= ($astextarea?'<textarea class="form-control" name="promptname" id="promptname"></textarea>':'<input class="form-control form-control-sm" type="text" name="promptname" id="promptname">');?>
					<input type="hidden" name="numshow" val="">

				</div>
				<div class="col">
				<button type="button" class="btn btn-info promptsave prevsave"><?=_("Previous");?></button>
				<button type="button" class="btn btn-primary promptsave"><?=_("Save");?></button>
				<button type="button" class="btn btn-info promptsave nextsave"><?=_("Next");?></button>
				</div>
			</div>
		</div>
    </div>
  </div>
</div>
