var page=""
var singlevalue
var cachenegsearch=[]
var lastsave=""
$(function() {
  //TODO: Introduce nextpanel to replace !system_id. 
	initAction()
});
function initAction() {
	$("#showMyOrg").click(showMyOrg);
	$("#showMyUser").click(showMyUser);
	$(".adminmenulink").click(function() {get_template($(this).data("page"),{},"whenLoaded_"+$(this).data("page"))}); 
	
}
function whenLoaded_words() {
	page="words"
	getrows()
	filters()
	if(cachenegsearch.length>0) {
		for(var i=0;i<cachenegsearch.length;i++) {
			if(cachenegsearch[i]) $($(".posnegsearch").get(i)).children().toggleClass("show")
		}
		cachenegsearch=[]
	}
	$("#showdetails").click(function() {get_template("words",{showdetails:true,filters:$(".wordfilter").serialize()},"whenLoaded_words"); cachenegsearch=$(".negsearch").map(function() {return $(this).hasClass("show")}).get() })
	$("#showlog").click(function() {get_template("words",{showlog:true,filters:$(".wordfilter").serialize()},"whenLoaded_words"); cachenegsearch=$(".negsearch").map(function() {return $(this).hasClass("show")}).get() })
	$(".wordsave").click(wordsave)
	modalSetup()
	$(".associateaffixclass").change(associateaffixclass)
	$(".newaffixclass").click(newaffixclass)
	$(".newaffixrule").click(newaffixrule)
	$(".wordclasssave").click(wordclasssave)
	$(".affixclasssave").click(affixclasssave)
	$(".affixrulesave").click(affixrulesave)
	$("#doeditwordclass").click(doeditwordclass)
	$("#doeditaffixclass").click(doeditaffixclass)
	$("#doeditaffixrule").click(doeditaffixrule)
	$("#newword").click(editNewword)

}
function whenLoaded_wordclass() {
	page="wordclass"
	getrows()	
	filters()
	$(".associateaffixclass").change(associateaffixclass)
	$(".newaffixclass").click(newaffixclass)
	$(".newaffixrule").click(newaffixrule)
	$(".wordclasssave").click(wordclasssave)
	$(".affixclasssave").click(affixclasssave)
	$(".affixrulesave").click(affixrulesave)
	$("#doeditaffixclass").click(doeditaffixclass)
	$("#doeditaffixrule").click(doeditaffixrule)

	modalSetup()
	$(".newwordclass").click(editNew)
}
function whenLoaded_fugeelement() {
	page="fugeelement"
	getrows()	
	filters()
	$(".associateaffixclass").change(associateaffixclass)
	$(".fugeelementsave").click(fugeelementsave)
	$(".affixclasssave").click(affixclasssave)
	$(".affixrulesave").click(affixrulesave)
	$("#doeditaffixclass").click(doeditaffixclass)
	$("#doeditaffixrule").click(doeditaffixrule)
	$(".newaffixclass").click(newaffixclass)
	$(".newaffixrule").click(newaffixrule)

	modalSetup()
	$("#newfugeelement").click(editNew)

}

