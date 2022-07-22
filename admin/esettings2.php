<?php 

	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";	
		require "../media/php/timecoder.php";
	
	if(!isset($_SESSSION)) session_start(); 
	
	require "../media/php/User.php";	
	$admin = new User("admin");		
	if(!$admin->confirmLogin('adminUser')) $admin->logout('adminUser','../'); 
	 /*************************************************************************/	
	 $_SESSION['adminInfo'] = $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	 
	require "../media/php/Course.php";	 
	
	require "../media/php/Users_Courses.php";		  
	 
	 #  session_destroy(); session_start(); 

	$bi = new  Institute_info();
	
	$_SESSION['page_title'] = $bi->institutename; 		
	
	/******************************************************************************/	 
	/*************************************/ 
	   if(!isset($_SESSION['studFilt'])) $_SESSION['studFilt'] = "level_2016 PRE NCE";
	//  if(!isset($_SESSION['courseYear'])) $_SESSION['courseYear'] = date('Y'); 
	   
	 /***********************************************/
	 $queries =  new DbTool(); 
	
	 $userLevels = $queries->getDistinctLevel("users"); 
	
	 /*************************************/
	$courses = new Course(); 
		// $allCourses = $courses->getAll(array()); 
		//  multiDistinct(array $field,$table,array $where,$order="")
		// select_Multi_Distinct(array $field,$table,array $where,$order="", $operator = "AND")
		// $papers = $queries->getFields($queries->select_Multi_Distinct(array("code","qtype"),"questions",array("year"=>$_SESSION['scheduleYear']),array("code")),array("code","qtype"));
	/**********************************************************************/
	/*********************************************/
	 
	if(isset($_POST['xStage2'])){	
		header("Location:esettings.php");
	}
	/*****************************************/
	  
	
	if(isset($_POST['filtStuds'])){
		
  	 	$_SESSION['studFilt'] = $_POST['studFilt']; 
	 
	}
	/*********************************************/
	
	$studQuery = explode("_",$_SESSION['studFilt']);  		
	
	$students = new User("users"); 
	
	$allCourseStuds =   $students->searchUser(array($studQuery[0]=>$studQuery[1])); 
	 
	 /**************************************/
	 # Scheduling  student courses 
	 
	 
	 if(isset($_POST['regCourses'])){
		 
		$uss  = count($_POST['userRegs']);
		 
		$dbm = new DbTool(); 
				
				if(!empty($uss)){
				
				for($n = 0; $n < $uss; $n++){
					// fetch info for student 
					$info = new User("users");
					$myInfo = $info->getAll(array('sn'=>$_POST['userRegs'][$n])); 
					/* user info fetched  */
					/**************************************/ 
					
					# search result 
					$where = array(
								"user_id"=>$myInfo['user_id'][0],
								"codegen"=>$_SESSION['paperTempCode'],
								"year"=>$_SESSION['scheduleYear']);
							
						 $myResult = $dbm->getFields($dbm->select("users_result",$where),
						 array("sn","codegen","year","paper_signal"));
																
						if(count($myResult['codegen'])==1){
							 # reschedule 
							 # update result 
								$updData = array(
								"currently"=>"off",
								"level"=>$myInfo['level'][0],	
								"total_qtn"=>array_sum($_SESSION['eqty']),
								"total_sec"=>$_SESSION['scheduleSecs'],
								"sec_used"=>0,
								"bus_stop"=>1,
								"unitscore"=>0,
								"paper_signal"=>"normal",								
								"totalscore"=>0,
								"percent"=>0); 
							 									
							$dbm->updateTb("users_result",$updData,$where);								
							// delete any existing question 
				 		   $dbm->deleteRow("qtn_remind",array("user_id"=>$myInfo['user_id'][0],"codegen"=>$_SESSION['paperTempCode'],"year"=>$_SESSION['scheduleYear'])); 														
						}						
						else{		
							// insert 
							$data = array(
							"user_id"=>$myInfo['user_id'][0],
							"scheduledate"=>date('d - M - Y'),
							"currently"=>"off",
							"codegen"=>$_SESSION['paperTempCode'],
							"title"=>$_SESSION['paperTitle'],							
							"year"=>$_SESSION['scheduleYear'],	
							"total_qtn"=>array_sum($_SESSION['eqty']),
							"total_sec"=>$_SESSION['scheduleSecs'],
							"level"=>$myInfo['level'][0],							
							"paper_signal"=>"normal"
							);
							
						// save students paper record	
					 	$dbm->insert("users_result",$data);	
						
						} // end else 
				}  // end first loop 
			
			///	save epanel data record
					// check the epanel if any of such schedule exists
						$exsteP = $dbm->getFields($dbm->select("epanel",array("codegen"=>$_SESSION['paperTempCode'],"year"=>$_SESSION['scheduleYear'])),array("codegen","year","title"));
						
						  $epanelData = array(
							"codegen"=>$_SESSION['paperTempCode'],
							"title"=>$_SESSION['paperTitle'],							
							"year"=>$_SESSION['scheduleYear'],
							"state"=>"draft",
							"total_sec"=>$_SESSION['scheduleSecs']
							);
							
							if(is_null($exsteP)){
								$dbm->insert("epanel",$epanelData);
								// save all source questions
								$f = 0;
								 foreach($_SESSION['ecos'] as $scos) {
									 $code = explode("_",$scos)[1]; 
									 $qtype = explode("_",$scos)[2];
									 $tqtn = $_SESSION['eqty'][$f]; 
									 $max_qtn = explode("_",$scos)[4];
									 
									 $dbm->insert("esource",array("code"=>$code,"qtype"=>$qtype,"year"=>$_SESSION['scheduleYear'],"codegen"=>$_SESSION['paperTempCode'],"total_qtn"=>$tqtn,"max_qtn"=>$max_qtn));
									 $f++;							
								 }
						
						}
			
			
			} /// end not empty 
			
			
		
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
			<p>&nbsp;   </p>
			<center>
			 <button type="button" class="btn btn-default green" data-dismiss="modal">Ok</button> 
			 </center>
			 <p>&nbsp;   </p>
          </div>
		  <?php } else if($_SESSION['alt']=="ok"){ ?>
		  <div class="modal-body green" style="text-align:center;">
			 <i class="glyphicon glyphicon-ok fa-2x"  ></i>
			<?php echo $_SESSION['infoMsg']; ?> 
			<p>&nbsp;   </p>
			<center>
			 <button type="button" class="btn btn-default green" data-dismiss="modal">Ok</button> 
			 </center>
			 <p>&nbsp;   </p>
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
					 
			  
			  <!-- *************************************************************************************************** -->
			   
			  <div class="row">  
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                <div class="x_title">  
									<div class="col-md-9">
										<h2> Step 2 ( Courses Select ) <small> <b> for &nbsp; [ &nbsp; <?php echo $_SESSION['paperTitle']." "; ?> &nbsp;] &nbsp &nbspare </small>  </b>
										</h2> 
									</div>	
									<div class="col-md-3 navbar-right">
										<button  type="submit" name="xStage2" id="xStage2" class="btn btn-default " > Back  To Step 1.. </button>			
									</div>
                                    <div class="clearfix"></div>
							
                                </div>
								
					<div class="x_content"> 
					<div class="col-md-7 col-sm-7">
						<table class = "table jambo_table">
							<thead>
								<tr>
									<th> Code </th> 
									<th> Title </th>
									<th> Type </th>
									<th> Total Qtn </th>
								</tr>
							</thead>
						<?php $f = 0; foreach($_SESSION['ecos'] as $scos) { ?>
							<?php // searchCourse(array $criterials,$order=""); 
								
								$cosinfo = $courses->searchCourse(array("code"=>explode("_",$scos)[1])); 
							?>
						<tr>
								<td> <?php  echo explode("_",$scos)[1]."&nbsp;&nbsp;"; ?> </td>
								<td> <?php  echo $cosinfo['name'][0]; ?> </td>
								<td> <?php echo explode("_",$scos)[2];?></td>
								<td> <?php echo $_SESSION['eqty'][$f]." of ".explode("_",$scos)[4]; ?> </td>
							</tr>
						 <?php $f++; } ?>
						 <tr><th > SUMMARY: </th><th colspan="3"> <?php echo array_sum($_SESSION['eqty'])."  Questions &nbsp; for &nbsp;".readTime($_SESSION['scheduleSecs']); ?> </th>  </tr>
						   <tr><th > PAPER CODE: </th><th colspan="3"> <?php echo $_SESSION['paperTempCode'];?></th></tr>						    
						</table>						
					</div>
                	 
					 			</div>  <!-- /. x_content -->
								
							</div> <!-- /. x_panel  -->
						</div>  <!--  /. col-sm-12 -->
					 
				</div>	 <!-- /. row -->

			  
                    <div class="row">  
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                <div class="x_title">  
                                    <h2> Now Select Users <small> <b> For The:&nbsp;<?php echo $_SESSION['paperTitle']; ?> </b></small> &nbsp;  (&nbsp;<?php echo count($allCourseStuds['user_id'])?>  ) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									 </h2>                                    
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content"> 
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
											<button class="btn btn-primary" type="submit" name="filtStuds" id="filtStuds" title="Search"> <i class="fa fa-search"></i> </button>
										</div> <!--/. form group-->
									</div> <!--/. col-md-1 -->
									
									<div class="col-sm-4 col-md-4" > 
										<div class="form-group"> <br/> 
											<label class="alert alert-suc alert"> <?php echo $uss ." users selected " ;?> </label>
										</div> 
									</div>
									
									<div class="col-sm-4 col-md-4" > 
										<div class="form-group"> <br/> 
										<button class="btn btn-success btn-round" name="regCourses" id="regCourses" type="submit"> <i> Schedule Selected Users </i></button>&nbsp;&nbsp;
										</div> 
									</div>
																
								
									<div class="col-sm-12 col-md-12 col-xs-12">
                                     <table id="studTable" class="table table-striped table-bordered responsive-utilities jambo_table">
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
											     array("user_id"=>$allCourseStuds['user_id'][$sn],"codegen"=>$_SESSION['paperTempCode'])),array("sn","codegen","year","paper_signal"));
																							 
											?>
											
                                            <tr class="odd pointer"  >
                                                <td class="a-center ">
                                                    <input type="checkbox" class="userRegs tableflat" name="userRegs[]" value="<?php echo $myInfo['sn'][0];?> ">
                                                </td>
                                                <td class=" "><?php echo $sn+1; ?> </td>
                                                <td class=" "><img class="img img-responsive img-thumbnail" src="<?php echo "../media/user_imgs/".$myInfo['passport'][0];  ?>" width="50" height="50" /> </td>												
												<td class=" "><?php echo $myInfo['surname'][0]."&nbsp;".$myInfo['firstname'][0];  ?> &nbsp; &nbsp; <small class="badge" title="Department"> <?php echo ($myInfo['department'][0]!="")?substr($myInfo['department'][0],0,4):"Nill"; ?> </small> </td>												
												<td class=" ">	<?php echo $studId;  ?>	</td>                                               
                                                <td class=" "> <button type="button" class="btn btn-info btn-sm" title=" Level "> <?php echo $myInfo['level'][0];  ?>  </button> </td>												 
                                                <td class=" " align="center"><?php 
											   
												if(empty($myResult['codegen'])) 
												{ ?>
													<i class="fa fa-close red fa-2x" title=" Not Scheduled Yet "></i>
												<?php }
												else{ ?>
													<i class="glyphicon glyphicon-ok green fa-2x" title=" Already Scheduled  "></i>
												<?php }  ?>
											   </td>
											   <td> <span class="btn <?php if($myResult['paper_signal'][0]=="normal") echo "btn-default"; if($myResult['paper_signal'][0]=="process") echo "btn-warning"; if($myResult['paper_signal'][0]=="done") echo "btn-success";?>"><?php echo $myResult['paper_signal'][0];?> </span></td>
                                            </tr> 
                                            <?php $sn++; } else { ?>
											<tr>
												<td colspan="8"> If No Student Appears, Click Search Button or You go and Import New Users </td>
											</tr>
											<?php } ?>
                                        </tbody>
                                    </table>
								</div> <!-- /. col-sm-12 -->
								
								
					<div class="col-sm-12"> <hr/></div>
					
							
							
								
					</div> <!-- /. x_content -->
								
                 </div> <!--  /. x_panel-->
							  
                        </div> <!-- col-md-12 -->
 
                        <br />
                        <br />
                        <br />

                    </div> <!-- /. row -->
					 				
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
					
					 $('#studTable').DataTable({
              			  //  "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "All"]]
				 "sPaginationType": "full_numbers", "lengthMenu": [[10, 50, 100,200,500, -1], [10, 50, 100, 200,500, "All"]] //[10, 25, 50, 100,200, "All"]
      				  });
		
				
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
			
			/***********************************/
			// auto click showPop	
			stg1Pop = $('#stg1Alert').val(); 
			if(stg1Pop !="") $('#showPop').click();	
			/**********************************************************/
		// searching student filtered
			// studFilt  filterQuery
			$('#studFilt').on('change',function(){
					$('#filtStuds').click();
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
	</script>
    
	<?php include "../media/links/foot_libraries.html"; ?>

       
      	 
   </form>         
     
</body>

</html>