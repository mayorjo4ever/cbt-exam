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
	 $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	 
	
	$bi = new  Institute_info();
	// global variables 
	$_SESSION['page_title'] = $bi->institutename;  	
	//
	//// 
		$courses = new Course(); 
		$allCourses = $courses->getAll(array());
	//
		$dbm = new DbTool(); 
		
	/*******************************************************************/
	
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
		  $impdisplay = $disp_off;
		  $msgAlert = $alert_success;
		/////////////////////////////////////////////////
	
	/*******************************************************************/
	
	if(isset($_POST['fileImpTog'])){
		if(isset($_SESSION['newQues'])) { unset($_SESSION['newQues']);}
		else { $_SESSION['newQues'] = true; }
	}
	
	if(!isset($_SESSION['defaultOption'])){
		$_SESSION['defaultOption'] = 3;
	}
	//
	if(!isset($_SESSION['optionType'])){
		$_SESSION['optionType'] = "choice";
	}
	if(!isset($_SESSION['marks'])){
		$_SESSION['marks'] = 2;
	}
	//
	if(!isset($_SESSION['advQues'])) $_SESSION['advQues'] = true;
	////  adding more option 
	
		if(isset($_POST['optPlus'])){
			if($_SESSION['defaultOption']<=4){
				$_SESSION['defaultOption']++;
			}
			}
		/// deleting more options 
		
		if(isset($_POST['delOption'])){
			if($_SESSION['defaultOption']>=3){
				$_SESSION['defaultOption']--;
			}
		}
		
	//
	//
	if(isset($_POST['compStageOne'])){
						
			$_SESSION['coscode'] = $_POST['coscode'];
			$_SESSION['cosyear'] = $_POST['cosyear'];
			$_SESSION['questype'] = $_POST['questype'];
			
			// selected course info
			
			if($_SESSION['coscode']==""){
			
				$tagSign = $gly_warn;
				$display = $disp_on;
				$msgAlert = $awarn;
			
				$_SESSION['stgMsg'] = "Please Select Course Code"; 
				
			}
			else if ($_SESSION['cosyear']==""){
				$tagSign = $gly_warn;
				$display = $disp_on;
				$msgAlert = $awarn;
			
				$_SESSION['stgMsg'] = "Please Select The Year"; 
				
			}
			else if($_SESSION['questype']==""){
				$tagSign = $gly_warn;
				$display = $disp_on;
				$msgAlert = $awarn;
			
				$_SESSION['stgMsg'] = "Input the Type of Question";
			}
			else{
				 $_SESSION['stageone'] = true;
				 $_SESSION['stagetwo'] = true;
			}
			}
	 
	if(isset($_POST['prevForm'])){
			unset($_SESSION['stageone']);
			unset($_SESSION['stagetwo']);  
	}
	
	if(isset($_POST['canupdForm'])){
			unset($_SESSION['updQno']);
			// unset($_SESSION['stagetwo']);  
	}	
	/************************************************************************************************/
	// storing questions now  
	if(isset($_POST['nextForm']) || isset($_POST['prevForm']) || isset($_POST['optPlus']) || isset($_POST['delOption']) || isset($_POST['advQtn']) || isset($_POST['updForm']) || isset($_POST['advQtn'])){
		$_SESSION['optionType'] = $_POST['optionType']; 
		# from step 1 		
		///
		$_SESSION['instruct_option'] = $_POST['instruct_option'];
		$_SESSION['instruct_passage'] = $_POST['instruct_passage'];
		$_SESSION['question'] = addslashes ($_POST['qtn']); 
		$_SESSION['passage'] = addslashes($_POST['passage']);
		$_SESSION['hidQtn'] = addslashes($_POST['hidQtn']);
		$_SESSION['hidPsg'] = addslashes($_POST['hidPsg']);
		$_SESSION['answer'] = addslashes($_POST['cosAnswer']);
		$_SESSION['psgInc']	= $_POST['psgInc']; 
		$_SESSION['pixInc'] = $_POST['pixInc'];
		$_SESSION['marks'] = $_POST['marks'];
		$_SESSION['typeAns'] = addslashes($_POST['typeAns']);
		// optionType
			// $_SESSION[' nqtnNo'] = $dbm->clean($_POST['nqtnNo']);
			//  options 
			for($i = 1; $i<=$_SESSION['defaultOption']; $i++){
			$_SESSION['options'][$i] = $_POST["optIndex"+$i];
			$_SESSION['mcosAnswer'.$i] = $_POST['mcosAnswer'.$i];		# multi-answer
			}
			 //
			 $_SESSION['copy_answer'] = $dbm->copy_answer($_SESSION['defaultOption'],$_SESSION['answer']);			
			 $_SESSION['copy_m_answer'] = $dbm->copy_m_answer($_SESSION['defaultOption']);	
			 
	}
	/**************** Now validate the question ************************/
	/******************************************************************/	
	
	if(isset($_POST['nextForm']) || isset($_POST['updForm'])){
		// validate inputs 
		$ss1 = true; $ss2 = true; $ss3 = false; $ss4 = false; 
		if($_SESSION['question']=="") {
				$tagSign = $gly_warn;
		  		$display = $disp_on;
		  		$msgAlert = $awarn;
			$qtnMsg = "Please Enter Your Question"; 
			$ss1 = false; }
		
		else if($_SESSION['marks']==""){
			$tagSign = $gly_warn;
		  		$display = $disp_on;
		  		$msgAlert = $awarn;
			$qtnMsg = "Please Enter The Mark For Question"; 
			$ss1 = false;
		}
		else if($_SESSION['instruct_option']=="yes" && $_SESSION['instruct_passage']==""){
			$tagSign = $gly_warn;
		  		$display = $disp_on;
		  		$msgAlert = $awarn;
			$qtnMsg = "Please Enter The Instruction for the question "; 
			$ss1 = false;
		}
		else {			  
			 // check for options if not empty
			 
			 if($_SESSION['optionType']=="choice"){
			 for($i=$_SESSION['defaultOption']; $i>=1; $i--){
					
					if($_SESSION['options'][$i] ==""){
						$tagSign = $gly_warn;
						$display = $disp_on;
						$msgAlert = $awarn;
				
						$opt = $dbm->n2a($i); # num to alphabet
						$qtnMsg = " Supply Option $opt ";
						$ss1  = false;
						}
					}
			 }
			 if($_SESSION['optionType']=="typeIn"){
				 if($_SESSION['typeAns'] ==""){
						$tagSign = $gly_warn;
						$display = $disp_on;
						$msgAlert = $awarn;
						$qtnMsg = " Type in the answer ";
						$ss1  = false;
						}
			 }
		}
		
		if($ss1 == true){
						
				switch($_SESSION['optionType']){
				 
				 case "choice": {
					 if($_SESSION['copy_answer']=="") { 
						$tagSign = $gly_warn;
						$display = $disp_on;
						$msgAlert = $awarn;				
					 $qtnMsg = "Select The Answer " ; $ss2 = false; }					 
				 }
				 break;
				 
				 case "checkbox":{
						
				 if(count($_SESSION['copy_m_answer'])<=1) { 
						$tagSign = $gly_warn;
						$display = $disp_on;
						$msgAlert = $awarn;
				
				 $qtnMsg = "You must Select more than one answer ";
					$ss2 = false;
				 }
				 }
				 break; 
			 } // //	end of switch 
		}
		
		if($ss1 == true && $ss2 == true){
			
			# check to include passage  
			/***************************************************************/
			
			if($_SESSION['psgInc'] !=""){
					
					# validate if passage is null 
					if($_SESSION['passage']==""){
						$psgtagSign = $gly_warn;
						$psgdisplay = $disp_on;
						$psgAlert = $awarn;
						$psgMsg = " The Passage cannot be left empty ";	
						$ss3 = false; 
						$_SESSION['delay'] = true;
					}
					else {	# if passge not empty 
						$psgtagSign = $gly_ok;
						$psgdisplay = $disp_off;
						$psgAlert = $asuccess;			
						$psgMsg = " ";
						$ss3 = true;	 unset($_SESSION['delay']);

						}				
			}
			else {		# when passage empty 
				$ss3 = false; 				
			}
			
			if($_SESSION['pixInc'] !=""){					
					 
					 // check if px already uploaded before 
					 
					 if($_SESSION['img_src']!="" && !isset($_FILES['qpix']['name'])){
						 
						 $ss4 = true; 
					 }
					 
					 
					 else if ($_SESSION['img_src']!="" &&  $_FILES['qpix']['name']!=""){
							// overide existing file 
						$nfn = "img_for_".$_SESSION['coscode']."_".$_SESSION['questype']."_".$_SESSION['qtnNo'];
						$nfn.="_".time();
									 
						$allowedMIMEs = array('image/jpeg', 'image/gif', 'image/png');
							foreach($allowedMIMEs as $mime) {
								if ($mime == $_FILES['qpix']['type']) {
									$mimeSplitter = explode('/', $mime);
									$fileExt = $mimeSplitter[1];
									$newPath =  "../exroom/imgs/".$nfn.'.'.$fileExt;
									$nfile = $nfn.'.'.$fileExt;
									break;
								}								
						} // end foreach
						// create dir first 
						if(!is_dir("../exroom/imgs/")) mkdir("../exroom/imgs/");
							///////
						if(!isset($newPath)){
							$qimgtagSign = $gly_warn;
							$qimgdisplay = $disp_on;
							$qimgAlert = $awarn;
							$qimgMsg = " Error! please upload a picture file ";
						}
						else if (!copy($_FILES['qpix']['tmp_name'], $newPath)) {
							$qimgtagSign = $gly_warn;
							$qimgdisplay = $disp_on;
							$qimgAlert = $awarn;
							$qimgMsg = " Error: Could not save file to server ";
							 
						} else{
							$qimgtagSign = $gly_ok;
						$qimgdisplay = $disp_off;
						$qimgAlert = $asuccess;			
						$qimgMsg = " ";
						$ss4 = true;	
						unset($_SESSION['delay']);
						$_SESSION['img_src'] = "../exroom/imgs/".$nfile ;
						$_SESSION['img_name'] = $nfile;
						}		
					 
					 }  // end uploading overide file  
					 
					 
					 else if(!isset($_SESSION['img_src'])) { 
					 
						 if( !isset($_FILES['qpix']['name']) || empty($_FILES['qpix']['name'])){
							 $qimgtagSign = $gly_warn;
							$qimgdisplay = $disp_on;
							$qimgAlert = $awarn;			
							$qimgMsg = " Please  Upload Your Picture ";	
							 $ss4 = false; 
							 $_SESSION['delay'] = true;
						 }
					 else { 
						
						$nfn = "img_for_".$_SESSION['coscode']."_".$_SESSION['questype']."_".$_SESSION['qtnNo'];
						$nfn.="_".time();
									 
						$allowedMIMEs = array('image/jpeg', 'image/gif', 'image/png');
							foreach($allowedMIMEs as $mime) {
								if ($mime == $_FILES['qpix']['type']) {
									$mimeSplitter = explode('/', $mime);
									$fileExt = $mimeSplitter[1];
									$newPath =  "../exroom/imgs/".$nfn.'.'.$fileExt;
									$nfile = $nfn.'.'.$fileExt;
									break;
								}								
						} // end foreach
						
						// create dir first 
						if(!is_dir("../exroom/imgs/")) mkdir("../exroom/imgs/");
							///////
						if(!isset($newPath)){
							$qimgtagSign = $gly_warn;
							$qimgdisplay = $disp_on;
							$qimgAlert = $awarn;
							$qimgMsg = " Error! please upload a picture file ";
						}
						else if (!copy($_FILES['qpix']['tmp_name'], $newPath)) {
							$qimgtagSign = $gly_warn;
							$qimgdisplay = $disp_on;
							$qimgAlert = $awarn;
							$qimgMsg = " Error: Could not save file to server ";
							 
						} else{
							$qimgtagSign = $gly_ok;
						$qimgdisplay = $disp_off;
						$qimgAlert = $asuccess;			
						$qimgMsg = " ";
						$ss4 = true;	
						unset($_SESSION['delay']);
						$_SESSION['img_src'] = "../exroom/imgs/".$nfile ;
						$_SESSION['img_name'] = $nfile;
						 
							
					 } ## end when file uploaded 
					 
					 } ## end when img src not exists 
					 
					} ## end when source file not empty 
		 		 		
			}  ## end when pix is checked 
						
			else {
				$ss4 = false; 
			} //
						
			 
		/*******************************************************************************/		
			
			// about to save / update 
			
			if($ss3 == false && $ss4==false && !isset($_SESSION['delay'])) {
				/* save /update direct */ 				 
				  $dbm = new DbTool();
				 $dbm->submitQuestion(); 
				 
						$tagSign = $gly_ok;
						$display = $disp_on;
						$msgAlert = $asuccess;
						$qtnMsg = " ";
			}
			
			else if($ss3 == false && $ss4 == false && isset($_SESSION['delay'])){
				// save /update direct 
					
				 # don't save/update yet 
				 
			}
			
			else if($ss3 == false && $ss4 == true){
				// save/ update question with picture
				 
				 $dbm = new DbTool();
				 $dbm->submitQuestion();
				 
						$tagSign = $gly_ok;
						$display = $disp_on;
						$msgAlert = $asuccess;
				 $qtnMsg = " .. With New Picture  ";
			}
			
			else if($ss3 == true && $ss4==false)
			{
				// save/update with passage
					 $dbm = new DbTool();					  
					$dbm->submitQuestion();
				
						$tagSign = $gly_ok;
						$display = $disp_on;
						$msgAlert = $asuccess;
						$qtnMsg = "..With Passage  ";
			}
			
			else if($ss3 == true && $ss4==true){
				// save / update with passage and picture
					  $dbm = new DbTool();
					  $dbm->submitQuestion();
					  $tagSign = $gly_ok;
					  $display = $disp_on;
					  $msgAlert = $asuccess;
				
			  $qtnMsg = ".. and picture  ";
			}			
		
		} # end of validation with passage and picture 
	
	}	# end update and insert 
	
	
		# echo $_SESSION['coscode'];
		$cosInfo = $courses->searchCourse(array("code"=>$_SESSION['coscode'],'level')); 
		$_SESSION['level'] = $cosInfo['level'][0];
		
		if(!isset($_SESSION['service'])) 
		$_SESSION['qtnNo'] = $qtnNo = $dbm->getQtnNo($_SESSION['coscode'],$_SESSION['cosyear'],$_SESSION['level'],$_SESSION['questype']);
		else $_SESSION['qtnNo'] = $_SESSION['oldnum'];
		/*****************************************************************************************/
		
		
		
	if(isset($_POST['compNew']) || isset($_POST['canupdForm'])){
		
		unset($_SESSION['question']);
		unset($_SESSION['answer']);
		unset($_SESSION['hidQtn']);
		
		for($i = 1; $i<=$_SESSION['defaultOption']; $i++){
			unset($_SESSION['options'][$i]); 
			}
			
		unset($_SESSION['saveNewQtn']);
		unset($_SESSION['updateId']);
		unset($_SESSION['qtnMsg']);
		unset($_SESSION['copy_answer']);
		unset($_SESSION['service']);
		//
				$tagSign = $gly_ok;
		  		$display = $disp_off;
		  		$msgAlert = $asuccess;

	}
		 
