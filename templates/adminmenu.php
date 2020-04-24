<nav class="navbar navbar-expand-lg navbar-light admin-navbar">
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#adminToggler" aria-controls="adminToggler" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	<div class="collapse tab-pane navbar-collapse" id="adminToggler">
		<ul class="nav-bar nav  mr-auto mt-2 mt-lg-0 ">
		<?php if(checkpermissions("wordedit","affix","admin")) {?> 
			<li class="nav-item " id="words"><a class="nav-link adminmenulink" data-page="words" href="#"><?= _('Process Words');?></a></li>
		<?php } if(checkpermissions("affix","admin")) {?> 
			<li class="nav-item " id="wordclass"><a class="nav-link adminmenulink" data-page="wordclass" href="#"><?= _('Word Classes');?></a></li>
			<li class="nav-item " id="affixclass"><a class="nav-link adminmenulink" data-page="affixclass" href="#"><?= _('Affix Classes');?></a></li>
			<li class="nav-item " id="affixrule"><a class="nav-link adminmenulink" data-page="affixrule" href="#"><?= _('Affix Rules');?></a></li>
			<li class="nav-item " id="fugeelement"><a class="nav-link adminmenulink" data-page="fugeelement" href="#"><?= _('Fuge Elements');?></a></li>
			<li class="nav-item " id="morphdescr"><a class="nav-link adminmenulink" data-page="morphdescr" href="#"><?= _('Morphological Description');?></a></li>
			<li class="nav-item " id="start_definitions"><a class="nav-link adminmenulink" data-page="start_definitions" href="#"><?= _('Start Definitions');?></a></li>
			<li class="nav-item " id="technical_term"><a class="nav-link adminmenulink" data-page="technical_term" href="#"><?= _('Technical Terms');?></a></li>
			<li class="nav-item " id="unaccepted_word"><a class="nav-link adminmenulink" data-page="unaccepted_word" href="#"><?= _('Unaccepted Words');?></a></li>
		<?php } ?>
		<?php if(checkpermissions("wordedit","affix","admin")) {?> 
			<li class="nav-item " id="createdic"><a class="nav-link adminmenulink" data-page="createdic" href="#"><?= _('Create Dictionary');?></a></li>
		<?php }?>
		<?php if(checkpermissions("baseuser","wordedit","affix","admin")) {?> 
			<li class="nav-item " id="uploadwords"><a class="nav-link adminmenulink" data-page="uploadwords" href="#"><?= _('Give us your words');?></a></li>
			<li class="nav-item " id="hunspell"><a class="nav-link adminmenulink" data-page="hunspell" href="#"><?= _('Analyze words');?></a></li>
		<?php }?>
		</ul>
		
	</div>
	<div class="col text-right" id="StavekontroldenHelp">
		<a href="./help/<?= explode(".",$_SESSION["locale"])[0];?>-help.pdf" target="_blank" title="<?= _('Download the manual ...');?>"><i class="far fa-question-circle"></i></a>
	</div>
</nav>
