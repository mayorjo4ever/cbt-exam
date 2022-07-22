<?php 
	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";
	
	require "../media/php/User.php";	
	$admin = new User("admin");		
	if(!$admin->confirmLogin('adminUser')) $admin->logout('adminUser','../'); 
	 /*************************************************************************/	
	 $_SESSION['adminInfo'] = $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	 
	 $bi = new Institute_info();
	
	$_SESSION['page_title'] = "Import / Create New Customer"; 
		
	$users = new User("users");	 
		$allUser = $users->getAll(array()); 
	//

	// when searching for students info 
	if(isset($_POST['searchuser'])){
		
		$searchText = strip_tags($_POST['searchText']); 
		
		$allUser = $users->searchUser(array('surname'=>$searchText,'firstname'=>$searchText,'midname'=>$searchText,'sex'=>$searchText,'email'=>$searchText,'faculty'=>$searchText,'department'=>$searchText,'dob'=>$searchText,'level'=>$searchText,'phone'=>$searchText,'user_id'=>$searchText));
				
	}
		
?>


<?php  

	// importing excel file 
	
	require '../media/Classes/PHPExcel.php';
	require_once '../media/Classes/PHPExcel/IOFactory.php';
	$dbm = new DbTool();
		
	//
	// alerts 
		$alert_warning = "alert-warning";
		$alert_success = "alert-success";
		$alert_danger = "alert-danger";
		
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
		  $imgdisplay = $disp_off;
		  $msgAlert = $alert_success;
		/////////////////////////////////////////////////
		
	if(isset($_POST['importUsers'])) // importUsers userFile
	{
		$import_file = $_FILES['userFile']['name'];
		$import_file_tmp_name = $_FILES['userFile']['tmp_name'];
		$import_file_path = pathinfo($_FILES['userFile']['name']);
 		$import_file_ext = $import_file_path['extension'];
	 	
		$status = false; 
	 
		if(empty($import_file)){
			$tagSign = $gly_warn;
		  	$display = $disp_on;
		  	$msgAlert = $alert_warning;			
			$_SESSION['studMsg'] = " NO file chosen, Please upload (.xls) file ";	
		}
		
		else{
			// check file type 
			$nfn = "importedUsers";
			// create a directory 
			if(!is_dir("uploads/")) mkdir("uploads/");
			 
			$fext = array('application/vnd.ms-excel','application/xls','text/xls');

				
			foreach($fext as $mime) {
							if ($mime == $_FILES['userFile']['type']) {
								  $status = true;
								  unlink("uploads/");
								  	$newFPath =  "uploads/".$nfn.'.'."xls";	
									$nfname = $nfn.'.'."xls";								 
									break;
							}
						}
						
			if(!$status){					
			$tagSign = $gly_warn;
		  	$display = $disp_on;
		  	$msgAlert = $alert_warning;			
			$_SESSION['studMsg'] = " Please select an Excel File(XLS): &nbsp; you gave a $import_file_ext file" ;			
				}
		
				else{
				
					copy($import_file_tmp_name, $newFPath);					
					
					$path = $newFPath;					
					
 			$objPHPExcel = PHPExcel_IOFactory::load($path);			
		 		 
	foreach ($objPHPExcel->getWorksheetIterator() as $worksheet) {
    
    $highestRow         = $worksheet->getHighestRow(); // e.g. 10
    $highestColumn      = $worksheet->getHighestColumn(); // e.g 'F'
    $highestColumnIndex = PHPExcel_Cell::columnIndexFromString($highestColumn);	
    $nrColumns = ord($highestColumn) - 64;
	
	///////////////////////////////////
	/*
	if($nrColumns!=9){ 
	$tagSign = $gly_warn;
		  	$display = $disp_on;
		  	$msgAlert = $alert_warning;			
			$_SESSION['studMsg'] = " your worksheet must have 9 columns: starting from  B - I ";
			$_SESSION['studMsg'] .=" <br/> this has $nrColumns columns ";
	 }*/
	 
		# else {
		       
	$headers = array(); 
	////////////////////////////////////////////////////
	////// get header 	
	 for ($col = 1; $col < $highestColumnIndex; ++ $col) {
            $cell = $worksheet->getCellByColumnAndRow($col, 1);
            $headers[$col-1]=$cell->getValue();			
        }   /// headers gotten      
		
		// get body 
	////////////////////////////////////////////////////////////////
	$fUsers = array();		/// full users
	for ($row = 2; $row <= $highestRow; ++ $row) {	
		$sUser=array();		/// single user
		for ($col = 1; $col < $highestColumnIndex; ++ $col) {
		   $cell = $worksheet->getCellByColumnAndRow($col, $row);
		   // $val = $cell->getValue();
		   // $dataType = PHPExcel_Cell_DataType::dataTypeForValue($val);
		   $sUser[] = $cell->getValue();
		   
		}
		$fUsers[] = array_combine($headers,$sUser);	 // merge each column head with cell values  
	}	
	// all users has been fetched now 			
	/////////////////////////////////////////////////////
	///// now check if each users exists before 	
			$dup = 0; $ins = 0; $i = 0; $dupUsers = $insUsers =  array();
			foreach($fUsers as $lUsers){// each line record
				
			$fd = $dbm->getFields($dbm->select("users",array("user_id"=>$lUsers['user_id'])),array_keys($lUsers));		 
				
				if(!empty($fd)){
					$dup++;	$dupUsers[]=$lUsers;
				}	
				else{
					  $dbm->insert("users",$lUsers);	
					  $insUsers[] = $lUsers;
						$dbm->updateTb("users",array("logstatus"=>"lout"),array("user_id"=>$lUsers['user_id']));
						$dbm->updateTb("users",array("password"=>strtolower($lUsers['surname']),"enc_psw"=>$dbm->toMD5(strtolower($lUsers['surname']))),array("user_id"=>$lUsers['user_id']));
					$ins++;
				}					 
				}		
				
			$tagSign = $gly_ok;
		  	$display = $disp_on;
		  	$msgAlert = $alert_success;			
			$_SESSION['studMsg'] = "$ins Users Successfully Uploaded, while $dup duplicate Users were discarded "; // 
	 
				#	 } 	 	 
								
					}
				}
						 
			}		 
		}
