<?php
	error_reporting(1);
	
		if(!isset($_SESSION))session_start();
	 
	/***************************************/
		  $_SESSION['adminUser'] = "seun";
	/***************************************/
	 	

?>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap core CSS -->

    <link href="../../media/css/bootstrap.min.css" rel="stylesheet">
    <link href="../../media/fonts/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../media/css/animate.min.css" rel="stylesheet">
	<link href="../../media/css/BubbleMsg.css" rel="stylesheet" />
	 
    <!-- Custom styling plus plugins -->
    <link href="../../media/css/custom.css" rel="stylesheet">
    <link href="../../media/css/icheck/flat/green.css" rel="stylesheet">
	<link href="../../media/images/laflogo.png" rel="shortcut icon" /> 
      
	<link href="../../media/css/bootstrap-switch.css" rel="stylesheet">
	<link href="../../media/css/editor/index.css" rel="stylesheet">
	<link href="../../media/css/select/select2.min.css" rel="stylesheet">
	
	  <link href="../../media/css/highlight.css" rel="stylesheet">
	  <link href="../../media/css/main.css" rel="stylesheet"> 
	<script src="../../media/js/jquery.min.js"></script>
	

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<script src="../../js/html5shiv.js"></script>
	<script src="../../js/respond.1.4.2.min.js"></script>

</head>

<body class="nav-md">

    <div class="container body">

        <div class="main_container">
			
		<div class="pannel" id="templatemo_header_wrapper">	 
			<div class="panel-heading" id="templatemo_header">
				
				<div class="col-md-12" id="site_logo"> </div>
				 		
			</div>
			
   
    	</div> <!--/. panel- -->
        
        <div class="row">        	
			<form method="post">
            <div class="col-sm-8 col-md-4 col-xs-12 col-xs-offset-4 "> 
				<h1>&nbsp; </h1>
            	 <div class="panel panel-default">
                	
                    <div class="panel-body" style="background:#ccc;" >
                    <div class="col-sm-2"> <img class="img img-circle img-responsive" src="../../media/images/laflogo.png" style="max-height:30px;" /> </div>
					<div class="col-sm-10"> <label style="font-size:16px;"> Administrator's Login </label> </div>
					
                    </div> <!--/. panel-heading-->
                    
                    <div class="panel-body">
                        
						<!-- right col -->
						<div class="col-sm-12  col-md-12 col-xs-12">
							<div class="form-group">
								<label class="right"> <i class="fa fa-user fa-fw"></i> Username </label>
								<input type="text" name="user" id="user" class="form-control" autofocus=true />
								<span class="help-block" id="userMsg" /> 
							</div>
							
							<div class="form-group">
							<label class="right"> <i class="fa fa-lock fa-fw"></i> Password  </label>
								<input type="password" name="pass" id="pass" class="form-control" />
								<span class="help-block" id="passMsg" />
							</div>
							
							 <div class="form-group input-group" id="gifframe" style="display:none;">
                               <img src="../../media/slides/10.gif" alt="" class="processgif" />
                            </div>
							
							<div class="form-group">
								<button class="btn btn-primary" onclick="return validateLogin()"> &nbsp; Sign in &nbsp; </button>
								<!-- <button type="submit" class="btn btn-primary"> Sign in </button> -->
							</div>
						
						</div>
                    
                    </div> <!--/. panel-body-->
                    
                  </div> <!--/. panel-default-->
				
		
            </div> <!--/. col-sm-8 col-md-8-->   
			</form>
        </div> <!--/. row-->
     
		</div> <!-- /. main_container -->
		
		<div class="row"> 
			<p>&nbsp; </p> <p>&nbsp; </p><p>&nbsp; </p> <p>&nbsp; </p> 
		</div>
	 
	
	</div> <!-- /. container body -->
	
	 
	   <!-- footer content -->
                <footer style="background:none;">
                   <div class=""><center>
                        <p class="pull-center">Copy right &copy; Hamdala Komputer Konsults. 2016 |
                            <span class="lead"> <i class="fa fa-paw"></i> HKK!</span>
                        </p></center>
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
				
				  
<script>
	  
	
function validateLogin(){
			
			var user = $('#user');  
   			var pass = $('#pass');
			var userMsg = $('#userMsg'); 
   			var passMsg = $('#passMsg');
			/*********************************/
			var username = $('#user').val();  
   			var password = $('#pass').val();
			/*************************************/
			//
			if(!FieldOk(user,userMsg,6000," Enter Your Username ")){
				return false;
			}
			//			 						
			else if(!FieldOk(pass,passMsg,6000," Enter Your Password ")){
				return false;	
			}
			 
			 else {
						var req = $.ajax({				
						url:"../../media/php/validator.php",
						method: "POST",
						data:
							{
								CheckAdmin:"user_id", username:username				
							},
						beforeSend:  function(){  showgif(); }				
						});
				
						req.fail(function(e){
							alert(e.status+" Failed"); 
							hidegif();
							});
			
						req.done(function(d){
							
							if(d==false){
								  showPop(user,userMsg,6000,"User Not Found");
								  hidegif();
								status = false;
							}
								else if(d==true){  
									hidegif();
									// make 2nd request 
									var req2 = $.ajax({				
										url:"../../media/php/validator.php",
										method: "POST",
										data:
											{
												CheckAdminPass:"user_psw",password:password,username:username
											},
										beforeSend:  function(){  showgif(); }				
										});
										
										req2.fail(function(e){
										alert(e.status+" Failed"); 
										hidegif();
										});
										
										req2.done(function(msg){
											if(msg==false){
													showPop(pass,passMsg,6000,"Wrong Password");
													hidegif();
													status = false;
											}
											if(msg==true){
												hidegif();
												top.location.href = "../";
											}
										}); 
								    }	 
								});
							 return false;
						 }
						//						 
			return false;
		 }		 
		 	
	/// submit your account 
	

</script> 
	
	 
		<script src="../../media/js/bootstrap.min.js"></script>
    <!-- chart js -->
    <script src="../../media/js/chartjs/chart.min.js"></script>
	<script src="../../media/js/BubbleMsg.js"> </script>
    <!-- bootstrap progress js -->
    <script src="../../media/js/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="../../media/js/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- icheck -->
    <script src="../../media/js/icheck/icheck.min.js"></script>

    <script src="../../media/js/custom.js"></script>
	
	<script src="../../media/js/bootstrap-switch.js"></script>
    <!-- moris js -->
    <script src="../../media/js/moris/raphael-min.js"></script>
    <script src="../../js/moris/morris.js"></script>
    <script src="../../media/js/moris/example.js"></script>

	
	 <script src="../../media/js/highlight.js"></script>
    <script src="../../media/js/main.js"></script> 
   
     
</body>

</html>
