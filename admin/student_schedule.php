<?php 

	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";		
	
	require "../media/php/User.php";	
	$admin = new User("admin");		
	if(!$admin->confirmLogin('adminUser')) $admin->logout('adminUser','../'); 
	 /*************************************************************************/	
	 $_SESSION['adminInfo'] = $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	 
	require "../media/php/Course.php";	 
	
	require "../media/php/Users_Courses.php";		  
	 
	  // session_destroy(); session_start(); 

	$bi = new  Institute_info();
	
	$_SESSION['page_title'] = $bi->institutename; 		
	
	 /****************/
	  if(!isset($_SESSION['studFilt'])) $_SESSION['studFilt'] = "level_100";
	  if(!isset($_SESSION['courseYear'])) $_SESSION['courseYear'] = date('Y'); 
	  if(!isset($_SESSION['finStageOne'])) $_SESSION['finStageOne'] = true; 
	 /***********************************************/
	//
	if(isset($_POST['cosplus'])){
		if(isset($_SESSION['newCos'])) { unset($_SESSION['newCos']);}
		else { $_SESSION['newCos'] = true; }
	}
	 
	
	if(isset($_POST['canCos'])){
		unset($_SESSION['newCos']);
		unset($_SESSION['cosname']);
		unset($_SESSION['coscode']);
		unset($_SESSION['cosstatus']);
		unset($_SESSION['cosunit']);
		unset($_SESSION['coslevel']);
		unset($_SESSION['CosUpdates']);
	} 
	
	// creating new course 
	
		// alerts 
		$awarn = "alert-warning";
		$asuccess = "alert-success";
		$adanger = "alert-danger";
		
		// glyghicon signs 
		$gly_warn = "glyphicon-warning-sign";
		$gly_ok = "glyphicon-ok";
		$gly_info = "glyphicon-info-sign";
		$gly_question = "glyphicon-question-sign";
		
		// display 
		$disp_off = " style='display:none;'";
		$disp_on = " style='display:block;'";
		
		
		// needed  = 
		  
		  $fdisplay = $disp_off;
		  $fAlert = $alert_success;
		  $sdisplay = $disp_off;
		/////////////////////////////////////////////////
		/****************************/		
	
	$queries =  new DbTool(); 
	
	$userLevels = $queries->getDistinctLevel("users"); 
	
	 /*************************************/
	$courses = new Course(); 
		$allCourses = $courses->getAll(array()); 
	
	/**********************************************************************/
  ## scheduling exams for student 
	#  finStep1 scheduleYear scheduleCos
	
	if(isset($_POST['finStep1'])){
		
		$dbm = new DbTool(); 
		
		$_SESSION['scheduleYear'] = $_POST['scheduleYear'];
		$_SESSION['scheduleCos'] = $_POST['scheduleCos'];
		
		// validate 
		if($_SESSION['scheduleCos'] == ""){
				$fAlert = 	$awarn;	 
				$fdisplay = $disp_on;
				$_SESSION['fMsg'] = "  Please Select The Course First ";
		}
		else if($_SESSION['scheduleYear'] ==""){
				$fAlert = 	$awarn;	 
				$fdisplay = $disp_on;
				$_SESSION['fMsg'] = "  Please Select The Year ";
		}
		else{
				# check database for questions available 
				
				$avCos = $dbm->getFields($dbm->select_Multi_Distinct(array("qtype","code","year"),"questions",array("code"=>$_SESSION['scheduleCos'],"year"=>$_SESSION['scheduleYear'])),array("code","year","qtype"));
				
				if(count($avCos['qtype'])==0){
					
					// seems no question is available 
					$fAlert = 	$awarn;	 
					$fdisplay = $disp_on;
					unset($_SESSION['finstageOne']) ;
					unset($_SESSION['finStageTwo']);
					$_SESSION['fMsg'] = "  No Questions has been set for this course  ";
				}
				else{
					$fAlert = 	$asuccess;	 
					$fdisplay = $disp_on;
					$_SESSION['fMsg'] = " We have ".join(" and ",$avCos['qtype']); 
					$_SESSION['paperTypes'] = $avCos['qtype'];
					$_SESSION['finstageOne'] = true; # finished stage one 
					$_SESSION['finStageTwo'] = true; # finished stage two t continue 
					unset($_SESSION['finStageThree']);
				}
				 
		}
			 
	} 

	    $cosInfo = $courses->searchCourse(array("code"=>$_SESSION['scheduleCos'])); 
		
		# $_SESSION['level'] = $cosInfo['level'][0];
				
				
	if(isset($_POST['xStage2'])){
		
		unset($_SESSION['finStageTwo']);
	    unset($_SESSION['finStageThree']);
	}
	/*****************************************/
	if(isset($_POST['xStage3'])){	
		unset($_SESSION['finStageThree']);
		$_SESSION['finStageTwo'] = true;
	}
	
	 // 
	 if(isset($_POST['finStep2']) || isset($_POST['fetcher'])){
		$dbm = new DbTool(); 
		/**********************************************************************/
		$_SESSION['scheduleType'] = $_POST['scheduleType'];
		$_SESSION['scheduleQtn'] = $_POST['scheduleQtn'];
		$_SESSION['scheduleHour'] = $hour = $_POST['scheduleHour'];
		$_SESSION['scheduleMinute'] = $minutes = $_POST['scheduleMinute'];
		# $_SESSION['scheduleMark'] = $_POST['scheduleMark'];
		
		/********************************************************************/
		
		$allQtn = $dbm->getFields($dbm->select("questions",array("code"=>$_SESSION['scheduleCos'],"year"=>$_SESSION['scheduleYear'],"qtype"=>$_SESSION['scheduleType'])),array("sn","code"));
		$_SESSION['allQtn'] = count($allQtn['sn']);
		
		/*********************************************************************/		 
		$_SESSION['scheduleSecs'] = $totsec = ($hour * 60 * 60) + ($minutes *60);
		/************************************************************************/
	 	
		if($_SESSION['scheduleType']==""){
				$sAlert = 	$awarn;	 
				$sdisplay = $disp_on; 
				$_SESSION['sMsg'] = " Select The Question Type  ";
		}
		else if($_SESSION['scheduleQtn']==""){
				$sAlert = 	$awarn;	 
				$sdisplay = $disp_on; 
				$_SESSION['sMsg'] = " Please Input The Maximum Question To Answer ";
		}
		else if(!is_numeric($_SESSION['scheduleQtn'])){
				$sAlert = 	$awarn;	 
				$sdisplay = $disp_on; 
				$_SESSION['sMsg'] = " Maximum Question Must Be a Number   ";
		}
		
		else if($_SESSION['scheduleQtn']>$_SESSION['allQtn']){
				$sAlert = 	$awarn;	 
				$sdisplay = $disp_on; 
				$_SESSION['sMsg'] = " Maximum Question Cannot Be More Than Available Questions   ";
		}
		else if($_SESSION['scheduleSecs'] < 59){
				$sAlert = 	$awarn;	 
				$sdisplay = $disp_on; 
				$_SESSION['sMsg'] = " Total Time Cannot Be Less Than a Minute   ";
		}
		/*else if($_SESSION['scheduleMark']==""){
				$sAlert = 	$awarn;	 
				$sdisplay = $disp_on; 
				$_SESSION['sMsg'] = " Please Input The Expected Total Marks ";
		}
		else if(!is_numeric($_SESSION['scheduleMark'])){
				$sAlert = 	$awarn;	 
				$sdisplay = $disp_on; 
				$_SESSION['sMsg'] = " Expected Total Marks Must Be a Number   ";
		}
		
		else if($_SESSION['scheduleMark']>100){
				$sAlert = 	$awarn;	 
				$sdisplay = $disp_on; 
				$_SESSION['sMsg'] = " Expected Total Marks Cannot Be More Than 100  ";
		}
		*/
		else {
			$sAlert = 	$asuccess;	 
				$sdisplay = $disp_on; 
				$_SESSION['sMsg'] = " Alright  ";
				$_SESSION['finStageThree'] = true;
		}
		 
	}
	
	/**********************************************************/
	// third stage of exam settings 
	
	// filterQuery studFilt
	
	if(isset($_POST['filterQuery'])){
		
  	 	$_SESSION['studFilt'] = $_POST['studFilt']; 
	 
	}
	/*********************************************/
	
	$studQuery = explode("_",$_SESSION['studFilt']);  		
	$userCourse = new Users_Courses(); 
	$allCourseStuds = $userCourse->getAll(array($studQuery[0]=>$studQuery[1],"code"=>$_SESSION['scheduleCos'],"year"=>$_SESSION['scheduleYear'])); 	

	/**************************************/
	 # Scheduling  student courses 
	 
	 if(isset($_POST['regCourses'])){
		 
		$uss  = count($_POST['userRegs']);
		 
		$dbm = new DbTool(); 
				
				for($n = 0; $n < $uss; $n++){
					// fetch info for student 
					$info = new User("users");
					$myInfo = $info->getAll(array('sn'=>$_POST['userRegs'][$n])); 
					/* user info fetched  */
					/**************************************/ 
					
					# search result 
					$where = array(
								"user_id"=>$myInfo['user_id'][0],
								"code"=>$_SESSION['scheduleCos'],
								"year"=>$_SESSION['courseYear'],
								"qtype"=>$_SESSION['scheduleType']);
							
					$myResult = $dbm->getFields($dbm->select("users_result",$where),
						 array("sn","code","year","qtype","paper_signal"));
																
						if(count($myResult['code'])==1){
							//  reschedule 
							 # update result 
								$updData = array(
								"currently"=>"off",
								"level"=>$myInfo['level'][0],								
								"total_qtn"=>$_SESSION['scheduleQtn'],
								"total_sec"=>$_SESSION['scheduleSecs'],
								"sec_used"=>0,
								"bus_stop"=>1,
								"unitscore"=>0,
								"paper_signal"=>"normal",								
								"totalscore"=>0,
								"percent"=>0); 
							 									
							$dbm->updateTb("users_result",$updData,$where);								
							// delete any existing question 
							   $dbm->deleteRow("qtn_remind",array("user_id"=>$myInfo['user_id'][0],"code"=>$_SESSION['scheduleCos'],"qtype"=>$_SESSION['scheduleType'],"year"=>$_SESSION['scheduleYear'])); 														
						}						
						else{		
							// insert 
							$data = array(
							"user_id"=>$myInfo['user_id'][0],
							"scheduledate"=>date('d - M - Y'),
							"currently"=>"off",
							"code"=>$_SESSION['scheduleCos'],
							"qtype"=>$_SESSION['scheduleType'],
							"year"=>$_SESSION['courseYear'],
							"total_qtn"=>$_SESSION['scheduleQtn'],
							"total_sec"=>$_SESSION['scheduleSecs'],
							"level"=>$myInfo['level'][0],							
							"paper_signal"=>"normal"
							);
							
							$dbm->insert("users_result",$data);							
						}
						  
					
				}  // end first loop 
		
	}	// end of course registration 
	
	 
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
                <div class="">
                    <div class="page-title">
                        <div class="title_left"> <form method="post">
                            <h3> <i class="fa fa-cogs fa-fw"> </i> &nbsp; Schedule Students   <small>For Their Assessment </small>
							&nbsp; <button class="btn btn-round btn-primary" name="cosplus"  id="cosplus"type="submit" title="Create New Course ">
							<i class="fa fa-wrench"> </i></button>
                </h3>
                </form>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                              
                              
                                <div class="input-group">
                                   
                                    <input type="text" class="form-control" placeholder="Search for..." name="searchText" value="<?php echo $_POST['searchText']?>">
                                    <span class="input-group-btn">
                            		<button class="btn btn-default" type="submit" name="searchCourse">Go!</button>
                       				</span>
                                </div> 
                                
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
				 
				 
			  <!-- *************************************************************************************************** -->
			 	<?php  if(isset($_SESSION['finStageOne']) && !isset($_SESSION['finStageTwo'])) {?>
				 <div class="row"> 
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel"> <form method="post" class="form">
                                <div class="x_title">  
                                    <h2> Step 1   ( Fetch Courses ) <small> Whose Questions Are Ready  </small> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 </h2>                                    
                                    <div class="clearfix"></div>
                                </div>
								
								<div class="x_content">
									<div class="col-sm-2 col-md-2 col-xs-4">
										<div class="form-group">
											<label> Select Course </label> 
											<select class="form-control select" name="scheduleCos" id="scheduleCos">
												<option value=""> ... </option>
												<?php 
												foreach($allCourses['code'] as $cos){
												?>
												<option value="<?php echo $cos; ?>"  <?php echo ($_SESSION['scheduleCos']==$cos)?"selected":""?>> <?php echo $cos; ?></option>
												<?php }?>
											</select>
										</div>  <!-- /. form-group-->
									
									</div> <!-- /. col-sm-2-->
									
									<div class="col-sm-2 col-md-2 col-xs-2">
										<div class="form-group">
											<label> Select year </label> 
											<select class="form-control select"  name="scheduleYear" id="scheduleYear">
												<option value=""> ... </option>
												<?php 
												for($y = 2015; $y<=date('Y'); $y++){
												?>  
												<option value="<?php echo $y; ?>" <?php echo ($_SESSION['scheduleYear']==$y)?"selected":""?>> <?php echo $y; ?></option>
												<?php }?>
											</select>
										</div>  <!-- /. form-group-->
									
									</div> <!-- /. col-sm-2-->
									
									<div class="col-sm-1 col-md-1 col-xs-2">
										<div class="form-group">
											<label> Start </label> <br/> 
											<button class="btn btn-primary" type="submit" name="finStep1" id="finStep1"> <i class="fa fa-search "> </i> </button>															
										</div>  <!-- /. form-group-->
									
									</div> <!-- /. col-sm-1-->
									
									<div class="col-sm-5 col-md-5 col-xs-5">
										<div class="form-group">
											 <br/> 
											<span class="btn <?php echo $fAlert;?>" <?php echo $fdisplay; // off or on ?>>  <?php print $_SESSION['fMsg']; ?>  </span>
											
										</div>  <!-- /. form-group-->
									
									</div> <!-- /. col-sm-5-->
									
								</div> <!-- /. x_content-->
								
								</form>
							</div> <!-- /. x_panel  -->
						</div>  <!--  /. col-sm-12 -->
						
						
				</div>	<!--  /. row   /. first  step -->
				
				<?php  } // haven completed stage one of exam settings ?>	
				
				<!-- *************************************************************************************************** -->
								
			 
				<?php   if(isset($_SESSION['finStageTwo']) && !isset($_SESSION['finStageThree'])) {?>
                    	
				 <div class="row"> <form method="post">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                <div class="x_title">  
                                    <h2> Step 2   ( Schedule Time ) <small><b> FOR &nbsp;  <?php echo  strtoupper($cosInfo['name'][0]." [ ". $cosInfo['code'][0] ." ]"."  ,  ".$cosInfo ['level'][0]."  level course ");  ?> </b> </small>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 </h2>                                    
                                    <div class="clearfix"></div>
                                </div>
								
								<div class="x_content">
								 
								 <div class="col-sm-4 col-md-4 col-xs-4">
									 
												<div class="col-sm-5"> 
												<h4> Paper Type :&nbsp; 	 </h4>
												</div>	
												
												<div class="col-sm-7"> 
													<select name="scheduleType" id="scheduleType" class="form-control" >
													<option value=""> .. </option>
													<?php foreach($_SESSION['paperTypes'] as $p) {?>	
														<option value="<?php echo $p; ?>" <?php echo ($_SESSION['scheduleType']== $p)?"selected":""?>> <?php echo $p; ?> </option>
													<?php } ?>
													</select>	
												</div>	 
											 
								 </div>
								 
								 <div class="col-sm-4 col-md-4 col-xs-4">
										 
												<div class="col-sm-8">
												<h4> Available Questions: </h4>
												</div>
												<div class="col-sm-4">
												<span class="btn btn-info"> <?php echo $_SESSION['allQtn']; ?>  </span> 
												</div>
											 
								 </div>
								 
								 <div class="col-sm-4 col-md-4 col-xs-4">
										 
												<div class="col-sm-8">
												<h4> Maximum Questions : </h4>
												</div>
												<div class="col-sm-4">
												<input type="text" name="scheduleQtn" id="scheduleQtn" value="<?php echo $_SESSION['scheduleQtn'];?>" class="form-control" style="width:79px;" /> 
												</div>
											 
								 </div>
								 
								 <div class="col-sm-12 col-md-12 col-xs-12"> <hr/> </div>
								 
								 
								  <div class="col-sm-8 col-md-8 col-xs-8">
										 
										 <div class="col-sm-3">
												<div class="form-group"> 
												<label> Hours:</label>												 
													<select name="scheduleHour" id="scheduleHour" class="form-control">
														<option> .. </option>	
													<?php for ($h = 0; $h < 5; $h++) {?>			
														<option value="<?php echo $h; ?> " <?php echo ($_SESSION['scheduleHour']==$h)?"selected":""?>> <?php echo $h."&nbsp; Hours"; ?> </option>
													<?php } ?>														
													</select>												
												</div>
										 </div>
												
										<div class="col-sm-3">
												<div class="form-group"> 
												<label> Minutes :</label>												 
													<select name="scheduleMinute" id="scheduleMinute" class="form-control">
														<option> .. </option>
													<?php for ($m = 0; $m < 60; $m++) {?>			
														<option value="<?php echo $m; ?> " <?php echo ($_SESSION['scheduleMinute']==$m)?"selected":""?>> <?php echo $m."&nbsp; Minutes"; ?> </option>
													<?php } ?>
													</select>				 								
												</div>
										 </div>
										
										 <div class="col-sm-3">
												<div class="form-group"> 
												<label> &nbsp; </label>	<br/>											 
													&nbsp; &nbsp; <button name="finStep2" id="finStep2" type="submit" class="btn btn-success"> Continue   <i class="fa fa-arrow-right"></i> </button>	
												</div>
										 </div>										 
									  
								 </div>  <!-- /. col-sm-8 -->
								 
								 <div class="col-sm-12 col-md-12 col-xs-12"> <hr/> </div>
								
								 <div class="col-md-4 col-sm-4 col-xs-4  navbar-left">                    
											<div class="form-group ">
												<button  type="submit" name="xStage2" id="xStage2" class="btn btn-default"> Back To Step 1 .. </button>...																								
												
												<button name="fetcher" id="fetcher" type="submit" class="btn btn-success hidden"> fetch    .. </button>		
												
											 </div> <!--/. form group-->
								</div> <!--/. col-md-8 -->
								
								<div class="col-sm-6 col-md-6 col-xs-6">										  
											<span class="btn <?php echo $sAlert;?>" <?php echo $sdisplay; // off or on ?>>  <?php print $_SESSION['sMsg']; ?>  </span>									 
									</div> <!-- /. col-sm-2-->
						 
								</div>  <!-- /. x_content --> 
								
								
							</div> <!-- /. x_panel  -->
						</div>  <!--  /. col-sm-12 -->
					 
						</form>
				</div>						<!--  /. row   /. second step -->
				
				<?php   } // haven completed stage two of exam settings ?> 
			  
			  <!-- *************************************************************************************************** -->
			   <?php   if(isset($_SESSION['finStageTwo']) && isset($_SESSION['finStageThree'])) {?>

			  <div class="row"> <form method="post">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                <div class="x_title">  
                                    <h2> Step 3  ( Select Users ) <small> <b> Who Will Do &nbsp; [ &nbsp; <?php echo $_SESSION['scheduleCos']."&nbsp &nbsp;".$_SESSION['scheduleType']; ?> &nbsp;]  <?php echo  strtoupper($cosInfo['name'][0]); ?></small>  </b>
									</h2>                                    
                                    <div class="clearfix"></div>
                                </div>
								
								<div class="x_content"> 
								
								<form method="post">
                	
					<div class="col-md-3 col-sm-3 col-xs-6">
                    	<div class="form-group">
                        	<label>Filter  Students By </label>
								<select class="form-control select" name="studFilt" id="studFilt">
									
									<optgroup label="Level">  
									<?php foreach($userLevels['level'] as $lev) {?> 
                                    	<option value="<?php echo "level_".$lev ?>" <?php echo ($_SESSION['studFilt']=="level_".$lev)?"selected":""?>> <?php echo $lev ?> </option>
                                     <?php }?>
                                    </optgroup>
                                    
								</select>
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-3 -->
                     
					
                    <div class="col-md-1 col-sm-1 col-xs-3">                    	
                    	<div class="form-group">
                        	<label><small>Go..&nbsp; </small></label> 
                        	<button class="btn btn-success" type="submit" name="filterQuery" id="filterQuery" title="Search"> <i class="fa fa-search"></i> </button>
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-1 -->
                    
                    
                   <div class="col-md-5 col-sm-5 col-xs-12">                    
                    	
						<div> <label class="btn <?php echo $msgAlert;?>"<?php echo $display; // off or on ?>> <span><i class="glyphicon <?php echo $tagSign; ?>"></i></span> <?php # print $_SESSION['saveMsg']; ?> </label> </div>
						
                    </div> <!--/. col-md-6 -->
                    
                    </form>
					 			</div>  <!-- /. x_content -->
								
							</div> <!-- /. x_panel  -->
						</div>  <!--  /. col-sm-12 -->
						
						</form>
				</div>	 <!-- /. row -->

			  
                    <div class="row"> <form method="post">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                <div class="x_title">  
                                    <h2> Total Users <small> <b> For [&nbsp;<?php echo $_SESSION['scheduleCos']."&nbsp;".$_SESSION['scheduleType']." ] In ".$studQuery[1]." Level ";?> </b></small> &nbsp;  (&nbsp;<?php echo count($allCourseStuds['user_id'])?>  ) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-success btn-round" name="regCourses" id="regCourses" type="submit"> <i> Schedule Selected Users </i></button>&nbsp;&nbsp; </h2>                                    
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content"> 
								
									<div class="col-sm-12 col-md-12 col-xs-12">
                                     <table id="example" class="table table-striped table-bordered responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" class="tableflat" onclick="selectAllUsers()">
                                                </th>
                                                <th> S/N </th>
												<th>Passport </th>                                               
                                                <th>Name </th>  
												<th>User_ID </th>                                               												
                                                <th>Level </th>
												<th>Scheduled </th>
												<th>Paper Status </th>
																											
                                            </tr>
                                        </thead>
									<!-- now list all courses available or searched -->
                                        <tbody>
                                             <?php $sn = 0; if(count($allCourseStuds['user_id'])>0)
									foreach($allCourseStuds['user_id'] as $studId ){ 											
											 $us = new User("users"); $myInfo =  $us->searchUser(array("user_id"=>$studId)); 
												
												$dbm = new DbTool();
												$myResult = $dbm->getFields($dbm->select("users_result",
											   array("user_id"=>$allCourseStuds['user_id'][$sn],"code"=>$_SESSION['scheduleCos'],"year"=>$_SESSION['courseYear'],
											   "qtype"=>$_SESSION['scheduleType'])),array("sn","code","year","qtype","paper_signal"));
																							 
											?>
											
                                            <tr class="odd pointer" title=" <?php echo " Department of ".$myInfo['department'][0]; ?> ">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="userRegs tableflat" name="userRegs[]" value="<?php echo $myInfo['sn'][0];?> ">
                                                </td>
                                                <td class=" "><?php echo $sn+1; ?> </td>
                                                <td class=" "><img class="img img-responsive img-thumbnail" src="<?php echo "../media/user_imgs/".$myInfo['passport'][0];  ?>" width="50" height="50" /> </td>												
												<td class=" "><?php echo $myInfo['surname'][0]."&nbsp;".$myInfo['firstname'][0];  ?> </td>												
												<td class=" ">	<?php echo $studId;  ?>	</td>                                               
                                                <td class=" "> <button type="button" class="btn btn-info btn-sm" title=" Level "> <?php echo $myInfo['level'][0];  ?>  </button> </td>												 
                                                <td class=" " align="center"><?php 
											   
												if( empty($myResult['code'])) 
												{ ?>
													<i class="fa fa-close red fa-2x" title=" Not Scheduled Yet "></i>
												<?php }
												else{ ?>
													<i class="glyphicon glyphicon-ok green fa-2x" title=" Already Scheduled  "></i>
												<?php }  ?>
											   </td>
											   <td> <span class="btn <?php if($myResult['paper_signal'][0]=="normal") echo "btn-success"; if($myResult['paper_signal'][0]=="process") echo "btn-warning"; if($myResult['paper_signal'][0]=="done") echo "btn-primary";?>"><?php echo $myResult['paper_signal'][0];?> </span></td>
                                            </tr> 
                                            <?php $sn++; } else { ?>
											<tr>
												<td colspan="8">No Student Has Registered for the course </td>
											</tr>
											<?php } ?>
                                        </tbody>
                                    </table>
								</div> <!-- /. col-sm-12 -->
								
								
					<div class="col-sm-12"> <hr/></div>
					
							 <div class="col-md-4 col-sm-4 col-xs-4  navbar-left">                    
													<div class="form-group ">
														<button  type="submit" name="xStage3" id="xStage3" class="btn btn-default " > Back  To Step 2.. </button>																																				
													</div> <!--/. form group-->
							</div> <!--/. col-md-4 -->
							
								
					</div> <!-- /. x_content -->
								
                 </div> <!--  /. x_panel-->
							  
                        </div> <!-- col-md-12 -->
</form>
                        <br />
                        <br />
                        <br />

                    </div> <!-- /. row -->
					
					
			<?php  } // haven completed stage three of exam settings ?> 				
			<!-- *************************************************************************************************** -->
			 
                  
                     <form method="post">
                        
                   <input type="hidden" name="cosmods" id="cosmods" value="" />
                     <input type="submit" name="subMods" id="subMods" value="submit mods " style="visibility:hidden;"/> <!-- keep other inputs -->
                                        </form>
                    <!-- footer content -->
                <footer>
                    <div class="">
                        <p class="pull-right">Hamdala Komputer Konsults. 2016 |
                            <span class="lead"> <i class="fa fa-paw"></i> HKK!</span>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
                    
                </div>
                <!-- /page content -->
            
		</div> <!-- /. main_container -->
	
	</div> <!-- /. container body -->
	 
    <script> 
	
		$(function(){
				
					$("#regCourses,#delCourses").hide(50); 
								
				// changing of student selection filter 
						
				/***********************************************************/
				$('#scheduleType').on('change',function(){
					$('#fetcher').click();
				}); 
		
			/***********************************************************/
				$('.userRegs').on('click',function(){
					totU = $('input[name="userRegs[]"]:checked').length; 	
					 	if(totU > 0) $('#regCourses').show('slow');
						else $('#regCourses').hide('slow');
				});
		/**************************************************/
		
			/// deleting courss for selected users 
			
			$('#delCourses').on('click',function(){
				
				return confirm("Are you sure you want to delete all the courses for these selected users ");
				
			});
		
		/**********************************************************/
		// searching student filtered
			// studFilt  filterQuery
			$('#studFilt').on('change',function(){
					$('#filterQuery').click();
				}); 
		
			});
					
					
/*******************************************/
	function selectAllUsers(){
		elem=document.getElementsByName("userRegs[]");
		for(i=0; i< elem.length; i++){
		if(elem[i].type='checkbox') 
		elem[i].click()};		
		// 				
	}

/*******************************************/
	function selectAllCourses(){
		elem=document.getElementsByName("cosRegs[]");
		for(i=0; i< elem.length; i++){  
		if(elem[i].type='checkbox') 
		elem[i].click()};		
		// 				
	}	
	
	/***********************************************/
	function radioChanged(){
		
		alert('yes'); 
	}
	
	</script>
		
	<?php include "../media/links/foot_libraries.html"; ?>
	  	
        
            
     
</body>

</html>