?>

<?php 
	# processing advanced question  
	If(isset($_POST['advQtn'])){		
		if(isset($_SESSION['advQues'])) { unset($_SESSION['advQues']);}
		else { $_SESSION['advQues'] = true; }
	
	}

?>

<?php  

	// importing excel file 
	
	require '../media/Classes/PHPExcel.php';
	require_once '../media/Classes/PHPExcel/IOFactory.php';
	
	$dbm = new DbTool(); 
		
	if(isset($_POST['importQtn']))
	{
		$import_file = $_FILES['importFile']['name'];
		$import_file_tmp_name = $_FILES['importFile']['tmp_name'];
		$import_file_path = pathinfo($_FILES['importFile']['name']);
 		$import_file_ext = $import_file_path['extension'];
	 	
		$status = false; 
	 
		if(empty($import_file)){
			$imptagSign = $gly_warn;
		  	$impdisplay = $disp_on;
		  	$impAlert = $awarn;			
			$_SESSION['impMsg'] = " NO file chosen, upload XLS file ";	
		}
		
		else{
			// check file type 
			$nfn = "tempfile";
			// create a directory 
			if(!is_dir("uploads/")) mkdir("uploads/");
			 
			$fext = array('application/vnd.ms-excel','application/xls','text/xls');

				
			foreach($fext as $mime) {
							if ($mime == $_FILES['importFile']['type']) {
								  $status = true;
								  unlink("uploads/");
								  	$newFPath =  "uploads/".$nfn.'.'."xls";	
									$nfname = $nfn.'.'."xls";								 
									break;
							}
						}
						
			if(!$status){					
			$imptagSign = $gly_warn;
		  	$impdisplay = $disp_on;
		  	$impAlert = $awarn;			
			$_SESSION['impMsg'] = " Please Select an Excel File (.xls format): &nbsp; You Gave ( $import_file_ext format )" ;			
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
	
	if($nrColumns!=17){ 
			$imptagSign = $gly_warn;
		  	$impdisplay = $disp_on;
		  	$impAlert = $awarn;			
			$_SESSION['impMsg'] = " your worksheet must have 15 columns: starting from  B - Q ";
			$_SESSION['impMsg'] .=" <br/> this has $nrColumns columns ";
	 }
	 
	 else {
		 */
		       
	$headers = array(); 
	////////////////////////////////////////////////////
	////// get header 	
	 for ($col = 1; $col < $highestColumnIndex; ++ $col) {
            $cell = $worksheet->getCellByColumnAndRow($col, 1);
            $headers[$col-1]=$cell->getValue();			
        }   /// headers gotten      
		
		// get body 
	////////////////////////////////////////////////////////////////
	$qtn = array();		
	for ($row = 2; $row <= $highestRow; ++ $row) {	
		$erVal=array();
		for ($col = 1; $col < $highestColumnIndex; ++ $col) {
		   $cell = $worksheet->getCellByColumnAndRow($col, $row);
		   $erVal[] = $cell->getValue();
		}
		$qtn[] = array_combine($headers,$erVal);	 // merge each column head with cell values  
	}	
	// all question has been fetched now 			
	/////////////////////////////////////////////////////
	///// now check if each question exists before 	
			$dup = 0; $ins = 0;
			foreach($qtn as $qrows){
				
			$fd = $dbm->getFields($dbm->select("questions",array("code"=>$qrows['code'],"year"=>$qrows['year'],"level"=>$qrows['level'],"qtype"=>$qrows['qtype'],"num"=>$qrows['num'],
			"question"=>$qrows['question'],"option1"=>$qrows['option1'],"option2"=>$qrows['option2'])),array_keys($qrows));		 
				
				if(!empty($fd)){
					$dup++;	
				}	
				else{
					 $dbm->insert("questions",$qrows);	
					 $dbm->updateTb("questions",array("recordtime"=>time(),"recorddate"=>date('D jS M, Y - g:i s A')),$fd['sn'][0]);
					$ins++;
				}					 
				}		
				
			$imptagSign = $gly_ok;
		  	$impdisplay = $disp_on;
		  	$impAlert = $asuccess;			
			$_SESSION['impMsg'] = "$ins records inserted and $dup records duplicated, ";// 
	 
					// } 	 	 
								
					}
				}
						 
			}		 
		}
