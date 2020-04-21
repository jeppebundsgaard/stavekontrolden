<?php
	$relative="../";
	include_once($relative."/settings/conf.php");
	include_once($GLOBALS["backenddir"]."checklogin.php");
	if($_SESSION["user_id"]!=1) exit;
?>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<button class="navbar-toggler" type="button" data-toggle="collapse" role="tab" data-target="#navbartoggle" aria-controls="navbartoggle" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse tab-pane navbar-collapse" id="navbartoggle">
		<ul class="navbar-nav nav " id="showTab" role="tab-list" >

			<li class="nav-item">
						<a class="nav-link editbasesystem" id="editOrgs"><?= _('Organizations');?></a>
			</li>
			<li class="nav-item">
						<a class="nav-link editbasesystem" id="editUsers"><?= _('Users');?></a>
			</li>

		</ul>
	</div>
</nav>
<div id="basesystemcontentdiv" class="container-fluid">
<div class="row d-flex justify-content-center">
		<div class="col text-center">
			<h2><?= _("My Stavekontrolden");?></h2>
		</div>
	</div>
</div>

