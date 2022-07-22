
<?php 
	error_reporting(E_ALL ^ E_NOTICE);
	
	if(!isset($_SESSION))session_start();
	if($_SESSION['paperFinished'] == true) stop();
	// confirm user login first 
	
	require "../media/php/Users.php";
	require "../media/php/Course.php";
	require "../media/php/timecoder.php";  
	require "../media/php/instituteinfos.php";	
	
	$bi = new  Institute_info();

	$user = new User("users");
	if(!$user->confirmLogin('exmUser')) $user->logout('exmUser','../'); 	
	$myInfo = $user->getAll(array("user_id"=>$_SESSION['exmUser']));	
	/*************************************************************************/	
	
		/* keep users time always updated
	*******************************************************************************/
	 if(!isset($_SESSION['time_start'])) $_SESSION['time_start'] = time();	
	$_SESSION['time_used'] = (time() - $_SESSION['time_start']) + $_SESSION['init_sec_used'];	
	$_SESSION['time_left'] = $_SESSION['total_sec'] - $_SESSION['time_used'];
	$refreshTime = 	$_SESSION['time_left']-3;
	if($_SESSION['time_used']>=$_SESSION['total_sec'])  {   $refreshTime = 1; stop(); }
	/********************************************************************************/ 
	
			if(!isset($_SESSION['dones'])) $_SESSION['dones'] =  $dones = array();
			$remains = $_SESSION['tot_qtn'] - array_sum($_SESSION['dones']);
			$_SESSION['percent_done'] = (array_sum($_SESSION['dones'])/$_SESSION['tot_qtn'])*100;
			$_SESSION['min_ans'] = round(0.30 * $_SESSION['tot_qtn']);
			$_SESSION['totalmark'] = array_sum($_SESSION['myQtn']['marks']); 	
			##########################################################################################
	
	
	header("Refresh:".$refreshTime);
	
	## tackles problem of starting afresh and redoing ##################
	 if(!isset($_SESSION['pasted'])) require("scripts/php/calculator.php");	
	###################################################################
	 	
	// fetching course schedule  
		
	$dbm = new DbTool();  
	
	/*** when user selects any question number	
	***********************************************************/
	if(isset($_POST['goQtn'])){			
			 
			$_SESSION['qtnNo'] = $_POST['goQtn'];	
			
			// keepOption($num)
			keepOption($_SESSION['qtnNo']);
			markQuestion($_SESSION['qtnNo']);
			// 			
	}
	/******************************************************/	
				
	/*** clicking next and previous button ************
	**** ****************************************************/	
	if(isset($_POST['btnPrev'])){		
		if($_SESSION['qtnNo']>1 && $_SESSION['qtnNo']<=$_SESSION['tot_qtn'])		
			$_SESSION['qtnNo']-=1;	
			//
			// keepOption($num)
			keepOption($_SESSION['qtnNo']+1);
			markQuestion($_SESSION['qtnNo']+1);
			// 
	}
	/******************************************************/
	if(isset($_POST['btnNext'])){	
		if($_SESSION['qtnNo'] <= $_SESSION['tot_qtn']-1)		 
			$_SESSION['qtnNo']+=1; 
			
			// keepOption($num)
			keepOption($_SESSION['qtnNo']-1);
			//markQuestion($num) 
			 markQuestion($_SESSION['qtnNo']-1);
			// 
	}
	/***************************************************************************************************/ 
			
	function keepOption($num){
	
			$dbm = new DbTool(); 
						##########  KEEP OPTIONS  ##############
				if(!isset($_SESSION['picked1'.$num])) 
				{
					$_SESSION['picked1'.$num] = $_SESSION['myQtn']['picked1'][($num-1)];//$_POST['qtn'.$num];
				
					if($_POST['qtn'.$num]!="") { $_SESSION['picked1'.$num] = $_POST['qtn'.$num];	$_SESSION['dones'][$num] = 1; }
					
				}
					else if(isset($_SESSION['picked1'.$num]))
						{
								if($_POST['qtn'.$num]!="") { $_SESSION['picked1'.$num] = $_POST['qtn'.$num]; $_SESSION['dones'][$num] = 1;	}
						}	
				#############################
			$dbm->updateTb("qtn_remind",
				array("picked1"=>$_SESSION['picked1'.$num]),
				array("user_id"=>$_SESSION['exmUser'],"year"=>$_SESSION['year'],"codegen"=>$_SESSION['codegen'],"num"=>$num));
			
			##################################################
			/******************* update The result ***********************/
			 $dbm->updateTb("users_result",array("bus_stop"=>$num,"sec_used"=>$_SESSION['time_used'],
			 "totalmark"=>$_SESSION['totalmark'],
			 "totalscore"=>array_sum($_SESSION['myScore']),"unitscore"=>$_SESSION['unitScore'],"percent"=>$_SESSION['percent']),
				array("user_id"=>$_SESSION['exmUser'],"year"=>$_SESSION['year'],"codegen"=>$_SESSION['codegen']));
			/*************************************************************************************/
			
				
			} #### end function keepOption
	
	function markQuestion($num){
		########################
		  		if($_SESSION['picked1'.$num]!=""){
					$dones++;	
					#########################   mark choices question  ############################
					switch($_SESSION['myQtn']['optiontype'][($num-1)]) {
						case "choice":{
								if($_SESSION['picked1'.$num]== $_SESSION['myQtn']['answer'][($num-1)]){
							$_SESSION['myScore'][$num-1] = $_SESSION['myQtn']['marks'][($num-1)];
							$_SESSION['unitScore']++;
							} else $_SESSION['myScore'][$num-1] = 0; 
						} ################### end choices question #####################################
						break;
						
						case "typeIn":{
								$accuracy = similar_text(trim(strtolower($_SESSION['picked1'.$num])),trim(strtolower($_SESSION['myQtn']['typeAns'][($num-1)])),$cent);
							if($cent == 100) 
							{
								$score = ($cent / 100) * $_SESSION['myQtn']['marks'][($num-1)];
								$_SESSION['myScore'][$num-1] = $score;  #$_SESSION['myQtn']['marks'][($q-1)];
								$_SESSION['unitScore']++;
							}
							else {
								$_SESSION['myScore'][$num-1] = 0; 
							}							 
						}
						break;
						
					}  ### end switch 	
					$_SESSION['percent'] = number_format((array_sum($_SESSION['myScore'])/$_SESSION['totalmark'])*100,1);
				}		 
				#######################################
			} #### end function markQuestion
	
	function stop(){
		
		require_once "../media/php/dbTool.php"; 
		
		$dbm = new DbTool();
	
		$_SESSION['myStatus']="done";
		
		unset($_SESSION['started']);
		
		$_SESSION['paperFinished'] = true;		
		// save some infos about logout 
		$logouttym = date('D jS M, Y - g:i s A');		 		
		//
		$data = array("paperlogouttime"=>$logouttym,"currently"=>"off","paper_signal"=>"done","totalmark"=>$_SESSION['totalmark'],"totalscore"=>array_sum($_SESSION['myScore']),"unitscore"=>$_SESSION['unitScore'],"percent"=>$_SESSION['percent']);
		$cond = array('user_id'=>$_SESSION['exmUser'],'codegen'=>$_SESSION['codegen'],'year'=>$_SESSION['year']);
			
		$dbm->updateTb("users_result",$data,$cond); 
		
		header("Location:index.php");		
	}
	######### end function stop 
	
	
	###############################################################################
	#### PREVENT STOPING WITHOUT ANSWERING QUESTIONS ##############################
	// when user has finished paper 
	
	 if(isset($_POST['btnFinished'])){		
		if($_SESSION['percent_done'] < 30){			
				 $_SESSION['logMsg'] =  " YOU MUST ANSWER &nbsp;".$_SESSION['min_ans']. "&nbsp; QUESTIONS BEFORE YOU SUBMIT YOUR PAPER";			
		}
		else {
			stop(); 
		}
		 
		
	} // end of finished button 
	/**************************************************************************/

	##########################################################################