function whenLoaded_affixclass() {
	page="affixclass"
	getrows()	
	filters()
	
	$(".associateaffixclass").change(associateaffixclass)
	$(".affixclasssave").click(affixclasssave)
	$(".affixrulesave").click(affixrulesave)
	$("#doeditaffixclass").click(doeditaffixclass)
	$("#doeditaffixrule").click(doeditaffixrule)
	modalSetup()
	$(".newaffixclass").click(newaffixclass)
	$(".newaffixrule").click(newaffixrule)
}
function whenLoaded_affixrule() {
	page="affixrule"
	getrows()	
	filters()
	$(".associateaffixclass").change(associateaffixclass)
	$("#doeditaffixclass").click(doeditaffixclass)
	
	$(".affixrulesave").click(affixrulesave)
	modalSetup()
}
function whenLoaded_morphdescr() {
	page="singlevalue"
	singlevalue="morphdescr"
	getrows()
	filters()
	promtReady()
}
function whenLoaded_technical_term() {
	page="singlevalue"
	singlevalue="technical_term"
	getrows()
	filters()
	promtReady()

}
function whenLoaded_start_definitions() {
	page="singlevalue"
	singlevalue="start_definitions"
	getrows()
	filters()
	promtReady()
}
function whenLoaded_unaccepted_word() {
	page="singlevalue"
	singlevalue="unaccepted_word"
	getrows()
	filters()
	promtReady()
}
function whenLoaded_wordstatus() {
	page="singlevalue"
	singlevalue="wordstatus"
	getrows()
	filters()

}
function whenLoaded_createdic() {
}
function whenLoaded_uploadwords() {
	$("#wordfile").change(uploadwords)
	$("#uploadwordsbutton").click(wordstodatabase) 
}
function whenLoaded_hunspell() {
	$("#analyzeword").click(analyzeword)
	$("#hunspellword").keydown(function(e) {if(e.key=="Enter") analyzeword()})
}
function analyzeword() {
	send("hunspell","hunspellresult",{word:$("#hunspellword").val(),spellcheck:$('#hunspellform [name=spellcheck]:checked').val()},"backend")
}
function hunspellresult(json) {
	if(typeof(json.analysisresult)!="undefined")
		$("#hunspellresult").html(json.analysisresult.join("<br>"))
}
function promtReady() {
	$(".promptsave").click(promptsave)
	$("#promptname").keydown(function(e) {if(e.which==13) {e.preventDefault(); promptsave()}})
	$('#promptmodal').on('shown.bs.modal', function (e) {
		$("#promptname").val("")
		$("#promptname").focus()
	})

}
function associateaffixclass() {
	var id=$(this).val()
	var description=$(this).children("option:selected").text()
	var aff=$('<button class="editaffixclass btn btn-sm btn-light" data-affixclassid="'+id+'">'+description+'</button><i class="fas fa-backspace text-danger deleteaffix"></i>&nbsp;');
	$(this).closest(".modal-body").find(".affixpool").append(aff)
	$(".deleteaffix").unbind("click").click(deleteaffix)
	$(".editaffixclass").unbind("click").click(viewAffixclass)
	$(this).val(0)
}
function modalSetup() {
	$('.modal-header').mousedown(modal_draggable);
	$('.modal').on('hidden.bs.modal', clearmodal)
}
function clearmodal(th) {
	if(typeof(th.type)!="undefined") th=$(this)
	$(th).find(".editwd").collapse("hide")
	$(th).find(".addwd").collapse("show")
	$(th).find(".wordsave").collapse("show")
	$(th).find(".associaterow").collapse("show")
	$(th).find(".newword[type!='checkbox']").val("")
	$(th).find(".disabled-words").val("")
	$(th).find(".newword").prop('disabled', false);
	$(th).find(".affixpool").html("")
}
function promptsave() {
	send("promptsave","afterprompt",{table:singlevalue,val:$("#promptname").val()},"backend")
}
function afterprompt() {
	getrows()
	$('#promptmodal').modal("hide")
}
function showNext(t) {
	var nextprev=(t).hasClass("nextsave")?1:($(t).hasClass("prevsave")?-1:0)
	var next=($("#nextbutton").data("next")+$("#prevbutton").data("next"))/2
	if(nextprev==0) return {nextprev:0,newsave:$(t).hasClass("newsave"),nextsingle:-1,next:next};
	var numshow=Number($(t).closest(".modal-content").find("[name=numshow]").val())+nextprev
	var limit=$("#limit").val()
	if(numshow<0 || numshow>=limit) {
		var button=(numshow<0?"prevbutton":"nextbutton")
		numshow=(numshow<0?limit-1:0)
		var next=$("#"+button).data("next")
		updatebuttons(button)
	} 
	$(t).closest(".modal-content").find("[name=numshow]").val(numshow)
	return {nextprev:nextprev,nextsingle:numshow,next:next}
}
function wordsave() {
	var andThen=showNext($(this))
	if($("#wordsform .newword").serialize()!=lastsave) {
		lastsave=$("#wordsform .newword").serialize()
		send("saveword","afterwordsave",{word:$("#wordsform .newword").serialize(),andThen:andThen},"backend")
	}
}
function wordclasssave() {
	var andThen=showNext($(this))
	var affixclasses=$(".wcpool.affixpool .editaffixclass").map(function() {return $(this).data("affixclassid")}).get()
	send("savewordclass","afterwordclasssave",{wordclass:$("#wordclassform .newword").serialize(),affixclasses:affixclasses,andThen:andThen},"backend")
}
function fugeelementsave() {
	var andThen=showNext($(this))
	var affixclasses=$(".fepool.affixpool .editaffixclass").map(function() {return $(this).data("affixclassid")}).get()
	send("savefugeelement","afterfugeelementsave",{fugeelement:$("#fugeelementform .newword").serialize(),affixclasses:affixclasses,andThen:andThen},"backend")
}
function affixclasssave() {
	var andThen=showNext($(this))
	var affixrules=$(".acpool.affixpool .editaffixrule").map(function() {return $(this).data("affixruleid")}).get()
	send("saveaffixclass","afteraffixclasssave",{affixclass:$("#affixclassform .newword").serialize(),affixrules:affixrules,andThen:andThen},"backend")
}
function affixrulesave() {
	var andThen=showNext($(this))
	var affixclasses=$(".arpool.affixpool .editaffixclass").map(function() {return $(this).data("affixclassid")}).get()
	send("saveaffixrule","afteraffixrulesave",{affixrule:$("#affixruleform .newword").serialize(),affixclasses:affixclasses,andThen:andThen},"backend")
}
function afterwordsave(json) {
	if(!json.warning) {
		if(json.andThen.nextsingle<0 && json.andThen.newsave!="true") $("#wordsmodal").modal('hide')
		else {
			$("#wordsform .newword:not(.dontreset)[type!='checkbox']").val("")
			
		}

		getrows(json.andThen)
	}
}
function afterwordclasssave(json) {
	if(!json.warning) {
		if(json.andThen.nextsingle<0 && json.andThen.newsave!="true") $("#wordclassmodal").modal('hide')
		if(page=="wordclass")
			getrows(json.andThen)
	}
}
function afterfugeelementsave(json) {
	if(!json.warning) {
		if(json.andThen.nextsingle<0 && json.andThen.newsave!="true") $("#fugeelementmodal").modal('hide')
		//if(page=="fugeelement")
		getrows(json.andThen)
	}
}
function afteraffixclasssave(json) {
	if(!json.warning) {
		if(page!="affixclass") {
			if(json.newaffixclass=="true") { // A new class created from wordclassmodal
				var aff=$('<button class="editaffixclass btn btn-sm btn-light" data-affixclassid="'+json.affixclassid+'">'+json.description+'</button>');
				var del=$('<i class="fas fa-backspace text-danger deleteaffix">').click(deleteaffix)
				$(".wcpool.affixpool,.fepool.affixpool").append(aff).append(del).append($(" "))
				if($(".associateaffixclass").length>0) {
				$(".associateaffixclass").prepend('<option value="'+json.affixclassid+'" >'+json.description+'</option>')
			}
			} else $(".editaffixclass").each(function() {if($(this).data("affixclassid")==json.affixclassid) $(this).text(json.description) })
			
		} 
		if(json.andThen.nextsingle<0 && json.andThen.newsave!="true") $("#affixclassmodal").modal('hide')
		else {
			$("#affixclassform  .newword:not(.dontreset)").val("")
			$(".acpool.affixpool").html("")
		}
		if(page=="affixclass" || !$("#wordclassmodal").hasClass("show"))
			getrows(json.andThen)
	}
}
function afteraffixrulesave(json) {
	
	if(!json.warning) {
		if(json.newaffixrule=="true") { // A new rule created from affixclassmodal
			var aff=$('<button class="editaffixrule btn btn-sm btn-light" data-affixruleid="'+json.affixruleid+'">'+json.description+'</button>');
			var del=$('<i class="fas fa-backspace text-danger deleteaffix">').click(deleteaffix)
			$(".acpool.affixpool").append(aff).append(del).append($(" "))
		} else $(".editaffixrule").each(function() {if($(this).data("affixruleid")==json.affixruleid) $(this).text(json.description) })
		if(json.andThen.nextsingle<0 && json.andThen.newsave!="true") $("#affixrulemodal").modal('hide')
		else {
			$("#affixruleform .newword:not(.dontreset)").val("")
			$(".arpool.affixpool").html("")
		}
		if(page=="affixrule")
			getrows(json.andThen)
	}
}
function filters() {
	$(".wordfilter").wrap('<div class="input-group">').before('<div class="input-group-prepend"><div class="input-group-text posnegsearch"><i class="fas fa-equals fa-xs collapse show "></i><i class="fas fa-not-equal fa-xs collapse negsearch"></i></div></div>')
	$("#wordsearch").after('<div class="input-group-append"><div class="input-group-text strictsearch" title="'+_("Accent search")+'"><i class="fas fa-language"></i></div></div>')
	$(".strictsearch").click(function() {
		$(this).toggleClass("disabled")
		if($(this).parent().next().val()!="") getrows()
	})
	$(".posnegsearch").click(function() {
		$(this).children().toggleClass("show")
		if($(this).parent().next().val()!="") getrows()
	})
	$(".wordfilter").change(getrows)
	$("#filtersetting").change(getrows)
	$("#limit").change(getrows)

	$("th:first-child").prepend('<i class="fas fa-sort-down changesort"></i> ')
	$("th:not(:first-child)").prepend('<i class="fas fa-sort changesort"></i> ')
	$(".changesort").click(function() {
		$(".changesort").not($(this)).removeClass("fa-sort-up fa-sort-down").addClass("fa-sort")
		var sort=($(this).hasClass("fa-sort-down")?"fa-sort-up":"fa-sort-down")
		$(this).removeClass("fa-sort fa-sort-up fa-sort-down").addClass(sort)
		getrows()
	})

	$(".nextrows").click(function() {
		if(!$(this).hasClass("disabled")) {
			var next=$(this).data("next")
			if(next==-1) next=Math.floor(Number($("#numrows").text())/Number($("#limit").val()))
			getrows({next:next})
			var button=$(this).data("buttontype")
			updatebuttons(button)
		}
	})
}
function updatebuttons(button) {
	switch(button) {
		case "firstbutton":
			$(".prevbutton").data("next",-1)
			$(".nextbutton").data("next",1)
			break;
		case "lastbutton":
			var last=Math.floor(Number($("#numrows").text())/Number($("#limit").val()))
			$(".prevbutton").data("next",last-1)
			$(".nextbutton").data("next",last+1)
			break;
		case "prevbutton":
		case "nextbutton":
			var add=(button=="prevbutton"?-1:1); 
			$(".prevbutton").data("next",$(".prevbutton").data("next")+add)
			$(".nextbutton").data("next",$(".nextbutton").data("next")+add)
			break;
	}
	disablebuttons()
}
function disablebuttons() {
	if($("#prevbutton").data("next")<0) {
		$(".prevbutton").addClass("disabled") 
		$(".firstbutton").addClass("disabled") 
	} else {
		$(".prevbutton").removeClass("disabled")
		$(".firstbutton").removeClass("disabled")
	}
	if($("#nextbutton").data("next")>Math.floor(Number($("#numrows").text())/Number($("#limit").val()))) {
		$(".nextbutton").addClass("disabled") 
		$(".lastbutton").addClass("disabled") 
	} else {
		$(".nextbutton").removeClass("disabled")
		$(".lastbutton").removeClass("disabled")
	}
}
function changeWord(th) {
	if(typeof(th.type)!="undefined") th=$(this)
	var col=th.index()
	var elem=$("#wordhead>tr>th:nth-child("+(col+1)+") .wordfilter").clone(true)
	elem.removeClass("wordfilter").addClass("wordupdate")
	var name=elem.attr("name")
	if(page=="singlevalue" && singlevalue=="start_definitions" || name=="comments" || name=="misspellings" || name=="strong_declension") {
		elem=$('<textarea class="form-control wordupdate" rows="'+(page=="singlevalue"?20:3)+'" name="'+(page=="singlevalue"?"singlevalue":name)+'"></textarea>')
	} 
	var val=th.children(".val").html().replace(/<br>/g,"\n").replace(/&gt;/g,">").replace(/&lt;/g,"<")
	if($(elem).prop("tagName")=="SELECT") {
		if(val!="")
			$(elem).children().filter(":contains("+val+")").attr("selected","selected")
	} else $(elem).val(val)
	elem.unbind("change").change(wordupdate)
	elem.keydown(wordkey)
	elem.on("blur",resetedit)
	th.children(".val").html(elem)
	elem.focus()
	th.children(".val").data("val",val)
	th.unbind("click")
}
function wordkey(e) {
	switch(e.key) {
		case "Escape":
			resetedit($(this))
			break;
		case "Tab":
			var next=(e.shiftKey?$(e.target).parent().parent().prevAll(".editable").first():$(e.target).parent().parent().nextAll(".editable").first())
			e.preventDefault()
			if(typeof(next)!="undefined")
				changeWord(next)
			break;
		case "ArrowRight":
			if(e.shiftKey) {
				var next=$(e.target).parent().parent().nextAll(".editable").first()
				wordupdate($(this))
				if(typeof(next)!="undefined")
					changeWord(next)
				$(this).unbind("change")
			}
			break;
		case "ArrowLeft":
			if(e.shiftKey) {
				var next=$(e.target).parent().parent().prevAll(".editable").first()
				wordupdate($(this))
				if(typeof(next)!="undefined")
					changeWord(next)
				$(this).unbind("change")
			}
			break;
		case "ArrowUp":
			if(e.shiftKey) {
				var next=$($(e.target).closest("tr").prev().children().get($(e.target).parent().parent().index()))
				wordupdate($(this))
				if(typeof(next)!="undefined")
					changeWord(next)
				$(this).unbind("change")
			}
			break;
		case "Enter":
			if($(this).attr("tagName")=="SELECT") $(this).click();
			if(!e.shiftKey) break;
		case "ArrowDown":			
			if(e.shiftKey) {
				var next=$($(e.target).closest("tr").next().children().get($(e.target).parent().parent().index()))
				wordupdate($(this))
				if(typeof(next)!="undefined")
					changeWord(next)
				$(this).unbind("change")
			}
			break;
	}
}
function resetedit(th) {
	if(typeof(th.type)!="undefined") th=$(th.target)
	th.parent().html(th.parent().data("val").replace(/\n/g,"<br>")).parent().click(changeWord)
}
function wordupdate(th) {
	if(typeof(th.type)!="undefined") th=$(this)
	var col=th.attr("name")
	var id=th.closest("tr").data("id")
	var val=th.val()
	
	if(th.prop("tagName")=="SELECT") {
		var txt=th.children().filter("option:selected").text()
	} else {
		var txt=val
	}
	var span=th.parent()
	var oldval=span.data("val")
	span.html(txt.replace(/\n/g,"<br>")).parent().click(changeWord)
	if(txt!=oldval)
		send(page+"update","doNothing",{id:id,col:col,val:val,singlevalue:singlevalue},"backend")
}
function populateTable(json) {
	if(json.andThen==null) json.andThen={}
		// console.log(json.andThen)

	var editfunction="placeholder"
	var t=""
	var editable=[2,3,4,5,6,10,11,12]
	for(var i=0;i<json.rows.length;i++) {
		t+='<tr data-id="'+json.rows[i][0]+'">'
		for(var j=1;j<json.rows[i].length;j++) {
			t+='<td'+(page=="words" && editable.indexOf(j)>-1?' class="editable"':'')+'>'+(j==1 && page!="singlevalue"?'<strong>':'')+'<span class="val">'+(json.rows[i][j]==null?'':json.rows[i][j].replace(/\n/g,"<br>"))+'</span>'+(j==1 && page!="singlevalue"?'</strong>':'')+"</td>"
		}
		if(page!="words") t+='<td class="delcol"><i class="far fa-trash-alt text-danger deletecategory"></i></td>'
	}	t+="</tr>"
	$("#tablebody").html(t)
	switch(page) {
		case "words": 
			$("#tablebody>tr>:nth-child(3)").append($('<span>&nbsp;<i class="far fa-eye viewWordclass"></i></span>'))
			editfunction="editWord"
			$(".viewWordclass").click(viewWordclass)
			$("#tablebody .editable").click(changeWord)
			$("#tablebody>tr>:nth-child(6), #tablebody>tr>:nth-child(12)").addClass("text-center")
			break
		case "wordclass":
			editfunction="editWordclass"
			$(".editaffixclass").click(viewAffixclass)
			break
		case "fugeelement":
			editfunction="editFugeelement"
			$(".editaffixclass").click(viewAffixclass)
			break
		case "affixclass":
			editfunction="editAffixclass"
			$(".editaffixrule").click(viewAffixrule)
			break
		case "affixrule":
			editfunction="editAffixrule"
			$(".editaffixclass").click(viewAffixclass)
			break
		case "singlevalue":
			$("#tablebody>tr>td:first-child").click(changeWord)
			break

	}
	var form="#"+page+"form";
	if(json.andThen.newsave=="true") { 
		clearmodal($(form))
		editNewword()
	}
// 	$(form+" [name=numshow]").data("numshow",json.numshow)
	if(page!="words") $(".deletecategory").click(deletecategory)
	if(page!="singlevalue")
		$("#tablebody>tr>td:first-child").click(window[editfunction])
	if(json.numrows!=null) $("#numrows").html(json.numrows)
	if(typeof(json.single)!="undefined") {
		var numshowObj=$(form+" [name=numshow]")
		if(typeof(json.reducenext)!="undefined") {
			$(numshowObj).val(Number($(numshowObj).val())-1)
		} else if(typeof(json.updatebutton)!="undefined") {
			$(numshowObj).val(json.andThen.nextsingle)
		}
		window[editfunction+"Modal"](json);
	}
	if(json.updatebutton) updatebuttons(json.updatebutton)
	disablebuttons()
}
function deletecategory() {
	if(window.confirm(_('Are you sure you want to delete this category and everything dependent on it (except words)?'))) {
		var id=$(this).closest("tr").data("id")
		send("deletecategory","getrows",{table:(page=="singlevalue"?singlevalue:page),id:id},"backend")
	}
}
function viewWordclass(e) {
	//You only view wordclass from word. 
	e.stopPropagation()
	var id=$(this).closest("tr").data("id")
	updateNumshow($(this),"wordclassform")
	send("singleWordclass","editWordclassModal",{wordid:id,view:true},"backend")
}
function editWordclass() {
	var id=$(this).parent().data("id")
	updateNumshow($(this),"wordclassform")
	send("singleWordclass","editWordclassModal",{id:id},"backend")
}
function doeditwordclass() {
	$("#wordclassmodal .editwd").collapse("show")
	$("#wordclassmodal .viewwd").collapse("hide")
	$("#wordclassmodal .closesave").collapse("show")
	$("#wordclassform .newword").prop('disabled', false);
	$(".wcedit").collapse("show")
	$(".wcpool.affixpool .editaffixclass").after('<i class="fas fa-backspace text-danger deleteaffix">')
	$(".deleteaffix").click(deleteaffix)

}
function editWordclassModal(json) {
	var wc=json.single
	$("#wordclassid").val(wc.id)
	populateModal(wc,"wordclass")
	$(".wcpool.affixpool").html(json.affixclasses)
	$(".wcpool.affixpool .editaffixclass").click(viewAffixclass)
	
	$("#wordclassmodal").find((json.view?".viewwd":".editwd")).collapse("show")
	if(json.view) {
		$(".wcedit").collapse("hide")
		$("#wordclassform .newword").prop('disabled', true);
	} else {
		$(".wcpool.affixpool .editaffixclass").after('<i class="fas fa-backspace text-danger deleteaffix">')
		$(".deleteaffix").click(deleteaffix)
	}
	$("#wordclassmodal").find(".addwd").collapse("hide")
	$(".newsave").collapse("hide")

	$("#wordclassmodal").modal("show")
}
function editFugeelementModal(json) {
	$("#tablebody>tr:nth-child("+(Number(json.andThen.nextsingle)+1)+")>td:first-child").click() //nth-child is 1-based
}
function editFugeelement() {
	$("#fugeelementid").val($(this).parent().data("id"))
	$("#fugeelementtxt").val($(this).text())
	$(".fepool.affixpool").html($(this).siblings().first().html())
	$(".fepool.affixpool .editaffixclass").after('<i class="fas fa-backspace text-danger deleteaffix">')
	$(".fepool.affixpool .editaffixclass").click(viewAffixclass)
	$(".deleteaffix").click(deleteaffix)
	$("#fugeelementmodal").find(".editwd").collapse("show")
	$("#fugeelementmodal").find(".addwd").collapse("hide")
	$("#fugeelementmodal").modal("show")
	updateNumshow($(this),"fugeelementform")
}
function deleteaffix(){
	$(this).prev().remove() //affixclasses
	$(this).remove() //backspace
}
function editWord() {
	var id=$(this).parent().data("id")
	updateNumshow($(this),"wordsform")
	send("singleWord","editWordModal",{id:id},"backend")
}
function editNewword() {
	$("#wordsform [name=wordstatus]").val(2)
	$("#wordsform [name=wordstatus]").attr("disabled","disabled")
	$("#wordsmodal .prevsave,#wordsmodal .nextsave").collapse("hide")
	$("#omitsuggestion").prop("checked",false)
}
function editNew(e) {
	$("#"+$(e.target).data("targetmodal")).find(".prevsave,.nextsave").collapse("hide")
}
function updateNumshow(o,form) {
	var numshowObj=$("#"+form+" [name=numshow]")
	$(numshowObj).val($(numshowObj).data("numshow")+$(o).closest("tr").index())
}
function editWordModal(json) {
	var w=json.single
	$("#wordid").val(w.id)
	populateModal(w,"words")
	var wordstatus=$("#wordsform [name=wordstatus]")
	if(wordstatus.children("option:selected").index()>1) 	{
		$("#wordsform .wordstatusbefore").val(wordstatus.children("option:selected").text())
		$("#wordsform .wordstatusbeforeelem").collapse("show")
		wordstatus.val(Number(wordstatus.val())+1)
	} else $(".wordstatusbeforeelem").collapse("hide")
	$("#wordsmodal").find(".editwd").collapse("show")
	$("#wordsmodal").find(".addwd").collapse("hide")
	$(".newsave").collapse("hide")
	$("#wordsmodal").modal("show")
}
function populateModal(vars,t) {
	for(let [k,v] of Object.entries(vars)) {
		var elem=$("#"+t+"form"+" [name="+k+"]")
		if(elem.hasClass("custom-select")) elem.html(elem.html()) // hack to make bootstrap aware that this select has a new selected. Without it, arrow down will show the first option's value, not the next from the one selected now.
		if(elem.attr("type")=="checkbox") elem.prop("checked",v>0?true:false) 
		else elem.val(v)
	}
}
function editAffixclass() {
	var id=$(this).parent().data("id")
	updateNumshow($(this),"affixclassform")
	send("singleAffixclass","editAffixclassModal",{id:id},"backend")
}
function viewAffixclass() {
	var id=$(this).data("affixclassid")
	updateNumshow($(this),"affixclassform")
	send("singleAffixclass","editAffixclassModal",{id:id,view:true},"backend")
}
function editAffixclassModal(json) {
	var a=json.single
	a.affixclassid=a.id
	
	populateModal(a,"affixclass")
	$(".acpool.affixpool").html(json.affixrules)
	$(".acpool.affixpool .editaffixrule").click(viewAffixrule)
	
	$("#affixclassmodal").find((json.view?".viewwd":".editwd")).collapse("show")
	if(json.view) {
		$(".associateclassrow").collapse("hide")
		$("#affixclassform .newword").prop('disabled', true);
	} else deleteableAffixClass()
	$("#affixclassmodal").find(".addwd").collapse("hide")
	
	$(".newsave").collapse("hide")
	$("#affixclassmodal").insertAfter("#affixrulemodal")
	$("#affixclassmodal").modal("show")
}
function deleteableAffixClass() {
	$(".acpool.affixpool .editaffixrule").after('<i class="fas fa-backspace text-danger deleteaffix">')
	$(".deleteaffix").unbind("click").click(deleteaffix)
}
function newaffixrule(e) {
	if($("#affixclassform [name=affixclassid]").val()=="") {
		send("saveaffixclass","editNewAffixrule",{affixclass:$("#affixclassform .newword").serialize(),andThen:{}},"backend")
	} else {
		editNewAffixrule()
	}
	editNew(e)
}
function editNewAffixrule(json) {
	if(json!=null) {
		$("#affixclassform [name=affixclassid]").val(json.affixclassid)
	}
	$("#affixruleform [name=affixclassid]").val($("#affixclassform [name=affixclassid]").val())
	$("#affixruleform [name=c_description]").val($("#affixclassform [name=description]").val())
	$("#affixruleform [name=newaffixrule]").val("true")
	$("#affixrulemodal").modal("show").insertAfter("#affixclassmodal")
}
function newaffixclass(e) {
	$("#affixclassform [name=newaffixclass]").val("true")
	$("#affixclassmodal").modal("show").insertAfter("#affixrulemodal")
	editNew(e)
}
function doeditaffixclass() {
	

	$("#affixclassmodal .newaffixrulerow").collapse("show")
	$("#affixclassmodal .editwd").collapse("show")
	$("#affixclassmodal .viewwd").collapse("hide")
	$("#affixclassmodal .closesave").collapse("show")
	$("#affixclassmodal .saveand").collapse("show")
	$("#affixclassform .newword").prop('disabled', false);
	
	deleteableAffixClass()
}
function editAffixrule() {
	var id=$(this).parent().data("id")
	updateNumshow($(this),"affixruleform")
	send("singleAffixrule","editAffixruleModal",{id:id},"backend")
}
function viewAffixrule() {
	var id=$(this).data("affixruleid")
	updateNumshow($(this),"affixruleform")
	send("singleAffixrule","editAffixruleModal",{id:id,view:true},"backend")
}
function editAffixruleModal(json) {
	var a=json.single
	a.affixruleid=a.id
	populateModal(a,"affixrule")
	$(".arpool.affixpool").html(json.affixclasses)
	$(".arpool.affixpool .editaffixclass").click(viewAffixclass)
	
	$("#affixrulemodal").find((json.view?".viewwd":".editwd")).collapse("show")
	if(json.view) {
		$(".associaterulerow").collapse("hide")
		$("#affixruleform .newword").prop('disabled', true);
	} else deleteableAffixRule()
	$(".associaterulerow.newsave").collapse("hide")
	$("#affixrulemodal").find(".addwd").collapse("hide")
	$("#affixrulemodal").insertAfter("#affixclassmodal")
	$("#affixrulemodal").modal("show")
}
function deleteableAffixRule() {
	$(".arpool.affixpool .editaffixclass").after('<i class="fas fa-backspace text-danger deleteaffix">')
	$(".deleteaffix").unbind("click").click(deleteaffix)
}
function doeditaffixrule() {
	$("#affixrulemodal .editwd").collapse("show")
	$("#affixrulemodal .viewwd").collapse("hide")
	$("#affixrulemodal .closesave").collapse("show")
	$("#affixruleform .newword").prop('disabled', false);
	$("#affixruleform .associateaffixclasstorule").collapse("show")
	deleteableAffixRule()
}
function getrows(andThen) {
	if(typeof(andThen)=="undefined") andThen={}
	else if(typeof(andThen.next)=="undefined") andThen={}
	if(andThen.length>0 && Number.isNaN(parseInt(andThen.next))) {
		$("#prevbutton").data("next",-1)
		$("#nextbutton").data("next",1)
	}
	// console.log(andThen)
	var order={}
	if(typeof($(".changesort"))!="undefined")
		order=$(".changesort").map(function(){return ($(this).hasClass("fa-sort-down")?"ASC":($(this).hasClass("fa-sort-up")?"DESC":""))}).get()
	send("get_"+page,"populateTable",{where:$(".wordfilter").serialize(),filtersetting:$("#filtersetting").val(),strictsearch:$(".strictsearch").hasClass("disabled"),order:order,negsearch:$(".negsearch").map(function() {return $(this).hasClass("show")}).get(),andThen:andThen,numrows:$("#numrows").text(),limit:($(this).attr("id")=="limit"?$(this).val():0),singlevalue:singlevalue},"backend")
}
function showMyOrg() {
	get_template("myOrganization",{contentdiv:"contentdiv"},"initOrg");
}
function showMyUser() {
	get_template("myUser",{},"editUserData");
}
function editUserData() {
	$(".userinput").change(function() {var val=($(this).hasClass("password")?md5($(this).val()):$(this).val()); send("usersettingsupdate","doNothing",{uservar:($(this).attr("name")?$(this).attr("name"):$(this).attr("id")),userval:val},"backend")});
	$("#finish").click(finish)
}

