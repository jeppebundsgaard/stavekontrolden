<div class="container">
	<div class="jumbotron jumbotron-fluid">
		<div class="container">
			<h1><?= _('Dictionaries');?></h1>
			<h3><?= _('Produced with Stavekontrolden');?></h3>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<table id="dictionaries" class="table table-sm table-hover table-striped">
				<thead id="dictionarieshead">
					<tr class="table-info">
					<th scope="col"><?= _('Language Code');?></th>
					<th scope="col"><?= _('OpenOffice/LibreOffice Extension');?></th>
					<th scope="col"><?= _('Affix file');?></th>
					<th scope="col"><?= _('Dictionary file');?></th>
					<th scope="col"><?= _('Database tables');?></th>
					</tr>
				</thead>
				<tbody class="table-striped " id="tablebody">
				<?php
					$dicdir=$relative."dictionaries/";
					if ($handle = opendir($dicdir)) {
						while (false !== ($e = readdir($handle))) {
							if ($e != "." && $e != ".." && is_dir($dicdir.$e) and file_exists($dicdir.$e."/".$e.".oxt")) {
								$version=file_get_contents($dicdir.$e."/version.txt");
								$f=$dicdir.$e."/".$e;
								$vf=$dicdir.$e."/".$e."-".$version;
							?>
								<tr><td><?= $e;?></td><td><a href="<?= $vf.".oxt";?>" ><?= $e.".oxt";?></a></td><td><a href="<?= $vf.".aff";?>" ><?= $e.".aff";?></a></td></td><td><a href="<?= $vf.".dic";?>"><?= $e.".dic";?></a></td><td><a target="_blank" href="<?= $dicdir.$e."/tables";?>"><?= $e." database";?></a></td><tr>
							<?php
							}
						}
						closedir($handle);
					}
				?>
				</tbody>
			</table>
		</div>
	</div>
</div>