?>


<?php 
	# downloading sample worksheet 
		
		if(isset($_POST['dwnSamp'])){
			
			header("Location:uploads/sample.xls");
			
		}
/***************************************************************/
# calculate total sum of marks 
$allQtns = $dbm->getFields($dbm->select("questions",array("year"=>$_SESSION['cosyear'],"code"=>$_SESSION['coscode'],"qtype"=>$_SESSION['questype']),array("num")),
		array("sn","num","question","option1","option2","option3","option4","option5","answer","marks","optiontype","typeAns","image1","image2","passage"));
		$totMarks = array_sum($allQtns['marks']);
		
?>

<!DOCTYPE html>
<html lang="en">

<head>
    
    <title> <?php ?></title>    
	
	<?php require "../media/links/top_libraries.html";?>

	<!--include tinymce-->
    
    <script type="text/javascript" src="../media/tinymce/tinymce.min.js"></script>
	
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
                            <h3> <i class="fa fa-edit fa-fw"> </i> &nbsp; Compose Questions &nbsp; <button class="btn btn-round btn-primary" name="fileImpTog"  id="fileImpTog"type="submit" title=" Upload Multi Question  With Excel File"><i class="fa fa-upload fa-2x"> </i></button>
                </h3>
                </form>
                        </div>

                        <div class="title_right">
                            
                        </div>
                    </div>
                    <div class="clearfix"></div>
					
                    <!--show only if new button is clicked--> 
              <?php if(isset($_SESSION['newQues'])){?>
                <div class="row"> 
                	<div class="x_content">
                 	<div class="panel panel-info">
                    <div class="panel-body"> <form method="post" enctype="multipart/form-data">
                	
                    <div class="col-md-4 col-sm-4 col-xs-8">
                    	<div class="form-group">
                        	<label>Express Upload &nbsp; <small> (choose .xls file) </small> </label>
                        	<input type="file" name="importFile" id="importFile" class="form-control" title=" Select Your Excel File (.xls)"/>
                        </div> <!--/. form group-->
                    </div> <!--/. col-md-2 -->
                     
                     
                    <div class="col-md-1 col-sm-1 col-xs-3">                    	
                    	<div class="form-group">
                        	<label><small>upload.. </small></label>
                        	<button class="btn btn-primary" type="submit" name="importQtn" id="importQtn" title="Now Upload The Questions"> <i class="glyphicon glyphicon-upload"></i>  </button>
                             </div> <!--/. form group-->
                    </div> <!--/. col-md-1 -->
                    
                    
                       <div class="col-md-1 col-sm-1 col-xs-3">                    	
                    	<div class="form-group">
                        	<label><small>sample </small></label>
                        	<button class="btn btn-success" type="submit" name="dwnSamp" id="dwnSamp" title=" Download Sample File "> <i class="fa fa-download"> </i> </button>
                             </div> <!--/. form group-->
                    	</div> <!--/. col-md-1 -->
                    
                    
                   <div class="col-md-5 col-sm-5 col-xs-12">                    
                    	<span class="alert <?php echo $impAlert;?>"<?php echo $impdisplay; // off or on ?>> <span><i class="glyphicon <?php echo $imptagSign; ?>"></i></span> <?php print $_SESSION['impMsg']; ?> </span>
								
                    </div> <!--/. col-md-6 -->
                    
                    </form>
                    </div> <!--/. panel-body-->
                    </div> <!--/. panel info-->
                    </div> <!-- /. x_content -->
                </div><!-- /. row-->
             <?php } ?>   
             
                    <?php if(!isset($_SESSION['stageone'])) {?>
                    
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2> Step 1  <small> Select The Course Details  </small> </h2>                                                                        
									<div class="clearfix"></div>
                                </div>
                               <div class="x_content">  
                                
                                <form method="post">
                                <div class="row">
                                
									   <div class="col-md-2 col-sm-2 col-xs-6">                    
											<div class="form-group">
												<label>Course Code </label>
												<select name="coscode" id="coscode" class="form-control">
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
												<select name="cosyear" id="cosyear" class="form-control">
                                                	<option value="">...</option>
                                                    <?php for($y = 2016; $y<=date('Y'); $y++){?>
                                                    <option value="<?php echo $y; ?>" <?php echo ($_SESSION['cosyear']==$y)?"selected":""?>><?php echo $y; ?></option>
                                                   <?php }?>
                                                </select>
											 </div> <!--/. form group-->
									   </div> <!--/. col-md-2 -->
                                       
                                        <div class="col-md-2 col-sm-2 col-xs-6">                    
											<div class="form-group">
												<label>Question Type  </label>
												<input type="text" name="questype" id="questype" class="form-control" value="<?php echo $_SESSION['questype'];?>" title="e.g. Test or Exam " placeholder="e.g Test or Exam"/>
											 </div> <!--/. form group-->
									   </div> <!--/. col-md-2 -->
                                       
                                       
                         
										
                                </div> <!--/. row -->
                                
                                <div class="row">                               	
                      			 <br />
                                <div class="col-md-2 col-sm-2 col-xs-6 navbar-left">                    
											<div class="form-group "> 
												<button name="compStageOne" type="submit" class="btn btn-success"> Next .. </button>
											 </div> <!--/. form group--> 											  
									   </div> <!--/. col-md-2 -->
								<div class="col-md-4 col-sm-4 col-xs-8 navbar-left">
									<div> <label class="btn <?php echo $msgAlert;?>"<?php echo $display; // off or on ?>> <span><i class="glyphicon <?php echo $tagSign; ?>"></i></span> <?php print $_SESSION['stgMsg']; ?> </label> </div>
								</div> <!--/. col-md-2 -->
                                </div><!-- /. row-->
                                
                                </form>
                                
								</div> <!-- x_content -->
                            </div> <!--  /. x_panel-->
							  
                        </div> <!-- col-md-12 -->

                        <br />
                        

                    </div> <!-- /. row --> 
					
					<?php } ?>
					
                    <?php if(isset($_SESSION['stagetwo'])) {?>
                    
					<!-- second form upload -->
					 <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							<form method="post" class="input-append" id="qtnForm" enctype="multipart/form-data" >
								<input type="hidden" name="typecheck" id="typecheck" value="<?php echo $_SESSION['optionType']; ?>" />
							<div class="x_panel">
                                <div class="x_title">
                                    <h2> Step 2  <small> <b>(<span class="btn bold black"><?php echo "<b>".$cosInfo['code'][0]." | ". $cosInfo['name'][0]." | ". $cosInfo['level'][0]." | ".$_SESSION['questype']."</b>";?></span>) &nbsp; </b></small> <!-- <button class="btn btn-info" name="advQtn" title="Advanced Question "><i class="fa fa-plus"> Advanced Question </i></button>	-->
									
									
										<?php if(!isset($_SESSION['saveNewQtn']) && !isset($_SESSION['service'])){?>
													<button name="nextForm" id="nextForm" type="submit" class="btn btn-success"> <i class="fa fa-plus"> </i> &nbsp;  Submit Question  .. </button>	
													 <?php } 
													  else if(isset($_SESSION['saveNewQtn']) && !isset($_SESSION['service'])){ ?>
													 <button name="compNew" id="compNew" type="submit" class="btn btn-success"> New Question </button>														 	 
													<?php }	
													 else if(isset($_SESSION['service'])) {?>														
													<button name="updForm" id="updForm" type="submit" class="btn btn-success"> Update No <?php echo $_SESSION['oldnum']; ?>   .. </button>
													<button name="canupdForm" id="canupdForm" type="submit" class="btn btn-danger"> <i class="fa fa-close"></i>  </button>
													<?php }	?>
									</h2>                                    
									
									<div class="navbar-right"> 
										<small>Total Marks  </small> <button class="btn btn-round btn-primary">
									<?php echo $totMarks; ?></button> &nbsp; &nbsp; &nbsp;
									<small>Question </small> <button class="btn btn-circle btn-success">
									<?php echo $_SESSION['qtnNo'];?></button> 
										
										 
									</div>
                                    <div class="clearfix"></div>
                                </div>
                               <div class="x_content">  
                                
                                 <div class="row">
                                       
									   <div class="col-sm-7 col-md-7 col-xs-12">
											<div class="form-group">
												<label> Include this instruction  &nbsp; &nbsp;
													<input type="checkbox" name="instruct_option" value="yes" <?php echo ($_SESSION['instruct_option']=="yes")?"checked":"";?>  class="flat" />
												</label>
												<input type="text" class="form-control" name="instruct_passage" value="<?php echo $_SESSION['instruct_passage']?>" style="max-width:450px;" />
												
											</div>
									   </div>
									    
									 <div class="col-sm-8 col-md-8 col-xs-12"> &nbsp; &nbsp; </div>
										
                                        <div class="col-md-6 col-sm-6 col-xs-12">                    
											<div class="form-group">
											<label> Compose Question .. </label>
											<textarea name="qtn" id="qtn" onKeyUp="resetQuestion()" onChange="resetQuestion()"><?php echo $_SESSION['question'];?></textarea>
											 </div> <!--/. form group-->
											 <div> <label class="btn <?php  echo $msgAlert."".$_SESSION['msgAlert'];?>"<?php  echo $display."".$_SESSION['display']; // off or on ?>> <span><i class="glyphicon <?php  echo $tagSign."".$_SESSION['tagSign']; ?>"></i></span> <?php print $_SESSION['qtnMsg']."".$qtnMsg; ?> </label> </div>
											<div class="form-group input-inline"> 
												<div class="col-sm-5 col-md-5">&nbsp;  <br/><label> Marks for Question</label> <span class="btn btn-sm btn-round btn-info"><?php echo "&nbsp;".$_SESSION['qtnNo'];?></span>: </div><div class="col-sm-4 col-md-4"> <br/><input type="text" class="form-control input-group" id="marks" name="marks" value="<?php echo $_SESSION['marks'];?>" data-toggle="tooltip"  data-placement="top" title=" Enter Marks For question <?php echo "&nbsp;".$_SESSION['qtnNo'];?>" style="max-width:100px; "/> &nbsp;</div> 
											</div>
									   </div> <!--/. col-md-2 -->
                                       
									   <div class="col-md-6 col-sm-6 col-xs-12 ">                    
											 
										 <div class="input_fields_wrap form-group input-group">
												  <label class="control-label"> Fill The Options Below. </label>
												 
												 <?php // echo list of options 								 
												 for($op = 1; $op<=$_SESSION['defaultOption']; $op++){
												 ?>
												 <div class="text-box form-group input-group">
												 <span class="input-group-addon">
													<i class="fa qnum"><?php echo $dbm->iLabel($op);?></i>
													</span>
														<input class="radiosoff form-control text-num" id="<?php echo "optIndex"+$op;?>" name="<?php echo "optIndex"+$op;?>" type="text" value="<?php echo $_SESSION['options'][$op]?>" /><span class="remove_option input-group-addon radiosoff" title="Remove"><i class="fa fa-minus"></i></span> 
												 </div>    
												 <?php } // end of displaying options ?>
												  
										 </div>  <!-- /. input_fields_wrap --> 
                                         
                                     <!--  adding more options-->
                                 <div class="form-group input-group">
									<input type="submit" class="radiosoff btn btn-info btn-circle glyphicon glyphicon-plus" id="optPlus" name="optPlus" value=" + "  title="More Options "/> &nbsp;  <input type="submit" name="delOption" id="delOption" value="deleted" style="visibility:hidden"/>                                  									 
                                 </div>        
										
								<div class="form-group form-inline">
                                	<label>Answers </label> 
                                    <select class="form-control" name="optionType"  id="optionType" onChange="modChange()">
                                    	<option value="choice" <?php echo ($_SESSION['optionType']=="choice")?"selected":""?>>  choice answers </option>
                                        <option value="typeIn"  <?php echo ($_SESSION['optionType']=="typeIn")?"selected":""?>> type-in answer </option>
									   <!-- <option value="choice" <?php echo ($_SESSION['optionType']=="choice")?"selected":""?>>single-option</option>s </option>-->
                                    </select>
                                </div>
								<p>&nbsp; </p>
								
								<?php for($aa=1; $aa<=$_SESSION['defaultOption']; $aa++){  
									
									if($_SESSION['optionType']=="choice"){ ?>									
										<i><?php echo $dbm->iLabel($aa); ?> </i><input type="radio" class="flat" name="cosAnswer" id="cosAnswer" value="<?php echo $aa; ?>" <?php echo ($_SESSION['answer']==$aa)?"checked":""; ?> class="radio radio-inline iradio_flat-green" /> &nbsp; &nbsp;
									<?php } 
									}
									if($_SESSION['optionType']=="typeIn"){ ?>
									
									 <input type="text" class="form-control" name="typeAns" id="typeAns" value="<?php echo $_SESSION['typeAns']; ?>"  data-toggle="tooltip"  data-placement="top" title=" Input The Answer here  " style="max-width:250px;" placeholder="Type Your Answer Here" /> &nbsp; &nbsp;
									
									<?php } 
								
									?>
							<br/>
                            <br/>
                           </div> <!--/. col-md-2 -->
						
									
                        <br />
                        
                                   
                        </div> <!--/. row -->
						

                                <div class="clearfix"></div>

							 <!-- for advanced questions  -->
						<?php if (isset($_SESSION['advQues'])) { ?> 
							<div class="row">
							   <div class="x_content">								
								<hr />	    
								
									<!--	left column -->
										<div class="col-sm-6 col-md-6 col-xs-12">
											
											<div class="form-group">
												<label> Add Passage To the Question .. </label>
												<textarea name="passage" id="passage" onKeyUp="resetPassage()" onChange="resetPassage"><?php echo $_SESSION['passage'];?></textarea>
											 </div> <!--/. form group-->
											 <div> <label class="btn <?php echo $psgAlert;?>"<?php echo $psgdisplay; // off or on ?>> <span><i class="glyphicon <?php echo $psgtagSign; ?>"></i></span> <?php print $psgMsg; ?> </label> </div>
											  <br />  <br />
											  <div class="form-group-inline">
												<label> Include Passage in Question [ <?php echo $_SESSION['qtnNo']; ?> ] .. </label>
												<input type="checkbox" name="psgInc" id="psgInc" value="yes" <?php echo ($_SESSION['psgInc']=="yes")?"checked":""; ?>  class="checkbox checkbox-inline icheckbox_flat-green"/>
											 </div> <!--/. form group-->
											
										</div>
									 <!--  end of left column -->
									 
									 
									 <!--	right column -->
										<div class="col-sm-6 col-md-6 col-xs-12">
											<div class="form-group">
												<label> Add Picture   .. </label>
												<input type="file" name="qpix" id="qpix" class="form-control" width="150"  /> <br />
												<img src="<?php echo ($_SESSION['img_src']=="")?"../media/images/unknown.png":$_SESSION['img_src']; ?>" class="pix1 img img-responsive img-thumbnail" style="max-height:280px; max-width:280px;" />
											 </div> <!--/. form group-->
											 
											 <!--
											 <div class="form-group">
												<label> Add Picture 2 .. </label>
												<input type="file" name="qpix[]" id="qpix" class="form-control"  width="150"/><br />
												<img src="../media/images/unknown.png" class="pix2 img img-responsive img-thumbnail" />												
											 </div> --> <!--/. form group-->
											 
											 <div> <label class="btn <?php echo $qimgAlert;?>"<?php echo $qimgdisplay; // off or on ?>> <span><i class="glyphicon <?php echo $qimgtagSign; ?>"></i></span> <?php print $qimgMsg; ?> </label> </div>
											 <br />  <br />
											 <div class="form-group-inline">
												<label> Include Picture(s) in Question [ <?php echo $_SESSION['qtnNo']; ?> ] .. </label>
												<input type="checkbox" name="pixInc" id="pixInc" value="yes" <?php echo ($_SESSION['pixInc']=="yes")?"checked":""; ?>  class="checkbox checkbox-inline icheckbox_flat-green"/>
											 </div> <!--/. form group-->
										</div>
									 <!--  end of right column -->
											  
							</div> <!-- /. x_content-->	   
						<div class="col-sm-12 col-md-12">  <hr />	</div>
							   </div> <!-- /. row -->
						<!-- END OF  advanced questions  -->
						<?php } ?>
							   <div class="row">
							   <div class="x_content">
								
								<br />	
                        
							    <div class="col-md-8 col-sm-8 col-xs-12  navbar-left">                    
											<div class="form-group ">
												<button  type="submit" name="prevForm" id="prevForm" class="btn btn-default"> Previous  .. </button>...												
												    
													<?php if(!isset($_SESSION['saveNewQtn']) && !isset($_SESSION['service'])){?>
													<button name="nextForm" id="nextForm" type="submit" class="btn btn-success"> Submit  Question .. </button>	
													 <?php } 
													  else if(isset($_SESSION['saveNewQtn']) && !isset($_SESSION['service'])){ ?>
													 <button name="compNew" id="compNew" type="submit" class="btn btn-success"> New Question </button>														 	 
													<?php }	
													 else if(isset($_SESSION['service'])) {?>														
													<button name="updForm" id="updForm" type="submit" class="btn btn-success"> Update No <?php echo $_SESSION['oldnum']; ?>   .. </button>
													<button name="canupdForm" id="canupdForm" type="submit" class="btn btn-danger"> <i class="fa fa-close"></i>  </button>
													<?php }	?>
													
												
											 </div> <!--/. form group-->
									   </div> <!--/. col-md-8 -->
								</div> <!-- /. x_content-->	   
						
							   </div> <!-- /. row -->
							   
                                </form>
                                
								</div> <!-- x_content -->
                            </div> <!--  /. x_panel-->
							  
                        </div> <!-- col-md-12 -->

                        <br />
                        

                    </div>
					<!-- /. second form upload-->
                    
                    <?php } // end of stagetwo ?>
                </div>
                
                  
                     <form method="post">
                        
                   <input type="hidden" name="cosmods" id="cosmods" value="" />
                     <input type="submit" name="subMods" id="subMods" value="submit mods " style="visibility:hidden;"/> <!-- keep other inputs -->
                                        </form>
                <!-- footer content -->
                <footer style="background:#EEEFFF;">
                    <div class="" style="color:#222;">
                        <p class="pull-right"> <center> Copyright &copy; 2016,  Hamdala Komputer Konsults.  |
                            <span class="lead"> <i class="fa fa-paw"></i> HKK!</span> </center>
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
		
		
		$(function(e) {
            
			$('.remove_option').on('click',function(){
				
				// reduce the options 
				$('#delOption').click(); 
				
				});
        });
		
		function modChange(){
			$('#nextForm').click(); $("#updForm").click();
		}
			 
	</script>
	
	