function initOrg() {
	$(".editorg").click(editorg)
}
function initCSS() {
// 	return;
	hljs.configure({   // optionally configure hljs
		languages: ['css']
	});

	var quill = new Quill('#csseditor', {
	modules: {
			syntax: true,              // Include syntax module
			toolbar: false  // No toolbar
		},
		theme: 'snow'
	});
	var CSSchange = false
	quill.on('text-change', function(delta) {
		CSSchange = true
	});
	setInterval(function() {
		if (CSSchange) {
 			console.log('Saving changes', CSSchange);
			CSSeditsave()
			CSSchange = false
		}
	}, 5*1000);
	$("#editCSSsave").click(function() {CSSeditsave(true)})
	$("#refreshStyle").click(function() {send("saveCSS","refreshStyle",{CSS:$("#csseditor").find("pre").text()},"backend")})
}
function CSSeditsave(finish) {
	send("saveCSS",(finish?"showMyOrg":"pagesaved"),{CSS:$("#csseditor").find("pre").text()},"backend");
}
function refreshStyle() {
	$('#stavekontroldenstyles').attr('href',$('#stavekontroldenstyles').attr('href').replace(/\?.*/,"")+"?v="+ new Date().getTime());
}
function editorg() {
	switch($(this).attr("id")) {
		case "editOrgPage":
			get_template("editpage",{pagetype:"org",id:0,contentdiv:"orgcontentdiv"},"editpageready")
		break;
		case "editFrontPage":
			get_template("editpage",{pagetype:"frontpage",id:0,contentdiv:"orgcontentdiv"},"editpageready")
		break;
		case "editPages":
			get_template("orgpages",{contentdiv:"orgcontentdiv"},"orgpagesready")
		break;
		case "editUserPage":
			get_template("editpage",{pagetype:"user",id:0,contentdiv:"orgcontentdiv"},"editpageready")
		break;
		case "editHeaderPage":
			get_template("editpage",{pagetype:"header",id:0,contentdiv:"orgcontentdiv"},"editpageready")
		break;
		case "editStyles":
			$("#orgcontentdiv").html('<h2 class="text-center align-middle h-100">'+_('Preparing CSS-editor')+'</h2><div class="d-flex justify-content-center"><div class="spinner-border m-5" role="status"><span class="sr-only">Loading...</span></div></div>');
			get_template("editCSS",{contentdiv:"orgcontentdiv"},"initCSS");
		break;
		case "editOrgSettings":
			get_template("orgsettings",{contentdiv:"orgcontentdiv"},"setsettings")
		break;
		case "editMasterData":
			get_template("orgmasterdata",{contentdiv:"orgcontentdiv"},"editMasterData")
		break
		case "editVersion":
			get_template("version",{contentdiv:"orgcontentdiv"},"editVersion")
		break;
		case "editOrgUsers":
			editOrgUsersIni()
		break
		case "editOrgStats":
			console.log("stats");
			get_template("stats",{contentdiv:"orgcontentdiv"},"doNothing")
		break
	}
}
function editOrgUsersIni() {
	get_template("orgusers",{contentdiv:"orgcontentdiv"},"editOrgUsers")	
}
function editOrgUsers() {
 	$(".changePermissions").click(function() {if($(this).children().length==0) send("systemUserPermissions","selectUserPermissions",{user:$(this).data("user")},"backend")})
	$("#invite").click(function() {send("orgUser","editOrgUsersIni",{invite:$("#email").val(),inviteuser:$("#username").val()},"backend")})
	$(".remove").click(function() {send("orgUser","editOrgUsersIni",{remove:$(this).data("user")},"backend")})
	$("#create").click(function() {send("orgUser","editOrgUsersIni",{create:$("#email").val(),user:$("#username").val(),password:md5($("#password").val())},"backend")})
	
}
function selectUserPermissions(json) {
	var cp=$(".changePermissions[data-user="+json.user+"]")
	$(cp).html(json.select)
	$("#doChangePermissions").change(doChangePermissions)
}
function doChangePermissions() {
	var val=$(this).val()
	var user=$(this).parent().data("user")
	$(this).parent().html(val)
	send("setSystemUserPermissions","doNothing",{permissions:val,user:user},"backend")
}

