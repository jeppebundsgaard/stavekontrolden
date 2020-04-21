<?php
	$relative="../";
	include_once($relative."/settings/conf.php");
// 	include_once($backenddir."checklogin.php");
	

?>
<div class="container">
	<div class="row">
		<div class="col">
			<h1><?= _('Pages');?></h1>
		</div>
		<div class="col">
			<div class="form-group">
				<button class="btn btn-small btn-light float-right" id="newpage" ><?= _("New Page");?></button>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col">

			<table id="dictionaries" class="table table-sm table-hover table-striped">
				<thead id="dictionarieshead">
					<tr class="table-info">
					<th scope="col"><?= _('Title');?></th>
					<th scope="col"><?= _('Edit');?></th>
					<th scope="col"><?= _('Move');?></th>
					<th scope="col"><?= _('Delete');?></th>
					</tr>
				</thead>
				<tbody class="table-striped " id="tablebody">
				<?php
					$orgpagesdir=$pagesdir."org/".$_SESSION["user_id"];
					if(!file_exists($orgpagesdir)) mkdir($orgpagesdir);
					else {
						if ($handle = opendir($orgpagesdir)) {
							while (false !== ($e = readdir($handle))) {
								if ($e != "." && $e != "..") {
									$f=$orgpagesdir.$e;
								?>
									<tr><td class="pagetitleedit"><?= str_replace(".html","",$e);?></td><td><i class="fas fa-edit orgpageedit"></i></td><td><i class="fas fa-arrow-down fa-sm"></i><i class="fas fa-arrow-up fa-sm"></i></td><td><i class="far fa-trash-alt text-danger deletepage"></i></td><tr>
								<?php
								}
							}
							closedir($handle);
						}
					}
				?>
				</tbody>
			</table>
		</div>
	</div>
</div>
