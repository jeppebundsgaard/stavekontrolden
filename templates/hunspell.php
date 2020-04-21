<div class="container">
	<div class="row">
		<div class="col">
		<h3><?= _("Analyze using latest version of the dictionary");?></h3>
		</div>
	</div>
	<div class="row">
		<div class="col" id="hunspellform">
			<label for="hunspellword" class="col-form-label"><strong><?= _('Enter one or more words');?></strong></label>
			<input class="hunspell form-control form-control-sm" type="text" id="hunspellword" name="hunspellword">
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="spellcheck" checked="checked" id="analysis" value="analysis">
				<label class="form-check-label" for="analysis"><?=_("Analyze");?></label>
			</div>
			<div class="form-check form-check-inline">
				<input class="form-check-input" type="radio" name="spellcheck" id="spellcheck" value="spellcheck">
				<label class="form-check-label" for="spellcheck"><?=_("Spellcheck");?></label>
			</div>
			<div class="form-check form-check-inline">
				<button type="button" class="btn btn-primary" id="analyzeword"><?= _("Analyze!");?></button>
			</div>
		</div>
		<div class="col">
		<label for="hunspellresult" class="col-form-label"><strong><?= _('Result');?></strong></label>
		<div class="affixpool" id="hunspellresult"></div>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<br><br>
			<h3>How to read the output</h3>
		</div>
	</div>
	<div class="row">
		<div class="col">
			<h4>Analyze</h4>
			<h6>From the hunspell (5) manual</h6>
			<ul><li>fl: Flag (morphological description or affix rule number).</li><li>st: Stem. Optional: default stem is the dictionary item in morphological analysis. Stem field is useful for virtual stems (dictionary words with NEEDAFFIX flag) and morphological exceptions instead of new, single used morphological rules.</li></ul><blockquote class="blockquote">feet st:foot is:plural<br>mice st:mouse is:plural<br>teeth st:tooth is:plural</blockquote><p>Word forms with multiple stems need multiple dictionary items:</p><blockquote class="blockquote">lay po:verb st:lie is:past_2<br>lay po:verb is:present<br>lay po:noun</blockquote><ul><li>al: Allomorph(s). A dictionary item is the stem of its allomorphs. Morphological generation needs stem, allomorph and affix fields.</li></ul><blockquote class="blockquote">sing al:sang al:sung<br>sang st:sing<br>sung st:sing</blockquote><ul><li>po: Part of speech category.</li><li>ds: Derivational suffix(es). Stemming doesn’t remove derivational suffixes. Morphological generation depends on the order of the suffix fields.</li></ul><p>In affix rules:</p><blockquote class="blockquote">SFX Y Y 1<br>SFX Y 0 ly . ds:ly_adj</blockquote><p>In the dictionary:</p><blockquote class="blockquote">ably st:able ds:ly_adj<br>able al:ably</blockquote><ul><li>is: Inflectional suffix(es). All inflectional suffixes are removed by stemming. Morphological generation depends on the order of the suffix fields.</li></ul><blockquote class="blockquote">feet st:foot is:plural</blockquote><ul><li>ts: Terminal suffix(es). Terminal suffix fields are inflectional suffix fields "removed" by additional (not terminal) suffixes. Useful for zero morphemes and affixes removed by splitting rules.</li></ul><blockquote class="blockquote">work/D ts:present<br>SFX D Y 2<br>SFX D 0 ed . is:past_1<br>SFX D 0 ed . is:past_2</blockquote><p>Typical example of the terminal suffix is the zero morpheme of the nominative case.</p><ul><li>sp: Surface prefix. Temporary solution for adding prefixes to the stems and generated word forms. See tests/morph.* example.</li><li>pa: Parts of the compound words. Output fields of morphological analysis for stemming.</li><li>dp: Planned: derivational prefix.</li><li>ip: Planned: inflectional prefix.</li><li>tp: Planned: terminal prefix.</li></ul>
		</div>
		<div class="col">
			<h4>Spellcheck</h4>
			<h6>From the hunspell (1) manual</h6>
			<p>Hunspell prints a one-line version identification message, and then begins reading lines of input. Each word is checked for spelling. If the word was found in the dictionary, then the line contains only a ’*’. If the word was found through affix removal, then the line contains a ’+’, a space, and the root word. </p><ul><li>If the word was found through compound formation (concatenation of two words, then the line contains only a ’−’. </li><li>If the word is not in the dictionary, but there are near misses, then the line contains an ’&amp;’, a space, the misspelled word, a space, the number of near misses, the number of characters between the beginning of the line and the beginning of the misspelled word, a colon, another space, and a list of the near misses separated by commas and spaces.</li><li>Also, each near miss or guess is capitalized the same as the input word unless such capitalization is illegal; in the latter case each near miss is capitalized correctly according to the dictionary. </li><li>Finally, if the word does not appear in the dictionary, and there are no near misses, then the line contains a ’#’, a space, the misspelled word, a space, and the character offset from the beginning of the line. Each sentence of text input is terminated with an additional blank line, indicating that hunspell has completed processing the input line.</li></ul><p>These output lines can be summarized as follows:</p><ul><li>OK: *</li><li>Root: + &lt;root&gt;</li><li>Compound: −</li><li>Miss: &amp; &lt;original&gt; &lt;count&gt; &lt;offset&gt;: &lt;miss&gt;, &lt;miss&gt;, ...</li><li>None: # &lt;original&gt; &lt;offset&gt;</li></ul><p>For example, a dummy dictionary containing the words "fray", "Frey", "fry", and "refried" might produce the following response to 'frqy refries':</p><blockquote class="blockquote">(#) Hunspell 0.4.1 (beta), 2005-05-26<br>&amp; frqy 3 0: fray, Frey, fry<br>&amp; refries 1 5: refried</blockquote><p><br></p>
		</div>
	</div>
</div>
