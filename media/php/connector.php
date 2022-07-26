<?php
	  
	if(!isset($_SESSION)) session_start();
	
	class DbTool{
		
			public $username,$psw,$conn;
			
			public $code, $message; 
			public $status;
	
			public function __construct(){
			
			$this->username = 'root';	$this->psw = 'msecure'; // connect to db 		
		    #$this->username = 'root';	$this->psw = ''; // connect to db 						
							
			try{
				
				if(!isset($_SESSION)) session_start();
				
				$this->conn = new PDO('mysql:host=127.0.0.1; dbname=nursingcbt',$this->username,$this->psw);
				
				$this->conn->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);			
				$this->code = $this->conn->errorCode();
				$this->message = "connected";						
				$this->status = true; 
												
				}
				catch(PDOException $er){					
					 $this->code = $_SESSION['error_code'] = $er->getCode(); 
					 $this->message = $_SESSION['error_msg'] = $er->getMessage(); 
					header("Location:error_page/");
				}	
			}			
			/// 
		public	function getConn(){

				return $this->conn;	
			}
			
		public function __destruct(){
				
				$this->conn = NULL; //  echo "but now am dead";
			}
		
	/// 
		 public function insert($table, array $data)
				{
					try{
			 	
				$db = new DbTool();	$conn = $db->getConn();			 		
				
				$columns = array_map(function($column){return "$column";}, array_keys($data)); 
				
					 $values = array_fill(0, count($data), '?');
					// construct the query    
				$sql = sprintf('INSERT INTO %s (%s) VALUES (%s)', 
					$table,
					join(',', $columns),
					join(',', $values)
			);			
    //  prepare and execute it
	
   		 $stmt = $conn->prepare($sql);
   		 $stmt->execute(array_values($data));	
		 
		 $this->message = $stmt->rowCount()." record inserted";
		 $this->code = $stmt->errorCode();
		 $this->status = true; 

		 	
			
			
		  }
			 catch(PDOException $er){
					 $this->code = $_SESSION['error_code'] = $er->getCode(); 
					 $this->message = $_SESSION['error_msg'] = $er->getMessage(); 
					header("Location:error_page/");
			 }
		}
			
		# 
		#
		
		 function updateTb($table, $data,$where ){
		 
		 $db = new DbTool();	$conn = $db->getConn();			 		
				
		   /// 
		if(empty($where)){
				$whereSql = '';			
			}
			else{			
				# split array	
				foreach($where as $column=>$value){
				$strings[]= "".$column."='".$value."'";
			}
			$whereSql = " WHERE ".implode(" AND ", $strings);			
			}								
			# statrt actual sql statement
			$sql = "UPDATE ".$table." SET ";
			#loop and build thecolumn
			$set = array();
			foreach($data as $column=>$value){
			$set[]= "".$column."='".$value."'";
			}
			 $sql.=implode(',',$set);
			#append the whereclause
			$sql.= $whereSql; //  $whereSql;
			
			$exe = $conn->prepare($sql);
			$exe->execute();
			
			if($exe->rowCount()>0) return $exe->rowCount()." data updated successfully";
			
			else return  "no data found for update";		
	   }
		
		
		public function update($table, $data,$where, $operator = "AND" ){
		 
		 try{
			 			 
			 $db = new DbTool(); 
			 $conn = $db->getConn();
			   /// 
			if(empty($where)){
					$whereSql = '';			
				}
				else{			
					# split array	
					foreach($where as $column=>$value){
					$strings[]= "".$column."='".$value."'";
				}
				$whereSql = " WHERE ".implode(" $operator ", $strings);			
				}								
				# statrt actual sql statement
				$sql = "UPDATE ".$table." SET ";
				#loop and build thecolumn
				$set = array();
				foreach($data as $column=>$value){
				$set[]= "".$column."='".$value."'";
				}
				 $sql.=implode(',',$set);
				#append the whereclause
				$sql.= $whereSql; //  $whereSql;
				
				$exe = $contc->prepare($sql);
				$exe->execute();
				
				$output = "";
				
				if($exe->rowCount()>0) $output = $exe->rowCount()." data updated";
								
				else $output =  "no data found for update";		
				
				$this->message = $output;
				
				$this->code = $exe->errorCode();
				
				$this->status = true; 
				
				return $output;
		 }
		 
		 catch(PDOExeption $er){
			 		$this->code = $_SESSION['error_code'] = $er->getCode(); 
					$this->message = $_SESSION['error_msg'] = $er->getMessage(); 
					header("Location:error_page/");
		 }
		 
	   }
		#			
		  
		public function select($table,array $where,$order="", $operator = "AND"){
			 
			 try{
	   	 
		  $db = new DbTool();	$conn = $db->getConn();
	
		  $wheres = empty($where)?"":array_map(function($elem){ return "$elem = ?";},array_keys($where));
			
			if(!empty($order)) $ord = " ORDER BY ".$order[0];
			else $ord = "";		
			
		  $str = sprintf("SELECT * FROM %s %s %s %s",$table,empty($where)?"":"WHERE",join(" $operator ",$wheres),$ord);
		  
		  $stm = $conn->prepare($str);
 		
			$stm->execute(array_values($where));
			
		 $this->message = $stm->rowCount()." record(s) found";
		 $this->code = $stm->errorCode();
		 $this->status = true; 
			
			$stm->setFetchMode(PDO::FETCH_ASSOC);
						
			return $res = $stm->fetchAll();
			
			 }
			 catch(PDOException $er){
					$this->code = $_SESSION['error_code'] = $er->getCode(); 
					$this->message = $_SESSION['error_msg'] = $er->getMessage(); 
					header("Location:error_page/");
			 }
		  }
		  #
		 
		  #		   
		  
		public function select_Distinct($field,$table,array $where,$order="", $operator = "AND"){
			 
			 try{
	   	  
		  $db = new DbTool();	$conn = $db->getConn(); 

//		  $field = empty($field)?"*":array_map(function($elem){ return "$elem,";},array_keys($field));//
		  $wheres = empty($where)?"":array_map(function($elem){ return "$elem = ?";},array_keys($where));
			
			if(!empty($order)) $ord = " ORDER BY ".$order[0];
			else $ord = "";		
			
		  $str = sprintf("SELECT DISTINCT %s FROM %s %s %s %s",$field,$table,empty($where)?"":"WHERE",join(" $operator ",$wheres),$ord);
		  
		  $stm = $conn->prepare($str);
 		
			$stm->execute(array_values($where));

			$this->message = $stm->rowCount()." record(s) found";
			$this->code = $stm->errorCode();
			$this->status = true; 
			
			$stm->setFetchMode(PDO::FETCH_ASSOC);
			
			return $res = $stm->fetchAll();

			 }
			 catch(PDOException $er){
					$this->code = $_SESSION['error_code'] = $er->getCode(); 
					$this->message = $_SESSION['error_msg'] = $er->getMessage(); 
	 				header("Location:error_page/");
				 }
		  }
		  #
						
		public function select_Multi_Distinct(array $field,$table,array $where,$order="", $operator = "AND"){
			 try{
	   	  $db = new DbTool();	$conn = $db->getConn(); 

 		  // $fields = empty($field)?"*":array_map(function($elem){ return "$elem,";},array_keys($field));//
		  $wheres = empty($where)?"":array_map(function($elem){ return "$elem = ?";},array_keys($where));
			
			if(!empty($order)) $ord = " ORDER BY ".$order[0];
			else $ord = "";		
			
		 $str = sprintf("SELECT DISTINCT %s FROM %s %s %s %s",join(", ",$field),$table,empty($where)?"":"WHERE",join(" $operator ",$wheres),$ord);
		 
		  $stm = $conn->prepare($str);
 		
			$stm->execute(array_values($where));

			$this->message =  $stm->rowCount()." record(s) found ";
			$this->code = $stm->errorCode();
			$this->status = true; 
			
			$stm->setFetchMode(PDO::FETCH_ASSOC);
			
			return $res = $stm->fetchAll();
			 
			 }
			 catch(PDOException $er){
			 		$this->code = $_SESSION['error_code'] = $er->getCode(); 
					$this->message = $_SESSION['error_msg'] = $er->getMessage(); 
					header("Location:error_page/");
			 }
		  }
		  		  
		 ##
		   
		public function deleteRow($table,$where, $operator = "AND" ){
		 
		 try{ 
		 
		 $db = new DbTool(); 
		 $conn = $db->getConn();		 
		   /// 
			if(!empty($where)){		 
				foreach($where as $column=>$value){
				$strings[]= "".$column."='".$value."'";
				} // rows mapped				
			
				$whereSql = " WHERE ".join(" $operator ", $strings);	
				
						$sql = sprintf("DELETE FROM  %s %s",$table,$whereSql); 
					 
					 	$exe = $conn->prepare($sql);
						
						$exe->execute();
						
						$counts = $exe->rowCount();
						
						if($counts==0)
						$this->message =  " no record was deleted ";
						else $this->message =  $counts."  record(s) deleted ";
						$this->code = $exe->errorCode(); 
						$this->status = true; 
					
					 return;
					
						}											
					}
					
			catch (PDOException $e){
				$this->code = $_SESSION['error_code'] = $er->code; 
					 $this->message = $_SESSION['error_msg'] = $er->message; 
					header("Location:error_page/");
			}		
	   }
	   
	   /// check for error 
	   
	   public function checkError(){
		  // $dbTool = new DbTool();
		   if($this->status != true){		   

						$_SESSION['error_code'] = $this->code; 
						$_SESSION['error_msg'] = $thisl->message; 
						header("Location:error_page/");
					}			
	   }
	   #
	   
	   function getFields(array $string, array $fieldname){
				
				foreach($string as $rows){
					foreach($fieldname as $f){
						$fields[$f][] = $rows[$f];	
					}
				}				
				return $fields;
			}
			
		#
		 
		 /********************************/
	// generate sring from array 
	function remap(array $var){
		 $i=0; $n = count($var); $str = "";
			foreach($var as $k=>$v){
			$str .= $k."=".$v." ";	
			if($i<$n-1) $str.= "&amp;";
			$i++;
			}
		return $str; 
	}
	
	// make crypting
		function toMD5($text){
				return md5($text);
		}
	//////////////////
		
	/**************************************************************************/
		public function resort(array $data){
			
			$ork = array_keys($data);  // original array keys 
			$aVal = array(); $n = 0;  // array values 
					foreach($data as $k=>$v){
						$aVal[] = $data[$ork[$n]][0];
						$n++;
					}
			return $output = array_combine($ork,$aVal);
		}
		/*********************************************************************/
		############################
		
			
	/****************************************************/
	
	# suffix of numbers or positions 
	 function suffixes ($value){
		if(!in_array(($value % 100),array(11,12,13))){
			
			switch ($value % 10){
				case 1: return $value.'<sup>st</sup>';
				case 2: return $value.'<sup>nd</sup>';
				case 3: return $value.'<sup>rd</sup>';
			}
			
		}
			 return $value.'<sup>th</sup>';
	 }
	 /************************************************/
	 // get week calendar range for a given year 
		
		function week_day_range($week,$year){
			
			$dto = new DateTime();
			$res[0] = $dto->setISODate($year,$week)->format(' M d, Y');
			$res[1] = $dto->modify('+5 days')->format(' M d, Y');
			return $res; // result - array type 
		}
		/********************************************/
		function get_month_days($month,$year){
				return cal_days_in_month(CAL_GREGORIAN,$month,$year);		
		}
		/*******************************************/
		function month_name($num){
			$name = "";
			switch($num){
				
				case 1 :  $name = "Jan"; break;
				case 2 :  $name = "Feb"; break;
				case 3 :  $name = "Mar"; break;
				case 4 :  $name = "Apr"; break;
				case 5 :  $name = "May"; break;
				case 6 :  $name = "Jun"; break;
				case 7 :  $name = "Jul"; break;
				case 8 :  $name = "Aug"; break;
				case 9 :  $name = "Sep"; break;
				case 10 :  $name = "Oct"; break;
				case 11 :  $name = "Nov"; break;
				case 12 :  $name = "Dec"; break;				
			}
			return $name;
		}
		/********************************************/
			function get_working_days($month,$year){
				$totaldays = $this->get_month_days($month,$year);
				$all_days = null; 
				
				for($d = $totaldays; $d>=1; $d--){
					$dates = "".$month."/".$d."/".$year."";
					if(date('D',strtotime($dates)) !="Sun"){
						$all_days[] = $d;
					}
				}
				
				return $all_days; 
			}
			
			/***************************************/
			
			function month_week_range($month,$year){
				
				 $days =  $this->get_month_days($month,$year);
				 $beg = "".$month."/1/".$year;
				 $end = "".$month."/".$days."/".$year;
				
				 $result[0] = (idate('W',strtotime($beg))==53)?1:idate('W',strtotime($beg));
				 $result[1]= idate('W',strtotime($end));
				 
				 return $result; 
			}
			
		
		################
	}
	
	?>