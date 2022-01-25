<?php
	$relative="../";
	include_once($relative."/settings/conf.php");
	include_once($systemdirs["backend"]."checklogin.php");
?>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<button class="navbar-toggler" type="button" data-toggle="collapse" role="tab" data-target="#navbartoggle" aria-controls="navbartoggle" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse tab-pane navbar-collapse" id="navbartoggle">
		<ul class="navbar-nav nav " id="showTab" role="tab-list" >

			<li class="nav-item">
						<a class="nav-link editorg" id="editMasterData"><?= _('Master Data');?></a>
			</li>
			<li class="nav-item">
						<a class="nav-link editorg" id="editVersion"><?= _('Version');?></a>
			</li>
			<!--<li class="nav-item">
						<a class="nav-link editorg" id="editStyles"><?= _('Stylesheet');?></a>
			</li>-->
			<li class="nav-item">
						<a class="nav-link editorg" id="editFrontPage"><?= _('Front Page');?></a>
			</li>
			<li class="nav-item">
						<a class="nav-link editorg" id="editPages"><?= _('Create/Edit Pages');?></a>
			</li>
			<li class="nav-item">
						<a class="nav-link editorg" id="editOrgUsers"><?= _('Users');?></a>
			</li>
		</ul>
	</div>
</nav>
<div id="orgcontentdiv" class="container-fluid">
<div class="row d-flex justify-content-center">
		<div class="col text-center">
		<?php
	$relative="../";
	include_once($relative."/settings/conf.php");
	

	$q="select * from organizations where org_id=".$_SESSION["user_id"];
	$result=$mysqli->query($q);
	$r=$result->fetch_assoc();

?>
			<h1 class="orgname"><?= $r["orgname"];?></h1>
			<h3 class="orgslogan"><?= $r["orgslogan"];?></h3>
			<a href="?o=<?= $r["orgurl"];?>">https://<?=$baseurl;?>?o=<?= $r["orgurl"];?></a>

		</div>
	</div>
</div>