/**************************************************************************/	
	// when user has finished paper 
	 if(isset($_POST['btnStop'])){		
		stop(); 
	} // end of finished button 
	/**************************************************************************/

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../media/images/KWCON-LOGO.JPG" rel="shortcut icon" /> 
<title>User -> <?php echo $_SESSION['exmUser']; ?></title>
	
	<?php require_once "headlinks.html";  ?>
  
</head>

<body style="background:url('../media/images/logo.png') repeat;">
 <!--********************* MODALS ************************************************ -->
 <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
      <div class="modal-dialog modal-sm" >
        <div class="modal-content">
          <div class="modal-header">
            <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"> <i class="fa fa-close red "></i> </button>
            <label class="modal-title" id="myModalLabel"> Message </label>
          </div>
          
		  <div class="modal-body red" style="text-align:center;">
			 <i class="fa fa-warning fa-2x"> </i> &nbsp;  <p>&nbsp;   </p>
				<?php echo $_SESSION['logMsg'] ; ?> 
			<p>&nbsp;   </p> 
			<center>
			 <button type="button" class="dismiss-btn btn btn-default red" data-dismiss="modal">Ok</button> 
			 </center>
			 <p>&nbsp;   </p>
          </div>
		  
		   
        </div>
      </div>
    </div> 					
	
