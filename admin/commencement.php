<?php 

	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";		
	
	require "../media/php/User.php";	
	$admin = new User("admin");		
	if(!$admin->confirmLogin('adminUser')) $admin->logout('adminUser','login/'); 
	 /*************************************************************************/	
	 $_SESSION['adminInfo'] = $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	 
	require "../media/php/Course.php";
	
	$bi = new  Institute_info();
	
	$_SESSION['page_title'] = $bi->institutename; 
 	 
	if(!isset($_SESSION['courseYear'])) $_SESSION['courseYear'] = date('Y');
			
	//
	if(isset($_POST['cosplus'])){
		if(isset($_SESSION['newCosSchedule'])) { unset($_SESSION['newCosSchedule']);}
		else { $_SESSION['newCosSchedule'] = true; }
	}
	  
		
	if(isset($_POST['searchCos'])){
				
			$_SESSION['scheduleYear'] = $_POST['scheduleYear'];
			
	}
/*****************************************************************/	
	
	// fetching courses 
	
	$dbm = new DbTool(); # (array $field,$table,array $where,$order="", $operator = "AND"){

	$readyCos = $dbm->getFields($dbm->select_Multi_Distinct(
		array("codegen","year"),"users_result",array("year"=>$_SESSION['scheduleYear'])),array("codegen","title","year"));	

		
		
## deleting selected checkboxes 
	
	if(isset($_POST['delSel'])){
		
		$dbm = new DbTool(); 
		
		$dels = count($_POST['cosSchd']); 
		 
			for($j=0; $j < $dels; $j++)
				{
					$criterial  = explode("-",$_POST['cosSchd'][$j]);  // codegen and year
					
					$dbm->updateTb("epanel",array('state'=>'draft'),array("codegen"=>$criterial[0],"year"=>$criterial[1]));
				}
				//  deleted 
		
			echo "<script> alert( '$dels schedules has been reset')</script>";
		 
				header("Refresh:1");
				 

	}
				
