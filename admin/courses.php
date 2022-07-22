<?php 

	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";		
	
	require "../media/php/Course.php";
	
	require "../media/php/User.php";	
	$admin = new User("admin");		
	if(!$admin->confirmLogin('adminUser')) $admin->logout('adminUser','login/'); 
	 /*************************************************************************/	
	 $_SESSION['adminInfo'] = $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	 
	 $bi = new  Institute_info();
	
	$_SESSION['page_title'] = $bi->institutename; 
	
	
	$courses = new Course(); 
	
		$allCourses = $courses->getAll(array());
	//

	// when searching for course info 
	if(isset($_POST['searchCourse'])){
		
		$_SESSION['searchText'] = $searchText = strip_tags($_POST['searchText']); 		
		$allCourses = $courses->searchCourse(array('name'=>$searchText,'code'=>$searchText,'unit'=>$searchText,'Semester'=>$searchText,'status'=>$searchText,'level'=>$searchText,'faculty'=>$searchText,'department'=>$searchText),array('level'));
				
	}
	 
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
		unset($_SESSION['semester']);
		
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
		
	if(isset($_POST['createCos']) || isset($_POST['updCos']) ){
				
			$_SESSION['cosname'] = strip_tags($_POST['cosname']); 
			$_SESSION['coscode'] = strip_tags($_POST['coscode']);
			$_SESSION['cosunit'] = strip_tags($_POST['cosunit']);
			$_SESSION['cosstatus'] = strip_tags($_POST['cosstatus']);
			$_SESSION['coslevel'] = strip_tags($_POST['coslevel']);
			$_SESSION['semester'] = $_POST['semester'];
			$_SESSION['createcoursestatus'] = false ;
			
			 if($_SESSION['cosname']==""){
				$tagSign = $gly_warn;
		  		$display = $disp_on;
		  		$msgAlert = $awarn;
		 	 	$_SESSION['saveMsg'] = " Enter Course Name ";
			}
			 else if($_SESSION['coscode']==""){
				$tagSign = $gly_warn;
		  		$display = $disp_on;
		  		$msgAlert = $awarn;
		 	 	$_SESSION['saveMsg'] = " Enter Course Code ";
			}
			else if($_SESSION['cosunit']==""){
				$tagSign = $gly_warn;
		  		$display = $disp_on;
		  		$msgAlert = $awarn;
		 	 	$_SESSION['saveMsg'] = " Enter Course Unit ";
			}
			else if($_SESSION['cosstatus']==""){
				$tagSign = $gly_warn;
		  		$display = $disp_on;
		  		$msgAlert = $awarn;
		 	 	$_SESSION['saveMsg'] = " Enter Course Status ";
				
			}
			else if($_SESSION['coslevel']==""){
				
				$tagSign = $gly_warn;
		  		$display = $disp_on;
		  		$msgAlert = $awarn;
		 	 	$_SESSION['saveMsg'] = " Enter Course Level ";			
			}
			else if($_SESSION['semester']==""){
				
				$tagSign = $gly_warn;
		  		$display = $disp_on;
		  		$msgAlert = $awarn;
		 	 	$_SESSION['saveMsg'] = "Select the semester ";			
			}
			else {
				
				$_SESSION['coursestatus'] = true; 
				
			}
		
	}
/*****************************************************************/	
	
	// creating course 
	
	if(isset($_POST['createCos'])){
	 
	 if($_SESSION['coursestatus'] == true){
		 $data = array("name"=>$_SESSION['cosname'],"code"=>$_SESSION['coscode'],"semester"=>$_SESSION['semester'],
				"unit"=>$_SESSION['cosunit'],"status"=>$_SESSION['cosstatus'],"level"=>$_SESSION['coslevel']); 
								
				$tagSign = $gly_ok;
		  		$display = $disp_on;
		  		$msgAlert = $asuccess;
		 	 	$_SESSION['saveMsg'] =  $courses->createCourse($data);
				// $_SESSION['saveMsg'] =  " Course Successfully Created";				
				 
	 }
	}
	
	// modifying after validation 
	
	if(isset($_POST['updCos']) ){
		
		 if($_SESSION['coursestatus'] == true){
			 $courses = new Course(); 
			 $data = array("name"=>$_SESSION['cosname'],"code"=>$_SESSION['coscode'],"semester"=>$_SESSION['semester'],
				"unit"=>$_SESSION['cosunit'],"status"=>$_SESSION['cosstatus'],"level"=>$_SESSION['coslevel']); 
								
				$tagSign = $gly_ok;
		  		$display = $disp_on;
		  		$msgAlert = $asuccess;
				$crt = array("sn"=>$_SESSION['cossn']);
				//$_SESSION['saveMsg'] = $_SESSION['cossn']; //= //  " Course Successfully Updated";
				$_SESSION['saveMsg'] = $courses->modifyCourse($crt,$data);    
		 }
	
	}
	

