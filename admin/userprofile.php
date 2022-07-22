<?php 

	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";		
	
	require "../media/php/User.php";	
	$admin = new User("admin");		
	if(!$admin->confirmLogin('adminUser')) $admin->logout('adminUser','../'); 
	 /*************************************************************************/	
	 $_SESSION['adminInfo'] = $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	 
	$bi = new  Institute_info();
	
	$_SESSION['page_title'] = $bi->institutename; 
	
	
	// querying user profile from request 
	if(isset($_REQUEST['mu'])){  # modify user..
			$query  = $_REQUEST['mu']; 
			$criterals = explode("_",$query);  
			$sn = $criterals[0];			
			$aUser = new User("users"); 
			$sUser = $aUser->getAll(array()); 
			
			 foreach($sUser['sn'] as $v){
				if($sn == md5($v)){							
					$_SESSION['snn'] = $v; 
					break; 					
				} 
			}
			  
	}
	
	// candidate to display is in session 	
		$users = new User("users");	 
		$allUser = $users->getAll(array('sn'=>$_SESSION['snn'])); 
		$logs = $users->getLogs(array('user_id'=>$allUser['user_id'][0],'type'=>'lin'));
	/*******************************************************************/
	  
?>
<!DOCTYPE html>
<html lang="en">

<head>
    
    <title> <?php ?></title>    
	
	<?php require "../media/links/top_libraries.html";?>

	<?php //  include "../media/php/FileReader.php";?>
	
</head>