?>


<?php 
	# downloading sample worksheet 
		
		if(isset($_POST['dwnStuds'])){
			
			header("Location:uploads/students.xls");
			
		}

?>


<?php 

	# import images for users 
	 if(isset($_POST['importImages'])){
		  
		 $n = 0; 
		 $images_arr = array(); 
		  
		 // validate 
		 
		 if($_FILES['userImages']['name'][0]==""){
			 $imgtagSign = $gly_warn;
		  	$imgdisplay = $disp_on;
		  	$imgAlert = $alert_warning;			
			$_SESSION['imgMsg'] = " Please, Upload The Images First  "; 
			 
		 }
		 
		 else { 
		 
		 $upLoads = 0; $repLaced = 0; 
		 
		 foreach($_FILES['userImages']['name'] as $key=>$val){
			//upload and stored images
			$target_dir = "../media/user_imgs/";
			
			$target_file = $target_dir.$_FILES['userImages']['name'][$key]; 
			 $images_arr[] = $target_file;				
				// check if file exists 
				 if(!file_exists($target_file)){
				
					if(move_uploaded_file($_FILES['userImages']['tmp_name'][$key],$target_file)){						
						$upLoads++; 
					// $images_arr[] = $target_file;
					
					} // end moved file
				 } // end file exists 
				 else if(file_exists($target_file)) {
						unlink($target_file); 
						if(move_uploaded_file($_FILES['userImages']['tmp_name'][$key],$target_file)){						
						$repLaced++; 
						// $images_arr[] = $target_file;
					
					} // end moved file
  					 
				 }
    		}	
			 $totImgs = count($images_arr);
		 
		 
			$imgtagSign = $gly_ok;
		  	$imgdisplay = $disp_on;
		  	$imgAlert = $alert_success;			
			$_SESSION['imgMsg'] = " $upLoads of $totImgs images uploaded successfully and $repLaced images were replaced"; //.print_r($_FILES['userImages']['name']); // 
	 	}

	 }
