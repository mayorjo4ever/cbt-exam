
function getOffsetRect(elem) {
    var box = elem.getBoundingClientRect()

    var body = document.body
    var docElem = document.documentElement

    var scrollTop = window.pageYOffset || docElem.scrollTop || body.scrollTop
    var scrollLeft = window.pageXOffset || docElem.scrollLeft || body.scrollLeft

    var clientTop = docElem.clientTop || body.clientTop || 0
    var clientLeft = docElem.clientLeft || body.clientLeft || 0

    var top = box.top + scrollTop - clientTop
    var left = box.left + scrollLeft - clientLeft

    return { top: Math.round(top), left: Math.round(left) }
}

function AutoHide(SpanID, Duration) {
    var Pattern = /^\d+$/;
    var isNumber = Pattern.test(Duration);

    if (isNumber) {
        setTimeout(function () {
            SpanID.removeClass('ShowBubble');
		    SpanID.addClass('HideBubble');
 			
        }, Duration);
    }
}

	function getPosLTW(elem){
		var top = Math.round(elem.position().top);
		var width = Math.round(elem.width());	
		var left = Math.round(elem.position().left);		           			   	
			
		return {left:left,top:top,width:width}
	}
 
function isMail(email, emailSpan, Duration, Message) {
    	
	var top = Math.round(email.position().top);
	var width = Math.round(email.width());	
	var left = Math.round(email.position().left);		           			   				
	var regEmail = /^[_a-zA-Z0-9-]+(\.[_a-zA-Z0-9-]+)*@[a-zA-Z]+(\.[a-zA-Z]+)*(\.[a-zA-Z]{1,3})$/;
	emailVal = email.val(); 
    AutoHide(emailSpan, Duration);
 
    if (!regEmail.test(emailVal)) {
		emailSpan.removeClass('HideBubble'); 
		emailSpan.addClass('ShowBubble');
 		emailSpan.html(Message);
		emailSpan.css({'left':width+left-90+'px','top':top+'px','white-space':'nowrap'});
 		return false;					
 
     }
    return true;
}

