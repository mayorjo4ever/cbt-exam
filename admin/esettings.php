<?php 

	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";		
	
	if(!isset($_SESSSION)) session_start(); 
	
	require "../media/php/User.php";	
	
	$admin = new User("admin");		
	if(!$admin->confirmLogin('adminUser')) $admin->logout('adminUser','../'); 
	 /*************************************************************************/	
	 $_SESSION['adminInfo'] = $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	
	/*********************************************************************************/	
	require "../media/php/Course.php";	 
	require "../media/php/timecoder.php";	
	require "../media/php/Users_Courses.php";		  
	/*********************************************************************************/	
	 #  session_destroy(); session_start(); 

	$bi = new  Institute_info();
	
	$_SESSION['page_title'] = $bi->institutename; 		
	
	/*********************************************/
		
	$queries =  new DbTool(); 
	
	$userLevels = $queries->getDistinctLevel("users"); 
	
	/*************************************/
	$courses = new Course(); 
		$allCourses = $courses->getAll(array()); 
		//  multiDistinct(array $field,$table,array $where,$order="")
		// select_Multi_Distinct(array $field,$table,array $where,$order="", $operator = "AND")
		$papers = $queries->getFields($queries->select_Multi_Distinct(array("code","qtype"),"questions",array("year"=>$_SESSION['scheduleYear']),array("code")),array("code","qtype"));
		
		// set paper date 
		if(!isset($_SESSION['paperDate'])) $_SESSION['paperDate'] = date('m/d/Y');
	/**********************************************************************/
	
	// get the mode of scheduling  exams for student 
	
	if(isset($_POST['setMode'])){
		$_SESSION['setMode'] = $_POST['setMode']; // either new mode or adding students to existing mode 
	}
	
	if(isset($_POST['xsetMode'])){
		unset($_SESSION['setMode']);  // cancel the setMode 
	}
	
  	
	/********* get details of subject picked  *********************/
	
		## get all subjects posted for schedule  
		if(isset($_POST['setup'])){	
		
			if(!isset($_SESSION['paperTemp']))  $_SESSION['paperTemp'] = $_POST['paperTemp'] = "multi"; 	
				else $_SESSION['paperTemp'] = $_POST['paperTemp']; 
				
				if(!isset($_SESSION['scheduleYear']))  $_SESSION['scheduleYear'] = date('Y'); 	
					else $_SESSION['scheduleYear'] = $_POST['scheduleYear']; 
	
				$_SESSION['mycourse']  = $_POST['singlecourse']; 	
				$_SESSION['scheduleHour'] = $hour = $_POST['scheduleHour'];
				$_SESSION['scheduleMinute'] = $minutes = $_POST['scheduleMinute']; 
				$_SESSION['scheduleSecs'] = $totsec = ($hour * 60 * 60) + ($minutes *60);
				$_SESSION['paperTitle'] = $_POST['paperTitle']; 
				$_SESSION['scheduleYear'] = $_POST['scheduleYear'];  
				$_SESSION['paperTemp'] = $_POST['paperTemp']; 
				$_SESSION['paperDate'] = $_POST['paperDate'];
						
				$ecos = null;
				$qties = null;				
				// check template				
				if($_SESSION['paperTemp'] == "single"){
					if($_POST['singlecourse']!="")
					$ecos[] = $_POST['singlecourse']; ///  singlecourse  ;					
				}
				else if($_SESSION['paperTemp'] == "multi"){
					for($m = 0; $m<count($papers['code']); $m++){				
						if($_POST['pap_'.$m]!=""){
							$ecos[] = $_POST['pap_'.$m];										
						} 
					} // tracked all selected courses 
				}
				
				/************ get the cos infos  *****************************/
					// 0 = index, 1 = code, 2 = type, 3 = year, 4 = max qttn
					// so now split 
					if(!is_null($ecos)){ $i = 0; 
						foreach($ecos as $pap){							
							$infos = explode("_",$pap); 
							$eachMax = 0; 
							if($_POST['pmaxQ'.$infos[0]]=="" || $_POST['pmaxQ'.$infos[0]] > $infos[4]) $_POST['pmaxQ'.$infos[0]]= $infos[4];
							$qties[] =  $_POST['pmaxQ'.$infos[0]];
							// $qties[] =  ($_POST['pmaxQ'.$infos[0]]=="")?$infos[4]:$_POST['pmaxQ'.$infos[0]];							
						}					
					}
				 /****************************************************************/
				
				/// validate inputs 
				if($_SESSION['scheduleYear']==""){ // error for year 
						$_SESSION['alt'] = "error"; $_SESSION['infoMsg']= " Select The Year"; 
				}
				else if($_SESSION['paperTitle']==""){ // error for paper title
					$_SESSION['alt'] = "error"; $_SESSION['infoMsg']= " Enter  Paper Title.."; 
				}
				else if($_SESSION['scheduleSecs'] < 119){
					$_SESSION['alt'] = "error"; $_SESSION['infoMsg'] = " Total Time Cannot Be Less Than Two Minutes ";				
				}
				else if(empty($ecos) || is_null($ecos)){
					$_SESSION['alt'] = "error"; $_SESSION['infoMsg'] = " You have not selected any paper for assessmemt ";
				}
				else if($_SESSION['paperTemp'] == "multi" && count($ecos)<=1){
					 $_SESSION['alt'] = "error"; $_SESSION['infoMsg'] = " \n Multi-Papers selected  must be more than 1  ";	
				}
				else {
					$_SESSION['ecos'] = $ecos;
					$_SESSION['eqty'] = $qties;		
					$dateString = explode("/",$_SESSION['paperDate']); 
					//
					// create new coscode
						$temp = explode(" ",$_SESSION['paperTitle']);						 
						$sub = $_SESSION['scheduleYear']."_cbt_";
						foreach($temp as $tm){
							$sub.= substr($tm,0,4)."_";
							}
							$_SESSION['paperTempCode'] = strtolower($sub.$dateString[0]."".$dateString[1]."_".rand(99,999));
				 
					
					$_SESSION['alt'] = "ok"; $_SESSION['infoMsg'] = " \n ".count($ecos)." courses selected with total of ".array_sum($qties)." questions ";	
					header("Location:esettings2.php"); 
				}				
		}
	
	 /*********************************************/
	  
	  
	  // modifying schedules  
	  
	  if(isset($_POST['schedule_update'])){
		  
		  $dbm = new DbTool(); 
		  
		  $upds = explode("-",$_POST['schedule_update']); 
		  
		  $codeInfo = $dbm->getFields($dbm->select("epanel",array("codegen"=>$upds[0],"year"=>$upds[1])),array("sn","codegen","title","year","total_sec","state")); 
		  
		  $coses = $dbm->getFields($dbm->select("esource",array("codegen"=>$upds[0],"year"=>$upds[1])),array("sn","code","qtype","year","codegen","total_qtn"));
		  
		  $_SESSION['paperTempCode'] = $upds[0]; 
		  $_SESSION['scheduleYear'] = $upds[1];
		  $_SESSION['paperTitle'] = $codeInfo['title'][0]; 
		  $_SESSION['scheduleSecs'] = $codeInfo['total_sec'][0]; 
		  
		  $_SESSION['ecos'] = $_SESSION['eqty'] = array(); 
		  
		  // 0 = index, 1 = code, 2 = type, 3 = year, 4 = max qttn
		  
		  $k = 0; 
		  foreach($coses['code'] as $cd){
			  $arr = $k."_".$cd."_".$coses['qtype'][$k]."_".$codeInfo['year'][0]."_".$coses['total_qtn'][$k];
			  $_SESSION['ecos'][] = $arr;
			  $_SESSION['eqty'][] = $coses['total_qtn'][$k];
			  $k++;
		  }
		  
		  header("Location:esettings2.php"); 
		  
		  
														
		  
	  }
	  
	  
	?> 