?>

<!DOCTYPE html>
<html lang="en">

<head>
    
    <title> Import / Create New Customer </title>    
	
	<?php include "../media/links/top_libraries.html";?>
	
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
                        <div class="title_left">
                            <h3> <i class="glyphicon glyphicon-import"></i> &nbsp; Import New Users  </h3>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search user..." name="searchText" id="searchText" value="<?php echo $_POST['searchText']; ?>">
                                    <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit" name="searchuser" id="searchuser">Go!</button>
                       				</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="x_panel">
                                <div class="x_content">

                                    <div class="row">
				<div class="col-md-12 col-sm-12 col-xs-12" style="text-align:center;">
					
				</div>                                 
				<div class="clearfix"></div>

					         <!--show only if new button is clicked--> 
              <?php  # if(isset($_SESSION['newQues'])){?>
                <div class="row"> 
                	<div class="x_content">
                 	<div class="panel panel-info">
                    <div class="panel-body"> <form method="post" enctype="multipart/form-data">
                	
                    <div class="col-md-4 col-sm-4 col-xs-8">
                    	<div class="form-group">
                        	<label> Upload  Users Profiles &nbsp; <small> (choose .xls file) </small> </label>
                        	<input type="file" name="userFile" id="userFile" class="form-control" title=" Select Your Excel File (.xls)"/>
                        </div> <!--/. form group--> 
                    </div> <!--/. col-md-2 -->
                     
                     
                    <div class="col-md-1 col-sm-1 col-xs-3">                    	
                    	<div class="form-group">
                        	<label><small>upload.. </small></label>
                        	<button class="btn btn-primary" type="submit" name="importUsers" id="importUsers" title="Now Upload The Users">  <i class="glyphicon glyphicon-upload"></i> </button>
                             </div> <!--/. form group-->
                    </div> <!--/. col-md-1 -->
                    
                    
                       <div class="col-md-1 col-sm-1 col-xs-3">                    	
                    	<div class="form-group">
                        	<label><small>sample </small></label>
                        	<button class="btn btn-success" type="submit" name="dwnStuds" id="dwnStuds" title="Download Sample File For Students "> <i class="fa fa-download"> </i> </button>
                             </div> <!--/. form group-->
                    	</div> <!--/. col-md-1 -->
                    
                    
                   <div class="col-md-5 col-sm-5 col-xs-12">                    
                    	
						<button class="alert <?php echo $msgAlert;?>"<?php echo $display; // off or on ?>> <span><i class="glyphicon <?php echo $tagSign; ?>"></i></span> <?php print $_SESSION['studMsg']; ?> </button>

                    </div> <!--/. col-md-5 -->
					
					<div class="col-sm-12 col-md-12 col-xs-12">					
						<hr/>
				   </div>
				   
				   <div class="col-sm-11 col-md-11 col-xs-12">					
						<table class="table table-responsive utilities-responsive table-stripped jambo_table">
						<tbody>
						<?php   if(!empty($insUsers)){  ?>
						<tr style="font-size:16px; color:green" > <th colspan="8"> Successful uploaded Records are as follows </th> </tr>
						 
						 <?php $n = 1;  foreach($insUsers as $uid) { ?>
								
							 <?php // print_r($uid); ?>	
							
							<tr style="font-weight:bold;">
								<td class=" "><?php  print $n." "; ?></td>
								<td class=" "><?php  print $uid['user_id']." "; ?></td>
								<td class=" "><?php  print $uid['surname']." ".$uid['firstname']." ".$uid['midname']; ?></td>
								<td class=" "><?php  print $uid['sex']." "; ?></td>
								<td class=" "><?php  print $uid['level']." "; ?></td>
								<td class=" "><?php  print $uid['faculty']." | ".$uid['department']; ?></td>
								<td class=" "><?php  print $uid['email'];  ?></td>
								<td class=" "><?php  print $uid['phone'];  ?></td>
							</tr>
							 
					<?php $n++; }
					
							 }
							 
							 ?>
							 
						<?php   if(!empty($dupUsers)){  ?>
						<tr style="font-size:16px;"> <th colspan="8"> The Following Records Were Duplicated  but discarded </th> </tr>
						 
						 <?php $d = 1; foreach($dupUsers as $uid) { ?>
								
							 <?php // print_r($uid); ?>	
							<tr>
								<td class="red"><?php  print $d." "; ?></td>
								<td class="red"><?php  print $uid['user_id']." "; ?></td>
								<td class="red"><?php  print $uid['surname']." ".$uid['firstname']." ".$uid['midname']; ?></td>
								<td class="red"><?php  print $uid['sex']." "; ?></td>
								<td class="red"><?php  print $uid['level']." "; ?></td>
								<td class="red"><?php  print $uid['faculty']." | ".$uid['department']; ?></td>
								<td class="red"><?php  print $uid['email'];  ?></td>
								<td class="red"><?php  print $uid['phone'];  ?></td>
							</tr>
							 
					<?php $d++; }
					
							 }
							 
							 ?>
							 </tbody>
					</table>
				   </div>
				   
					 <div class="col-md-12 col-sm-12 col-xs-12">                    
						<div class="form-group">
						<h4> format of excel file </h4>
						<img class="img img-responsive" src="../media/images/student_excel.png" />
						</div>								
								
                    </div> <!--/. col-md-12 -->
					
                    </form>
                    </div> <!--/. panel-body-->
                    </div> <!--/. panel info-->
                    </div> <!-- /. x_content -->
                </div><!-- /. row-->
             <?php # } ?>   
			 
			          <!--show only if new button is clicked--> 
              <?php # if(isset($_SESSION['newQues'])){?>
                <div class="row"> 
                	<div class="x_content">
                 	<div class="panel panel-info">
                    <div class="panel-body"> <form method="post" enctype="multipart/form-data">
                	
                    <div class="col-md-4 col-sm-4 col-xs-8">
                    	<div class="form-group">
                        	<label> Upload Their Passports &nbsp; <small> (choose .jpg/png file) </small> </label>
                        	<input type="file" class="form-control" name="userImages[]" id="userImages" accept="image/*" title="Browse Their Passports " multiple />
							<!-- <input type="file" name="importFile" id="importFile" class="form-control" /> -->
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                     
                     
                    <div class="col-md-1 col-sm-1 col-xs-3">                    	
                    	<div class="form-group">
                        	<label><small>upload.. </small></label>
                        	<button class="btn btn-primary" type="submit" name="importImages" id="importImages" title="Now Upload The Questions"> <i class="glyphicon glyphicon-upload"></i>  </button>
                             </div> <!--/. form group-->
                    </div> <!--/. col-md-1 -->
                    
                     
                    
                   <div class="col-md-7 col-sm-7 col-xs-12">                    
                    	<span class="alert <?php echo $imgAlert;?>"<?php echo $imgdisplay; // off or on ?>> <span><i class="glyphicon <?php echo $imgtagSign; ?>"></i></span> <?php print $_SESSION['imgMsg']; ?> </span>
								
                    </div> <!--/. col-md-6 -->
					
					<div class="col-sm-12 col-md-12 col-xs-12">					
						<hr/>
				   </div>
				   
					 <div class="col-md-12 col-sm-12 col-xs-12">                    
						<div class="form-group">
						<h4> Samples of Passports </h4>
						<img class="img img-responsive" src="../media/images/passports.png" />
						</div>								
								
                    </div> <!--/. col-md-9 -->
                    
                    </form>
                    </div> <!--/. panel-body-->
                    </div> <!--/. panel info-->
                    </div> <!-- /. x_content -->
                </div><!-- /. row-->
             <?php # } ?>   
			 
                                
                                </div>
                            </div> <!-- /. x_content -->
                        </div> <!-- /. x_panel -->
                    </div> <!-- /. col-sm-12 -->
                </div>
 
            </div>
            <!-- /page content -->
			
			
			

		</div> <!-- /. main_container -->
	
	</div> <!-- /. container body -->
	 
	<?php include "../media/links/foot_libraries.html";?>
	
</body>

</html>