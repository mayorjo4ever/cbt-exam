<?php
		if(!isset($_SESSION)) session_start();

		if(!isset($_SESSION['started'])){
			 header("location:index.php");
		} 
  
	/******************************************/
	if(!isset($_SESSION['rand_list'])) {
		
		 $dbm = new DbTool(); 
			$cond = array('year'=>$_SESSION['year'],'code'=>$_SESSION['code'],'qtype'=>$_SESSION['qtype']);
			//
			$qtncounts = $dbm->getFields($dbm->select("questions",$cond),array('code'));		 
			$_SESSION['max_qtn'] = count($qtncounts['code']);  
				
				// create  a random list of question for each paper scheduled 
			
				$max_range = $_SESSION['max_qtn'];
				$min_range = 1;
				$count_range = $_SESSION['tot_qtn'];
				
				$arr=range($min_range,$max_range);
				shuffle($arr);
				$nrArray = array_slice($arr,0,$count_range);
			
			$_SESSION['rand_list'] = $nrArray;
					 			 
			}			
			/**********************************************************/	
			
			if(!isset($_SESSION['arr_qtn'])){
				
				$dbm = new DbTool(); 		
				   $n = 0;
				foreach($_SESSION['rand_list'] as $qno){
					
				$cond = array('year'=>$_SESSION['year'],'code'=>$_SESSION['code'],'qtype'=>$_SESSION['qtype'],'num'=>$qno);					
					
				$_SESSION['arr_qtn'][$n]= $dbm->getFields($dbm->select("questions",$cond),
					array("sn","code","year","qtype","num","marks","question","tot_option","optiontype","passage","option1","option2","option3","option4","option5","answer","typeAns","image1","image2","picked1"));
			 
				$dbm->insert("qtn_remind",array(
							"user_id"=>$_SESSION['exmUser'],
							"code"=>$_SESSION['code'],
							"year"=>$_SESSION['year'],
							"qtype"=>$_SESSION['qtype'],
							"num"=>($n+1),
							"question"=>$_SESSION['arr_qtn'][$n]['question'][0],
							"tot_option"=>$_SESSION['arr_qtn'][$n]['tot_option'][0],
							"optiontype"=>$_SESSION['arr_qtn'][$n]['optiontype'][0],
							"passage"=>$_SESSION['arr_qtn'][$n]['passage'][0],
							"option1"=>$_SESSION['arr_qtn'][$n]['option1'][0],
							"option2"=>$_SESSION['arr_qtn'][$n]['option2'][0],
							"option3"=>$_SESSION['arr_qtn'][$n]['option3'][0],
							"option4"=>$_SESSION['arr_qtn'][$n]['option4'][0],
							"option5"=>$_SESSION['arr_qtn'][$n]['option5'][0],
							"answer"=>$_SESSION['arr_qtn'][$n]['answer'][0],
							"typeAns"=>$_SESSION['arr_qtn'][$n]['typeAns'][0],							
							"image1"=>$_SESSION['arr_qtn'][$n]['image1'][0],
							"image2"=>$_SESSION['arr_qtn'][$n]['image2'][0],
							"marks"=>$_SESSION['arr_qtn'][$n]['marks'][0]
							));
				 $n++;
				}  // for loop end here
			
			/// after question is stored , activate session paste 
			
			$_SESSION['pasted']  = true;
			
			} 
			
			/// finished storing questions 	
?>
 