function editMasterData() {
	$(".orginput").change(function() {send("orgsettingsupdate","doNothing",{orgvar:$(this).attr("id"),orgval:$(this).val()},"backend")});
	$("#finish").click(finish)
}
function editVersion() {
	$(".versioninput").change(function() {send("versionupdate","doNothing",{version:$(this).val()},"backend")});
	$("#finish").click(finish)
}
function orgpagesready() {
	$("#newpage").click(newpage)
	$(".pagetitleedit").click(pagetitleedit)
	$(".orgpageedit").click(function() {get_template("editpage",{pagetype:"org",pagetitle:$(this).parent().siblings().first().text(),id:0,contentdiv:"orgcontentdiv"},"editpageready")})
}
function newpage() {
	var pagetitle=window.prompt("Page title")
	if(typeof(pagetitle)!="undefined" && pagetitle!="") get_template("editpage",{pagetype:"org",pagetitle:pagetitle,newpage:true,id:0,contentdiv:"orgcontentdiv"},"editpageready")
}
function pagetitleedit() {
	var oldtitle=$(this).text()
	var pagetitle=window.prompt("New Page title",oldtitle.trim())
	
	if(pagetitle!=null && pagetitle!="") send("changepagetitle","editPages",{pagetitle:pagetitle.trim(),oldtitle:oldtitle},"backend")
}
function editPages(json) {
	get_template("orgpages",{contentdiv:"orgcontentdiv"},"orgpagesready")
}
jQuery.cachedScript = function( url, options ) {
 
  // Allow user to set any option except for dataType, cache, and url
  options = $.extend( options || {}, {
    dataType: "script",
    cache: true,
    url: url
  });
 
  // Use $.ajax() since it is more flexible than $.getScript
  // Return the jqXHR object so we can chain callbacks
  return jQuery.ajax( options );
};
 
