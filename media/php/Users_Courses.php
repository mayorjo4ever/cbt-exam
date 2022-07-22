<?php 	
	
	// require "dbTool.php";
	
		class Users_Courses{
				
				#  protected $userType;
				
				public function __construct($userType){
					# $this->userType = $userType;					
				}
				///////////////////////////////////////////////////
				
				 
				/////////////////////////////////////////////////////////
				
				public function createUser(array $parameters){
						
						// type is either admin or customer
						// parameters are field names of the user account 
						
				}
				 
			///////////////////////////////////////////////////////////////
				
				function deleteUser($userID){
					
					}
			///////////////////////////////////////////////////////////////////////
			
				public function logout($userID,$directory){
				
					if(isset($_SESSION[$userID])) { 
						unset($_SESSION[$userID]); header("Location:$directory");
					 }
					else { header("Location:$directory"); }
				}
			////// find users ////////////////////////////////////////////////////////
			
				
				public function getAll(array $criteral){ 
					 
					 	$dbm = new DbTool(); 
						
					 $allUsers = $dbm->getFields($dbm->select('users_courses',$criteral,array('user_id')),
	 		array('sn','user_id','level','code','year')); 						
						return $allUsers;
						
					} 
				///////////////////////////////////////////////////
			
			public function searchUser(array $criterials,$order=""){
				 try{
				  	  $table = "users_courses";
					  $dbm = new DbTool();
					  $conn = $dbm->getConn();
				  $wheres = empty($criterials)?"":array_map(function($elem){ return "$elem REGEXP ?";},array_keys($criterials));
					
				if(!empty($order)) $ord = " ORDER BY ".$order[0];
				else $ord = "";		
				
			  $str = sprintf("SELECT * FROM %s %s %s %s",$table,empty($criterials)?"":"WHERE",join(' OR ',$wheres),$ord);
			  $stm = $conn->prepare($str);
			
			  $stm->execute(array_values($criterials));
				
			  $res = $stm->fetchAll();
			  
			return 	$output = $dbm->getFields($res,array('sn','user_id','level','code','year'));
				 }
				 catch(PDOException $er){
						echo $er->getMessage(); 
				 }
		  }
		 	 	
			
		}			
		// end of class user 				
	


?>