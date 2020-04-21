<!--     < ?php if(!$_SESSION["user_id"] and !$loggedin) {? > -->
<?php if(!$_POST["relogin"]) { ?>
	<div class="row d-flex mt-4 justify-content-center">
		<div class="col">
		<h1 class="text-center">Stavekontrolden</h1>
		<p class="lead text-center"><?= _('The hunspell companion.');?></p>
		</div>
	</div>
<?php } ?>
	<div class="row d-flex mt-4 justify-content-center">
		<div class="col  " id="loginform">
			<?= ($_POST["relogin"]?'<h3 class="text-center login collapse show">'._('Session timed out. Log in again').'</h3>':'');?>
			<h3 class="text-center signup collapse"><?=_('Give us your e-mail and a password');?></h3>
			<div class="d-flex justify-content-center">
				<div class="card card-block logindiv ">
					<form class="form-signin loginform" method="POST" >
					<label for="inputEmail" class="sr-only collapse signup" id="signuplabel"><?= _('Email address');?></label>
					<label for="inputEmail" class="sr-only collapse login show"><?= _('Email address or Username');?></label>
					<input type="text" id="inputEmail" class="form-control menuform" placeholder="<?=_('Email address or Username');?>" required>
					<label for="inputPassword" class="sr-only"><?= _('Password');?></label>
					<input type="password" id="inputPassword" class="form-control menuform mt-2" placeholder="<?=_('Password');?>" required>
					<div class="form-check">
					<input type="checkbox" id="rememberMe" value=""> <label class="form-check-label" for="rememberMe"><?= _('Remember me');?></label>
					</div>
					<?= ($_POST["relogin"]?'<input type="hidden" id="relogin" value="true">':'<button class="btn btn-lg btn-success mr-2 collapse show login" id="applyforsignup" type="button">'._('Sign up').'</button><button class="btn btn-lg btn-primary loginsignup-button login-button collapse signup" id="signup" type="submit">'._('Sign up').'</button>');?>
					<button class="btn btn-lg btn-primary loginsignup-button login-button collapse show login" id="login" type="submit"><?= _('Log in');?></button>
					<p class="small muted"><a class="" id="forgotpassword" href="#"><?= _('Forgot your password? Click here to create a new one.');?></a></p>
					</form>
				
				</div>
			
			</div>
		</div>
	</div>
<!-- 		< ?php }  ?> -->
