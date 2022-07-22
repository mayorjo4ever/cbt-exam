<?php 

	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";		
	
	require "../media/php/Course.php";
	require "../media/php/timecoder.php";
	
	require "../media/php/User.php";
	$admin = new User("admin");		

	if(!$admin->confirmLogin('adminUser')) $admin->logout('adminUser','../'); 
	 /*************************************************************************/	
	 $_SESSION['adminInfo'] = $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	 
	 $bi = new  Institute_info(); $dbm = new DbTool(); 
	
	$_SESSION['page_title'] = $bi->institutename; 
		
	$courses = new Course(); 
	
	$allCourses = $courses->getAll(array());
	//
	 
	if(isset($_POST['cosplus'])){
		if(isset($_SESSION['newCos'])) { unset($_SESSION['newCos']);}
		else { $_SESSION['newCos'] = true; }
	}
	
	
	
	// clicking search button 		
		if(isset($_POST['searchResult'])){
			$_SESSION['year'] = $_POST['year'];
			$_SESSION['code'] = $_POST['code'];
			$_SESSION['qtype'] = $_POST['qtype'];								 
			 
		}
		 /*************************************/
		 
		 $resultCond = array();
			
			$aYear = array("year"=>$_SESSION['year']);
			$aCode = array("code"=>$_SESSION['code']);
			$qType = array("qtype"=>$_SESSION['qtype']);
			
			if($_SESSION['year']!=""){
					$resultCond = array_merge($resultCond,$aYear);
			}
			
			if($_SESSION['code']!=""){
					$resultCond = array_merge($resultCond,$aCode);
			}
			
			if($_SESSION['qtype']!=""){
					$resultCond = array_merge($resultCond,$qType);
			}
			 
	/*********************************************/
	 
			$_SESSION['resCond'] = $resultCond;
		
	/*******************************************/
 
	$distcYear = $dbm->getFields($dbm->select_Distinct("year","users_result",array()),array("year"));
		//
		$distcCode = $dbm->getFields($dbm->select_Distinct("code","users_result",array("year"=>$_SESSION['year'])),array("code"));
		//
		 $distcType = $dbm->getFields($dbm->select_Distinct("qtype","users_result",array("year"=>$_SESSION['year'],"code"=>$_SESSION['code'])),array("qtype"));
			
		/*******************************************/		
		$cosInfo = $courses->searchCourse(array("code"=>$_SESSION['code'],'level')); 
		$_SESSION['level'] = $cosInfo['level'][0];
		/*******************************************/
		
		$examStudents = $dbm->getFields($dbm->select("users_result",$resultCond,array("user_id")),array("user_id","year","totalmark","totalscore","percent","paperlogintime","paperlogouttime","sn","code","qtype","year","paper_signal","total_sec","sec_used"));
		
 
		/***** to download result 	
	**********************************************************/
		if(isset($_POST['downloadResult'])){ 					 
			//
			$dbm = new DbTool();
			$req = $dbm->remap($_SESSION['resCond']); 
			
			header("Location:download.php?$req");
		} 
	/***************************************************************/
		
	if(isset($_POST['vassess'])){
		$_SESSION['stud_result_criterial'] = explode("_", $_POST['vassess']); 
		header("Location:student_result.php"); 
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
	
            <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left"> <form method="post">
                            <h3> <i class="fa fa-book fa-fw"> </i> &nbsp; Users Result     <small> ... </small> &nbsp; <button class="btn btn-round btn-primary" name="cosplus"  id="cosplus"type="submit" title=" Filter Result "><i class="fa fa-pencil"> </i></button>
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
              <?php if(isset($_SESSION['newCos']) || isset($_SESSION['CosUpdates'])){?>
                <div class="row"> 
                	<div class="x_content">
                	<div class="panel panel-info">
                    <div class="panel-body"> <form method="post">
                	<div class="col-md-2 col-sm-2 col-xs-6">
                    	<div class="form-group">
                        	<label>Filter By Year </label>
                        	<select class="form-control" name="year" id="year" onChange="resemble()">
                                 <option value="">Select </option>
                                   <?php  
									foreach( $distcYear['year'] as $qy){
									?>
                                   <option value="<?php echo $qy; ?>" <?php echo ($_SESSION['year']==$qy)?"selected":"";?>> <?php echo $qy; ?></option>
                                   <?php } ?>
                                </select>
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                    
                    <div class="col-md-2 col-sm-2 col-xs-6">                    
                    	<div class="form-group">
                        	<label>Filter By Course </label>                        	
							 <select class="form-control" name="code" id="code" onChange="resemble()">
                                 <option value=""> Select.. </option>
                                   <?php  
									foreach( $distcCode['code'] as $cc){
									?>
                                   <option value="<?php echo $cc; ?>" <?php echo ($_SESSION['code']==$cc)?"selected":"";?>> <?php echo $cc; ?></option>
                                   <?php } ?>
                               </select>
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                    
                    <div class="col-md-2 col-sm-2 col-xs-6">                    
                    	<div class="form-group">
                        	<label>Filter By Type </label>
                   	      
						   <select class="form-control" name="qtype" id="qtype" onChange="resemble()">
                                 <option value=""> Select.. </option>
                                   <?php  
									foreach( $distcType['qtype'] as $qt){
									?>
                                   <option value="<?php echo $qt; ?>" <?php echo ($_SESSION['qtype']==$qt)?"selected":"";?>> <?php echo $qt; ?></option>
                                   <?php } ?>
                               </select>
							   
                    	</div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                    
                    
                    <div class="col-md-1 col-sm-1 col-xs-3">                    	
                    	<div class="form-group">
                        	<label><small>Search </small></label>
                        	<button class="btn btn-primary" type="submit" name="searchResult" id="searchResult" title="Search Result"> <i class="fa fa-search"></i> </button>
                             </div> <!--/. form group-->
                    </div> <!--/. col-md-1 -->
                   
                    
				  </form>
                    </div> <!--/. panel-body-->
                    </div> <!--/. panel info-->
                    </div> <!-- /. x_content -->
                </div><!-- /. row-->
             <?php } ?>   
             
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel"> 
                                <div class="x_title"> <form method="post">
                                    <h2> <small style="font-size:14px;"> <b> Result For:  <?php echo $_SESSION['year']." | ". $_SESSION['code']." | ". $cosInfo['name'][0]." | ". $cosInfo['level'][0]." Level | ".$_SESSION['qtype'];?> &nbsp;</b> </small> 
							 <?php if(!empty($_SESSION['year'])) { ?><button type="submit" name="downloadResult" id="downloadResult" class="btn btn-round btn-info"> Download &nbsp; <i class="fa fa-download"></i> </button> &nbsp; &nbsp; 
							 <button type="button" name="printResult" id="printResult" class="btn btn-round btn-primary" onclick="window.print()"> Print&nbsp; <i class="glyphicon glyphicon-print"></i> </button> <?php }?>
									</h2>                                    
                                    <div class="clearfix"></div>
									</form>
                                </div>
                                <div class="x_content">  <form method="post">									
                                    <table class="table table-striped table-bordered responsive-utilities jambo_table" style="font-size:13px;">
                                        <thead>
                                            <tr  class="text-uppercase">
                                                 
                                                <th> S/N  </th>												
												<th> Passport </th>
												<th> Fullname / Matric .No  </th>												                                       
												<th> Time Allocated </th>												
												<th> Expected Mark  </th>
												<th> Score  </th>
												<th> Percent&nbsp;(%)  </th>		                                        
												<th> paper signal  </th>		                                        
											</tr>
                                        </thead>
									<!-- now list all courses available or searched -->
                                        <tbody>
										
										 <!--  load users from database --> 
								<?php 
								
								if(!empty($_SESSION['year'])) { 
								// 
									$sn = 0; 
									foreach($examStudents['user_id'] as $uid ){ 
									$me = $dbm->getFields($dbm->select("users",array("user_id"=>$uid)),array("surname","firstname","midname","passport"));
									?>
                                        <tr class="gradeA">											 
                                            <td><?php echo $sn+1; ?></td>											
                                            <td> <img src="<?php  echo "../media/user_imgs/".$me['passport'][0]; ?>" class="image image-responsive img-thumbnail" width="40" height="40" /></td>
                                            <td><?php echo $me['surname'][0]." ".$me['firstname'][0]." ".$me['midname'][0]."<br/><b>". $uid."</b>"; ?></td>                                            
                                            <td class="text-left"><?php echo readTime($examStudents['total_sec'][$sn])."<br/><b>".$examStudents['code'][$sn]."&nbsp; ".$examStudents['qtype'][$sn]."</b>"?></td>                                            
                                            <td class="text-left text-capitalised"><button class="btn btn-primary btn-sm"> <?php echo $examStudents['totalmark'][$sn]; ?> </button></td>
											 <td class="text-left"> <button class="btn btn-sm <?php echo $dbm->readPercent($examStudents['percent'][$sn]);?>"> <?php echo $examStudents['totalscore'][$sn];  ?> </button></td>
                                            <td class="text-left"> <button class="btn btn-sm <?php echo $dbm->readPercent($examStudents['percent'][$sn]);?>"> <?php echo  $examStudents['percent'][$sn];?></button>  </td>
											<td class="text-left"><button  name="vassess" type="submit" value="<?php echo $uid."_".$examStudents['year'][$sn]."_".$examStudents['code'][$sn]."_".$examStudents['qtype'][$sn]; ?>" class="btn <?php if($examStudents['paper_signal'][$sn]=="normal") echo "btn-success"; if($examStudents['paper_signal'][$sn]=="process") echo "btn-warning"; if($examStudents['paper_signal'][$sn]=="done") echo "btn-primary";?> btn-sm" data-toggle="tooltip"  data-placement="top" title=" View Assessment  "><?php echo $examStudents['paper_signal'][$sn];?></button></td>                                            
                                        </tr> 
							  <?php  $sn++; }
							  
								} // end of !empty ?>
							  
							<!--  load user --> 
									 	
                                       
                                        </tbody>
                                    </table>

								 </form>	
								</div>  <!--  /. x_content -->
                            </div> <!--  /. x_panel -->
							  
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
	
		function resemble(){
		$("#searchResult").click(); 
	 }
					
	</script>
		
	<?php include "../media/links/foot_libraries.html"; ?>
	  	
        
            
     
</body>

</html>