<script>
		
	// submission of question
	 
	 //// form subission 
		$("form#qtnForm").submit(function(e) {
           
		   question = tinymce.get('qtn').getContent();	
		   $("#hidQtn").val(question);
		   //		   
		    passage = tinymce.get('passage').getContent();	
		   $("#hidPsg").val(passage);
		  //  alert(question);
		    return true; 
        
		});
	 
	
	 function resetQuestion(){ 
				 question = tinymce.get('qtn').getContent();			
				 $("#hidQtn").val(question);
				 $("#qtnStatus").html("text area changing ");
				// alert('changed ');
			 } 
	 function resetPassage(){ 
				 passage = tinymce.get('passage').getContent();			
				 $("#hidQtn").val(passage);
				 $("#qtnStatus").html("text area changing ");
				 // alert('changed ');
			 } 
	
</script>
    
  
	<script>
	
		$(function(){
			
			var mchoices = $('#typecheck').val(); 
			// alert(mchoices); 
			switch(mchoices){
				case "choice":{
					 $(".radiosoff").removeAttr("disabled","disabled");
					//$(".radiosoff").css({'background-color':'red'});
				}
				break;
				
				case "typeIn":{
					 $(".radiosoff").prop("disabled","disabled");
					//$(".radiosoff").css({'background-color':'yellow'});
				}
				
				break;
			}
			
			
		});
	
	</script>
 
 	<?php include "../media/links/foot_libraries.html"; ?>
	
     <script>

