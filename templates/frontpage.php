<div class="container mt-5">
	<div class="row">
		<div class="col">
		<?php
		$langtoorg=array("da_DK"=>0);
		include($systemdirs["pages"]."frontpage/".($GLOBALS["langtoorg"][$_SESSION["locale"]]+0).".html")
		?>
		</div>
	</div>
</div>