<body class="nav-md">

    <div class="container body">

        <div class="main_container">
			
           <!-- left bar links -->
            
            <?php include "../media/links/leftbar.php"; ?>

            <?php include "../media/links/top_navigation.php";?>
	
			<?php # include "../media/links/page_content.php";?>
            
        	 <!-- page content -->
            <div class="right_col" role="main"> 
                <div class=""> <form method="post">

                    <div class="page-title">
                        <div class="title_left">
                            <h3> <i class="fa fa-user"></i> &nbsp;   Student Profile  &nbsp;  </h3>
                        </div>
  
                    </div> 
                     <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel">
                               
							   <div class="x_title">
                                    <h2 class="big">  <?php echo $allUser['user_id'][0]."'s "; ?> <small> info </small></h2>                                    
                                    <div class="clearfix"></div>
                                </div>
								
                                <div class="x_content">

                                    <div class="col-md-3 col-sm-3 col-xs-12 profile_left">

                                        <div class="profile_img">

                                            <!-- end of image cropping -->
                                            <div id="crop-avatar">
                                                <!-- Current avatar -->
                                                <div class="avatar-view" title="<?php echo $allUser['surname'][0]."&nbsp;".$allUser['firstname'][0]."&nbsp;".$allUser['midname'][0] ; ?>">
                                                    <img src="<?php echo "../media/user_imgs/".$allUser['passport'][0];?>" alt="Avatar">
                                                </div>
  
                                            </div>
                                            <!-- end of image cropping -->
                                        </div>
										
                                        <h3><?php echo $allUser['surname'][0]."&nbsp;".$allUser['firstname'][0]?></h3>

                                        <ul class="list-unstyled user_data">
                                            <li><i class="fa fa-signal user-profile-icon"></i>  Level &nbsp; <?php echo $allUser['level'][0]; ?>
                                            </li>
											
                                            <li>
                                                <i class="fa fa-briefcase user-profile-icon"></i> Dept. &nbsp;  <?php echo $allUser['department'][0]; ?>
                                            </li>
											<li>
                                                <i class="fa fa-briefcase user-profile-icon"></i> Faculty. &nbsp;  <?php echo $allUser['faculty'][0]; ?>
                                            </li>
                                        </ul>

                                       <!--  <a class="btn btn-success"><i class="fa fa-edit m-right-xs"></i>Edit Profile</a>
                                        <br />  -->
 
                                    </div>
									
									
                                    <div class="col-md-9 col-sm-9 col-xs-12">

                                        <div class="profile_title">
                                            <div class="col-md-6">
                                                <h2> Concise Information  </h2>
                                            </div>
                                            <div class="col-md-6">
                                               <!--  <div id="reportrange" class="pull-right" style="margin-top: 5px; background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #E6E9ED">
                                                    <i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
                                                    <span>December 30, 2014 - January 28, 2015</span> <b class="caret"></b>
                                                </div>
												-->
                                            </div>
                                        </div>
                                          
                                        <div class="" role="tabpanel" data-example-id="togglable-tabs">
                                             
                                            <div id="myTabContent" class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade active in" id="tab_content1" aria-labelledby="home-tab">

                                                    <!-- start recent activity -->
                                                    <ul class="messages">
                                                        <li>
                                                            <img src="<?php echo "../media/user_imgs/".$allUser['passport'][0];?>" class="avatar" alt="Avatar">                                                            
                                                            <div class="message_wrapper">
                                                                <h4 class="heading">About </h4>
                                                                <blockquote class="message">
																	<?php echo $allUser['surname'][0] ."&nbsp;".$allUser['firstname'][0] ." is a student of Kwara State College of Education Technology (Lafiagi) who was admitted  in the year 2016, in the faculty of ".$allUser['faculty'][0].", department of ".$allUser['department'][0];?>
																	. other details includes the following .. 
																</blockquote>
																 <br /> 
																<blockquote class="message">
																	<i class="fa fa-user"></i> &nbsp;  Gender: <?php echo $allUser['sex'][0] ;?>
																	<br/> <br/> 
																	<i class="fa fa-calendar"></i> &nbsp; Date of Birth: <?php echo $allUser['dob'][0] ;?> 
																	 <br/>  <br/> 
																	 <i class="fa fa-send"></i> &nbsp; Email: <?php echo $allUser['email'][0];?> 
																	 <br/> <br/> 
																	  <i class="fa fa-phone user-profile-icon"></i> &nbsp; Phone No: <?php echo $allUser['phone'][0];?> 
																	 <br/> <br/> 
																	<i class="fa fa-home user-profile-icon"></i> &nbsp; Home Address: <?php echo $allUser['homeaddress'][0];?> 
																	 <br/> <br/> 
																	 <i class="fa fa-briefcase user-profile-icon"></i> &nbsp; Department: <?php echo $allUser['department'][0];?> 
																	 <br/> <br/> 
																	 <i class="fa fa-briefcase user-profile-icon"></i> &nbsp; Faculty: <?php echo $allUser['faculty'][0];?> 
																	 <br/> <br/> 
																	 <i class="fa fa-signal user-profile-icon"></i> &nbsp; Current Level: <?php echo $allUser['level'][0];?> 
																	 <br/> <br/> 
																	 <i class="fa fa-user user-profile-icon"></i> &nbsp; Username: <?php echo $allUser['user_id'][0];?> 
																	 <input type="hidden" value="<?php echo $allUser['user_id'][0];?>" name="myid" id="myid"/>
																	 <br/> <br/> 
																	 <i class="fa fa-lock user-profile-icon"></i> &nbsp; Password: [&nbsp; <b><?php echo strtolower($allUser['password'][0]);?></b> &nbsp;] &nbsp; 																
																	 <br/> <br/> 
																	 <i class="fa fa-unlock user-profile-icon"></i> &nbsp; Update Password:  &nbsp; &nbsp;  <input name="pswMod" id="pswMod" type="text" class=" flat" style="width:160px;" />  </blockquote>																
                                                                <br /> 
																 															
                                                                <br /> 																
                                                            </div>
                                                        </li>
                                                       
                                                        <li>
                                                            <img src="<?php echo "../media/user_imgs/".$allUser['passport'][0];?>" class="avatar" alt="Avatar">
                                                            															 
															
                                                            <div class="message_wrapper">
                                                                <h4 class="heading">Activity Logs </h4>
                                                                <blockquote class="message">About the CBT program, detail activity logs of <?php echo $allUser['surname'][0]."&nbsp;".$allUser['firstname'][0]." are analysed below ...";?> 
																<br /> <br />
																<i class="glyphicon glyphicon-time user-profile-icon"></i> &nbsp; Last Login: <?php echo $allUser['logdate'][0];?> 
																	 <br/> <br/> 
																	<i class="glyphicon glyphicon-time user-profile-icon"></i> &nbsp; Total Login(s): <?php echo count($logs['user_id']);?> 
																	 <br/> <br/>  <?php $cent  = count($logs['user_id']);?>
																	 <i class="fa user-profile-icon"> </i> &nbsp; Logs Percentage: (<?php echo $cent; ?>%)
																		  <br/> <br/>
																	 <div class="progress progress_sm">
																		<div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<?php echo count($logs['user_id']); ?>"></div>
																	 </div>
																	  
																</blockquote>
                                                                <br /> <br />
                                                                
                                                            </div>
                                                        </li>
                                                    
                                                    </ul>
                                                    <!-- end recent activity -->

                                                </div>
                                                 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div

			 ></form>
            </div>
            <!-- /page content -->
			
		</div> <!-- /. main_container -->
	
	</div> <!-- /. container body -->
	 
	 
    <script> 
		$(function(){
				   
	 	// changing password 
		/***************************************************/
		  
		$('#pswMod').on('change',function(){
			
			if(confirm(' Are you sure that you want to change this password ?')){
				
				var pass = $(this).val(); 
				var user = $('#myid').val();
				
				var req = $.ajax({				
						url:"../media/php/validator.php",
						method: "POST",
						data:
							{
								resetUserPsw:"user_psw", newPsw:pass,  user_id:user				
							},
						// beforeSend:  function(){  showgif(); }				
						});
				
						req.fail(function(e){
							alert(e.status+" Failed"); 
							hidegif();
							});
			
						req.done(function(d){ 
							
							alert($.trim(d));
							
							});
				 
			}
				
				
				
				
				});
			
			
			
			
			});
			
	/*******************************************/
	 	
	</script>
		
     
	<?php include "../media/links/foot_libraries.html"; ?>
	   
        
     
</body>

</html>