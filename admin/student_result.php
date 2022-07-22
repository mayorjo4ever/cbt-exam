<?php 

	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";	
	require "../media/php/timecoder.php";	
	
	require "../media/php/Course.php";
	
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
	 	
	#######################################################################
	####### break result critrials  
	$newConds = $_SESSION['stud_result_criterial'];
	$me = $dbm->getFields($dbm->select("users",array("user_id"=>$newConds[0])),array("surname","firstname","midname","passport","level","department"));
	
	$mycosInfo = $courses->searchCourse(array("code"=>$newConds[2])); 
	
	$_SESSION['myQtn'] = $myQtn = $dbm->getFields($dbm->select("qtn_remind",array("user_id"=>$newConds[0],"year"=>$newConds[1],"codegen"=>$newConds[2])),
					array("sn","code","year","qtype","num","marks","question","tot_option","optiontype","passage","instruction","option1","option2","option3","option4","option5","answer","typeAns","image1","image2","picked1"));
	$_SESSION['myResult']  = $dbm->getFields($dbm->select("users_result",array("user_id"=>$newConds[0],"year"=>$newConds[1],
				"codegen"=>$newConds[2]),array("user_id")),array("user_id","year","totalmark","totalscore","percent","paperlogintime","paperlogouttime","sn","code","qtype","year","paper_signal","sec_used","bus_stop","total_sec"));
	#######################################################################
		
?>
	
 
<!DOCTYPE html>
<html lang="en">