<!--**************************************************************************************************************** -->

 
	<div class="container">
    	<div class="row">
        	<div class="col-md-12">
            	<div class="panel panel-success">              	 
                    <div class="panel-heading">                    
                    
					<div class="text-uppercase">
						
						<label> <img src="<?php   echo "../media/images/".$bi->logo; ?> " style="max-height:80px; max-width:120px;" 	class="img img-responsive  img-thumbnail  img-circle" />
 						  &nbsp; &nbsp; &nbsp; <i class="glyphicon glyphicon-user fa-2x"></i> &nbsp; &nbsp;
						  <span style="font-size:18px;"><?php echo $_SESSION['exmUser']."&nbsp;"; ?> &nbsp; &nbsp;  <i class="glyphicon glyphicon-triangle-right"></i> 
						  <?php echo $myInfo['surname'][0]."&nbsp;".$myInfo['firstname'][0];?>  <i class="glyphicon glyphicon-triangle-right"></i> <?php echo "&nbsp; &nbsp; ".$_SESSION['myReports']['code'][0]." &nbsp; ".$_SESSION['myReports']['qtype'][0]; ?>
						  </span>	</label>  
						 <!-- display timer  -->
						 <div class="navbar navbar-right"> 	
							<div id="CountDownTimer" class="small" data-timer="<?php echo $_SESSION['time_left'];?>" style=" width: 250px;"> </div>							
						</div>
						<!-- <br/>&nbsp; --> 
					</div>
               		
                    </div> <!--/. panel heading-->
                    
                    <div class="panel-body">
                    	<div class="row"> <form method="post" role="form">                    	
						<div class="col-md-2 col-sm-2 col-xs-4">
                        
							<div class="col-md-2 col-sm-2 col-xs-4 profile_left">
									<div class="profile_img"> 
                                            
                                            <div id="crop-avatar">
                                                <!-- Current avatar -->
                                                <div class="avatar-view" title="<?php echo $allUser['surname'][0]."&nbsp;".$allUser['firstname'][0]."&nbsp;".$allUser['midname'][0] ; ?>">         
												<center> <img src="<?php echo "../media/user_imgs/".$myInfo['passport'][0];?>" alt="<?php echo "../media/user_imgs/".$myInfo['user_id'][0];?>" class="" style="max-height:180px; max-width:180px;">
												<br/> <br/> 
                                             
										<ul class="list-unstyled user_data small">
													<b><li><i class="fa fa-user user-profile-icon"></i>  ID &nbsp; <?php echo $_SESSION['exmUser']; ?>
													</li>
													
													<!--<li>
														<i class="fa fa-briefcase user-profile-icon"></i> Dept. &nbsp;  <?php echo $myInfo['department'][0]; ?>
													</li>
													<li>
														<i class="fa fa-briefcase user-profile-icon"></i> Faculty. &nbsp;  <?php echo $myInfo['faculty'][0]; ?>
													</li>--> 
													</b>
                                        </ul>
										</center>

											   </div>  
										
											</div>
                                            <!-- end of image cropping -->
                                        </div>						
									
									</div> <!-- /. col-sm-2 -->
								</div> <!-- /. col-sm-2 -->
								
								
                        <div class="col-md-10 col-sm-10 col-xs-12"> 
						<?php  
								if($_SESSION['myQtn']['passage'][($_SESSION['qtnNo'] -1)] !="") { 
									$pWt = "col-md-4 col-sm-4 col-xs-12"; 
									$qWt = "col-md-8 col-sm-8 col-xs-12";
						?>
						
						<div class="<?php echo $pWt; ?>"> <!-- column for passage -->
							<div class="x_panel">
								<div class="x_title">
									<h5> <b>Read This Passge  </b></h5>
									<div class="clearfix"> </div>
								</div> <!-- /. x_title-->
								
								<div class="x_content" style="min-height:300px;">
									<?php 
									echo stripslashes($_SESSION['myQtn']['passage'][($_SESSION['qtnNo'] -1)]);
									?>
									
								</div> <!-- /. x_content -->
								
							</div> <!-- /. x_panel -->
						</div>
						 
								<?php } # close question with passage
									else  {  
									$qWt = "col-md-12 col-sm-12 col-xs-12";
								}
								?>
								
                         <div class="<?php echo $qWt; ?>">
                            <div class="panel panel-info">
                                <div class="panel-body">                            	                              
                                                              
                                <div style="font-size:18px;">   
                                  <?php 
								$qtno = $_SESSION['qtnNo'];
								
								if($_SESSION['myQtn']['instruction'][($qtno-1)]!=""){ ?>
									
									<div class="form-group"> <i class="alert bg-info"> <?php echo $_SESSION['myQtn']['instruction'][($qtno-1)]; ?> </i>
									</div> <br/>  
									
								<?php } ?>
								<div class="form-group">
								<?php  echo  stripslashes($_SESSION['myQtn']['question'][($qtno-1)]);?> 
								 
								 </div> </div>                                
									
								<?php  
								if($_SESSION['myQtn']['image1'][($_SESSION['qtnNo'] -1)] !="") { 
									$imWt = "col-md-5 col-sm-5 col-xs-6"; 
									$opWt = "col-md-7 col-sm-7 col-xs-6";
								?>									
							   <div class="<?php echo $imWt; ?>">   <!-- column for images -->
									
									<div class="img"> <br/>
										<img class="img img-responsive img-thumbnail"	src="<?php echo "imgs/".$_SESSION['myQtn']['image1'][($_SESSION['qtnNo'] -1)];?>" style="max-height:300px;" />
									</div>
								
							   </div>	
							   
							   <?php } # <!-- end col for images -->
									else  {  
									$opWt = "col-md-12 col-sm-12 col-xs-12";
								}
								?>
							   
                                <div class="<?php echo $opWt; ?>">   <!-- column for options <br/> --> 
                               
							   <!-- populate option buttons--> 
                               
							   <!-- check option types --> 
								
								<?php if($_SESSION['myQtn']['optiontype'][($qtno-1)]=="choice") {?>
								
                                <?php for($opt = 1; $opt <=$_SESSION['myQtn']['tot_option'][($qtno-1)]; $opt++) {?>
                               <div class="radio" style="font-size:20px;"> &nbsp; &nbsp; &nbsp; &nbsp; 
								<span> <?php echo $dbm->iLabel($opt); ?>   </span>
							   
							     <label id="<?php echo 'labelans'.$opt; ?>" for="radio">									
									<input type="radio" class="qexC flat" name="<?php echo "qtn".$qtno;?>" id="<?php echo "qtn".$qtno;?>" value="<?php echo  stripslashes($_SESSION['myQtn']['option'.$opt][($qtno-1)]); ?>" <?php echo  stripslashes(($_SESSION['myQtn']['option'.$opt][($qtno-1)]==$_SESSION['picked1'.$qtno]))?"checked":"";?> />  
                                    &nbsp; <?php echo stripslashes($_SESSION['myQtn']['option'.$opt][($qtno-1)]);?>									
                               </label>
							    </div> <!--/. form-group-->
								<?php }   

								} // end of choice answer 
								else if($_SESSION['myQtn']['optiontype'][($qtno-1)]=="typeIn") { ?>
									
									<p><label> Type In Your Answer Here <i class="fa fa-arrow-down fa-2x"> </i></label> </p>
									<p> 
										<textarea rows="2" cols="50"  name="<?php echo "qtn".$qtno;?>" id="<?php echo "qtn".$qtno;?>" style="font-size:24px; font-family:georgian " autofocus="true" ><?php echo $_SESSION['picked1'.$qtno];?></textarea></p>
								<?php } ?>
                               
							   </div> <!-- end col for options -->
							 
							   <div class="col-sm-12 col-md-12 col-xs-12"> <br/></div>
                               
							<!-- create a space for selecting any question anytime  -->
                            <p>&nbsp;</p>
								<div class="col-md-4">
                                    <div class="form-group"> 
										
										<button type="button" name="" id="" class="btn  btn-default bold">  &nbsp; <b>  <?php echo $_SESSION['qtnNo']."&nbsp; of &nbsp; ".$_SESSION['tot_qtn'] ?> </b> </button>                                      	 
                                    
                                    </div> <!--/. form-group-->
								</div>	
								<div class="col-md-6">
                                 <div class="form-group">									
                                 	  <button type="submit" name="btnPrev" id="btnPrev" class="btn  btn-success"><i class="glyphicon glyphicon-arrow-left"></i> Previous  </button> &nbsp; &nbsp; &nbsp; 
									  
									  <button type="submit" name="btnNext" id="btnNext" class="btn  btn-primary"><i class="glyphicon glyphicon-arrow-right"></i> Next </button>     &nbsp; &nbsp; &nbsp;  <input type="submit" name="jumper" id="jumper" style="display:none;" value="navigator" />
                                 
								 <?php  # echo  ?>
								 
								 </div>  <!-- /. form-group-->
                                </div> <!-- col-md-6-->
                                
                                <div class="col-md-2">
                                	<div class="form-group">
                                    <button type="submit" class="btn btn-danger" name="btnFinished" id="btnFinished" onclick="return confirm('Are you sure you want to submit')" data-toggle="tooltip" data-placement="top" 
													title="Have You Complete Your Paper ? "> Submit </button>
                                    
                                    <button type="submit" class="btn btn-danger" name="btnStop" id="btnStop" style="visibility:hidden; "> Stop </button>
                                    
                                    </div> <!-- /. form-group--> 
                                </div> <!--/. col-md-2-->
                                </div> <!--/. panel-body-->
                          
                            </div>  <!--/. panel-info-->
                          
                          </div> <!--/. col-md-10-->
                       </div> <!--/. col-md-10-->              		
					<!-- </div>  /. row -->
				 
				
					<div class="col-md-2">
						 
					</div> <!-- /. col-md-2 -->
						
					 						 
							 
					<div class="col-md-10">
						 <?php 
						 ############### SHOW LIST OF ANSWERED QUESTIONS ##################################
						 for($m = 1; $m<=$_SESSION['tot_qtn']; $m++) { ?>
									<button type="submit" name="goQtn" value="<?php echo $m; ?>" class="btn <?php echo($_SESSION['picked1'.$m]=="")?"btn-default":"btn-success"; ?>  btn-xs"> <i class="bold <?php echo($_SESSION['picked1'.$m]=="")?"red":"white"; ?>"> <?php echo $m; ?> </i> </button>  
								<?php } 
						 ################################################################################## 
						   
							?>							
						</div> <!-- /. col-md-10 -->
						
					</div>							 
							 
						
						<input type="hidden" name="keepNext" id="keepNext" value="<?php echo $_SESSION['qtnNo'];?>">
						<input type="hidden" name="keepTotal" id="keepTotal" value="<?php echo $_SESSION['tot_qtn'];?>">
						<input type="hidden" name="itype" id="itype" value="">
						<input type="hidden" name="stg1Alert" id="stg1Alert" value="<?php echo $_SESSION['logMsg'];?>" />
						<input type="hidden" name="time_keeper" id="time_keeper" value="<?php echo readTime($_SESSION['time_left']); ?>" />
						<input type="hidden" name="time_percent" id="time_percent" value="<?php echo ($_SESSION['time_left']/$_SESSION['total_sec'])*100; ?>" />
						
                         </form>
                        </div> <!--/. panel-body -->
                       </div>  <!-- /. panel -->
                     </div> <!--/.col-md-12 -->
              
            </div> <!--/. row-->       
			<div class="row text-center" style="display:none;">										
				<a href="#" id = "showPop" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#basicModal">Click to open Modal</a>
			</div>
		 		
		  <!-- footer content -->
               <!-- footer content -->
                <footer style="background:#EEEFFF;">
                    <div class="" style="color:#222;">
                           <p class="pull-right">Hamdala Komputer Konsults. 2016 |
                            <span class="lead"> <i class="fa fa-paw"></i> HKK!</span>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
                  
    </div>	<!-- /. container-->
  
 <?php unset( $_SESSION['logMsg']); ?>
 