<!DOCTYPE html>
<html lang="en">

<head>
    
    <title> <?php ?></title>    
	
	<?php require "../media/links/top_libraries.html";?>

	<?php //  include "../media/php/FileReader.php";?>
	
</head>

<body class="nav-md">
	 <form method="post" class="form">
					
<!--********************* MODALS ************************************************ -->
 <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
      <div class="modal-dialog modal-sm" >
        <div class="modal-content">
          <div class="modal-header">
            <!-- <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>-->
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"> <i class="fa fa-close red "></i> </button>
            <label class="modal-title" id="myModalLabel"> Message </label>
          </div>
          <?php if($_SESSION['alt']== "error") {?>
		  <div class="modal-body red" style="text-align:center;">
			 <i class="fa fa-warning fa-2x"> </i> &nbsp; 
			<?php echo $_SESSION['infoMsg'] ; ?> 
			<p> &nbsp;  </p>
			<center>
			 <button type="button" class="btn btn-default green" data-dismiss="modal">Ok</button> 
			 </center>
			 <p> &nbsp;  </p>
          </div>
		  <?php } else if($_SESSION['alt']=="ok"){ ?>
		  <div class="modal-body green" style="text-align:center;">
			 <i class="glyphicon glyphicon-ok fa-2x"  ></i>
			<?php echo $_SESSION['infoMsg']; ?> 
			<p> &nbsp;  </p>
			<center>
			 <button type="button" class="btn btn-default green" data-dismiss="modal">Ok</button> 
			 </center>
			 <p> &nbsp;  </p>
          </div>
		  <?php }?>
           
		  
        </div>
      </div>
    </div>
						
