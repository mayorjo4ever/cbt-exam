<?php 	
	
	// require "dbTool.php";
	
		class Course{
				

				public function __construct(){
					 					
				}
				///////////////////////////////////////////////////
				 				 
				public function createCourse(array $parameters){
												
						// parameters are field names of the course 
						$dbm = new DbTool();
						 $msg = "Successful";
						// check db if exists 
						$exc = $dbm->getFields($dbm->select('courses',array("code"=>$parameters['code'])),
	 		array('sn','name','code')); 	
					if(count($exc['sn']) >=1){ $msg = "Course Code [ ".$parameters['code']." ] Already Exist "; }			
					
					else {
						$dbm->insert("courses",$parameters); 	
						$msg = "Course Created Successfully";
					}
						return $msg;  // join("-",$parameters);
				}
				 
				///////////////////////////////////////////////////////////
				
				function deleteCourse($courseID){
					
					
					}
					
			///////////////////////////////////////////////////////////////////////					 				
				public function getAll(array $criteral){ 
					 
				 	$dbm = new DbTool(); 						
 				 	$allCourse = $dbm->getFields($dbm->select('courses',$criteral,array('level')),
	 		array('sn','name','code','unit','status','level','semester')); 						
						return $allCourse;						
					} 
		    
			///////////////////////////////////////////////////
			
			public function searchCourse(array $criterials,$order=""){
				 try{
				  	  $table = "courses";
					  $dbm = new DbTool();
					  $conn = $dbm->getConn();
				  $wheres = empty($criterials)?"":array_map(function($elem){ 
				  	return "$elem REGEXP ?";},array_keys($criterials));
					
				if(!empty($order)) $ord = " ORDER BY ".$order[0];
				else $ord = "";		
				
			  $str = sprintf("SELECT * FROM %s %s %s %s",$table,empty($criterials)?"":"WHERE",join(' OR ',$wheres),$ord);
			  $stm = $conn->prepare($str);
			
			  $stm->execute(array_values($criterials));
				
			  $res = $stm->fetchAll();
			  
			return 	$output = $dbm->getFields($res,array('sn','name','code','unit','status','level','semester'));
				
				 }
				
				 catch(PDOException $er){
						echo $er->getMessage(); 
				 }
		  }
		  
		  /////////////////////////////////////////////
		  
		  public function modifyCourse(array $criterials,array $newValues){
		  				// parameters are field names of the course 
						$dbm = new  DbTool(); 
						return $dbm->updateTb("courses",$newValues,$criterials);
						 
						// $dbm->message; 
		  		
		  }
		 ////////////////////////////////////////////////////
		 	 				
		}			
		// end of class courses 				
	


?>