<?php
		if(!isset($_SESSION)) session_start();

		if(!isset($_SESSION['started'])){
			 header("location:index.php");
		} 
		
		
	class questionaire{
		
		public $codegen;
		public $year; 
		
		protected $indexes; 
		protected $questions; 
		protected $shufQuestions; 
		
		
		public function __construct($codegen,$year){
			
			$this->codegen = $codegen; 
			
			$this->year = $year;
			
			if(!empty($this->codegen) && !empty($this->year)){
				$this->get_temp_qtn_criterial(); // fetch the indexes
				$this->getQtn(); 				// now get the questions
				$this->resahpe_all();			// all questions and options shuffled 
				
			}
		}
		
		protected function get_temp_qtn_criterial(){ 
			
				$dbm = new DbTool();
				
				$indexes = array();  // WHERE ALL THE QUESTION PRIMARY ID KEY WILL BE STORED
				
					$sources = $dbm->getFields($dbm->select("esource",array("codegen"=>$this->codegen,"year"=>$this->year)),array('sn','code','qtype','year','total_qtn'));
					
					// after getting question sources
					
					if(!is_null($sources)){
						
						/// ok, all sources of question are gotten now 
						/************* NOW ITEARTE THROUGH THEM *********************/
						$n = 0; 
						
						foreach($sources['code'] as $cd){
							
							// go through each code and get max questions for them 
								
								$criterial = array("code"=>$cd,"qtype"=>$sources['qtype'][$n],"year"=>$sources['year'][$n]); 
								
								$allQtn = $this->countQtn($criterial); 
								
								$expected = $sources['total_qtn'][$n]; 
								
								$ranges = range(1,$allQtn); 
								
								// randomize question  
								
								shuffle($ranges); 
								
								$wanted = array_slice($ranges,0,$expected); 

									// now source the question serial index 
										
										foreach($wanted as $index){
											
											$serials = $dbm->getFields($dbm->select("questions",array("code"=>$cd,"qtype"=>$sources['qtype'][$n],"year"=>$sources['year'][$n],"num"=>$index)),array('sn','code','qtype','year'));											
										
										// now fill the indexes 
										
										$indexes[] = $serials['sn'][0]; 
											
										}								
								
							$n++; 	// increment n
						}
						
						$this->indexes =  $indexes; 
					}
					
					else 
						$this->indexes =  null; 
				
		}
		
		///////////////////////////////////////
		
		protected function countQtn($criterial){
			
			// connect 
			
			$dbm = new DbTool(); 
			
			$res =  $dbm->getFields($dbm->select("questions",$criterial),array('sn','code','qtype','year','total_qtn'));
			
			return count($res['sn']);
			
		}
		
		protected function getQtn(){
					
			$dbm = new DbTool(); 
			
			$indexes = $this->indexes; 
			
			$result = array();  
				
				$values =  array("sn","code","year","qtype","marks","instruction","question","tot_option","optiontype","passage","option1","option2","option3","option4","option5","answer","typeAns","image1","image2","picked1");
				
			 // now get questions 
			 if(!is_null($indexes)) 
			 {
				 shuffle($indexes); 
				 
				 foreach($indexes as $serials){
				 
					$result[] = $dbm->resort($dbm->getFields($dbm->select("questions",array("sn"=>$serials)),$values));
					 
					} // done 
			 }
			 
			$this->questions =  $result;  
		}
	 
	######################################
	## to shuffle the objectives but keep the index key constant
	
	protected function opt_quakes(&$array){
		
		if(is_array($array)){
			
			$keys = array_keys($array); 
			
			$temp = $array; 
			
			$array = null; 
			
			shuffle($temp);
			
			foreach($temp as $k=>$v){
				$array[$keys[$k]] = $v;
			}
			return;			
		}
		return false; 	
	}
	 ################################
		
		protected function resahpe_all(){
		
				$qtns = $this->questions; 
				
				$a =  array("sn","code","year","qtype","marks","instruction","question","tot_option","optiontype","passage","answer","typeAns","image1","image2","picked1");
			
				$b =  array("option1","option2","option3","option4","option5");
				
				$output = array(); 
				
				foreach($qtns as $aa){		
	 
					foreach($a as $k){
						 
						  $ma[$k] = $aa[$k];
					 } 
		 		 
				foreach($b as $k){
					  $mb[$k] = $aa[$k];
					 }		
			
					$mb = array_slice($mb,0,$ma[tot_option]);			
					
					$this->opt_quakes($mb);
		
				$mc = array_merge($ma,$mb);
				
				$output[] = $mc;
			}	
			
			$this->shufQuestions = $output; 	
		}
	
 ###################################################
	
		public function getAllQtn(){
		
			return $this->shufQuestions; 
			
		}
		
	#####################################
	
	public function backup_questions($userID){
			
			$dbm = new DbTool(); 
			
			$extras = array("user_id"=>$userID,"codegen"=>$this->codegen); 
			
			$qtns = $this->shufQuestions;
			
			$n = 1; 
			foreach($qtns as $q){
					$num = array("num"=>$n);					
					$cent = array_merge($q,$extras); 
					$all = array_merge($cent,$num);
					$repair = array_slice($all,1);
					$dbm->insert("qtn_remind",$repair); 
				$n++;
			}
			
		}
		
	} 	// end of class questionaire  
  
	/******************************************/
	if(!isset($_SESSION['pasted'])) {
		
				$qtn_object = new questionaire($_SESSION['codegen'],$_SESSION['year']);
				
				$dbm = new DbTool();
								
				$qtns = $qtn_object->getAllQtn(); 
				
				$qtn_object->backup_questions($_SESSION['exmUser']);
				
				$_SESSION['pasted']  = true;
	 			
						   
			// fetch user's questions 
			/******************************************/
			 $_SESSION['myQtn'] = $myQtn = $dbm->getFields($dbm->select("qtn_remind",array("user_id"=>$_SESSION['exmUser'],"year"=>$_SESSION['year'],"codegen"=>$_SESSION['codegen'])),
							array("sn","codegen","num","question","tot_option","optiontype","passage","instruction","option1","option2","option3","option4","option5","answer","typeAns","image1","marks","picked1"));
		
			/*******************************************/
		
			}			
			/**********************************************************/	
			
			/// finished storing questions 	
?>
 