// Usage
// $.cachedScript( "ajax/test.js" ).done(function( script, textStatus ) {
//   console.log( textStatus );
// });
function editpageready(json) {
	if($("#quillscss").length==0)
		 $('head').append('<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" id="quillcss" rel="stylesheet" type="text/css">')
		 
	$.cachedScript("//cdn.quilljs.com/1.3.6/quill.min.js").done(function() {
		$.cachedScript("./js/vendor/image-resize.min.js").done(function() {
			$.cachedScript("./js/vendor/image-drop.min.js").done(function() {
				var toolbarOptions = [
				[{
				'header': [1, 2, 3, 4, 5, 6, false]
				}],
				['bold', 'italic', 'underline', 'strike'], // toggled buttons
				['blockquote', 'code-block'],

				[{
				'list': 'ordered'
				}, {
				'list': 'bullet'
				}],
				[{
				'indent': '-1'
				}, {
				'indent': '+1'
				}], // outdent/indent
				[{
				'size': ['small', false, 'large', 'huge']
				}], // custom dropdown
				[{
				'color': []
				}, {
				'background': []
				}], // dropdown with defaults from theme
				[{
				'font': []
				}],
				[{
				'align': []
				}],
				['link', 'image', 'video'],

				['clean'] // remove formatting button
			];

				var quill = new Quill('#editor', {
					modules: {
						toolbar: toolbarOptions,
						imageResize: {
							modules: [ 'Resize', 'DisplaySize', 'Toolbar' ]
						},
						imageDrop: true
			// 			autoformat: true
					},
					theme: 'snow',
				});
				var change = false
				quill.on('text-change', function(delta) {
					change = true
				});
				
				if(json.headers) {
					headers=json.headers // headers include: headers[1][headernum]: classes, headers[2][headernum]: headercontent, 
					$("#headernum").change(function() {setheader(quill,$(this).children(":selected").val()) })
					$("#deleteheader").click(function() {deleteheader(quill)})
					$("#addheader").click(function() {addheader(quill)})
					$("#defaultvisibility ,#showfrom, #hidefrom").change(function() {updateheaders(json,quill)})
					setheader(quill,0)
				}

				// Save periodically
				setInterval(function() {
					if (change) {
			// 			console.log('Saving changes', change);
						pageeditsave(json,quill)
						change = false
					}
				}, 5*1000);

				// Check for unsaved data
				window.onbeforeunload = function() {
					if (change) {
						return _('There are unsaved changes. Are you sure you want to leave?');
					}
				}	
				$("#pageeditsave").click(function() {pageeditsave(json,quill,true)})
				// 	$('#editor').wysiwyg();
			})
		})
	})
}
function pageeditsave(json,quill,finish) {
	var pagecontent=quill.root.innerHTML
	if(json.pagetype=="header") {
		var activeheader=$("#headernum").children(":selected").val()
		headers[2][activeheader]=pagecontent
		pagecontent=""
		for(i in headers[1]) {
			pagecontent+='<div class="'+headers[1][i]+'">'+headers[2][i]+'</div>'
		}
	}
	send("savepagecont",(finish?"finish":"pagesaved"),{id:json.id,pagetype:json.pagetype,pagecontent:pagecontent},"backend");
}

