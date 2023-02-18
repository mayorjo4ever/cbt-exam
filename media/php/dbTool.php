<?php
	  
	if(!isset($_SESSION)) session_start();  
	
	class DbTool{
		
			public $username,$psw,$conn;
			
			public $code, $message; 
			public $status;
	
			public function __construct(){
			
			$this->username = 'root';	$this->psw = ''; // connect to db 		
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
		  public function select($table, $where="",$order="", $operator = "AND", $direction = " DESC "){
			 
			 try{
	   	 			$db = new DbTool();	$conn = $db->getConn();
		  $wheres = empty($where)?"":array_map(function($elem){ return "$elem = ?";},array_keys($where));
			
			if(!empty($order)) $ord = " ORDER BY ".join(" , ",$order)." ". $direction ;
			else $ord = "";		
			
		  $str = sprintf("SELECT * FROM %s %s %s %s ",$table,empty($where)?"":"WHERE",@join(" $operator ",$wheres),$ord);
		  
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
		  /****************************************************************************/
		  //////////////////////////////////////////////////////////////////////////////
		  // selection function with different equators < > = <= >= 
		   
	  function selections($table, $wheres, $whereEqt, $operators, $order="",  $direction = " DESC "){
			  
			  try{
				  
				  $db = new DbTool();	$conn = $db->getConn();
				
				$cw = count($wheres); $ce = count($whereEqt); $co = count($operators);
				  if($cw!= $ce)
					  throw new Exception(" The total numbers of Whereclause must matched with the numbers of WhereEquator : ".$cw." by ".$ce." by ".$co." given ");
					 
					 if(($cw-1)!= $co)
					  throw new Exception(" The total numbers of operators ( OR AND, NOR ) must be 1 less than the  WhereEquator : ".$cw." by ".$ce." by ".$co." given ");
				  
					$whereSql = '';	 				  
							if(!empty($wheres)){			
								# split array
									$i = 0; 									
									foreach($wheres as $column=>$value){
										$strings[] =  $column." ".$whereEqt[$i]." '".$value."'";
										$i++;
										}
										// match string with operators
										$data = [];
										 foreach(array_map(null,$strings,$operators) as $parts)
										 {
											 $data = array_merge($data,$parts);
										 }
										 /* alternative code
										 /*********************************** 
										 $data = array_reduce(array_map(null,$strings,$operators),
										 function($strings,$operators){
												return array_merge($strings,$operators);
											},array());
										****************************************/
										 $whereSql = implode(" ",$data);
										}
			  
			if(!empty($order)) $ord = " ORDER BY ".join(" , ",$order)." ". $direction ;
				else $ord = "";		
			
			$str = sprintf("SELECT * FROM %s %s %s %s ",$table,empty($wheres)?"":" WHERE ",$whereSql,$ord);
		  
			$stm = $conn->prepare($str);
			
			$stm->execute();									
				 $this->message = $stm->rowCount()." record(s) found";
				 $this->code = $stm->errorCode();
				 $this->status = true; 											
					$stm->setFetchMode(PDO::FETCH_ASSOC);							
						return $res = $stm->fetchAll();
								
			  }
			  catch(Exception $e){
				  echo $e;
			  }
			  
			 }
		   
		   /************************
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
		 
		  ****************/  
		  
		  // old multi distinct function 
		  function multiDistinct(array $field,$table,array $where,$order=""){
			 try{
	   	  $con = new DbTool();	$conn = $con->getConn(); 

//		  $field = empty($field)?"*":array_map(function($elem){ return "$elem,";},array_keys($field));//
		  $wheres = empty($where)?"":array_map(function($elem){ return "$elem = ?";},array_keys($where));
			
			if(!empty($order)) $ord = " ORDER BY ".$order[0];
			else $ord = "";		
			
		 $str = sprintf("SELECT DISTINCT %s FROM %s %s %s %s",join(", ",$field),$table,empty($where)?"":"WHERE",join(' AND ',$wheres),$ord);
		 
		  $stm = $conn->prepare($str);
 		
			$stm->execute(array_values($where));
			
			return $res = $stm->fetchAll();
			 
			 }
			 catch(PDOException $er){
					echo $er->getMessage(); 
			 }
		  }
		 //////////////////////////
		  
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
		
		public function select_Multi_Distinct(array $field,$table,array $where,$order="", $operator = "AND", $direction = "DESC"){
			 try{
	   	  $db = new DbTool();	$conn = $db->getConn(); 

//		  $field = empty($field)?"*":array_map(function($elem){ return "$elem,";},array_keys($field));//
		  $wheres = empty($where)?"":array_map(function($elem){ return "$elem = ?";},array_keys($where));
			
			if(!empty($order)) $ord = " ORDER BY ".join(" , ",$order)." ". $direction ;
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
		
		
		public function getMax($table, $field, $wheres, $operator = "AND"){
			
			try{
				
			$vsn = new DbTool();
			$vcon = $vsn->getConn();	
		$wheres = empty($wheres)?"":array_map(function($elem){ return "$elem = ?";},array_keys($wheres));
			$str = sprintf("SELECT MAX(%s) AS max FROM %s",$field,$table,empty($where)?"":"WHERE",join(' AND ',$wheres));
			$exe = $vcon->prepare($str);
			$exe->execute();
			
			$this->message =  " found ". $exe->fetch(PDO::FETCH_ASSOC);
			$this->code = $stm->errorCode(); 
			$this->status = true; 
					
			return $fin = $exe->fetch(PDO::FETCH_ASSOC);	// final
			
			}
			catch (PDOException $er){
				$_SESSION['error_code'] = $er->code; 
				$this->code = $_SESSION['error_code'] = $er->code; 
					 $this->message = $_SESSION['error_msg'] = $er->message; 
					header("Location:error_page/");
			}
		}
		///
		public function getMin($table,$field,$wheres, $operator = "AND"){
			
			try{
				
			$vsn = new DbTool();
			$vcon = $vsn->getConn();	
		$wheres = empty($wheres)?"":array_map(function($elem){ return "$elem = ?";},array_keys($wheres));
			$str = sprintf("SELECT MIN(%s) AS min FROM %s",$field,$table,empty($where)?"":"WHERE",join(' AND ',$wheres));
			
			$exe = $vcon->prepare($str);
			$exe->execute();
			
			$this->message =  " found ". $exe->fetch(PDO::FETCH_ASSOC);
			$this->code = $stm->errorCode(); 
			$this->status = true; 
			
			return $fin = $exe->fetch(PDO::FETCH_ASSOC);	
			
			}
			catch (PDOException $er){
			$this->code = $_SESSION['error_code'] = $er->code; 
					 $this->message = $_SESSION['error_msg'] = $er->message; 
					header("Location:error_page/");
			}
		}
		 
		   
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
		
	function iLabel($value){
		$label = "";
		if($value==1){
			$label = "A";
			}
			if($value==2){
			$label = "B";
			}
				if($value==3){
				$label = "C";
				}
					if($value==4){
					$label = "D";
					}
						if($value==5){
						$label = "E";
						}
						
 			return $label;			
		}
	  
	###
	
	// get next question id 
		function getQtnNo($code,$year,$level,$qtype){
			
				$dbm = new DbTool(); 
				
				$allAv = $dbm->select("questions",array("code"=>$code,"year"=>$year,"level"=>$level,"qtype"=>$qtype));

				$reqFields = $dbm->getFields($allAv,array("qtnum","code"));
				
				$tot = 	count($reqFields['code']);		
				
				return $tot+1; 
				
		}
		
		//  copy answer 
		function copy_answer($total_options,$answer)
		{
				return $result = $_SESSION['options'][$answer];
			  
		}
		
		function copy_m_answer($total_options)
		{
			$result = array(); 
			$n = 0;
			for($i = 1; $i<=$total_options; $i++){
				if($_SESSION['mcosAnswer'.$i]!=""){
					$result[$n] = $this->copy_answer($total_options, $_SESSION['mcosAnswer'.$i]);
					$n++;
				}
			}
			return $result; 			# = $_SESSION['options'][$answer];
			  
		}
		
		 
		function paste_answer(array $options,$answer)
		{
			$dbm = new DbTool();
			$result = 0;
			
			$n = 0;
			foreach($options as $opts)	
			{
					if($answer == $opts)
					{ 
					$result = $n+1;	
						break;
					}
					$n++;										
			}
			return $result;
		}
		
		
		/***************************/
		
		function readColor($val){
		if($val<=15 ){
			echo " progress-bar right bg-red";
		}
		elseif($val<=25){
			echo "progress-bar right bg-orange";
		}
		elseif($val<=100){
			echo " progress-bar right bg-green ";
		}
		 
	}
	
	function readPercent($val){
		if($val<=20 ){
			echo " btn-danger";
		}
		elseif($val<=40){
			echo "btn-warning";
		}
		elseif($val<=100){
			echo " btn-success ";
		}
		 
	}
	
		/*********************/ 
		function n2a($val){
		if($val=='1'){
			return 'A';
		}
		elseif($val=='2'){
			return 'B';
		}
		elseif($val=='3'){
			return 'C';
		}
		elseif($val=='4'){
			return 'D';
		}
		elseif($val=='5'){
			return 'E';
		}
		else { 
		return '';
		}
	}
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
	
	/********************************************************************************/
		public function submitQuestion(){							
			 /************************************************************************************************/	
				##  CONTROL DATA TO SAVE 
				  $dbm = new DbTool();	$conn = $dbm->getConn();
				###				
				###	
					$savingData = array("code"=>$_SESSION['coscode'],"year"=>$_SESSION['cosyear'],
					"qtype"=>$_SESSION['questype'],"level"=>$_SESSION['level'],"num"=>$_SESSION['qtnNo'],
					"passage"=>($_SESSION['psgInc']=="")?"":$_SESSION['passage'],"question"=>$_SESSION['question'],
					"instruction"=>($_SESSION['instruct_option']=="yes")?$_SESSION['instruct_passage']:"",
					"optiontype"=>$_SESSION['optionType'],"option1"=>$_SESSION['options'][1],
					"option2"=>$_SESSION['options'][2],"option3"=>$_SESSION['options'][3],
					"option4"=>$_SESSION['options'][4],"option5"=>$_SESSION['options'][5],"marks"=>$_SESSION['marks'],
					"tot_option"=>$_SESSION['defaultOption'],"answer"=>$_SESSION['copy_answer'],
					"typeAns"=>$_SESSION['typeAns'],"image1"=>($_SESSION['pixInc']=="")?"":$_SESSION['img_name'],
					"recordtime"=>time(),"recorddate"=>date('D jS M, Y - g:i s A'),"createdby"=>$_SESSION['adminUser']);
					###
					###
					$updData = array("code"=>$_SESSION['coscode'],"year"=>$_SESSION['cosyear'],
					"qtype"=>$_SESSION['questype'],"level"=>$_SESSION['level'],"num"=>$_SESSION['qtnNo'],
					"passage"=>($_SESSION['psgInc']=="")?"":$_SESSION['passage'],"question"=>$_SESSION['question'],
					"instruction"=>($_SESSION['instruct_option']=="yes")?$_SESSION['instruct_passage']:"",
					"optiontype"=>$_SESSION['optionType'],"option1"=>$_SESSION['options'][1],
					"option2"=>$_SESSION['options'][2],"option3"=>$_SESSION['options'][3],
					"option4"=>$_SESSION['options'][4],"option5"=>$_SESSION['options'][5],"marks"=>$_SESSION['marks'],
					"tot_option"=>$_SESSION['defaultOption'],"answer"=>$_SESSION['copy_answer'],
					"typeAns"=>$_SESSION['typeAns'],"image1"=>($_SESSION['pixInc']=="")?"":$_SESSION['img_name'],
					"updatetime"=>time(),"dateupdated"=>date('D jS M, Y - g:i s A'),"updatedby"=>$_SESSION['adminUser']);
				###
				
				###
				## CHECK IF IT IS UPDATE OR INSERT 
					if(!isset($_SESSION['service'])){
						$dbm->insert("questions",$savingData);
						
							$_SESSION['tagSign'] = $tagSign = $gly_ok;
							$_SESSION['display'] = $display = $disp_on;
							$_SESSION['msgAlert'] = $msgAlert = $asuccess;
							
					 $_SESSION['qtnMsg'] = " Question ". $_SESSION['qtnNo']. " Successfully saved.. Press New Question";
					 $_SESSION['saveNewQtn'] = "yes";
				} // end for insert 
				
				else if(isset($_SESSION['service'])){
					// now UPDATE the question 
						  
						  $dbm->updateTb("questions",$updData,array("sn"=>$_SESSION['updateId'])); //insert("questions",$savingData);
						
								$_SESSION['tagSign'] = $tagSign = $gly_ok;
								$_SESSION['display'] = $display = $disp_on;
								$_SESSION['msgAlert'] = $msgAlert = $asuccess;
								
						 $_SESSION['qtnMsg'] = " Question ". $_SESSION['oldnum']. " Updated Successfully.. ";
						 $_SESSION['saveNewQtn'] = "yes";
						 unset($_SESSION['service']);
				}
			/***********************************************************************/
		}
	/********************************************************************************/
	// make crypting
		function toMD5($text){
				return md5($text);
		}
		
		/************************************************/
			# get distinct level 
			# and departments  
			
			public function getDistinctLevel($table)
			{
				$tool = new DbTool(); 
				
				return $dsLevel = $tool->getFields($tool->select_Distinct("level",$table,array(),array('level')),array('level'));
			}			
		/***********************************************/
		public function getDistinctDepartment($table)
			{
				$tool = new DbTool(); 
				
				return $dsDept = $tool->getFields($tool->select_Distinct("department",$table,array(),array('department')),array('department'));
			}
		/****************************************************************/
		
		 public function queryString($strings){			 
			 
		 $db = new DbTool(); 
		 $conn = $db->getConn();
		 
		 $exe = $conn->prepare($strings);
						
						$exe->execute();
						
			return $fin = $exe->fetch(PDO::FETCH_ASSOC);	 
			 
		 }
		 
		 # reconfigure users name 
		 function encodeId($id){
			//	return str_replace("/","_",$id); 
			return $id;
		 }
		 
		function decodeId($id){
			// return str_replace("_","/",$id); 
			return $id;
			}
		  
		 
		 
		 
		/*******************************************************************************************
		public function selectNotExists($table1,$table2,array $where1,array $where2,$order="", $operator = "AND"){
			 
			 try{
	   	 
		  $db = new DbTool();	$conn = $db->getConn();
	
		   $wheresA = empty($where1)?"":array_map(function($elem){ return "$elem = ?";},array_keys($where1));
		   $wheresB = empty($where2)?"":array_map(function($elem){ return "$elem = ?";},array_keys($where2));		  
		   $wheresC = empty($matches)?"":array_map(function($elem){ return "$elem = ?";},array_keys($matches));
			$allWheres =   array_merge($where1,$where2);	
			
		  $str = sprintf("SELECT * FROM %s %s %s ",$table1,empty($where1)?"":"WHERE",join(" $operator ",$wheresA));
				$str .= sprintf(" $operator  NOT EXISTS ( SELECT * FROM %s %s %s ",$table2,empty($where2)?"":"WHERE",join(" $operator ",$wheresB)).")"; 
	//			$str .= sprintf(" $operator %s ",join(" $operator ",$wheresC));
				
			
		 $stm = $conn->prepare($str);
 		$stm->execute((array_values($allWheres));
		
			# $stm->execute(array_values($where));
			
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
		 **************************************************************************************/		
		
}	// end of class DbTool
		?>
		
	<?php 
	
	
	// at the admin page 
		// update questionnumber 
		if(isset($_POST['qnmUpdate'])){
			$dbm = new DbTool(); 
			
			$name = substr($_POST['name'],4);
			
			$value = (int)$_POST['value'];
			
			$oldnum =  $dbm->getFields($dbm->select("questions",array("sn"=>$name)),array("num"));
			
			if(!is_numeric($value)){
				echo "the new value cannot be a string, please supply integer value ";	
			}
			
			else{
				$dbm->updateTb("questions",array("num"=>$value),array("sn"=>$name));
				
				echo "question number ".$oldnum['num'][0]." is now updated to number ".$value; 
			
			}
		}
	
	?>	
		
	<?php 
	
////////////// login user 
	
	if(isset($_POST['checkUser'])){
		
		$dbm = new DbTool();			
	  
		$user = $_POST['checkUser'];
		$loops = $dbm->getFields($dbm->select("users",array('user_id'=>$user)),array('user_id'));
		
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
	
		
		if(isset($_POST['checkPsw'])){ 
			
			$dbm = new DbTool(); 
			
			$matric = $_POST['matric'];	
			$psw = $_POST['checkPsw'];
			$user_Pc = gethostname(); 
			
			$loops = $dbm->getFields($dbm->select("users",array('user_id'=>$matric,'enc_psw'=>$dbm->toMD5($psw))),array('user_id'));
			
			if(count($loops)==0 || count($loops)>1){
				echo false;
				}
				else if(count($loops)==1){
					$_SESSION['exmUser'] = $matric;
					$logdate = date('D jS M, Y - g:i s A');
					$logtime = time();
					$logid = rand(1,9999)*126;
					//					 
					 $dbm->insert("userslogs",array("user_id"=>$_SESSION['exmUser'],"type"=>"lin","logtime"=>$logtime,"logdate"=>$logdate));
					 $dbm->updateTb("users",array("logtime"=>$logtime,"logdate"=>$logdate,"logstatus"=>"lin","pc_name"=>$user_Pc),array("user_id"=>$_SESSION['exmUser']));				
					//
					echo true;	
				}						
		}

// to display exam users 
