console.time("main")
var logs=[]
var isTest=false;
var settings
var dateformat='DD/MM/YYYY'
var slasheddateformat=dateformat.replace(/[^YMD]+/g,"/").split("/")
var isAdmin=false
console.log(language)
//if(typeof(language)=="undefined") var language="da_DK"
$.getJSON( "./locale/"+language+"/LC_MESSAGES/jsmessages.json", function( jsonlang ) {
_.setTranslation(jsonlang)
// console.log(jsonlang)
	window.cookieconsent.initialise({
		"palette": {
			"popup": {
			"background": "#eb6c44",
			"text": "#ffffff"
			},
			"button": {
			"background": "#f5d948"
			}
		},
		"type": "info",
// 		"location": false,
// 		"animateRevokable": false,
// 		"revokeBtn": '<div class="{{classes}} cc-revoke '+(showconsent?'':'cc-invisible')+'">'+_("Change Cookie Choice")+'</div>',
		"cookie.name":'cookieconsent_status',
		"cookie.path":'/',
		"cookie.domain":window.location.hostname,
		"cookie.expiryDays": 365,
		"cookie.secure":true,
// 		"dismissOnScroll":false,
		"dismissOnTimeout":30000,
		"dismissOnWindowClick":true,
// 		"autoOpen":true,
		"content": {
			"message": _("Stavekontrolden uses cookies to ensure you get the best experience on our website. We don't track you!"),
			"dismiss": _("Got it"),
			"deny": _("Decline"),
			"link": _("Learn more"),
			"href": "./?cookies=1"
		}
	});
})
var isAdmin=false
$(function(){
	
	$(".openloginform").click(openloginform);
	$(".loginform").submit(login);
	$("#applyforsignup").click(applyforuser);
	$("#signup").click(login);
	$("#updatepassword").click(updatepassword);
	$("#forgotpassword").click(forgotpassword);
	//How many should be shown at this viewport size?
	if(typeof(warning)!="undefined") showWarning(warning);
	$(".newLang").click(function() {var search=window.location.search; window.location.replace((search?search+"&":"?")+"setlang="+$(this).attr("src").replace(".png","").split("/")[2])});

// $('#carouselCreateCaptions').on('slide.bs.carousel',function(e) {console.log(e)})
});

function applyforuser() {
	$("#inputEmail").attr("type","email")
	$("#inputEmail").attr("placeholder",($("#signuplabel").text()))
	$(".signup").collapse("show")
	$(".login").collapse("hide")
}
function send(page,f,d,place) {
	if(typeof(place)=="undefined") var place="frontend";
	if(typeof(d)=="undefined") var d={};
// 	alert(page+f+place)
	d.ajax=1;
	console.log("./"+place+"/"+page+".php");
	var log=page
	if(!logs[log]) logs[log]=1
	else logs[log]++
	log=log+logs[log]
	console.time(log)
	$.ajax({
		url: "./"+place+"/"+page+".php",
		data: d,
		type: "POST",
		dataType : "json",
		cache: false,
		success: function( json ) {
			if(json.log) console.log(json.log);
			if(json.loggedout) relogin(); 
			else {
				if(json.warning) {if(json.warning!=""){ showWarning(json.warning,20000);}}
				if(f) window[f](json); 
			}
			console.timeEnd(log)
		},
		error: function( xhr, status, errorThrown ) {
			showError(_("There was a problem. Are you connected to the Internet?") );
			console.log( "Error: " + errorThrown );
			console.log( "Status: " + status );
			console.dir( xhr );
			console.timeEnd(log)
		}
	});
}
function relogin() {
	var data={template:"login",relogin:true}
	$.ajax({url:"functions/templatefunctions.php",data:data,type:"POST",dataType:"json",cache:false,
		success:function(json) {
			$("#loginbody").html(json.template)
			$("#loginmodal").modal("show")
			$(".loginform").submit(login);
		},
		error: function( xhr, status, errorThrown ) {
			showError(_("There was a problem. Are you connected to the Internet?") );
			
			console.log( "Error: " + errorThrown );
			console.log( "Status: " + status );
			console.dir( xhr );
		}
	});
}

function get_template(template,data,f) {
	if(typeof(data)=="undefined") data={}
	data.template=template
//  	console.log(data)
	$.ajax({url:"functions/templatefunctions.php",data:data,type:"POST",dataType:"json",cache:false,
		success:function(json) {
// 			console.log(json)
			if(json.loggedout) relogin(); 
			else {
				if(data.contentdiv) json.contentdiv=data.contentdiv
				insertTemplate(json)
				console.log(f)
				if(typeof(f)!="undefined")
					window[f](json)
			}
		},
		error: function( xhr, status, errorThrown ) {
			showError(_("There was a problem. Are you connected to the Internet?") );
			
// 			showError( "Maybe there was a problem with the template" );
			console.log( "Error: " + errorThrown );
			console.log( "Status: " + status );
			console.dir( xhr );
		}

	});
}
function insertTemplate(json) {
  	console.log("inserting template");
//   	console.log(json);
	var contentdiv=(json.contentdiv?json.contentdiv:'contentdiv')
	if($("#"+contentdiv).length==0) contentdiv='contentdiv'
	$("#"+contentdiv).html(json.template);
}
function openloginform() {
	var logintype=$(this).attr("id") //.replace("-button","")
	$(".loginsignup-button").hide()
	$("."+logintype).show()
}
function login(e) {
	e.preventDefault()
	send("login","checklogin",{logintype:($(document.activeElement).attr("id")=="signup"?"signup":"login"),inputEmail:$("#inputEmail").val(),inputPassword:$("#inputPassword").val(),rememberMe:$("#rememberMe").prop('checked'),relogin:$("#relogin").val()});
}
function forgotpassword() {
	var email=$("#inputEmail").val()
	if(!email) showWarning(_("Please write your e-mail address and click again."))
	else {
		send("forgotpassword","passwordsent",{email:email});
	}
}
function passwordsent(json) {
	if(!json.warning) {
		showMessage(_('An e-mail with instructions has been sent to you. If it\'s not there in a few minutes, look in your spam folder.'))
	}
}
function updatepassword() {
	send("login","checklogin",{logintype:"login",inputPassword:$("#inputPassword").val(),inputEmail:$("#inputEmail").val(),newpass:$("#newpass").val()});
}
function checklogin(json) {
 	console.log(json)
	if(!json.warning) {
		if(json.relogin)
			$("#loginmodal").modal("hide")
		else
			window.location.href="?backend=1"
	}
}
function showWarning(txt,time) {
// 	console.log(txt)
	if(txt.length>9) {
		if(typeof(time)=="undefined") var time=3000
		$("#basesystemWarningTxt").html(txt)
		$("#basesystemWarning").show().delay(time).fadeOut()
		$("#closew").unbind("click").click(function() {$("#basesystemWarning").hide()})
	}
}

function showMessage(txt,time) {
	if(typeof(time)=="undefined") var time=3000
	$("#basesystemMessageTxt").html(txt)
	$("#basesystemMessage").show().delay(time).fadeOut()
	$("#closem").unbind("click").click(function() {$("#basesystemMessage").hide()})

}

function showError(txt,time) {
	if(typeof(time)=="undefined") var time=3000
	$("#basesystemErrorTxt").html(txt)
	$("#basesystemError").show().delay(time).fadeOut()
	$("closee").unbind("click").click(function() {$("#basesystemError").hide()})

}
function showWait(state) {
	$("#StavekontroldenWait").toggleClass("d-none",!state)
}

function doNothing() {}
function doNothing() {}