<script>
		 	
		/****************************************/
			// detecting click  buttons on keyboard 
		$(document).keydown(function(event){
			
		/***************************************/						 
		// alert(event.which); 
		
			if(event.which == 32 || event.which == 27 || event.which == 13 ) 
				{
				// press Next button 
					$('.dismiss-btn').click(); 
				}  
				});
		/****************************************/
		
		$(function() 
		{
			/************************************/
		// auto click showPop	
			stg1Pop = $('#stg1Alert').val(); 
			if(stg1Pop !="") $('#showPop').click();	
		/************************************/
		});
	 
	</script>
 
	
	<script>
	
			function reminder(){
			
			var req = $.ajax({
				url:"../media/php/accessor.php",
				data:
					{
					watchMyTime:'Tell me the time remaining'
					},
				method:"POST" 
				  }); 	
						
					req.fail(function(e){
						//  alert('failed connecting for time watch '); // 
						console.log(e.status+" Failed");
						});
					
						req.done(function(d){
							  
							var time_percent_string =   $.parseJSON(d); 	
							  
							if(time_percent_string[0] == 75){
								notify(time_percent_string[1]);							
							}
							
							if(time_percent_string[0]==50){
								notify(time_percent_string[1]);
							}
							
							if(time_percent_string[0]==25){
								notify(time_percent_string[1]);
							}
							
							if(time_percent_string[0]==5){
								notify(time_percent_string[1]);
							}
							
							if(time_percent_string[0]==1){
								notify(time_percent_string[1]);
							}
		/***************************************************************************/							 
							 /////////////////////////////////////// 
								});
						
						setTimeout(reminder,5000);
						
						}
						
						/**************************************************/
						function notify(secs_string){							
								(new PNotify({
									title: ' ATTENTION ! ',
									text: ' YOU HAVE  '+ secs_string + ' LEFT ',
									type: 'error',
									font:'24px bold',
									desktop: {
										desktop: true
									}
								})).get().click(function(e) {
									if ($('.ui-pnotify-closer, .ui-pnotify-sticker, .ui-pnotify-closer *, .ui-pnotify-sticker *').is(e.target)) return;
									alert('Hey! You clicked the desktop notification!');
								});  
						}
						////////////////////////////////////////////////////////////////
						/***********************************************************************/					 
	
	
	</script>
  