function CustomValidation(ControlID, SpanID, Pattern, ErrorMsg) {
    var j = getOffsetRect(ControlID);
    var Width = ControlID.clientWidth + 10 + j.left;
    var reg = Pattern;

    AutoHide(SpanID, Duration);

    if (!reg.test(ControlID)) {
        SpanID.className = "ShowBubble";
        SpanID.style.top = j.top + "px";
        SpanID.style.left = Width + "px";
        SpanID.innerHTML = ErrorMsg;
        return false;
    }
    return true;
}


        function HideError(SpanID) {
            var ErrorMsgID = document.getElementById(SpanID);
            ErrorMsgID.className = "HideBubble";
            return false;

        }

 
        function HideError(SpanID) {
            var ErrorMsgID = document.getElementById(SpanID);
            ErrorMsgID.className = "HideBubble";
            return false;
        }
 
 

		function FieldOk(TextId,SpanChild,Duration,Message){			
			
			var pos = getPosLTW(TextId); 			
			 
			TextId.focus(function(e) {
              SpanChild.removeClass('ShowBubble');
		       SpanChild.addClass('HideBubble');		    
            });
			
			if(TextId.val()==""){
			AutoHide(SpanChild,Duration);			
			SpanChild.removeClass('HideBubble'); 
		    SpanChild.addClass('ShowBubble');
 			SpanChild.html(Message);
			SpanChild.css({'left':pos.width+pos.left-90+'px','top':pos.top+'px','white-space':'nowrap'});
 			return false;					
			}		
			return true;	
		}
	 		 		
		 //	 		  
	
	function userExist(TextId,PswId,TextSpn,PswSpn,Duration,Message,Message2){			
											
			 rmatric = TextId.val();	// real matric
			 rpsw = 	  PswId.val();	// real psw  		  			 
			 //// 
			var request = 	$.ajax({
			url:			"media/php/dbTool.php",
			method:			"POST",
			data:			{ checkUser: rmatric },
			beforeSend: 	function(){  showgif(); }			
			});
			
			request.fail(function(){
				alert('Connetion to Database Lost - on 1st Request');	
				 status = false; 
							 
			});
			
			request.done(function(msg){ 
				 
				 if(msg==false){
				 	showPop(TextId,TextSpn,Duration,Message);
					hidegif();
					 status = false;
				 }
				 
				 if(msg==true){
					
					hidegif();
					
					var request2 = 	$.ajax({
					url:			"php/dbActor.php",
					method:			"POST",
					data:			{ matric: rmatric, checkPsw: rpsw  },
					beforeSend: 	function(){  showgif(); }			
					});
					
					request2.fail(function(){
					alert('Connetion to Database Lost - on 2nd Request');	
					status = false; 
							 
					});
					request2.done(function(msg){
						if(msg==false){
				 		showPop(PswId,PswSpn,Duration,Message2);
						hidegif();					  
						}
						
						if(msg==true){
						hidegif();
						// alert("logged in ");
						// window.location.href = "exroom/index2.php";
						 top.location.href = "exroom/";							 
						}  					 				 
					});	
//					return status;									  
				 }
				 // end of first request 
				
			});
						 	 			
		}				
	 
		function showPop(TextId,SpanChild,Duration,Message){
			
			var pos = getPosLTW(TextId); 
			AutoHide(SpanChild,Duration);			
			SpanChild.removeClass('HideBubble'); 
		    SpanChild.addClass('ShowBubble'); 	
			SpanChild.html(Message);		
			SpanChild.css({'left':pos.width+pos.left-90+'px','top':pos.top+'px','white-space':'nowrap'});	
						
		}
					 		
	function adminExist(TextId,PswId,TextSpn,PswSpn,Duration,Message,Message2){			
											
			 aid = TextId.val();	// admin id
			 apsw = 	  PswId.val();	// admin psw  		  			 
			 //// 
			var request = 	$.ajax({
			url:			"../../php/dbActor.php",
			method:			"POST",
			data:			{ checkAdmin: aid },
			beforeSend: 	function(){  showgif(); }			
			});
			
			request.fail(function(){
				alert('Connetion to Database Lost - on 1st Request');	
				 status = false; 
							 
			});
			
			request.done(function(msg){ 
				 
				 if(msg==false){
				 	showPop(TextId,TextSpn,Duration,Message);
					hidegif();
					 status = false;
				 }
				 
				 if(msg==true){
					
					hidegif();
					
					var request2 = 	$.ajax({
					url:			"../../php/dbActor.php",
					method:			"POST",
					data:			{ id: aid, checkAdmPsw: apsw  },
					beforeSend: 	function(){  showgif(); }			
					});
					
					request2.fail(function(){
					alert('Connetion to Database Lost - on 2nd Request');	
					status = false; 
							 
					});
					request2.done(function(msg){
						if(msg==false){
				 		showPop(PswId,PswSpn,Duration,Message2);
						hidegif();					  
						}
						
						if(msg==true){
						hidegif();
						// alert("logged in ");						
						 top.location.href = "index.php";							 
						}  					 				 
					});	
//					return status;									  
				 }
				 // end of first request 
				
			});
						 	 			
		}				
	 
		
