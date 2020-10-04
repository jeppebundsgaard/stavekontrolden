	<div class="row ">
		<div class="col text-center">
			<i class="fas fa-angle-double-left nextrows disabled firstbutton" <?=(!$navigationshown?'id="firstbutton"':'');?> data-buttontype="firstbutton" data-next="0"></i>
			<i class="fas fa-angle-left nextrows disabled prevbutton" <?=(!$navigationshown?'id="prevbutton"':'');?> data-buttontype="prevbutton" data-next="-1"></i>
			<i class="fas fa-angle-right nextrows nextbutton" <?=(!$navigationshown?'id="nextbutton"':'');?> data-buttontype="nextbutton" data-next="1"></i>
			<i class="fas fa-angle-double-right nextrows lastbutton" <?=(!$navigationshown?'id="lastbutton"':'');?> data-buttontype="lastbutton" data-next="-1"></i>
		</div>
	</div>
<?php $navigationshown=true;?>
