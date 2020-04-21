	</div>
</main>
<footer class="footer d-print-none py-1 mt-auto site-footer fixed-bottom-md">
	<div class="collapse row" id="collapseLang">
		<div class="col justify-content-right">
			<?php
			$tag1='<img class="newLang flag-img float-right" src="locale/flags/';
			$tag2='.png">';
			$langs=array("da_DK","en_US");
			echo $tag1.implode($tag2.$tag1,$langs).$tag2;
			?>
		</div>
	</div>
	<div class="row ">
		<div class="col ">
			<a class="footer-link" href="?create=1"><span class="text-muted ml-2">&copy; Stavekontrolden</span></a>
		</div>
		<div class="col-md-7 col-5 d-flex justify-content-center">
			<a class="footer-link text-center mr-3 mr-lg-4 d-none d-md-inline" href="?cookies=1"><?= _('Cookies');?></a>
			<a class="footer-link text-center mr-3 mr-lg-4 d-none d-md-inline" href="?contact=1"><?= _('Contact');?></a>
		</div>
		<div class="col">
			<div  class="icon-link float-right" id="chooselang"><span><button class="btn pb-0 pt-0 "><img data-toggle="collapse" href="#collapseLang" role="button" aria-expanded="false" aria-controls="collapseLang" class="flag-img" src="locale/flags/<?= $locale; ?>.png"></button></div>

			<?php if($_SESSION["user_id"]) {?><form method="POST" action="?<?=$_SERVER['QUERY_STRING'];?>"><button class="btn pb-0 pt-0 text-muted float-right logout" onclick="this.form.submit()" title="<?= _('Log out');?>"><i class="fas fa-sign-out-alt"></i></button><input type="hidden" name="logout" value="true"></form><?php } ?>
		</div>
	</div>
	<div class="row ">
		<div class="col d-flex justify-content-center">
			<a class="footer-link text-center mr-3 mr-lg-4 d-md-none" href="?cookies=1"><?= _('Cookies');?></a>
			<a class="footer-link text-center mr-3 mr-lg-4 d-md-none" href="?contact=1"><?= _('Contact');?></a>
			<a class="footer-link text-center ml-3 ml-lg-4 d-md-none" href="./?backend=1"><?= _('Log in');?></a>
		</div>
	</div>

</footer>
<footer class="d-none d-print-block">
	<div class="row h-100">
		<div class="col d-flex align-content-end">
			<span class="text-muted mt-5 mx-auto"><?= _("Tournament Managed by basesystem");?></span>
		</div>
	</div>
</footer>

<div class="alert alert-warning" id="basesystemWarning" style="position: fixed;width:30%;z-index:1051;top:50%;left:50%;margin-left:-15%;text-align:center;display:none; " role="alert">
	<button type="button" class="close" id="closew" aria-label="Close" >
		<span aria-hidden="true">&times;</span>
	</button>
	<span id="basesystemWarningTxt">
	</span>
</div>
<div class="alert alert-success" id="basesystemMessage" style="position: fixed;width:30%;z-index:1051;top:50%;left:50%;margin-left:-15%;text-align:center;display:none; " role="alert">
	<button type="button" class="close" id="closem" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
	<span id="basesystemMessageTxt">
	</span>
</div>
<div class="alert alert-danger fixed-bottom w-100" id="basesystemError" style="position: fixed;z-index:1051;text-align:center;display:none; margin-bottom:0px;padding-x:30px;" role="alert">
	<button type="button" class="close" id="closee" aria-label="Close" >
		<span aria-hidden="true">&times;</span>
	</button>
	<span id="basesystemErrorTxt">
	</span>
</div>
<div class="modal fade" id="loginmodal" tabindex="-1" role="dialog" aria-labelledby="loginmodal" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title"><?= _('Login');?></h5>
			</div>
			<div class="modal-body" id="loginbody">
				
			</div>
		</div>
	</div>
</div>
<i id="basesystemWait" class="fad fa-spinner fa-spin d-none" style="font-size:50px;position: fixed; top: 50%;  left: 50%;"></i>
    <!-- Bootstrap core JavaScript
    ================================================== -->

    
    
<script src="./vendor/components/jquery/jquery.min.js" ></script>
<script src="./vendor/twbs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="./js/vendor/md5.min.js"></script>
<script src="./js/vendor/translate.js"></script>
<!-- 	<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script> -->


<!-- <script src="./locale/<?= $locale;?>/LC_MESSAGES/jsmessages.js"></script> -->

<script>var language="<?=$locale;?>"</script>
<script src="./js/basesystem.js?v=<?=$v;?>"></script>
<?php 
$v="0.0.2";
if($_SESSION["user_id"]) echo('<script src="./js/basesystemadmin.js?v='.$v.'"></script>');
?>
	<?php if($_SESSION["orgMember"] and $_SESSION["user_id"]==1) {?> 
		<script src="./js/basesystemadminadmin.js?v=<?=$v;?>"></script>
	<?php }?>
  </body>
</html>