tinymce.init({
    selector: "textarea#qtn",
    theme: "modern",
    width: 99+'%',
    height: 95+'%',
    plugins: [
         "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
         "save table contextmenu directionality emoticons template paste textcolor"
   ],
   content_css: "css/content.css",
   toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons | fontsizeselect", 
   style_formats: [
        {title: 'Bold text', inline: 'b'},       
        {title: 'Header 1', block: 'h1', styles: {color: '#000000'}},
		{title: 'Header 2', block: 'h2', styles: {color: '#000000'}},
		{title: 'Header 3', block: 'h3', styles: {color: '#000000'}},
		{title: 'Header 4', block: 'h4', styles: {color: '#000000'}},
		{title: 'Header 5', block: 'h5', styles: {color: '#000000'}},
		{title: 'Header 6', block: 'h6', styles: {color: '#000000'}},
        {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
    ]
 });
 
 
tinymce.init({
    selector: "textarea#passage",
    theme: "modern",
    width: 99+'%',
    height: 95+'%',
    plugins: [
         "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
         "save table contextmenu directionality emoticons template paste textcolor"
   ],
   content_css: "css/content.css",
   toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | l      ink image | print preview media fullpage | forecolor backcolor emoticons | fontsizeselect", 
   style_formats: [
        {title: 'Bold text', inline: 'b'},       
        {title: 'Header 1', block: 'h1', styles: {color: '#000000'}},
		{title: 'Header 2', block: 'h2', styles: {color: '#000000'}},
		{title: 'Header 3', block: 'h3', styles: {color: '#000000'}},
		{title: 'Header 4', block: 'h4', styles: {color: '#000000'}},
		{title: 'Header 5', block: 'h5', styles: {color: '#000000'}},
		{title: 'Header 6', block: 'h6', styles: {color: '#000000'}},
        {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'}
    ]
 });
 
 </script>
 

 

</body>

</html>