// handling course modification 
	if(isset($_POST['subMods'])){		 
	$dbm =  new DbTool(); $_SESSION['cossn'] = $_POST['cosmods'];
		$courses = $dbm->getFields($dbm->select('courses',array('sn'=>$_POST['cosmods'])),array('name','code','unit','status','level','semester'));
	
			$_SESSION['cosname'] = $courses['name'][0];						
			$_SESSION['coscode'] = $courses['code'][0];
			$_SESSION['cosunit'] = $courses['unit'][0];
			$_SESSION['cosstatus'] = $courses['status'][0];
			$_SESSION['coslevel'] = $courses['level'][0];
			$_SESSION['semester'] = $courses['semester'][0];
			
			//  make coyrse update available 
			$_SESSION['CosUpdates'] = true; unset( $_SESSION['newCos']);
					
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
                            <h3> <i class="fa fa-book fa-fw"> </i> &nbsp; Courses  <?php echo "(". count($allCourses['code']).")&nbsp;";  ?>  <small> Available </small> &nbsp; <button class="btn btn-round btn-primary" name="cosplus"  id="cosplus"type="submit" title="Create New Course "><i class="fa fa-pencil"> </i></button>
                </h3>
                </form>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                              
                              <form method="post">
                                <div class="input-group">
                                   
                                    <input type="text" class="form-control" placeholder="Search for..." name="searchText" value="<?php echo $_SESSION['searchText']?>">
                                    <span class="input-group-btn">
                            		<button class="btn btn-default" type="submit" name="searchCourse">Go!</button>
                       				</span>
                                </div> 
                                </form>
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
                        	<label>Course Name </label>
                        	<input type="text" name="cosname" id="cosname" value="<?php echo $_SESSION['cosname']?>" class="form-control" title="Course Name"/>
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                    
                    <div class="col-md-2 col-sm-2 col-xs-6">                    
                    	<div class="form-group">
                        	<label>Course Code </label>
                        	<input type="text" name="coscode" id="coscode" value="<?php echo $_SESSION['coscode']?>" class="form-control" title="Course Code" />
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                    
                    <div class="col-md-2 col-sm-2 col-xs-6">                    
                    	<div class="form-group">
                        	<label>Course Unit </label>
                   	      <input type="text" name="cosunit" id="cosunit" value="<?php echo $_SESSION['cosunit']?>" class="form-control" title="Course Unit" />
                    	</div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                    
                    <div class="col-md-2 col-sm-2 col-xs-6">                    
                    	<div class="form-group">
                        	<label>Course Status </label>
                        	<input type="text" name="cosstatus" id="cosstatus" value="<?php echo $_SESSION['cosstatus']?>" class="form-control" title="Course Status" />
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                    
                    <div class="col-md-2 col-sm-2 col-xs-6">                    
                    	<div class="form-group">
                        	<label>Level </label>
                        	<input type="text" name="coslevel" id="coslevel" value="<?php echo $_SESSION['coslevel']?>" class="form-control" title="Course Name" />
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                    
					<div class="col-md-2 col-sm-2 col-xs-6">                    
                    	<div class="form-group">
                        	<label> Semester  </label>
                        	<select class="form-control select" name="semester" id="semester">									
									<optgroup label="Semester">
										<option value=""> ... </option>
										<option value="1st" <?php echo ($_SESSION['semester']=="1st")?"selected":""?>> 1st Semester </option>
										<option value="2nd" <?php echo ($_SESSION['semester']=="2nd")?"selected":""?>> 2nd Semester </option>
                                    </optgroup> 
								</select>
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-3 -->
                    
                    <?php if(isset($_SESSION['CosUpdates'])){ ?>
                    <div class="col-md-2 col-sm-2 col-xs-3">                    	
                    	<div class="form-group">                        
                        	<button class="btn btn-info" type="submit" name="updCos" id="updCos" title=" Update Course">Update Course <i class="fa fa-send"></i> </button>
                             </div> <!--/. form group-->
                    </div> <!--/. col-md-1 -->
                    <?php }?>
                    
                    <?php if(isset($_SESSION['newCos'])){ ?>
                    <div class="col-md-2 col-sm-2 col-xs-3">                    	
                    	<div class="form-group">                        	
                        	<button class="btn btn-success" type="submit" name="createCos" id="createCos" title="Create Course"> Create Course <i class="fa fa-send"></i> </button>
                             </div> <!--/. form group-->
                    </div> <!--/. col-md-1 -->
                    <?php }?>
                    
                        <div class="col-md-2 col-sm-2 col-xs-3">                    	
                    	<div class="form-group">
                            <button class="btn btn-danger" type="submit" name="canCos" id="canCos" title="Cancel"> Cancel <i class="fa fa-remove"></i> </button>
                        	
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
             
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>List of Courses   <small>Are as follows </small> </h2>                                    
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content"> 									
                                    <table id="example" class="table table-striped table-bordered responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" class="tableflat">
                                                </th>
                                                <th> S/N </th>
                                                <th> Course Name </th>
                                                <th> Course Code </th>
												<th> Semester </th>
                                                <th>Course Unit </th>
                                                <th>Status</th>
                                                <th>Level </th>   
                                                <th>Action</th>                                               
                                            </tr>
                                        </thead>
									<!-- now list all courses available or searched -->
                                        <tbody>
                                             <?php $sn = 0; 
									foreach($allCourses['code'] as $coscode ){  ?>
                                            <tr class="odd pointer">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="tableflat">
                                                </td>
                                                <td class=" "><?php echo $sn+1; ?> </td>
                                                <td class=" "><?php echo $allCourses['name'][$sn];  ?>  </td>                                               
												<td class=" "><?php echo $coscode  ?> </td>
												 <td class=" "><?php echo $allCourses['semester'][$sn]  ?> </td>
                                                <td class=" "> <button type="button" class="btn btn-success btn-sm" title=" View Departments "> <?php echo $allCourses['unit'][$sn];  ?>  </button> </td>
                                                <td class=" "><button type="button" class="btn btn-info btn-sm" title=" View Departments "> <?php echo $allCourses['status'][$sn];  ?>  </button></td>
                                                <td><?php echo $allCourses['level'][$sn];  ?>  </td>
                                                <td>
                                                <button class="cm btn btn-warning" title="modify" type="submit" value="<?php echo $allCourses['sn'][$sn]." ";?>" onClick=""><i class="fa fa-edit"></i></button> 
                                                <button class="cd btn btn-danger" title="delete" value="<?php echo $allCourses['sn'][$sn]." ";?>" type="submit"><i class="fa fa-close"></button></td>                                      
                                            </tr> 
                                            <?php $sn++; } ?>
                                      
                                        </tbody>
                                    </table>

									
								</div>
                            </div> <!--  /. x_panel-->
							  
                        </div> <!-- col-md-12 -->

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
				
				// find all button with class cd - course delete
					$("button:submit.cd").on('click',function (){ 
						var val = $(this).val();
						//
						// quickly send request to database for details 
						
					var req = $.ajax({
						url:"../media/php/accessor.php",
						data:
							{
							getCourseContents:'getCourseContents',sn:val
							},
						 method:"POST",
						 //beforeSend: function(){alert('sending')},
						
						});
						
						req.fail(function(e){
							alert(e.status+" Failed");
							});
					
					
						req.done(function(d){
							 
								var cosinfo = $.parseJSON(d);
								
							if(confirm("Are you sure you want to delete "+cosinfo[1]+" -- "+cosinfo[0])){				
							// make another request for deleting course 
							
							var req2 = $.ajax({
								url:"../media/php/accessor.php",
								data:
									{
									deleteCourseContents:'getCourseContents',sn:val
									},
								 method:"POST",
								 //beforeSend: function(){alert('sending')},								
							});
					
					req2.fail(function(e){
						alert(e.status+" Failed");
						});
						
						req2.done(function(res){
							
							if (res==true){
					
								alert(cosinfo[1]+' "'+cosinfo[0]+ '" is now deleted ');	
								window.location.href = "";
								}
								else {
								alert('Sorry, '+cosinfo[1]+' "'+cosinfo[0]+ '" cannot be deleted ');		
								}
							});
												
						}
						
					});

						});
						
		
		/*
		** work on course modification 
		**
		*/				
		
					// find all button with class cd - course delete
					$("button:submit.cm").on('click',function (){ 
						
						 var val = $(this).val(); 												
						// quickly send request to database for details 
						  $("#cosmods").val(val); 					
						$("#subMods").click();   
						});						
		
			});
					
	</script>
		
	<?php include "../media/links/foot_libraries.html"; ?>
	  	
        
            
     
</body>

</html>