<div class="container mt-5">
	<div class="row collapse mt-3" id="thanks">
		<div class="col">
			<h3><?= _("Thank you so much!");?></h3>
			<p><?= _("We will start processing the words. If you want to be part of that work, please get in contact!");?></p>
		</div>
	</div>
	<div class="row collapse" id="nownewwords">
		<div class="col">
			<h3><?= _("We had all the words");?></h3>
			<p><?= _("Thank you for taking the time to upload your words. We didn't find any words not in our dictionary already. You can download the latest version of the spellchecker on the Dictionary page.");?></p>
		</div>
	</div>
	<div class="row uploadfile collapse show">
		<div class="col">
			<h1 ><?= _("Give us your words");?></h1>
			<p><?= _('Upload document or text files (.odt, .txt), markup files (.html, .sgml, .xml), or typesetting files (.tex, .latex, .nroff, .troff)');?></p>
			<p><?= _('It is okay if the document includes words already in the dictionary; they will be filtered out.<br>It is also okay if the document includes words that you don\'t think should be included. You will get the opportunity to edit the words after upload.');?></p>
		</div>
	</div>
	<div class="row uploadfile collapse show">
		<div class="col text-center">
			<div class="custom-file">
				<input type="file" class="custom-file-input" id="wordfile">
				<label class="custom-file-label" for="wordfile"><?=_('Choose the file to upload');?></label>
				<span class="uploadinfo collapse"><i class="fas fa-spinner fa-spin"></i><?=_('Uploading ...');?></span>
			</div>
		</div>
	</div>


	<div class="row collapse mt-3 uploaddone">
		<div class="col">
			<h3><?= _("Prepare for inclusion");?></h3>
			<p><?= _("Please help us by editing the words before final inclusion into the database.");?></p>
			<p><ul>
				<li><?= _("Change all uppercase words which are not names, to lowercase.");?></li>
				<li><?= _("Reduce all words to their basic form (stem)");?></li>
				<li><?= _("Remove doublets, and other words you don't think should be included in the database.");?></li>
				<li><?= _("When you think, you are done, hit the <i>'Send to further processing'</i> button.");?></li>
			</ul></p>
		</div>
	</div>
	<div class="row collapse mt-3 uploaddone">
		<div class="col text-center">
			<textarea id="newwords" rows="30" class="form-control"></textarea>
		</div>
		<div class="">
			<button type="button" class="btn btn-primary" id="uploadwordsbutton"><?= _("Send to further processing");?></button>
		</div>
	</div>
</div>
