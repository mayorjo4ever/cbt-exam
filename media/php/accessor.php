<?php 
	
	require "dbTool.php";
	require "timecoder.php";
	
	error_reporting(1);
	
	if(isset($_POST['IsNumber'])){
		$num = $_POST['IsNumber'];
		echo is_numeric($num); // true or false
	}
	
	
	
	// confirm if account no. already existed 
		if(isset($_POST['checkNewAccount'])){	
		
		$dbm =  new DbTool(); 
		$cln = new Cleaner();
		
		$account = $cln->clearTags($_POST['checkNewAccount']);
		
		$rows = $dbm->select("customer",array("accountno"=>$account)); //  
				
		if(count($rows)==0){
				echo true;
				}	
					else if(count($rows)>=1){
						echo false;
						}									
		}
		
		#
		
		class Cleaner{
			
			public function __construct(){} 
			
			public function clearTags($obj){
				return strip_tags($obj);
			}
					
			#
			
			public function toMD5($obj){
				return md5($obj);			
			}
			#
			public function enslash($obj){
				addslashes($obj);
			}
										
		}
				
		if(isset($_POST['LoginUsers'])){
				$dbm =  new DbTool();  # database mgr.
				$cln = new Cleaner();	
				$username = $cln->clearTags($_POST['username']);
				$password = $cln->clearTags($_POST['password']);
				// echo "no, there is no login for ".$username ."..".$password;
						
				// check account again if available
				$rows = $dbm->getFields($dbm->select("admin",array("username"=>$username,"enc_psw"=>$cln->toMD5($password))),
				array('username')); //  

				$tot = count($rows);
				
				if($tot==0) { # create the account
					echo false;
				}
				
				else if($tot == 1){
					echo true;
				}
				
			}
		
		
		if(isset($_POST['createNewAccount'])){
			$dbm =  new DbTool();  # database mgr.
			$cln = new Cleaner();
				
				$accountno = $cln->clearTags($_POST['createNewAccount']);
				$accttype = $cln->clearTags($_POST['accttype']);
				$surname = $cln->clearTags($_POST['surname']);
				$midname = $cln->clearTags($_POST['midname']);
				$othername = $cln->clearTags($_POST['othername']);
				$gender = $cln->clearTags($_POST['gender']);
				$dob = $cln->clearTags($_POST['dob']);
				$email = $cln->clearTags($_POST['email']);
				
				
				// check account again if available
				$rows = $dbm->getFields($dbm->select("customer",array("accountno"=>$accountno)),
				array('accountno','surname','middlename','othername','gender','dob','email')); //  

				$tot = count($rows);
				
				if($tot==0) { # create the account
					$data = array('accountno'=>$accountno,'accounttype'=>$accttype,'surname'=>$surname,'middlename'=>$midname,'othername'=>$othername,'gender'=>$gender,'dob'=>$dob,'email'=>$email);
					$dbm->insert("customer",$data); // profile inserted to customer table
					echo "Account Created Successfully ".$dbm->message;	
				}
				
				else if($tot > 0){
					echo " Sorry, This Account Already Exists ";	
				}
				
				// print_r($rows);
				
				// echo "recieved -".$accountno."-".$surname."-".$midname."-".$othername."-".$gender."-".$dob."-".$email;
				
		}
		
	// fetch school info 
	
	 /// read users, usersonline, totalcourse and total questions saved 
	  if(isset($_POST['datainfo'])){
	$dbm =  new DbTool();
		$allUsers = $dbm->getFields($dbm->select('users',array('')),array('user_id'));
		$logUsers = $dbm->getFields($dbm->select("users",array('logstatus'=>"lin")),array('user_id'));
	   	$allCourses = $dbm->getFields($dbm->select_Distinct('code','courses',array()),array('code'));
	 	$allQuestions = $dbm->getFields($dbm->select_Distinct("code","questions",array()),array('code'));
		// store in session 
		$_SESSION['totuser'] = count($allUsers['user_id']);
		$_SESSION['actuser'] = count($logUsers['user_id']); 
		
		$result = array(
						count($allUsers['user_id']),
						count($logUsers['user_id']),
						count($allCourses['code']),
						count($allQuestions['code'])
						);
				  
		  echo json_encode($result); // convert it to javascript array 
		  
	  }
	#
	/***********************************************************************************/
		
	// getCourseContents	
	/// read courses information 
	  if(isset($_POST['getCourseContents'])){
		
		$dbm =  new DbTool();
		$courses = $dbm->getFields($dbm->select('courses',array('sn'=>$_POST['sn'])),array('name','code'));
			
			$result = array(
						$courses['name'][0],
						$courses['code'][0]
						);
			
		echo json_encode($result); // convert it to javascript array 
		  
	  }
	#
	/***********************************************************************************/
	// deleteCourseContents
	if(isset($_POST['deleteCourseContents'])){
		
				$dbm =  new DbTool();
				
				$dbm->deleteRow("courses",array('sn'=>$_POST['sn']));			
				
				echo true;
		  
	  }
	  #
	/***********************************************************************************/
	// read courses information 
	  if(isset($_POST['getCourseModifications'])){
		
		$dbm =  new DbTool();
		$courses = $dbm->getFields($dbm->select('courses',array('sn'=>$_POST['sn'])),array('name','code','unit','status','level'));
			// store in session 
		$result = array( $courses['name'][0], $courses['code'][0],$courses['unit'][0],		$courses['status'][0], $courses['level'][0]);
		echo  json_encode($result); 
			 
	  }
	#
	/***********************************************************************************/
	
	// scheduling courses for students 
		
		if(isset($_POST['completedCos'])){
			$dbm = new DbTool(); 
			$datas = explode("-",$_POST['completedCos']); 
			# 0 = title // 1 = cos code // 2  = year 
			# check database if existed 
			 $completed = $dbm->getFields($dbm->select("epanel",array(
				"codegen"=>$datas[1],
				"year"=>$datas[2],
				"state"=>"done")),
				array("codegen","year","state"));
				// when existed 
			if(count($completed['codegen'])==0){
				// now close the course 
				$dbm->updateTb("epanel",
						array(						
						"state"=>"done"),
						array(
						"codegen"=>$datas[1],						
						"year"=>$datas[2]));
				
			 echo $datas[1]." is now Closed for students "; 
				
			}
			
			else if(count($completed['codegen'])==1){
				echo $datas[1]." has already been Closed earlier ";
			}
		}
	
	/*******************************************************************/
		
 
