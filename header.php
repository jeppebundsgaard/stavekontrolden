<!DOCTYPE html>
<html lang="<?= $lang; ?>">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="Stavekontrolden ...">
    <meta name="author" content="Jeppe Bundsgaard">
    <link rel="icon" href="kontroldico.png">

    <title>Stavekontrolden</title>
    
	<link rel="stylesheet" href="./vendor/twbs/bootstrap/dist/css/bootstrap.min.css">

    <!-- Add icon library -->
	<link rel="stylesheet" href="./vendor/components/font-awesome/css/all.min.css">

	<!-- styles for Stavekontrolden -->
    <link rel="stylesheet" href="./css/basesystem.css" id="basesystemstyles">
    <link rel="stylesheet" href="./css/basesystemadmin.css">
    
    
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/cookieconsent@3/build/cookieconsent.min.css" />
	<script src="https://cdn.jsdelivr.net/npm/cookieconsent@3/build/cookieconsent.min.js"></script>
  </head>

<body  class="pb-0 pb-lg-5"> <!-- Removed: d-flex flex-column -->
	<!-- Header --><!-- add? fixed-top -->
	<nav class="navbar navbar-expand-md navbar-dark justify-content-between sticky-top site-header d-print-none">
		<div class="col-3 ">
			<a class="navbar-brand rounded-circle basesystem-logo align-middle" href="/" aria-label="basesystem">
				<img src="img/kontrold-logo.png">
			</a>
		</div>
		<div class="colbasesystem text-center align-middle">
			<span class="d-none d-lg-block small"></span><span class="d-block" id="basesystemHeader"></span>
		</div>
		<div class="col d-lg-none">
			<button class="navbar-toggler float-right " type="button" data-toggle="collapse" data-target="#navbarToggler" aria-controls="navbarToggler" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon "></span>
			</button>
		</div>
		<div class="collapse navbar-collapse col-12 col-lg-8 justify-content-end float-right" id="navbarToggler">
				<ul class="navbar-nav">
					<li class="nav-item active d-flex justify-content-end">
						<a class="nav-link menulink" href="./"><?= _('Frontpage');?></a>
					</li>
					<li class="nav-item active d-flex justify-content-end">
						<a class="nav-link menulink" href="./?dictionaries=1"><?= _('Download');?></a>
					</li>
					<?php 
					$orgpagesdir=$pagesdir."org/".($GLOBALS["langtoorg"][$_SESSION["locale"]]+0)."/";
					if(file_exists($orgpagesdir)) {
						if ($handle = opendir($orgpagesdir)) {
							while (false !== ($e = readdir($handle))) {
								if ($e != "." && $e != "..") {
									$f=str_replace(".html","",$e);
								?>
								<li class="nav-item active d-flex justify-content-end">
									<a class="nav-link menulink" href="./?page=<?= $f;?>"><?= $f;?></a>
								</li>
								<?php
								}
							}
							closedir($handle);
						}
					}
					?>
					<?= (!$_SESSION["user_id"]?'<li class="nav-item active d-flex justify-content-end">
						<a class="nav-link menulink" href="./?backend=1">'._('Log in').'</a>
					</li>':''); ;?>
					<?php if($_SESSION["orgMember"] and $_SESSION["permissions"]=="admin") {?> 
						<li class="nav-item active d-flex justify-content-end" id="showMyOrg">
							<a class="nav-link menulink" href="#"><?= _('My Organization');?></a>
						</li>
					<?php }?>
					<?php if($_SESSION["orgMember"] and $_SESSION["user_id"]==1) {?> 
						<li class="nav-item active d-flex justify-content-end" id="showMyStavekontrolden">
							<a class="nav-link menulink" href="#"><?= _('My Stavekontrolden');?></a>
						</li>
					<?php }
					if($_SESSION["user_id"]) {?> 
						<li class="nav-item active d-flex justify-content-end" id="showMyUser">
							<a class="nav-link menulink" href="#"><?= _('My User');?></a>
						</li>
					<?php }?>
				</ul>
			
		</div>
	</nav>
	<div id="adminmenu">
	<?= ($user_id?get_template("adminmenu")["template"]:""); ?>
	</div>
	<main role="main" class="flex-shrink-0 h-100 mb-3">
		<div class="h-100"  id="contentdiv">
