<?php 	
	
	  require_once "dbTool.php";
	
		class User{
				
				protected $userType;
				
				public function __construct($userType){
					if(!isset($_SESSION)) session_start();
					$this->userType = $userType;					
				}
				///////////////////////////////////////////////////
				
				public function login($username,$password,$directory){
					
				}
				
				/////////////////////////////////////////////////////////
				
				public function createUser(array $parameters){
						
						// type is either admin or customer
						// parameters are field names of the user account 
						
				}
				
				/////////////////////////////////////////////////////////
				
		
				public function confirmLogin($username){
					
					if(isset($_SESSION[$username])) {
						
						$dbm = new DbTool();
						
						// check account again if available
							$rows = $dbm->getFields($dbm->select($this->userType,array("user_id"=>$_SESSION[$username])),
							array('user_id')); //  

							$tot = count($rows);
				
							if($tot==0) { # login failed									
								return false;
							}
							
							else if($tot == 1){ 									
								return true;
							}
							else return false;
										
			}
						
		}
				
			///////////////////////////////////////////////////////////////
				
				function deleteUser($userID){
					
					}
			///////////////////////////////////////////////////////////////////////
			
				public function logout($userID,$directory){
				
						$dbm = new DbTool();
							$user_Pc = gethostname(); 
							$logdate = date('D jS M, Y - g:i s A');
							$logtime = time();
							$logid = rand(1,9999)*463; 
							$dbm->insert("userslogs",array("user_id"=>$_SESSION[$userID],"type"=>"lout","logtime"=>$logtime,"logdate"=>$logdate));
							 $dbm->updateTb($this->userType,array("logtime"=>$logtime,"logdate"=>$logdate,"logstatus"=>"lout","pc_name"=>$user_Pc),array("user_id"=>$_SESSION[$userID]));				
					
						 unset($_SESSION[$userID]);
						 session_start();
						 session_destroy();  
						 header("Location:$directory");
					 
					
				}
			////// find users ////////////////////////////////////////////////////////
			
				
				public function getAll(array $criteral){ 
					 
					$dbm = new DbTool(); 
						
					 $allUsers = $dbm->getFields($dbm->select($this->userType,$criteral,array('surname','firstname')),
	 		array('sn','user_id','surname','firstname','midname','sex',
			'faculty','department','passport','phone','level','dob','day','month','year','email','password',
			'homeaddress','datereg','timereg','logtime','logdate','logstatus','pc_name','pc_ip')); 						
						return $allUsers;
						
					} 
				/*********************************************************************/
				
				public function getLogs(array $criterials){
					$dbm = new DbTool();
					return $logs = $dbm->getFields($dbm->select("userslogs",$criterials),array('user_id','logtime','logdate','type')); 
				}
				/**************************************************************/
			
			public function searchUser(array $criterials,$order=""){
				 try{
				  	  $table = $this->userType;
					  $dbm = new DbTool();
					  $conn = $dbm->getConn();
				  $wheres = empty($criterials)?"":array_map(function($elem){ return "$elem REGEXP ?";},array_keys($criterials));
					
				if(!empty($order)) $ord = " ORDER BY ".$order[0];
				else $ord = "";		
				
			  $str = sprintf("SELECT * FROM %s %s %s %s",$table,empty($criterials)?"":"WHERE",join(' OR ',$wheres),$ord);
			  $stm = $conn->prepare($str);
			
			  $stm->execute(array_values($criterials));
				
			  $res = $stm->fetchAll();
			  
			return 	$output = $dbm->getFields($res,array('sn','user_id','surname','firstname','midname','sex',
			'faculty','department','passport','phone','level','dob','day','month','year','email','password',
			'homeaddress','datereg','timereg','logtime','logdate','logstatus','pc_name','pc_ip'));
				 }
				 catch(PDOException $er){
						echo $er->getMessage(); 
				 }
		  }
		 	 	
			
		}			
		// end of class user 				
	


?>