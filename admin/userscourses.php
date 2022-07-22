<?php 

	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";		
	require "../media/php/Course.php";
	require "../media/php/User.php";	
	
	$admin = new User("admin");		
	if(!$admin->confirmLogin('adminUser')) $admin->logout('adminUser','../'); 
	 /*************************************************************************/	
	 $_SESSION['adminInfo'] = $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	 
	 # session_destroy(); session_start(); 

	$bi = new  Institute_info();
	
	$_SESSION['page_title'] = $bi->institutename; 	
		
	 /****************/
	  if(!isset($_SESSION['studFilt'])) $_SESSION['studFilt'] = "level_100";
	  if(!isset($_SESSION['courseFilt'])) $_SESSION['courseFilt'] = "level_100";
	  if(!isset($_SESSION['courseYear'])) $_SESSION['courseYear'] = date('Y'); 
	
	// $studQuery = explode("_","level_"); 
	 // $cosQuery = explode("_","level_");
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
		  $tagSign = $gly_info;
		  $display = $disp_off;
		  $msgAlert = $alert_success;
		/////////////////////////////////////////////////
		/****************************/		
	
	$queries =  new DbTool(); 
	$userLevels = $queries->getDistinctLevel("users"); 
	$userDepartments = $queries->getDistinctDepartment("users");
	$courseLevels = $queries->getDistinctLevel("courses"); 
	$courseDepartments = $queries->getDistinctDepartment("courses");
	
	// saving changed selections 
	// filterQuery studFilt
	
	if(isset($_POST['filterQuery'])){
		
		$dbm = new DbTool();
		
		$_SESSION['studFilt'] = $_POST['studFilt']; 
		$_SESSION['courseFilt'] = $_POST['courseFilt'];
		$_SESSION['courseYear'] = $_POST['courseYear'];
		$_SESSION['semester'] = $_POST['semester'];
		
				
	$studQuery = explode("_",$_SESSION['studFilt']); 
	$cosQuery = explode("_",$_SESSION['courseFilt']);	
	
	}
	
	$studQuery = explode("_",$_SESSION['studFilt']); 
	$cosQuery = explode("_",$_SESSION['courseFilt']);	
	
	$courses = new Course(); 
	
		$allCourses = $courses->getAll(array($cosQuery[0]=>$cosQuery[1],"semester"=>$_SESSION['semester'])); 
	//
	
	$studs = new User("users");
	
	 $allStuds = $studs->getAll(array($studQuery[0]=>$studQuery[1]));
	 
	 
	 /**************************************/
	 # registering student courses 
	 
	 if(isset($_POST['regCourses'])){
		 
		$uss  = count($_POST['userRegs']);
		$coss = count($_POST['cosRegs']);	
		
		$dbm = new DbTool(); 
				
				$allAv = $dbm->select("questions",array("code"=>$code,"year"=>$year,"level"=>$level,"qtype"=>$qtype));

				$reqFields = $dbm->getFields($allAv,array("qtnum","code"));
				
				$tot = 	count($reqFields['code']);		
				
				for($n = 0; $n < $uss; $n++){
					// fetch info for student 
					$info = new User("users");
					$myInfo = $info->getAll(array('sn'=>$_POST['userRegs'][$n])); 
					/* user info fetched  */
					/**************************************/
					/****** now query course works ***************/
					 for($m = 0; $m<$coss; $m++){
						 $cInfo = new Course(); 	
						 $cosInfo = $cInfo->getAll(array("sn"=>$_POST['cosRegs'][$m]));
		
						 $myCos = $dbm->getFields($dbm->select("users_courses",
							array("user_id"=>$myInfo['user_id'][0],"year"=>$_SESSION['courseYear'],"code"=>$cosInfo['code'][0])),array("code","year"));
						
						if(count($myCos['code'])>0){
							// do nothing 
						}						
						else{							
							$dbm->insert("users_courses",array("user_id"=>$myInfo['user_id'][0],
							"level"=>$myInfo['level'][0],"code"=>$cosInfo['code'][0],"year"=>$_SESSION['courseYear']));							
						}
						  
					 } // end second loop
					 		
				}  // end first loop 
		
	}	// end of course registration 
	
	/**********************************************************************/
	############ delete courses selected for users 
	if(isset($_POST['delCourses'])){
		$dbm = new DbTool(); 
		$dels = count($_POST['userRegs']);
		 
			for($j=0; $j < $dels; $j++)
				{
					$info = new User("users");
					$myInfo = $info->getAll(array('sn'=>$_POST['userRegs'][$j])); 
					// now delete courses 
					# 
					$dbm->deleteRow("users_courses",array("user_id"=>$myInfo['user_id'][0],"year"=>$_SESSION['courseYear']));
				}
				//  deleted 
				 
	}
	
	/************************************************************************/
	 
	 
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
                            <h3> <i class="fa fa-book fa-fw"> </i> &nbsp; Register Courses   <small> for Students  </small> 
							&nbsp; <button class="btn btn-round btn-primary" name="cosplus"  id="cosplus"type="submit" title="Create New Course ">
							<i class="fa fa-pencil"> </i></button>
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
					
                    <!--show only if new button is clicked--> 
              <?php if(isset($_SESSION['newCos']) || isset($_SESSION['CosUpdates'])){?>
                <div class="row"> 
                	<div class="x_content">
                	<div class="panel panel-info">
                    <div class="panel-body"> <form method="post">
                	
					<div class="col-md-2 col-sm-2 col-xs-6">
                    	<div class="form-group">
                        	<label>Filter  Students  By </label>
								<select class="form-control select" name="studFilt" id="studFilt">
									
									<optgroup label="Level">  
									<?php foreach($userLevels['level'] as $lev) {?> 
                                    	<option value="<?php echo "level_".$lev ?>" <?php echo ($_SESSION['studFilt']=="level_".$lev)?"selected":""?>> <?php echo $lev ?> </option>
                                     <?php }?>
                                    </optgroup>
                                    
									<optgroup label="Dapartments">
									
									<?php foreach($userDepartments['department'] as $dep) {?> 
                                    	<option value="<?php echo "department_".$dep ?>" <?php echo ($_SESSION['studFilt']=="department_".$dep)?"selected":""?>> <?php echo $dep; ?> </option>
                                     <?php }?>
                                    </optgroup>
                                    
								</select>
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                    
                    <div class="col-md-2 col-sm-2 col-xs-6">                    
                    	<div class="form-group">
                        	<label> Filter Courses By  </label>
                        	<select class="form-control select" name="courseFilt" id="courseFilt">									
									<optgroup label="Level">
									<?php foreach($courseLevels['level'] as $lev) {?> 
                                    	<option value="<?php echo "level_".$lev; ?>" <?php echo ($_SESSION['courseFilt']=="level_".$lev)?"selected":""?>> <?php echo $lev ?> </option>
                                     <?php }?>
                                    </optgroup>
                                    
									<optgroup label="Dapartments">
									
									<?php foreach($courseDepartments['department'] as $dep) {?> 
                                    	<option value="<?php echo "department_".$dep ?>" <?php echo ($_SESSION['courseFilt']=="department_".$dep)?"selected":""?>> <?php echo $dep; ?> </option>
                                     <?php }?>
                                    </optgroup> 
								</select>
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                     
					  <div class="col-md-2 col-sm-2 col-xs-6">                    
                    	<div class="form-group">
                        	<label>  Select Semester  </label>
                        	<select class="form-control select" name="semester" id="semester">									
									
									<optgroup label="Semester">										
										<option value="1st" <?php echo ($_SESSION['semester']=="1st")?"selected":""?>> 1st Semester </option>
										<option value="2nd" <?php echo ($_SESSION['semester']=="2nd")?"selected":""?>> 2nd Semester </option>
                                    </optgroup> 
									
								</select>
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-3 -->
					 
					 <div class="col-md-2 col-sm-2 col-xs-6">                    
                    	<div class="form-group">
                        	<label>  Select Year  </label>
                        	<select class="form-control select" name="courseYear" id="courseYear">									
									
									<optgroup label="Year ">
									<?php for($year = 2015; $year <= date('Y'); $year++) {?> 
                                    	<option value="<?php echo $year; ?>" <?php echo ($_SESSION['courseYear']==$year)?"selected":""?>> <?php echo $year;  ?> </option>
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
                    
                    
                        <div class="col-md-1 col-sm-1 col-xs-3">                    	
                    	<div class="form-group">
                        	<label><small>Cancel</small></label>
                            
                            <button class="btn btn-warning" type="submit" name="canCos" id="canCos" title="Cancel"> <i class="fa fa-remove"></i> </button>
                        	
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-1 -->
                    
                   <div class="col-md-5 col-sm-5 col-xs-12">                    
                    	
						<div> <label class="btn <?php echo $msgAlert;?>"<?php echo $display; // off or on ?>> <span><i class="glyphicon <?php echo $tagSign; ?>"></i></span> <?php print $_SESSION['saveMsg']; ?> </label> </div>
						
                    </div> <!--/. col-md-6 -->
                    
                    </form>
                    </div> <!--/. panel-body-->
                    </div> <!--/. panel info-->
                    </div> <!-- /. x_content -->
                </div><!-- /. row-->
             <?php } ?>   
             
                    <div class="row"> <form method="post">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                <div class="x_title">  
                                    <h2>Users Registered Courses  (<?php echo count($allStuds['user_id'])?> users ) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-success btn-round" name="regCourses" id="regCourses" type="submit"> <i> Register Selected Users </i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <button class="btn btn-danger btn-round" name="delCourses" id="delCourses" type="submit"> <i> Delete Selected Users Courses </i></button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <div class="navbar-right right"> Courses Available (<?php echo count($allCourses['code'])?>) </div></h2>                                    
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content"> 
									<div class="col-sm-8 col-md-8 col-xs-12">
                                     <table id="example" class="table table-striped table-bordered responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" class="tableflat" onclick="selectAllUsers()">
                                                </th>
                                                <th> S/N </th>
                                                <th>Name </th>                                               
                                                <th>Level </th>
												<th>Courses Offered </th>
                                                                                            
                                            </tr>
                                        </thead>
									<!-- now list all courses available or searched -->
                                        <tbody>
                                             <?php $sn = 0; 
									foreach($allStuds['user_id'] as $studId ){  ?>
                                            <tr class="odd pointer" title=" <?php echo " Department of ".$allStuds['department'][$sn]; ?> ">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="userRegs tableflat" name="userRegs[]" value="<?php echo $allStuds['sn'][$sn];  ?> ">
                                                </td>
                                                <td class=" "><?php echo $sn+1; ?> </td>
                                                <td class=" "><?php echo $allStuds['surname'][$sn]."&nbsp;".$allStuds['firstname'][$sn];  ?>  <br/>   <br/> 
													<img class="img img-responsive img-circle img-thumbnail" src="<?php echo "../media/user_imgs/".$allStuds['passport'][$sn];  ?>" width="70" height="70" />
													<br/> <br/>
													<?php echo $studId;  ?>
												</td>                                               
                                                 <td class=" "> <button type="button" class="btn btn-success btn-sm" title=" Level "> <?php echo $allStuds['level'][$sn];  ?>  </button> </td>
												 
                                               <td class=" "><?php 
											   $dbm = new DbTool();
											   $myCos = $dbm->getFields($dbm->select("users_courses",
											   array("user_id"=>$allStuds['user_id'][$sn],"year"=>$_SESSION['courseYear'])),array("code","year"));
												print  implode("&nbsp; &nbsp; &nbsp; ",$myCos['code']); 
												?>

											   </td>
                                            </tr> 
                                            <?php $sn++; } ?>
                                      
                                        </tbody>
                                    </table>
								</div> <!-- /. col-sm-8 -->
								
								<div class="col-sm-4 col-md-4 col-xs-12">
                                     <table id="example" class="table table-striped table-bordered responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" class="tableflat" onclick="selectAllCourses()">
                                                </th>
                                                <th> S/N </th>                                                
                                                <th>Course Code </th>                                                
                                                <th>Level</th>
                                                                                             
                                            </tr>
                                        </thead>
									<!-- now list all courses available or searched -->
                                        <tbody>
                                             <?php $sn = 0; if(count($allCourses['code'])>0)
									foreach($allCourses['code'] as $coscode ){  ?>
                                            <tr class="odd pointer" title="<?php echo $allCourses['name'][$sn];  ?>">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="cosRegs tableflat" name="cosRegs[]" value="<?php echo $allCourses['sn'][$sn];  ?> "> 
                                                </td>
                                                <td class=" "><?php echo $sn+1; ?> </td>                                                
                                                <td class=" "><?php echo $coscode;  ?> &nbsp; &nbsp;  <button type="button" class="btn btn-info btn-sm" title=" Units "> <?php echo $allCourses['unit'][$sn];  ?>  </button></td>                                                
												<td class=" "> <?php echo $allCourses['level'][$sn];  ?> </td>
                                                
                                            </tr> 
                                            <?php $sn++; }  else { ?>
											<tr>
												<td colspan="4">No Courses are available </td>
											</tr>
											<?php }?>
                                        </tbody>
                                    </table>
								</div> <!-- /. col-sm-4 -->
									
								</div>
                            </div> <!--  /. x_panel-->
							  
                        </div> <!-- col-md-12 -->
</form>
                        <br />
                        <br />
                        <br />

                    </div>
                </div>
                
                  
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
						
					$('#studFilt,#courseYear,#courseFilt,#semester').on('change',function(){
						
						$('#filterQuery').click();  
						 
					});
					
			/***********************************************************/
				$('.userRegs, .cosRegs').on('click',function(){
								
					totU = $('input[name="userRegs[]"]:checked').length; 	
					totC = $('input[name="cosRegs[]"]:checked').length; 	
						
						if(totU>0 && totC>0) $('#regCourses').show('slow');
						else $('#regCourses').hide('slow');
						
						// for deleting users courses 
						
						if(totU > 0) {
							$('#delCourses').show('slow');
						}
						else  $('#delCourses').hide('slow');
				});
		/**************************************************/
		
			/// deleting courss for selected users 
			
			$('#delCourses').on('click',function(){
				
				return confirm("Are you sure you want to delete all the courses for these selected users ");
				
			});
		
		/**********************************************************/
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
	</script>
		
	<?php include "../media/links/foot_libraries.html"; ?>
	  	
        
            
     
</body>

</html>