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
	 
	
	$bi = new  Institute_info();
	
	$_SESSION['page_title'] = $bi->institutename; 
	
	$courses = new Course(); 
	
		$allCourses = $courses->getAll(array());
	//
		$dbm = new DbTool(); 
	 
	if(isset($_POST['togQtn'])){
		if(isset($_SESSION['qSearch'])) { unset($_SESSION['qSearch']);}
		else { $_SESSION['qSearch'] = true; }
	}
	
	//
	if(isset($_POST['searchQues'])){
					
			$_SESSION['coscode'] = $_POST['coscode'];
			$_SESSION['cosyear'] = $_POST['cosyear'];
			$_SESSION['questype'] = $_POST['questype'];  
	}
	 
		$disYear = $dbm->getFields($dbm->select_Distinct("year","questions",array("code"=>$_SESSION['coscode'])),array('year'));
		$disType = $dbm->getFields($dbm->select_Distinct("qtype","questions",array("code"=>$_SESSION['coscode'],"year"=>$_SESSION['cosyear'])),array('qtype'));
		// $ = 
		$allQtns = $dbm->getFields($dbm->select("questions",array("year"=>$_SESSION['cosyear'],"code"=>$_SESSION['coscode'],"qtype"=>$_SESSION['questype']),array("num")),
		array("sn","num","question","option1","option2","option3","option4","option5","answer","marks","optiontype","typeAns","image1","image2","passage"));
		$totMarks = array_sum($allQtns['marks']);
		
		$cosInfo = $courses->searchCourse(array("code"=>$_SESSION['coscode'])); 
		// now fetch all questions 
		
	/*******************************************************************/
		
	
	if(isset($_POST['subModQn'])){
	 
		$_SESSION['updateId'] = $_POST['modify'];	  		
		 $dbm = new DbTool();		 	  
		 $mdQtn = $dbm->getFields($dbm->select('questions',array('sn'=>$_SESSION['updateId'])),array('sn','num','code','year','level','qtype','tot_option','optiontype',
		 'question','passage','option1','option2','option3','option4','option5','answer','typeAns','image1'));
 //		 	 
		$_SESSION['coscode'] = $mdQtn['code'][0];	
		$_SESSION['cosyear'] = $mdQtn['year'][0];		
		$_SESSION['questype'] = $mdQtn['qtype'][0];
		
		$_SESSION['oldnum'] = $_SESSION['qtnNo'] = $mdQtn['num'][0]; // new question no.
		$_SESSION['question'] = $mdQtn['question'][0];
		$_SESSION['defaultOption'] = $mdQtn['tot_option'][0];
		$_SESSION['passage'] = $mdQtn['passage'][0];
		
		$_SESSION['optionType'] = $mdQtn['optiontype'][0];
		$_SESSION['options'][1] = $mdQtn['option1'][0];
		$_SESSION['options'][2] = $mdQtn['option2'][0];
		$_SESSION['options'][3] = $mdQtn['option3'][0];
		$_SESSION['options'][4] = $mdQtn['option4'][0];
		$_SESSION['options'][5] = $mdQtn['option5'][0];
		$_SESSION['marks'] =	  $mdQtn['marks'][0];
		$_SESSION['typeAns'] = 	  $mdQtn['typeAns'][0];
		
		$_SESSION['img_src'] = "../exroom/imgs/".$mdQtn['image1'][0];
		$_SESSION['img_name'] = $mdQtn['image1'][0];
		
	 	$_SESSION['answer'] = $dbm->paste_answer(array($mdQtn['option1'][0],$mdQtn['option2'][0],$mdQtn['option3'][0],$mdQtn['option4'][0],$mdQtn['option5'][0]),$mdQtn['answer'][0]);   // $allqtn['answer'][0];
	  	$_SESSION['service'] = "update";		 
		
		 $_SESSION['stageone'] = true;
		 $_SESSION['stagetwo'] = true;
		
		header("Location:nquestion.php");		  	  
	}
	/*************************************************************************/
		
	## deleting selected checkboxes 
	
	if(isset($_POST['delSel'])){
		
		$dbm = new DbTool(); 
		
		$dels = count($_POST['qtnDel']);
		
		for($j=0; $j < $dels; $j++)
				{
					$dbm->deleteRow("questions",array("sn"=>$_POST['qtnDel'][$j]));
				}
				//  deleted 
				// $_SESSION['delMsg'] = "$dels questions has been deleted";
				 echo "<script> alert( '$dels questions has been deleted')</script>";
				header("Refresh:1");

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
                            <h3> <i class="fa fa-book fa-fw"> </i> &nbsp; Questions...  <?php  # echo "(". count($allCourses['code']).")&nbsp;";  ?>  <small>  </small> &nbsp; <button class="btn btn-round btn-primary" name="togQtn"  id="togQtn"type="submit" title=" Edit Questions Options "><i class="fa fa-table"> </i></button>
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
              <?php if(isset($_SESSION['qSearch'])){?>
                <div class="row"> 
                	<div class="x_content">
                	<div class="panel panel-info">
                    <div class="panel-body"> 
						
						<form method="post">
					   <div class="col-md-2 col-sm-2 col-xs-6">                    
											<div class="form-group">
												<label>Course Code </label>
												<select name="coscode" id="coscode" class="form-control" onChange="reSearch()">
                                                	<option value="">...</option>
                                                    <?php foreach($allCourses['code'] as $cc) {?>
                                                    <option value="<?php echo $cc; ?>" <?php echo ($_SESSION['coscode']==$cc)?"selected":""?>><?php echo $cc; ?></option>
                                                    <?php }?>
                                                </select>
											 </div> <!--/. form group-->
									   </div> <!--/. col-md-2 -->
                                       
                                       <div class="col-md-2 col-sm-2 col-xs-6">                    
											<div class="form-group">
												<label>Select Year </label>
												<select name="cosyear" id="cosyear" class="form-control" onChange="reSearch()">
                                                	<option value="">...</option>
                                                    <?php foreach($disYear['year'] as $y){?>
                                                    <option value="<?php echo $y; ?>" <?php echo ($_SESSION['cosyear']==$y)?"selected":""?>><?php echo $y; ?></option>
                                                   <?php }?>
                                                </select>
											 </div> <!--/. form group-->
									   </div> <!--/. col-md-2 -->
                                       
									    <div class="col-md-2 col-sm-2 col-xs-6">                    
											<div class="form-group">
												<label>Select Type </label>
												<select name="questype" id="questype" class="form-control" onChange="reSearch()">
                                                	<option value="">...</option>
                                                    <?php foreach($disType['qtype'] as $qt){?>
                                                    <option value="<?php echo $qt; ?>" <?php echo ($_SESSION['questype']==$qt)?"selected":""?>><?php echo $qt; ?></option>
                                                   <?php }?>
                                                </select>
											 </div> <!--/. form group-->
									   </div> <!--/. col-md-2 -->
									   
                                       
                    
                        <div class="col-md-1 col-sm-1 col-xs-3">                    	
                    	<div class="form-group">
                        	<label><small>search </small></label>
                            
                            <button class="btn btn-success" type="submit" name="searchQues" id="searchQues" title="Search Questions"> <i class="fa fa-search"></i> </button>
                        	
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
             
                    <div class="row"> <form method="post">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2> <?php echo  $cosInfo['name'][0]; ?>   <small  class="bold"> ( <?php echo  $cosInfo['code'][0]." | ". $cosInfo['level'][0]." | ".$_SESSION['questype']; ?> ) &nbsp; </small> 
									 <button class="btn btn-info btn-round" data-toggle="tooltip"  data-placement="top" title=" Total Questions  "> <i><?php echo count($allQtns['sn']);?></i></button> 
									 <button class="btn btn-danger btn-round" name="delSel" id="delSel"> <i>Delete Selected</i></button>									
									</h2>  
									<div class="navbar-right"> <small>Total Marks </small> <button class="btn btn-round btn-primary"  data-toggle="tooltip"  data-placement="top" title=" Total Marks  ">
									<?php echo $totMarks;?></button> 
									</div>									
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content"> 									
                                    <table id="example" class="table table-striped table-bordered responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" name="clickallQtn" onClick="selectAllQtn()" class="tableflat checkbox-inline">
                                                </th>
                                                <th> S/N </th>
                                                <th>Questions </th>
												<th>Marks</th>
                                                <th>A </th>
                                                <th>B </th>
                                                <th>C </th>
                                                <th>D </th>   
                                                <th>E</th> 
												<th>Actions</th> 
                                            </tr>
                                        </thead>
									<!-- now list all courses available or searched -->
                                        <tbody>
                                             <?php $sn = 0; 
									foreach($allQtns['question'] as $qtn ){  ?>
                                            <tr class="odd pointer">
                                                <td class="a-center "> 
                                                    <input type="checkbox" class="qtnDel checkbox tableflat" name="qtnDel[]" value="<?php echo $allQtns['sn'][$sn]; ?>">
                                                </td>
                                                <td class=" "> <input type="text" name="<?php echo "updn".$allQtns['sn'][$sn]; ?>" id="<?php echo "updn".$allQtns['sn'][$sn]; ?>" value="<?php echo $allQtns['num'][$sn]; ?>" class="qnumUpd form-control" style="width:60px;" /> <?php // echo $sn+1; ?> </td>
                                                <td class=" "><?php echo $qtn;  ?>   </td>												
												<td><span class="btn btn-primary"><?php echo $allQtns['marks'][$sn]; ?></span></td>
												
											<?php  if($allQtns['optiontype'][$sn]=="choice") { ?>
												  
													<td class=" "><?php echo $allQtns['option1'][$sn]; ?>  <?php if(($allQtns['option1'][$sn]==$allQtns['answer'][$sn] || $allQtns['option1'][$sn]==$allQtns['answer2'][$sn] || $allQtns['option1'][$sn]==$allQtns['answer3'][$sn])&& $allQtns['option1'][$sn]!=""){?> <span class="green fa fa-check"></span> <?php }?></td>
													 <td class=" "> <?php echo $allQtns['option2'][$sn]; ?>  <?php if(($allQtns['option2'][$sn]==$allQtns['answer'][$sn] || $allQtns['option2'][$sn]==$allQtns['answer2'][$sn] || $allQtns['option2'][$sn]==$allQtns['answer3'][$sn])&& $allQtns['option2'][$sn]!=""){?> <span class="green fa fa-check "></span> <?php }?>  </td>
													<td class=" "><?php echo $allQtns['option3'][$sn]; ?>  <?php if(($allQtns['option3'][$sn]==$allQtns['answer'][$sn] || $allQtns['option3'][$sn]==$allQtns['answer2'][$sn] || $allQtns['option3'][$sn]==$allQtns['answer3'][$sn])&& $allQtns['option3'][$sn]!=""){?> <span class="green fa fa-check "></span> <?php }?> </td>
													<td><?php echo $allQtns['option4'][$sn]; ?> <?php if(($allQtns['option4'][$sn]==$allQtns['answer'][$sn] || $allQtns['option4'][$sn]==$allQtns['answer2'][$sn] || $allQtns['option4'][$sn]==$allQtns['answer3'][$sn])&& $allQtns['option4'][$sn]!=""){?> <span class="green fa fa-check "></span> <?php }?> </td>
													<td>
													<?php echo $allQtns['option5'][$sn]; ?>   <?php if(($allQtns['option5'][$sn]==$allQtns['answer'][$sn]) && $allQtns['option5'][$sn]!=""){?> <span class="green fa fa-check "></span> <?php }?> 
												   </td>  
												   
											   <?php  } 
											     else if( $allQtns['optiontype'][$sn]=="typeIn") { ?>
											   											   
											   <td class=" " colspan="5">  Type-In Ans <i class="fa fa-arrow-right"></i> &nbsp; <?php echo $allQtns['typeAns'][$sn]; ?>   </td>
											
											<?php }?>

											   
												<td> <button class="mdqx btn btn-info small" title="Update"  type="submit" name="mdqx" value="<?php echo $allQtns['sn'][$sn]." ";?>"><i class="fa fa-edit"></i></button>
													<?php  
														if($allQtns['passage'][$sn]!=""){?>
															<span class="btn btn-primary small" title="Passage : <?php echo strip_tags($allQtns['passage'][$sn]); ?> "><i class="fa fa-book"></i></span>
														<?php } 
														
														if($allQtns['image1'][$sn]!=""){?>
															<span class="btn btn-warning small" title="View Attachment"><i class="fa fa-paperclip"></i></span>
														<?php } 
?>
												</td>
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
						</form>
                    </div>
                </div>
                
                  
                     <form method="post">
                        
                   <input type="hidden" name="cosmods" id="cosmods" value="" />
                    <input type="hidden" name="modify" id="modify" value="" /> 
					<input type="submit" name="subModQn" id="subModQn" value="" style="visibility:hidden;"/>  
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
		
		function reSearch(){
			$('#searchQues').click();
		}
			
			$(document).ready(function (){
				
		/**********************************************/
				
		// toggle delete seletion button delSel 
		 	
			$('#delSel').hide('fast');
		  
		
		/**********************************************/
				
				/// updating ;question mumber 
		
		$("input:text.qnumUpd").change(function(e) {
            name = $(this).attr("name");
			value = $(this).val();
						 
			if(confirm("are you sure you want to change this number")){
				
				$.post("../media/php/DbTool.php",{qnmUpdate:'questionum',name:name,value:value},function(respond){
					  alert(respond);
					window.location.href = "";					
				 });
			}
			 
        });
		/*************************************************/
		
		$(".mdqx").on('click',function (p){ 				
				 var num = $(this).val();
				 $("#modify").val(num);
				
				 $("#subModQn").click();
				  
				  return false; 
				});
		/***************************************/				
			
			$('.qtnDel').on('click',function(){
			  tot = $('input[name="qtnDel[]"]:checked').length; 	
				// alert(tot);
				if(tot>0) $('#delSel').show('slow');
				else $('#delSel').hide('slow');
				
		});
		
		/**************************************************/
		$('#delSel').on('click',function(){
			
			return confirm(' do you want to delete all selected questions ?');			
		});
		
	});
		
		///// find all checkbox when one selected
			
		/*******************/
	function selectAllQtn(){
		elem=document.getElementsByName("qtnDel[]");
		for(i=0; i< elem.length; i++){
		if(elem[i].type='checkbox') 
		elem[i].click()};		
		// 				
	}		
/********************/
		
			
			 
	</script>
	 
	<?php include "../media/links/foot_libraries.html"; ?>
	
     
     
</body>

</html>