<script>

	// buttons of next, previous, first and last  
	 
	 
	 $(document).ready(function(e){
		
		var qtn = $("#keepNext").val();
		var tot = $("#keepTotal").val();
		
		locker(qtn,tot);	 time_updator(); // call the timer to start counting 
		
		setTimeout(time_updator,2000);  
		setTimeout(reminder,5000);
		 	
		$("#selector").change(function(e) {
            	$("#jumper").click();
        });
		
		// dim submit button 
		$('#btnFinished').css('opacity','0.1'); 
		
		$('#btnFinished').on('mouseover',function(){
			
		 $(this).css('opacity','1.0'); 
		 
		});
		
		$('#btnFinished').on('mouseout',function(){
			
		 $(this).css('opacity','0.1'); 
		 
		});
		
	 }); // end of jQuery
				
	 
	/****************************************/
			// detecting click  buttons on keyboard 
		$(document).keydown(function(event){
			
			if(event.which == 39) 
				{
				// press Next button 
					$('#btnNext').click(); 
				}
			if(event.which == 37) 
				{
				// press previous button 
					$('#btnPrev').click(); 
				}
				
			if(event.which == 65) 
				{
				// press option A 
					$('#labelans1').click();  
				}
			if(event.which == 66) 
				{
				// press option B 
					$('#labelans2').click();    
				}
			if(event.which == 67) 
				{
				// press option C 
					$('#labelans3').click();   
				}
			if(event.which == 68) 
				{
				// press option D 
					$('#labelans4').click();  
				}
			if(event.which == 69) 
				{
				// press option E 
					$('#labelans5').click();
				}
		});
	
		 /****************************************************************/
		 /****************************************************************/
		
		$(function(){
			
		// circle timer 
		 $("#CountDownTimer").TimeCircles({time:{ Days: { show: false }, Hours: { show: true}}});
			///##################################################################################/
		});
		
		 
	 
	 function locker(elem,tot){
		 if(elem==tot) $("#btnNext").hide('fast');
			else $("#btnNext").show('fast');
			
		if((elem-1)==0) $("#btnPrev").hide('fast');
			else $("#btnPrev").show('fast');
			 
		}
	 	
		
	function time_updator(){
		
		var req = $.ajax({
				url:"../media/php/accessor.php",
				data:
					{
					updateWatch:'1000'
					},
				method:"POST",
				 beforeSend: function(){  // alert('sending')
				 },
						
					});
						
					req.fail(function(e){
						// console.log(e.status+" Failed");
						});
					
						req.done(function(d){
							if(d == true)
								{
									$("#btnStop").click();	 
									window.top.href="index.php";
								}
//								alert('updating');
						});
		
		setTimeout(time_updator,1000);		
		
		}
		
</script>

</body>

    <?php require_once "footlinks.html";?>
  
</html>