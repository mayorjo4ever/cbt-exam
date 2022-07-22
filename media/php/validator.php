<?php 
	
	require "dbTool.php";
	
	error_reporting(1);  if(!isset($_SESSION)) session_start();
	
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

/*****************************************/		 
		
		if(isset($_POST['CheckUser'])){
			$dbm = new DbTool();			
	  
		$user_id = $_POST['username'];
		$loops = $dbm->getFields($dbm->select("users",array('user_id'=>$user_id)),array('user_id'));
				
		if(count($loops)==0 ){  // check for admin
				$loop2 = $dbm->getFields($dbm->select("admin",array('user_id'=>$user_id)),array('user_id'));
				if(count($loop2)==0) 	
					echo false;
						else if(count($loop2)==1)	echo true; 
				}	
					else if(count($loops)==1){
						echo true; 
						}	
					} 

		/*****************************************/		 
		
		if(isset($_POST['CheckPass'])){
			 $dbm = new DbTool();  
			 
			$user_id = $_POST['username'];	
			$psw = $_POST['password'];
			$user_Pc = gethostname(); 
			
			$loops = $dbm->getFields($dbm->select("users",array('user_id'=>$user_id,'enc_psw'=>md5($psw))),array('user_id'));
			
			if(count($loops)==0 ){
				$loop2 = $dbm->getFields($dbm->select("admin",array('user_id'=>$user_id,'enc_psw'=>md5($psw))),array('user_id'));
					if(count($loop2)==0 ) echo json_encode(array(false,"")); 
					else if(count($loop2)==1) {
						$_SESSION['adminUser'] = $user_id;
						echo json_encode(array(true,"admin/"));}
				}
				else if(count($loops)==1){
					$_SESSION['exmUser'] = $user_id;
					$logdate = date('D jS M, Y - g:i s A');
					$logtime = time();
					$logid = rand(1,9999)*126;
					//					 
					 $dbm->insert("userslogs",array("user_id"=>$_SESSION['exmUser'],"type"=>"lin","logtime"=>$logtime,"logdate"=>$logdate));
					 $dbm->updateTb("users",array("logtime"=>$logtime,"logdate"=>$logdate,"logstatus"=>"lin","pc_name"=>$user_Pc),array("user_id"=>$_SESSION['exmUser']));				
					//
					echo json_encode(array(true,"exroom/"));	
				}						
		 
		}

/********************************************************/

		if(isset($_POST['CheckAdmin'])){
		
		$dbm = new DbTool();			
	  
		$user_id = $_POST['username'];
		$loops = $dbm->getFields($dbm->select("admin",array('user_id'=>$user_id)),array('user_id'));
		
		if(count($loops)==0){
				echo false;
				}	
					else if(count($loops)==1){
						echo true;
						}
						else if(count($loops)>1){
							echo false;	
						}
		
		}

/********************** CheckAdminPass ***********************/
 
		
		if(isset($_POST['CheckAdminPass'])){
			
			$dbm = new DbTool(); 
			
			$user_id = $_POST['username'];	
			$psw = $_POST['password'];
			$user_Pc = gethostname(); 
			
			$loops = $dbm->getFields($dbm->select("admin",array('user_id'=>$user_id,'enc_psw'=>md5($psw))),array('user_id'));
			
			if(count($loops)==0 || count($loops)>1){
				echo false;
				}
				else if(count($loops)==1){
					$_SESSION['adminUser'] = $user_id;				 
					
					echo true;	
				}						
		
		}

/********************************************************/			
		if(isset($_POST['LoginUsers'])){
				$dbm =  new DbTool();  # database mgr.
				$cln = new Cleaner();	
				$username = $cln->clearTags($_POST['username']);
				$password = $cln->clearTags($_POST['password']);
				// echo "no, there is no login for ".$username ."..".$password;
						
				// check account again if available
				$rows = $dbm->getFields($dbm->select("users",array("user_id"=>$username,"enc_psw"=>$cln->toMD5($password))),
				array('username')); //  

				$tot = count($rows);
				
				if($tot==0) { # login failed									
					echo false;
				}
				
				else if($tot == 1){ 				
					$_SESSION['user']=$username;
					echo true;
				}
				
			}

	/*******************************************************************/			
		
		
		// to reset the password 
	  if(isset($_POST['resetUserPsw'])){		 
		$dbm = new DbTool(); 
		
			$newPsw = $_POST['newPsw'];
			$user_id = $_POST['user_id']; 
			
		  $dbm->updateTb("users",array("password"=>$newPsw,"enc_psw"=>$dbm->toMD5($newPsw)),array("user_id"=>$user_id));
			
		echo $user_id."'s password  is now changed to ".$newPsw;
		 
	  }
		
		
		
	/*****************************************************************/
		// scheduling courses for students 
		
		if(isset($_POST['scheduleCos'])){
			$dbm = new DbTool(); 
			$datas = explode("_",$_POST['scheduleCos']); 
			# 0 = title // 1 = cos code // 2 = type // 3 = year 
			# check database if existed 
			 $scheduled = $dbm->getFields($dbm->select("course_schedule",array(
				"code"=>$datas[1],
				"qtype"=>$datas[2],
				"year"=>$datas[3])),
				array("code","year","qtype"));
				// when existed 
			if(count($scheduled['code'])==0){
				// now schedule the course 
				$dbm->insert("course_schedule",array(
						"code"=>$datas[1],
						"qtype"=>$datas[2],
						"year"=>$datas[3],
						"state"=>"ready"));
				
			 echo $datas[1]." is now scheduled for students "; 
				
			}
			else if(count($scheduled['code'])>0){
				echo $datas[1]." has already been scheduled earlier ";
			}
		}
	/******************************************************************/
	# completedCos
	
		
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
		
	
?>