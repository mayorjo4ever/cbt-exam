<?php 
	
	require "dbTool.php";
	
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
 
?>