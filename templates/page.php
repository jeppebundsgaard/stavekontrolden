<div class="container mt-5">
	<div class="row">
		<div class="col">
		<?php
		include($systemdirs["pages"]."org/".($GLOBALS["langtoorg"][$_SESSION["locale"]]+0)."/".$_GET["page"].".html")
		?>
		</div>
	</div>
</div>