<!--**************************************************************************************************************** -->
		



    <div class="container body">

        <div class="main_container">
			
           <!-- left bar links -->
            
            <?php include "../media/links/leftbar.php"; ?>

            <?php include "../media/links/top_navigation.php";?>
	
			<?php # include "../media/links/page_content.php";?>
           
		   <!-- showing pop messages  -->
		   <div class="row text-center" style="display:none;">										
					<a href="#" id = "showPop" class="btn btn-sm btn-danger" data-toggle="modal" data-target="#basicModal">Click to open Modal</a>
			</div>
        	 
            <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left">  
									<h3> <i class="fa fa-cogs fa-fw"> </i> &nbsp; Schedule Students   <small>For Their Assessment </small>
									&nbsp; <button class="btn btn-round btn-primary" name="cosplus"  id="cosplus"type="submit" title="Create New Course ">
									<i class="fa fa-wrench"> </i></button>
									</h3>
									<input type="hidden" name="stg1Alert" id="stg1Alert" value="<?php echo $_SESSION['infoMsg'];?>" />
				 
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
					
					 
					<div class="row"> 
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							<?php  if(!isset($_SESSION['setMode'])){ ?>
							
							<div class="x_panel">
								 <div class="x_title">  
                                    <h2> HOW DO YOU WANT TO SCHEDULE THE EXAMINATION ? 
									
									 </h2>                                    
                                    <div class="clearfix"></div>
                                </div>
								
								<div class="x_content">
									
									<div class="col-sm-4 col-md-4">
										<div class="panel panel-warning">
											<div class="panel-heading"> <label> From Existing Schedule </label></div>
											<div class="panel-body "> 
												<p class="text-center">
													In this schedule, you will be able to view all list of scheduled papers, and if you need to modify any student, papers or add more student to the schedule, pemission is granted as an administrator. 
												</p>
												<p> <button class="btn btn-warning btn-block"  name="setMode" value="old"> Existing Schedule &nbsp; <i class="fa fa-sign-in"></i></button> </p>
											</div>
										</div>
									</div>
									
									<div class="col-sm-4 col-md-4">
										<div class="panel panel-success">
											<div class="panel-heading"> <label>New Schedule :  <?php echo $_SESSION['setMode'];?> </label> </div>
											<div class="panel-body"> 
												<p class="text-center">
													In this schedule, all subjects whose questions are ready will be displayed, timing will be scheduled and any students you wished to add will be scheduled to take the paper. <br/><br/>
												</p>
												<p> <button class="btn btn-success btn-block" name="setMode" value="new"> New Schedule &nbsp; <i class="fa fa-sign-in"></i></button> </p>
											</div>
										</div>
									</div>
								
								</div> <!-- /. x_content -->
							
							</div> <!-- /. x_panel -->
							
							<?php  } // close setMode dialogs ?>
							
							
							<?php // WHEN THE SETMODE METHOD IS = NEW 
								if($_SESSION['setMode']=="new"){ ?>
							 
							
                            <div class="x_panel">
                                
								<div class="x_title">  
                                    <div class="col-md-9">
										<h2>NEW SCHEDULE : NOW FETCH QUESTIONS  &nbsp;&nbsp;&nbsp;
									 </h2>
									</div> 
									 <div class="col-md-3">
										<div class="nav navbar-right">
											<button class="btn btn-default" name="xsetMode"> <i class="fa fa-arrow-left"></i> Back  </button>
										</div>
									</div> 
									                                    
                                    <div class="clearfix"></div>
                                </div>
								
								<div class="x_content">
									<div class="panel panel-success">
										<div class="panel-heading">
											<label> Set The New Schedule Here </label>
										</div>
									<div class="panel-body">
									<div class="col-sm-3 col-md-3 col-xs-6  bg-gray">
										<div class="form-group">
											<span class="fa fa-folder-open fa-5x"></span> <br/>
											<label class="font-18" style="<?php echo ($_SESSION['paperTemp']!='multi')?"color:#ccc;":""; ?>">  <input checked type="radio" class="green font-16"  name="paperTemp" id="paperTemp" value="multi" <?php echo ($_SESSION['paperTemp']=="multi")?"checked":""?> />  Multi-Subject in One Sitting </label>
										</div>  <!-- /. form-group-->
									
									</div> <!-- /. col-sm-2-->
									
									<div class="col-sm-3 col-md-3 col-xs-6">
										<div class="form-group">
											<span class="fa fa-folder fa-5x"></span>  <br/>
											<label class="font-18" style="<?php echo ($_SESSION['paperTemp']!='single')?"color:#ccc;":""; ?>"/> <input type="radio" class="green font-16" name="paperTemp" id="paperTemp" value="single" <?php echo ($_SESSION['paperTemp']=="single")?"checked":""?>/> Single-Subject in One Sitting </label>
										</div>  <!-- /. form-group-->
									</div> <!-- /. col-sm-2-->
								 	  
								<div class="col-sm-12 col-md-12"> <hr/> </div>
								<div class="clearfix"></div>
								
								
								<!-- second form menu -->
								
								<div class="col-md-12 col-sm-12 col-xs-12"> 
							  
                                <div class="x_title">  
                                    <h2> SET PAPER TITLE AND TIME &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 </h2>                                    
                                    <div class="clearfix"></div>
                                </div>
								
									<div class="col-sm-2 col-md-2 col-xs-6">
										<div class="form-group">
											<label> Select year </label> 
											<select class="form-control select success"  name="scheduleYear" id="scheduleYear" onchange="resemble()">
												<option value=""> ... </option>
												<?php 
												for($y = 2015; $y<=date('Y'); $y++){
												?>  
												<option value="<?php echo $y; ?>" <?php echo ($y==$_SESSION['scheduleYear'])?"selected":""?>> <?php echo $y; ?></option>
												<?php }?>
											</select>
										</div>  <!-- /. form-group-->
									</div> <!-- /. col-sm-2-->									
								
									<div class="col-sm-2">
												<div class="form-group"> 
												<label> Paper Title :</label>												 
													<input type="text" name="paperTitle" id="paperTitle" value="<?php echo $_SESSION['paperTitle']; ?>" class="form-control" />
												</div>
								    </div>
								 
									<div class="col-sm-2">
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
												
										<div class="col-sm-2">
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
										 
										 <div class="col-sm-2">
												<div class="form-group"> 
												<label> Date To be done :</label>												 
													<input type="text" name="paperDate" id="paperDate" value="<?php echo $_SESSION['paperDate']; ?>" class=" form-control" />
												</div>
										</div>
										 
									<div class="col-sm-12 col-md-12"> <hr/> </div>
								<div class="clearfix"></div>
								
									 
						</div>  <!--  /. col-sm-12 -->
								
								<!-- /. end second form menu -->
								
								<div class="x_title">
									 <h2> NOW  SELECT  COURSES    &nbsp; &nbsp; &nbsp; &nbsp; 
											<button type="submit" name="setup" id="setup" class="btn btn-success"> Continue <i class="fa fa-step-forward"></i></button>		
											&nbsp; &nbsp; <?php if(!empty($_SESSION['infoMsg'])){?> <label class="alert <?php echo ($_SESSION['alt']=="ok")?"alert-success":"alert-danger";?> font-14"> <?php echo $_SESSION['infoMsg'];  ?></label><?php } ?>
									 </h2>                                    
                                    <div class="clearfix"></div>
								</div>
								 
								<div  class="col-sm-6 col-md-6 panel-info">
									<table class="table table-bordered tableflat table-responsive" >
										<thead>
											<tr> 
												<th> S/N</th>												 
												<th> COURSE </th>
												<th> TYPE </th>
												<th> Av-Qtn </th>
												<th> MAX-Qtn </th>
											</tr>
										</thead>
										
										
										<tbody>
											<?php $n=0; foreach($papers['code'] as $coses){ 
												$tqtn = $queries->getFields($queries->select("questions",array("code"=>$coses,"qtype"=>$papers['qtype'][$n],"year"=>$_SESSION['scheduleYear'])),array('code','qtype'));
												
											?>
											<tr > 
												<td><?php print $n+1; ?></td>
												<td style="width:30%;" title="<?php echo 'Subject '.$n+1; ?>"> <?php if($_SESSION['paperTemp']=="single"){?>   <label>
												  <input type="radio" class="radio flat" name="singlecourse" value="<?php echo  $n."_".$coses."_".$papers['qtype'][$n]."_".$_SESSION['scheduleYear']."_".count($tqtn['code']); ?>" <?php echo ($_SESSION['mycourse']==$n."_".$coses."_".$papers['qtype'][$n]."_".$_SESSION['scheduleYear']."_".count($tqtn['code']))?"checked":""?> />
													 &nbsp;&nbsp; <?php  print $coses;  ?> </label>
												<?php 
													}
													  else if($_SESSION['paperTemp']=="multi") { // multi paper
													?> 	<label>
													<input type="checkbox" class="checkbox flat" name="<?php echo "pap_".$n; ?>" value="<?php echo  $n."_".$coses."_".$papers['qtype'][$n]."_".$_SESSION['scheduleYear']."_".count($tqtn['code']); ?>" <?php echo ($_POST['pap_'.$n] == $n."_".$coses."_".$papers['qtype'][$n]."_".$_SESSION['scheduleYear']."_".count($tqtn['code']))?"checked":""; ?> />
														&nbsp;&nbsp; <?php  print $coses;  ?>  </label> 
													<?php } ?>
												 </td>
												<td> <?php  print $papers['qtype'][$n];  ?></td>
												<td> <?php  print count($tqtn['code']);  ?> </td>
												<td> <input type="text" name="<?php echo "pmaxQ".$n;?>" value="<?php echo $_POST['pmaxQ'.$n];?>" class="form-control" style="width:60px;" placeholder=" "/> </td>
											</tr>
											<?php $n++; }?>
										</tbody>									
									</table>
								</div>
								
									</div> <!-- /. panel-body-->
									
									</div> <!-- /. panel-success -->
								
								</div> <!-- /. x_content-->								
							 
							</div> <!-- /. x_panel  -->
							<?php } /// END OF NEW MODE METHOD ...  ?>
							
							<?php // WHEN THE SETMODE METHOD IS = NEW 
								if($_SESSION['setMode']=="old"){ ?>
								
								<div class="x_panel">
									<div class="x_title">  
										<div class="col-md-9">
											<h2>EXISTING SCHEDULE : UPDATES  &nbsp;&nbsp;&nbsp;
										 </h2>
										</div> 
										 <div class="col-md-3">
											<div class="nav navbar-right">
												<button class="btn btn-default" name="xsetMode"><i class="fa fa-arrow-left"></i>  Back  </button>
											</div>
										</div> 
                                    <div class="clearfix"></div>
									</div>
									
									<div class="x_content">
										
										<div class="col-md-8 col-sm-8"> 
											 <div class="panel panel-warning"> 
												<div class="panel-heading"> 
													<label>Select any of the schedules below </label>
												</div>
												<div class="panel-body"> 
													
													<ul class="list-unstyled timeline widget">
														<?php // get all the paperTempCodes													 
														$dbm = new DbTool(); 
														
														$allCodes = $dbm->getFields($dbm->select("epanel",array("")),array("sn","codegen","title","year","total_sec","state")); 
														
														// if exist : display them 
														
														if(!is_null($allCodes)){ $m=0; 
															foreach($allCodes['title'] as $titles){ 
																	
																	$eachstuds = $dbm->getFields($dbm->select("users_result",array("codegen"=>$allCodes['codegen'][$m],"year"=>$allCodes['year'][$m])),array("sn","user_id"));
																	
																	$eachcoses = $dbm->getFields($dbm->select("esource",array("codegen"=>$allCodes['codegen'][$m],"year"=>$allCodes['year'][$m])),array("sn","code","qtype","year","codegen","total_qtn"));
															?>
																	
														<li>
															<div class="block">
																<div class="block_content">
																	<h2 class="title bold text-capitalize">
																		<a> <?php echo $titles; ?> </a>
																	</h2>
																	<div class="byline bold"> <br/>
																		  <span> <?php echo $allCodes['codegen'][$m]; ?> </span> &nbsp;&nbsp; &nbsp; Time :   <a > <?php echo readTime($allCodes['total_sec'][$m]); ?> </a> 
																																				  
																	</div>
																	
																	<p class="text-capitalize excerpt bold blue"> <br/>
																		Users  : <span class="badge"> <?php echo count($eachstuds['user_id'])."  "; ?></span> Students
																	</p>
																	<p class="text-capitalize excerpt bold black"> 
																		Subjects Combination : <br/>
																		
																		<?php ?>
																		<table class="table jambo_table" style="min-width:60%; max-width:80%;">
																			<?php $p= 0; foreach($eachcoses['code'] as $ncode){  ?>
																			<tr>
																			<td> <?php echo $ncode."&nbsp; &nbsp;".$eachcoses['qtype'][$p]. ",&nbsp with &nbsp;".$eachcoses['total_qtn'][$p]." questions";   ?></td>	
																				
																			</tr>
																			<?php $p++; }?>
																		</table>
																		
																	</p>
																	
																	<p> <button class="btn btn-warning" name="schedule_update" value="<?php echo $allCodes['codegen'][$m]."-".$allCodes['year'][$m]; ?>" <?php echo ($allCodes['state'][$m]=="done")?" disabled ":"";?>> Update Schedule </button> &nbsp; Note: Paper State is : <?php echo $allCodes['state'][$m]; ?></p>
																	
																</div>
															</div>	
														</li>
															<?php $m++; }
														}
														else{ ?>
															
															<li>
															<div class="block">
																<div class="block_content">
																	<h2 class="title bold text-capitalize">
																		<a>  No Schedule Available </a>
																	</h2>
																	<div class="byline bold">
																		  <span> empty record  </span> 
																	</div>
																	<p> Click <span class="badge">  Back </span> Button above and Create   New Schedule </p>
																</div>
															  </div>
															</li>
																	
														<?php }
														
													?>
													</ul>
												</div>
											 </div>
											 
										</div> <!-- /. col-md-6 -->
									
									</div>
								</div>
								
								<?php 
								
								} // END COLLECTION OF EXISTING SCHEDULE
								?>
							
						</div>  <!--  /. col-sm-12 -->
						
						
				</div>	<!--  /. row   /. first  step -->  
			  <!-- *************************************************************************************************** -->
		           
                        
                   <input type="hidden" name="cosmods" id="cosmods" value="" />
                     <input type="submit" name="subMods" id="subMods" value="submit mods " style="visibility:hidden;"/> <!-- keep other inputs -->
                                         
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
            });
		
			
				// changing of student selection filter 
			
				$(function(){
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
			
			/***********************************/
			// auto click showPop	
			stg1Pop = $('#stg1Alert').val(); 
			if(stg1Pop !="") $('#showPop').click();	
			/**********************************************************/
		// searching student filtered
			// studFilt  filterQuery
			$('#studFilt').on('change',function(){
					$('#filterQuery').click();
				}); 
		
		/////////////////////////////////////////
		// auto click showPop	
			stg1Pop = $('#stg1Alert').val(); 
			if(stg1Pop !="") $('#showPop').click();	
		/************************************/
		/// navigating multi and single subj template 
			$("input#paperTemp[type=radio]").on('change',function(){
				// alert($(this).val());
				var temp = $(this).val();
				$("#setup").click(); 
				});	
		
			});
					
		
					
		function resemble(){$("#setup").click();}
					
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
	
	$(function(){
				
			// calendar
			 $('#paperDate').datepicker();
		/******************************************/
			///
		});
	
	</script>
		
	<?php include "../media/links/foot_libraries.html"; ?>
	  	
        
   </form>         
     
</body>

</html>