?>



<?php 

	if(isset($_POST['updateWatch'])) {
		
		$dbm = new DbTool();
	
	 if(!isset($_SESSION['time_start'])) $_SESSION['time_start'] = time();
	
		$_SESSION['time_used'] = (time() - $_SESSION['time_start']) + $_SESSION['init_sec_used'];
	/******************* update The result ***********************/
	 $dbm->updateTb("users_result",array("bus_stop"=>$_SESSION['qtnNo'],"sec_used"=>$_SESSION['time_used'],
	 "totalmark"=>$_SESSION['totalmark'],
	 "totalscore"=>array_sum($_SESSION['myScore']),"unitscore"=>$_SESSION['unitScore'],"percent"=>$_SESSION['percent']),
		array("user_id"=>$_SESSION['exmUser'],"year"=>$_SESSION['year'],"codegen"=>$_SESSION['codegen']));
	/*************************************************************************************/
	
		if($_SESSION['time_used']>=$_SESSION['total_sec']) $_SESSION['paperFinished'] = true; 
	 	/**** notify if timeout *****/		 
		echo ($_SESSION['time_used']>=$_SESSION['total_sec'])?true:false;
	
		
	}


	if(isset($_POST['updateWatches'])) {
		

		
		#######################################################################################
		 
		//  save questions as well 
		/**********************************************
		  for($i=1; $i<=$_SESSION['tot_qtn']; $i++){	
		   
			$dbm->updateTb("qtn_remind",
			array("picked1"=>$_SESSION['picked1'.$i]),
			array("user_id"=>$_SESSION['exmUser'],"year"=>$_SESSION['year'],"codegen"=>$_SESSION['codegen'],"num"=>$i));
				
		 } **/
		 
	// all answer picked are saved now 
		
	}

/**************************************************/
	if(isset($_POST['QChanged'])){ // question changed
			$dbm = new DbTool();			
			//
			$num = substr($_POST['name'],3); 			
			$_SESSION['picked1'.$num] = $_POST['value'];
				
			$dbm->updateTb("qtn_remind",array("picked1"=>$_SESSION['picked1'.$num]),array("user_id"=>$_SESSION['exmUser'],"sn"=>$_SESSION['myQtn']['sn'][($num-1)]));	
			 
			 echo $_POST['value']." was saved";
			
		}
		
		if(isset($_POST['MQValue'])){ // question changed
			 
			$_SESSION['checkboxvalue'] = $_POST['MQValue'];
			
		}
	
/******************************************************/
	if(isset($_POST['MQChanged'])){ // question changed
			$dbm = new DbTool();			
			
			$state = $_POST['state']; // checked / unchecked 
			$opt = $_POST['optn'];
			$num = $_POST['QN'];
			$value = $_POST['value'];			
			$reply = ($state=="checked")?"unchecked":"checked";
			
			$_SESSION['picked'.$opt.''.$num] = ($state=="checked")?"":$value;
			$field = "picked".$opt; 
			$dbm->updateTb("qtn_remind",array($field=>$_SESSION['picked'.$opt.''.$num]),array("user_id"=>$_SESSION['exmUser'],"sn"=>$_SESSION['myQtn']['sn'][($num-1)]));	
			 
			
			// $dbm->updateTb("qtn_remind",array("picked1"=>$_SESSION['picked1'.$num]),array("user_id"=>$_SESSION['exmUser'],"sn"=>$_SESSION['myQtn']['sn'][($num-1)]));	
			 
			 echo "qtn " .$_POST['QN']." $opt is now  ".$reply; 
			
		}
	##########################################################################
		// keeping of time  watchMyTime
		if(isset($_POST['watchMyTime'])){ // question changed
				
				 if(!isset($_SESSION['time_start'])) $_SESSION['time_start'] = time();	
					$_SESSION['time_used'] = (time() - $_SESSION['time_start']) + $_SESSION['init_sec_used'];	
					$_SESSION['time_left'] = $_SESSION['total_sec'] - $_SESSION['time_used'];
	/********************************************************************************/ 
					$time_left_percent = round(($_SESSION['time_left']/$_SESSION['total_sec'])*100);
					$time_string = readTime($_SESSION['time_left']); 
				 
				  echo json_encode(array($time_left_percent,$time_string));
		}
	############################################################################
	
?>