<?php 
		
	error_reporting(1);
	if(!isset($_SESSION))session_start();
	 // require "media/php/dbTool.php";
	require "media/php/User.php";
	
	require "media/php/instituteinfos.php";	
	$bi = new  Institute_info();	
?>
<!DOCTYPE html>
<html lang="en">

<head>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
    
    <title><?php   echo $bi->institutename; ?> </title>    
	
	<link href="media/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="media/css/custom.css" rel="stylesheet"/>
    <link href="media/fonts/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="media/css/animate.min.css" rel="stylesheet" />
    <link href="media/css/icheck/flat/green.css" rel="stylesheet" /> 
	<link href="media/images/KWCON-LOGO.JPG" rel="shortcut icon" /> 
	<link href="media/css/pnotify.custom.min.css" rel="stylesheet"/>
	<script src="media/js/jquery.min.js"></script>
	<script src="media/js/pnotify.custom.min.js"></script>

</head>

<body class="nav-md" style="background:#FFF; background:url(media/images/logo.PNG) repeat;">
 
 <!-- Page Content -->
    <div class=" container"> 
	
	<div class="main_container">
	
		   <br/>  
		 <!-- Content Row -->
        <div class="row">
             <div class="col-md-10 col-sm-10 col-sm-offset-1">
                    <div class="panel panel-primary text-center bg-primary">
                        <div class="panel-body black bg-primary"> 
							<div class="col-md-sm-2 col-md-2"> 
								<img src="<?php   echo "media/images/".$bi->logo; ?> " style="max-height:80px; max-width:120px;" 	class="img img-responsive  img-thumbnail  img-circle" />
							</div>
							
							<div  class="col-md-8 col-sm-8">
								  <br/>
								<h3 class="bold">    <?php   echo $bi->institutename; ?> </h3>  
								
							</div>
							
							<div  class="col-md-sm-2 col-md-2 pull-right"> 
									 <img src="media/images/KWCON-LOGO2.jpg " style="max-height:80px; max-width:120px;" class="img img-responsive img-thumbnail" /> 
							</div>
						
						  </div>
                        <!-- /.panel-heading -->
                             
                        </div> 
              </div>
                 
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row --> 
	
	 
	 <div class="row"> 
	 <div class="col-lg-10 col-md-10 col-sm-10 col-xs-12 col-sm-offset-1">	 
		
		<div class="col-md-2 col-sm-2 col-xs-4 bg-info ">
			 
				 <!-- required for floating -->
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs tabs-left">
                                            <li class="active"><a href="#home" data-toggle="tab"><i class="glyphicon glyphicon-home"></i>&nbsp;  Home</a>
                                            </li>
                                            <li><a href="#home" data-toggle="tab"><i class="fa fa-warning"></i>&nbsp; Instructions</a>
                                            </li>
                                            <li><a href="#home" data-toggle="tab"><i class="fa fa-support"></i>&nbsp; Supports</a>
                                            </li>
                                            <li><a href="#home" data-toggle="tab"><i class="glyphicon glyphicon-phone-alt"></i>&nbsp; Contact</a>
                                            </li>
											<li>
												<button class="btn btn-info btn-lg  " data-toggle="modal" data-target="#loginMenu"> &nbsp; Login  Here &nbsp; <span class="fa fa-sign-in ">  </span> </button> 
											</li>
                                        </ul>
			  
		</div>
		
		<div class="col-md-10 col-sm-10 col-xs-8">
 	
		<!-- Tab panes -->
                      <div class="tab-content">
							<div class="tab-pane active" id="home">
                                  <!-- <p class="lead">WELCOME TO KWCOETL LAFIAGI  </p> --> 
                                  	 <!-- Carousel
										================================================== -->    
							 <div id="myCarousel" class="carousel slide" data-ride="carousel">
								
								<?php $dbm = new DbTool(); 
									$slides = $dbm->getFields($dbm->select("slides",array('')),array("name","address")); 
			
								?>
								
							  <!-- Indicators -->
							  <ol class="carousel-indicators">
							  <?php $n = 0; 
								if(!is_null($slides)){
									foreach($slides['name'] as $simg) { ?> 
								<li data-target="#myCarousel" data-slide-to="<?php echo $n; ?>" class="<?php echo ($n==0)?'active':''; ?>"></li>        								
							   <?php $n++; 
									}

								}		?>
							  </ol>  

							 
      <div class="carousel-inner" role="listbox">
			
		<?php //display the slides 
				$n = 0; 
				if(!is_null($slides)){
					foreach($slides['name'] as $simg) { ?>
						
							<!--  <.item 1> -->
		<div class="item <?php echo ($n==0)?"active":""; ?>">
          <img class="first-slide img-responsive img-rounded" src="<?php echo $slides['address'][$n]."".$simg;?>" style=" max-height:350px; min-width:937px;" />
          <div class="container">
            <div class="carousel-caption">
             <!-- <h1> Mayorjo </h1>     -->
			 	 <center>
					<button  type="button" class="playButton btn btn-default btn-xs">
						&nbsp;&nbsp; <span class="glyphicon glyphicon-play"></span> &nbsp;&nbsp;
					</button>
					
					<button  type="button" class=" pauseButton btn btn-default btn-xs">
						&nbsp;&nbsp; <span class="glyphicon glyphicon-pause"></span> &nbsp;&nbsp;
					</button>	
				</center>	
			 <p> <h3>2016 Enterance Examination... </h3> </p> <p>&nbsp; </p>
			 
            </div>
				
          </div>
        </div>
        <!--  </.item 1> -->
							
					<?php $n++; }
				}
		?>	
         
		 	</div> <!-- /. inner  -->
		 <!-- carousel controls -->
	   
			
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="icon-prev" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
		    </a>

		  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
			<span class="icon-next" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		  </a> 
			</div> 	<!-- /. carousel-->

										
                            </div>
                            <div class="tab-pane" id="profile">Profile Tab.</div>
                            <div class="tab-pane" id="messages">Messages Tab.</div>
                            <div class="tab-pane" id="settings">Settings Tab.</div>
                         </div>
		
		<!-- /. Tab panes -->
		
					  		 
	 </div> <!-- /.col-md-10 -->
		
		</div><!-- /.col-lg-10 -->
		
		</div>  <!-- /.row -->
		<br/>
	
		
		<div class="row">
			<div class="col-lg-12">
                        <div class="modal fade" id="loginMenu" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-sm">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close bold" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="H2"> Please Login..  </h4>
											
                                        </div>
									 <form role="form">
                                        <div class="modal-body">
                                          <p class="text-capitalize text-center"> Use your matric number as the username and surname as password </p>
                                        <div class="form-group">
                                            <label> <i class="fa fa-user"></i> &nbsp; Username  </label> 
                                            <input name="user" id="user" type="text" class="form-control" placeholder="Username" />
                                            <span id="userMsg" class="HideBubble"></span>
                                        </div>
                                        <div class="form-group">
                                            <label> <i class="fa fa-lock"></i> &nbsp; Password </label>
                                            <input name="pass" id="pass" type="password" class="form-control" placeholder="Password" />
											<span id="passMsg" class="HideBubble"></span>
                                        </div>
										
                                        </div>
                                        <div class="modal-footer">										
                                            <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->											  
											<img src="media/slides/10.gif" alt="" class="processgif left" />
                                            <button type="button" class="btn btn-primary" onclick="return validateLogin()"> &nbsp; Login &nbsp; <i class="fa fa-sign-in fa-fw"></i></button>
                                        </div>
										    
									</form>
                                  </div>
                                </div>
                            </div>
                    </div>
			</div>
		  <!-- footer content -->
                <footer style="background:#EEEFFF;">
                    <div class="" style="color:#222;">
                        <p class="pull-right"> <center> Copyright &copy; 2016,  Hamdala Komputer Konsults.  |
                            <span class="lead"> <i class="fa fa-paw"></i> HKK!</span> </center>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
		 
			</div>  <!-- /. main_container -->
		</div>
	 
	     
	 
  <!-- start processing user login -->
    <script>
	
	
	$(function(){
		// playButton pauseButton
		// auto hide play button 
		$(".playButton").toggle('fast'); 
		$(".playButton,.pauseButton").css({'opacity':'0.3'});
		////////////////////
		$(".playButton,.pauseButton").on('mouseenter',function(){
			$(this).css({'opacity':'1.0'});
		});
			$(".playButton,.pauseButton").on('mouseleave',function(){
			$(this).css({'opacity':'0.3'});
		});
		
		/////////////
		$(".close").on('click',function(){
			$('#user,#pass').val("");
		});
		
		///////////////
		
		$(".pauseButton").on('click',function(){
			$(".playButton").toggle('fast'); $(".pauseButton").toggle('fast');
			$("#myCarousel").carousel('pause');
		});
		//
			$(".playButton").on('click',function(){
				 $(".playButton").toggle('fast'); $(".pauseButton").toggle('fast');
				 $("#myCarousel").data('bs.carousel').options.interval=2000;
				 $("#myCarousel").carousel('cycle');
		});
	});
	
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
						url:"media/php/validator.php",
						method: "POST",
						data:
							{
								CheckUser:"user_id", username:username				
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
										url:"media/php/validator.php",
										method: "POST",
										data:
											{
												CheckPass:"user_id",password:password,username:username
											},
										beforeSend:  function(){  showgif(); }				
										});
										
										req2.fail(function(e){
										alert(e.status+" Failed"); 
										hidegif();
										});
										
										req2.done(function(msg){
											var vals = $.parseJSON(msg);
											if(vals[0]==false){
													showPop(pass,passMsg,6000,"Wrong Password");
													hidegif();
													status = false;
											}
											if(vals[0]==true){
												hidegif();
												top.location.href = vals[1];
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
 
<!-- user login ended -->

    <script type="text/javascript" src="media/js/BubbleMsg.js"></script>
    <link rel="stylesheet" type="text/css" href="media/css/BubbleMsg.css">	 
	 
  
    <script src="media/js/html5shiv.js"></script>
    <script src="media/js/respond.1.4.2.min.js"></script>	 
	 
	     <!-- jQuery -->
    

	 <script src="media/js/bootstrap.min.js"></script>
    <!-- chart js -->
    <script src="media/js/chartjs/chart.min.js"></script>
    <!-- bootstrap progress js -->
    <script src="media/js/progressbar/bootstrap-progressbar.min.js"></script>
    <script src="media/js/nicescroll/jquery.nicescroll.min.js"></script>
    <!-- icheck -->
    <script src="media/js/icheck/icheck.min.js"></script>

    <script src="media/js/custom.js"></script>
	 
</body>

</html>