function addheader(quill) {
	var newnum=headers.length-1
	headers[1][newnum]=""
	headers[2][newnum]=""
	
	$("#headernum").append("<option>"+newnum+"</option");
	setheader(quill,newnum)
}
function deleteheader(quill) {
	var activeheader=$("#headernum option:selected").val()
	delete(headers[1][activeheader])
	delete(headers[2][activeheader])
	$("#headernum option:selected").remove()
	setheader(quill,$("#headernum option:first").val())
}
function setheader(quill,activeheader) {
	var c=headers[1][activeheader].split(" ")
	$("#headernum").val(activeheader)
	$("#defaultvisibility").val(c[0])
	$("#showfrom").val(/-block/.test(c[1])?c[1]:(/-block/.test(c[2]))?c[2]:"")
	$("#hidefrom").val(/-none/.test(c[1])?c[1]:(/-none/.test(c[2]))?c[2]:"")
	quill.root.innerHTML=headers[2][activeheader]
}
function pagesaved() { //Do nothing
}
function finish(json) {
	var pagetype=(json.pagetype?json.pagetype:$(this).data("pagetype")) 
	switch(pagetype) {
		case "org":
		case "frontpage":
		case "header":
			showMyOrg()
		break
 		case "user":
 			showMyUser()
 		break
	}
}
function uploadwords() {
	var file_data = $('#wordfile').prop('files')[0];   
	var form_data = new FormData();
	form_data.append('wordfile', file_data);
	$("#nownewwords").collapse("hide")
	$(".uploaddone").collapse("hide")
	$('#thanks').collapse('hide');
	
 	$('.uploadinfo').collapse('show').on('shown.bs.collapse', function() {
		$.ajax({
					url: 'backend/uploadwords.php',
					cache: false,
					contentType: false,
					processData: false,
					data: form_data,                         
					type: 'post',
					dataType : "json",
					success: function(json){
						if(json.log) {
							console.log(json.log)
						}
						if(json.warning) {
							showWarning(json.warning)
							$('.uploadinfo').collapse('hide');
						}
						else {
							$('.uploadinfo').collapse('hide');
							if(json.newwords.length>0) {
								$('#newwords').val(json.newwords.sort().filter(function (value, index, self) { return self.indexOf(value) === index;}).join("\n"));
								$('.uploaddone').collapse('show')
								$('.uploadfile').collapse('hide')
							} else {
								$('#nownewwords').collapse('show')
							}
						}
					},
					error: function( xhr, status, errorThrown ) {
						$('.uploadinfo').collapse('hide');
						showError(_("There was a problem. Are you connected to the Internet?") );
						console.log( "Error: " + errorThrown );
						console.log( "Status: " + status );
						console.dir( xhr );
					}
		});
	})
}
function wordstodatabase() {
	send("newwords","thankforwords",{newwords:$('#newwords').val()},"backend")
}
function thankforwords() {
	$('.uploaddone').collapse('hide')
	$('.uploadfile').collapse('show')
	$('#thanks').collapse('show');
}
function modal_draggable(e){
    window.modal_dragging = {};
    modal_dragging.pageX0 = e.pageX;
    modal_dragging.pageY0 = e.pageY;
    modal_dragging.elem = $(this).closest(".modal");
    modal_dragging.offset0 = $(this).closest(".modal").offset();
    function handle_dragging(e){
        var left = modal_dragging.offset0.left + (e.pageX - modal_dragging.pageX0);
        var top = modal_dragging.offset0.top + (e.pageY - modal_dragging.pageY0);
        $(modal_dragging.elem)
        .offset({top: top, left: left});
    }
    function handle_mouseup(e){
        $('body')
        .off('mousemove', handle_dragging)
        .off('mouseup', handle_mouseup);
    }
    $('body')
    .on('mouseup', handle_mouseup)
    .on('mousemove', handle_dragging);
}