########################################################################################
########################################################################################
## access_students 
		if(isset($_POST['access_students'])){
			$data = $_POST['access_students'];
			$infos = explode("-",$data); 
			$_SESSION['codegen']=$infos[0]; $_SESSION['year']=$infos[1];
			header("Location:result.php");
		
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
                            <h3> <i class="fa fa-book fa-fw"> </i> &nbsp; Assessment Schedule  <small> For Students  </small> &nbsp; <button class="btn btn-round btn-primary" name="cosplus"  id="cosplus"type="submit" title=" Click here to select year  "><i class="fa fa-repeat"> </i></button>
                </h3>
                </form>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                              
                              <form method="post">
                                <div class="input-group">
                                   
                                    <input type="text" class="form-control" placeholder="Search for..." name="searchText" value="<?php echo $_POST['searchText']?>">
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
              <?php if(isset($_SESSION['newCosSchedule'])){?>
                <div class="row"> 
                	<div class="x_content">
                	<div class="panel panel-info">
                    <div class="panel-body"> <form method="post">
                
                       
					 <div class="col-md-3 col-sm-3 col-xs-6">                    
                    	<div class="form-group">
                        	<label>  Filter Courses By Year  </label>
                        	<select class="form-control select" name="scheduleYear" id="scheduleYear">									
									
									<optgroup label="Year ">
									<?php for($year = 2015; $year <= date('Y'); $year++) {?> 
                                    	<option value="<?php echo $year; ?>" <?php echo ($_SESSION['scheduleYear']==$year)?"selected":""?>> <?php echo $year;  ?> </option>
                                     <?php }?>
                                    </optgroup>
                                    
								</select> 
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-3 -->
					  
                     
                    <div class="col-md-1 col-sm-1 col-xs-3">                    	
                    	<div class="form-group">
                        	<label><small> Search  </small></label>
                        	<button class="btn btn-success" type="submit" name="searchCos" id="searchCos" title="Search Courses"> <i class="fa fa-search"></i> </button>
                             </div> <!--/. form group-->
                    </div> <!--/. col-md-1 -->
                    
                       
					<div class="col-md-5 col-sm-5 col-xs-12">                    
                    	
						<div> <label class="btn <?php echo $msgAlert;?>"<?php echo $display; // off or on ?>> <span><i class="glyphicon <?php echo $tagSign; ?>"></i></span> <?php # print $_SESSION['saveMsg']; ?> </label> </div>
						
                    </div> <!--/. col-md-6 -->
                    
                    </form>
                    </div> <!--/. panel-body-->
                    </div> <!--/. panel info-->
                    </div> <!-- /. x_content -->
                </div><!-- /. row-->
             <?php } ?>   
             
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel"> <form method="post">
                                <div class="x_title">
								
                                    <h2>List of Papers Available    <small> For Assessment </small> 
									&nbsp; 
									 <button class="btn btn-danger btn-round" name="delSel" id="delSel"> <i>Reset All Selected</i></button>
									</h2>                                    
                                    <div class="clearfix"></div>
									
                                </div>
                                <div class="x_content"> 									
                                    <table id="example" class="table table-striped table-bordered responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" class="tableflat" onclick="selectAllSchedules()"> 
                                                </th>
                                                <th> S/N </th>
                                                <th> Course Code </th>
                                                <th> Course Name </th>
												<th> Total Students  </th>
                                                <th> Paper has Started  </th>   
                                                <th> Paper Completed </th>                                               
                                            </tr>
                                        </thead>
									<!-- now list all courses available or searched -->
                                        <tbody>
										
                                             <?php $sn = 0; 
											 
											 if(!is_null($readyCos)) { ?>
											 
											 <tr> 
												 <td> * </td>
												 <td colspan="6"> Click the <b>OFF/ON</b> button to change the state of the paper schedules  &nbsp; &nbsp;&nbsp; <b>OFF</b> means No, &nbsp; &nbsp; <b>ON</b> means Yes. </td>
											</tr>
										<?php
											 
									foreach($readyCos['codegen'] as $coscode ){  
										// $courses = new Course();   $cosInfo = $courses->getAll(array("code"=>$coscode));
										// fetch all students
										$allStuds = $dbm->getFields($dbm->select("users_result",array("codegen
										"=>$readyCos['codegen'][$sn] ,"year"=>$readyCos['year'][$sn])),array('user_id'));
										
										$costitle = $dbm->getFields($dbm->select("epanel",array("codegen
										"=>$readyCos['codegen'][$sn])),array('title','state'));
										
										// query if course has already been scheduled 
										$scheduledCos = $dbm->getFields($dbm->select("epanel",array(
										"codegen"=>$coscode,										
										"year"=>$readyCos['year'][$sn])),
										array("codegen","year","title","state"));
										
										// completed course 
										$completedCos = $dbm->getFields($dbm->select("epanel",array(
										"codegen"=>$coscode,										
										"year"=>$readyCos['year'][$sn],
										"state"=>"done")),
										array("codegen","year","title","state"));
									?>	
                                            <tr class="odd pointer">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="cosSchd tableflat" name="cosSchd[]" value="<?php echo $readyCos['codegen'][$sn]."-".$readyCos['year'][$sn];  ?>">
                                                </td>
                                                <td class=" "><?php echo $sn+1; ?> </td>
                                                <td class=" "><?php echo  $coscode; ?>  </td>												
                                                <td class=" "><?php echo $costitle['title'][0];  ?> </td>
                                                <td class=" "><button type="submit" name="access_students" value="<?php echo $coscode."-".$readyCos['year'][$sn]; ?>"  class="btn btn-info btn-sm" title=" Total Students"> View All &nbsp;  <i class="badge"> <?php echo count($allStuds['user_id']);  ?>  &nbsp; </i>  </button></td>
                                                <td>
													<div class="">
													  <label>
														 <input class="schedule-state" type="checkbox" value="<?php echo "schedule-".$coscode."-".$readyCos['year'][$sn];?>" <?php if(count($scheduledCos['state'])>0 && $scheduledCos['state'][0]!="draft") echo "checked";?>>
													  </label>
													</div>
												</td>
                                                <td>
													<div class="">
													  <label>
														 <input class="complete-state" type="checkbox" value="<?php echo "complete-".$coscode."-".$readyCos['year'][$sn];?>" <?php echo (count($completedCos['state'])==1)?"checked":""?>>
													  </label>
													</div>
												</td>                                      
                                            </tr> 
                                            <?php $sn++; } 
											 } // end not null 											

											else { ?>
											
											<tr> <th colspan="7" class="no-data center"> Seems No Paper has been scheduled for students   </th> </tr>
												
											<?php }
											
											?>
                                      
                                        </tbody>
                                    </table>

									
								</div> </form>
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
				
				
			// on switch 
			// init 
			$(".schedule-state,.complete-state").bootstrapSwitch();
			
			/*******************************************************************/
			//  
			$(".complete-state").on('click',function(){
				 
				if(confirm("Are you sure your students has completed this paper ? because they will not be able to see it again when closed !")){
				
				var completes = $(this).val(); 
					
					var req2 = $.ajax({				
						url:"../media/php/accessor.php",
						method: "POST",
						data:
							{
								completedCos:completes					
							},
					//	beforeSend:  function(){  showgif(); }				
						});
				
						req2.fail(function(e){
							alert(e.status+" Failed"); 
							/// hidegif();
							});
			
						req2.done(function(d){
							
							 alert($.trim(d)); 
							 top.location.href = "";
						});
						
					}
					
			});
			
			/****************************************************************/
			
			$(".schedule-state").on('click',function(){
				 	
					var schedules = $(this).val(); 
					
					var req = $.ajax({				
						url:"../media/php/validator.php",
						method: "POST",
						data:
							{
								scheduleCos:schedules					
							},
					//	beforeSend:  function(){  showgif(); }				
						});
				
						req.fail(function(e){
							alert(e.status+" Failed"); 
							/// hidegif();
							});
			
						req.done(function(d){
							
							 alert($.trim(d)); 
							 top.location.href = "";
						});
					
			});
			 
			/**********************************************************************/
			$('#scheduleYear').on('change',function(){
				$('#searchCos').click();
				
				});
			 
			});
			
			 	 
/*******************************************/// cosSchd selectAllSchedules
	function selectAllSchedules(){
		elem=document.getElementsByName("cosSchd[]");
		for(i=0; i< elem.length; i++){  
		if(elem[i].type='checkbox') 
		elem[i].click()};		
		// 				
	}
		

	$(function(){
			
			$('#delSel').hide('fast');
		
			$('.cosSchd').on('click',function(){
			  tot = $('input[name="cosSchd[]"]:checked').length; 	
				// alert(tot);
				if(tot>0) $('#delSel').show('slow');
				else $('#delSel').hide('slow');
				
		});
		
		/**************************************************/
		
		$('#delSel').on('click',function(){
			
			return confirm(' Do you want to Reset all selected Schedules ?');			
		
		});
		/********************************************/

		});	
	</script>
	
	
	
	
	
		
	<?php include "../media/links/foot_libraries.html"; ?>
	  	
        
            
     
</body>

</html>