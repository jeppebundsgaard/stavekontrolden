<!--     < ?php if(!$_SESSION["user_id"] and !$loggedin) {? > -->
<?php 
	$email=file_get_contents($relative."../newpass/".$newpass);
	if(!$email) { 
		echo ('<script>var warning="'._('The link has expired. We can send you a new one.').'";</script>');
		echo get_template("login")["template"];

	} else {?>
	<div class="row d-flex mt-4 justify-content-center">
		<div class="col  " id="loginform">
			<h3 class="text-center"><?= _('Create a new password!');?></h3>
			<div class="d-flex justify-content-center">
				<div class="card card-block logindiv ">
					<form class="form-signin loginform" method="POST" >
					<p><?=_('Email address').": ".$email;?></p>
					<label for="inputPassword" class="sr-only"><?= _('New Password');?></label>
					<input type="password" id="inputPassword" class="form-control menuform mt-2" placeholder="<?=_('Password');?>" required>
					<input type="hidden" id="inputEmail" value="<?= $email;?>">
					<input type="hidden" id="newpass" value="<?= $newpass;?>">
					<button class="btn btn-lg btn-primary" id="updatepassword" type="button"><?= _('Update');?></button>				
				</div>
			
			</div>
		</div>
	</div>
<!-- 		< ?php }  ?> -->
<?php }