/*		$.ajax({
			url:"scripts/php/dbActor.php",
			beforeSend:function(){ alert('sending');}
			,fail:function(code){ alert('failed '+code)}
			,success:function(){alert('successful')}
			,complete:function(){ alert('completed')}
			
			});
*/		
		/* var jqxhr = $.ajax( "scripts/php/dbActor.php" )
		  .done(function() {
			alert( "success" );
		  })
		  .fail(function() {
			alert( "error" );
		  })
		  .always(function() {
			alert( "complete" );
  			});
 */
 	
		
	function hidegif(){
		$('.processgif').css('visibility','hidden'); 	 
		$('#gifframe').hide('fast');
	}
	//
	function hideNgif(){
		$('.sprocessgif').css('visibility','hidden'); 	 
		// $('#gifframe').hide('fast');
	}
	
	// 	
	function showgif(){
		$('.processgif').css('visibility','visible'); 			 
		$('#gifframe').css('display','block')
	}
	
	function showNgif(){
		$('.sprocessgif').css('visibility','visible'); 	
		// $('#gifframe').show('fast');
	}
	
	
	function reshape(){
			fh = $('#footer').height();
		bdh = $('#bodyTag').height();
		fomh = $('#logmenu').height();				  
		//
		$('#bodyTag').css({'height':fomh+105+'px'});
		$('#footer').css({'top':fomh+315+'px'});
		//
		bw = $('body').width();
			hw = $('#logmenu').width();
			bdv = hw/bw*100; 		
			bleft = (100-bdv)/2; 
			 
			$('#logmenu').css({'left':bleft+'%'});				
	}
	
	function showAlert(){
	
		msg = $('#loadstatus'); 
		val = msg.val();
 
		
		
		if(val.length>0) {
				
		$('#window,#bodyTag').css({'opacity':'0.1'});	
		$('.logStatus').css({'visibility':'visible'});	
			setTimeout(hideAlert,6000);		
		}
		else {
		 hideAlert();
		}
	}
	
	function hideAlert(){			
			$('#window,#bodyTag').css({'opacity':'1'});	
			$('.logStatus').css('visibility','hidden');
	}
		
    function isNewUser(TextId,TextSpn,Duration,Message){			
											
			 user = TextId.val();	// real matric
			 
			 $.post("php/dbActor.php",{checkNewUser: user},function(res){
				 if(res==true){
					 return true;
					 }
					 if(res==false){
						 false;
						 }
				 });
			
			 //// 
			/*var request = 	$.ajax({
			url:			"php/dbActor.php",
			method:			"POST",
			data:			{ checkNewUser: user },
			beforeSend: 	function(){  showNgif(); }			
			});
			
			request.fail(function(){
				alert('Connetion to Database Lost For New User');	
				///  status = false; 
							 
			});
			
			request.done(function(reply){ 
				 
				 if(reply == true){					
					hideNgif();	
					return true; 				 										  
				 }
				 
				 if(reply == false){
				 	showPop(TextId,TextSpn,Duration,Message);
					hideNgif();
					return false;
				 }			 
				 
				 // end of first request 				
			});
 				
				*/ 	 			
		}				
	 
	  
	function validateReg(){
			
			var sname = $('#nsname'),		spsname = $('#spsname');   
   			var fname = $('#nfname'),		spfname = $('#spfname');
			var email = $('#nemail'),		spmail = $('#spmail');
			 		
			var uname = $('#nuname'),		spuname = $('#spuname');
 
		    var psw = $('#npsw'),			sppsw = $('#sppsw');
			var psw2 = $('#npsw2'),			sppsw2 = $('#sppsw2');
			 
			if(!FieldOk(sname,spsname,6000," Enter Your Surname ")){
				return false;
			}
			//			 						
			else if(!FieldOk(fname,spfname,6000," Enter Your Firstname ")){
				return false;
			}
			//
			else if(!FieldOk(email,spmail,6000," Enter Your Email Address ")){
				return false;
			}
			else if(!isMail(email,spmail,6000,"Your eMail is Invalid")){
				return false; 
			}
			else if(!FieldOk(uname,spuname,6000," Enter Your Username or ID ")){
				return false;
			}
			 
			else if(!FieldOk(psw,sppsw,6000," Enter Your Password ")){
				return false;	
			}
			else if(!FieldOk(psw2,sppsw2,6000," Enter Your Password Again ")){
				return false;	
			}			
						
			else if(psw.val()!=psw2.val()){
				showPop(psw2,sppsw2,6000,"Password did not match");
				return false; 
			}			
			
			else if(!isNewUser(uname,spuname,6000, " This User Already exist" )){
				return false;	
			}			
			 
				alert("successful");
			  return true;
			 
		 }		 
		
			
		// user forgot password
			function forgpsw(){
				 window.alert("contact the administrator for your password");
			}
		
	$(function(){ 
	 	hidegif(); hideNgif();	showAlert();
		  
		$('#alertbtn').click(function(e) {
            hideAlert();
        });	
		 $('#loader').fadeOut('slow');  
    });
 		
			 
		