<head>
    
    <title> <?php echo $me['surname'][0]." ".$me['firstname'][0]."'s &nbsp; Result "; ?></title>    
	
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
                        <div class="col-sm-12"> <form method="post">
                            <h4> <i class="fa fa-book fa-fw"> </i> <?php echo $me['surname'][0]." ".$me['firstname'][0]."'s &nbsp; ".$newConds[1]." ".$mycosInfo['semester'][0]."&nbsp; Semester &nbsp;Assessment &nbsp; ".$newConds[3]; ?>&nbsp;       <small> ... </small> &nbsp;
							<button type="button" class="btn " onclick="window.print()"><i class="glyphicon glyphicon-print" title="Print Rseult"> </i> </button>
							</h4> <br/>
						</form>
                        </div>
                        
                    </div>
                    
                    <!--show only if new button is clicked--> 
           
             
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                
                                <div class="x_content"> 									
										<div class="col-sm-8 col-md-8">
											<div class="">
												<?php 
													$n = 0; if(!empty($_SESSION['myQtn'])) foreach($_SESSION['myQtn']['num'] as $num ) {  ?>
													<div class="form-group even">
														<p> <label><b><i><?php echo $num.")"; ?> </i> </b></label>
															<!-- check for passage in question -->
															<?php if($_SESSION['myQtn']['passage'][$n]!="") {?>
																<p class="font-13 red"> <label> <i> Passage </i></label> <br/> <?php echo  $_SESSION['myQtn']['passage'][$n]; ?></p> <br/>
															<?php } ?>  
															
															<?php if($_SESSION['myQtn']['instruction'][$n]!="") {?>
																<span class="font-13 blue"> <label> </label> <br/> <?php echo  $_SESSION['myQtn']['instruction'][$n]; ?></span> <br/>
															<?php } ?>  
															
															<?php if($_SESSION['myQtn']['image1'][$n]!="") {?>
																<span class="font-13 blue"> <label> </label> <br/> <img class="img img-responsive" src="<?php echo "../exroom/imgs/". $_SESSION['myQtn']['image1'][$n]; ?>" style="max-width:150px; max-height:150px;" /></span> <br/>
															<?php } ?>  
															
															<?php echo stripslashes($_SESSION['myQtn']['question'][$n]); ?>
														</p>
														
														
														<?php if($_SESSION['myQtn']['optiontype'][($n)]=="choice") {?>
														<p> 
															<?php  for($p = 1; $p<=$_SESSION['myQtn']['tot_option'][$n]; $p++){?>
																<b> 
																
																<span class="bold"> <?php echo $dbm->iLabel($p); ?>) &nbsp; </span>
																
																<label> <?php echo $_SESSION['myQtn']['option'.$p][$n]; ?>  &nbsp; &nbsp;
																<?php if($_SESSION['myQtn']['option'.$p][$n] == $_SESSION['myQtn']['picked1'][$n] &&  $_SESSION['myQtn']['picked1'][$n] == $_SESSION['myQtn']['answer'][$n]  ) echo "<i class='glyphicon glyphicon-ok  green fa-2x'></i>"; ?> 
																<?php if($_SESSION['myQtn']['option'.$p][$n] == $_SESSION['myQtn']['picked1'][$n] &&  $_SESSION['myQtn']['picked1'][$n] != $_SESSION['myQtn']['answer'][$n]  ) echo "<i class='glyphicon glyphicon-remove  red fa-2x'></i>"; ?>
																<?php if($_SESSION['myQtn']['option'.$p][$n] == $_SESSION['myQtn']['answer'][$n] &&  $_SESSION['myQtn']['picked1'][$n] != $_SESSION['myQtn']['answer'][$n]  ) echo "<i class='glyphicon glyphicon-ok  green'></i>"; ?> 
																&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
																</label> </b>
															<?php }  ?>
														</p>
														<?php } #  end choice 
														
														else if($_SESSION['myQtn']['optiontype'][($n)]=="typeIn") {?>
															<p>
															
															<label> Supplied : &nbsp; &nbsp; <?php echo $_SESSION['myQtn']['picked1'][$n]; ?> &nbsp; &nbsp;
																<?php if(trim(strtolower($_SESSION['myQtn']['typeAns'][$n])) == trim(strtolower($_SESSION['myQtn']['picked1'][$n]))) echo "<i class='glyphicon glyphicon-ok  green fa-2x'></i>";?>
																<?php if(trim(strtolower($_SESSION['myQtn']['typeAns'][$n])) != trim(strtolower($_SESSION['myQtn']['picked1'][$n]))) echo "<i class='glyphicon glyphicon-remove  red fa-2x'></i>";?>
																<?php  
																																		
																?> 
															</label>
															 
															</p>
															
															<p>															
																<label> <small> Answer : &nbsp; &nbsp; <?php echo $_SESSION['myQtn']['typeAns'][$n]; ?> </small> </label>															
															</p>
														
														
														<?php } ?>
														<p>  Score &nbsp;:  &nbsp; &nbsp;
														
														<?php 

														if($_SESSION['myQtn']['optiontype'][$n]=="choice") {														
																	if($_SESSION['myQtn']['picked1'][$n] == $_SESSION['myQtn']['answer'][$n]) echo $_SESSION['myQtn']['marks'][$n]."&nbsp;/&nbsp".$_SESSION['myQtn']['marks'][$n]; else echo " 0 &nbsp;/&nbsp;".$_SESSION['myQtn']['marks'][$n]; 
															}
															else if($_SESSION['myQtn']['optiontype'][$n]=="typeIn") {	
															$accuracy = similar_text(trim(strtolower($_SESSION['myQtn']['picked1'][$n])),trim(strtolower($_SESSION['myQtn']['typeAns'][$n])),$cent); 
															if($cent==100) 	echo ( $cent / 100 ) * $_SESSION['myQtn']['marks'][$n]."&nbsp;/&nbsp;".$_SESSION['myQtn']['marks'][$n];  else echo " 0 &nbsp;/&nbsp;".$_SESSION['myQtn']['marks'][$n]; 
															}
																	?> 
														</p>
														<hr/>
													</div>
													
												<?php $n++;  } 
													else { ?>
														 <center> 
														<h3> <i class="fa fa-warning red"></i> &nbsp; Sorry!</h3>
															<h4> <?php echo $me['surname'][0]." ".$me['firstname'][0] ?> Has Not Written any Paper on <?php echo  $mycosInfo['name'][0]." for ".$mycosInfo['level'][0]." Level ";?></h4>
															 </center>
														
													<?php }
												?>
											</div>
											 
											<div class="x_title">
												<h4 class="text-uppercase bold">
													Summary of &nbsp; <?php echo $newConds[0]."&nbsp;'s &nbsp;".$newConds[3];?>  &nbsp;
												</h4>
												<div class="clearfix"></div>
											</div>
											 
											<div class="x_content">
												   <table class="table table-responsive table-bordered jambo_table">
													 <tbody>
														<tr class="text-uppercase bold">
															<th  style="width:25%; ">STUDENT info </th> <td colspan="3"><?php echo $me['surname'][0]." ".$me['firstname'][0]."'s &nbsp; ".$me['level'][0]."&nbsp; Level &nbsp; ".$mycosInfo['semester'][0]." Semester &nbsp;". $_SESSION['myResult']['year'][0]." &nbsp; ".$mycosInfo['code'][0]."&nbsp; ".$newConds[3];?>  </td>															
														</tr>
														
														<tr class="text-uppercase bold">
															<th>Course info </th> <td colspan="3"><?php echo $mycosInfo['code'][0]."&nbsp; - &nbsp; ".$mycosInfo['name'][0]."&nbsp - &nbsp;". $mycosInfo['level'][0]." Level &nbsp; - &nbsp;".$mycosInfo['unit'][0]." Units &nbsp;".$mycosInfo['status'][0]  ;?> </td>															
														</tr>
																												
														<tr class="text-uppercase bold">
															<th>score</th> <td colspan="3"><?php echo $_SESSION['myResult']['totalscore'][0] ."&nbsp;/&nbsp; ".$_SESSION['myResult']['totalmark'][0]. " &nbsp;&nbsp;(&nbsp;".$_SESSION['myResult']['percent'][0]."&nbsp;% )";?></td>															
														</tr> 
														<tr class="text-capitalize bold">
															<th>time in / out </th> <td colspan="3"><?php echo $_SESSION['myResult']['paperlogintime'][0] ."&nbsp;-&nbsp; ".$_SESSION['myResult']['paperlogouttime'][0];?> &nbsp; &nbsp; [ &nbsp; <?php echo readTime($_SESSION['myResult']['sec_used'][0]);?>&nbsp;/ &nbsp; <?php echo readTime($_SESSION['myResult']['total_sec'][0]);?> ]</td>															
														</tr> 
													 </tbody>
												   </table>
											</div>
											
										   </div> <!--  /. col-md-10 -->
										
										<div class="col-sm-2 col-md-2 ">
												<img src="<?php echo "../media/user_imgs/".$me['passport'][0] ?>" class=" img-profile img img-thumbnail img-responsive img-circle" style="max-height:160px;" />
												<br/><br/>
												<label> <i class="fa fa-signal"></i>&nbsp; &nbsp; Level : &nbsp; <?php echo $me['level'][0];?> L </label>										
												
										</div> <!--  /. col-md-2 -->
								</div> <!--  /. x_content-->
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
	
		function resemble(){
		$("#searchResult").click(); 
	 }
					
	</script>
		
	<?php include "../media/links/foot_libraries.html"; ?>
	  	
        
            
     
</body>

</html>