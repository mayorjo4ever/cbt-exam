<?php
		if(!isset($_SESSION)) session_start();

		 if(!isset($_SESSION['redo_access']) and !isset($_SESSION['delay'])){
			 header("location:index.php");
		}
		
		if(isset($_SESSION['alert'])){
		 
			 header("location:../");
		}
		
		  	   
	///////////////////////////////
	//////////view exam schedule///
	$con = new DbManager();

	$schd = $con->selectAnd("schedule",array(''));
	$allSchd = $con->getFields($schd,array('subjectcode','batchno','year','type','total_sec','time','mark','total_qtn','commence'));
	
	$Schdcos = $con->selectAnd('subject',array('code'=>$allSchd['subjectcode'][0]));
	$SchdcosName=$con->getFields($Schdcos,array('name')); 
	
	$cond = array('year'=> $allSchd['year'][0],'subjectcode'=>$allSchd['subjectcode'][0],
	'batchno'=>$allSchd['batchno'][0],'type'=>$allSchd['type'][0]);
			
 	 	
			# linkn result tab name to save to
			switch($allSchd['type'][0]){
				case 'test':
				$resTab_score = 'testscore';
				$totTab_score = 'totaltest';
				$_SESSION['tabSign']=$tabSign = "test_signal";
				break;
				#
				#
				case 'exam':
				$resTab_score = 'examscore';
				$totTab_score = 'totalexam';
				$_SESSION['tabSign']=$tabSign = "exam_signal";					
				break;
			}
			
			#
			#first get total qtn
			# 			
			if(!isset($_SESSION['max_qtn'])){				
			
			$qcount = $con->getFields($con->selectAnd("composition",$cond),array('subjectcode'));		 
			$_SESSION['max_qtn'] = count($qcount['subjectcode']); 
			
			}
			#
			#  get the qtn randomise
			if(!isset($_SESSION['rand_list'])){
			 	$max_range = $_SESSION['max_qtn'];
				$min_range = 1;
				$count_range = $allSchd['total_qtn'][0];
				
				$arr=range($min_range,$max_range);
				shuffle($arr);
				$nrArray = array_slice($arr,0,$count_range);
			
			$_SESSION['rand_list'] = $nrArray;
			}
	 
			#
			#
			# get the qtn randomised
			 
			if(!isset($_SESSION['cach_qtn'])){
			 for($i=1; $i<= $allSchd['total_qtn'][0]; $i++){
			 $questions = $con->selectAnd('qtn_remind',array('matricno'=>$_SESSION['exmUser'],'qtnum'=>$i,'subjectcode'=>$allSchd['subjectcode'][0],'type'=>$allSchd['type'][0],'year'=> $allSchd['year'][0],'batchno'=>$allSchd['batchno'][0]));
		 	$qtnValues = $con->getFields($questions,array('year','subjectcode','type','batchno','question','tot_option','qtnum','option1','option2','option3','option4','option5','attachment','answer','picked'));
		 		 
		$_SESSION['cach_qtn'][$i] = $qtnValues;
		
				  }					
			}
			
			// auto keep answers
			for($n = 1; $n<=$allSchd['total_qtn'][0]; $n++){
			if(!isset($_SESSION['mycach'][$n]))	{
				$_SESSION['mycach'][$n] = $_SESSION['cach_qtn'][$n]['picked'][0];
			}
			elseif(isset($_SESSION['mycach'][$n])){
			if($_POST['num'.$n] !="")	{
				$_SESSION['mycach'][$n] = $_POST['num'.$n];
					}
				}
				// now save
		$saveCond = array('matricno'=>$_SESSION['exmUser'],'year'=>$allSchd['year'][0],'subjectcode'=>$allSchd['subjectcode'][0],'batchno'=>$allSchd['batchno'][0],'type'=>$allSchd['type'][0],'qtnum'=>$n);	
		 $con->updateTb("qtn_remind",array('picked'=>$_SESSION['mycach'][$n]),$saveCond); 
			}			 
			#
			# calculate score 
			$_SESSION['myscore']=0;
			for($q = 1; $q<=$allSchd['total_qtn'][0]; $q++){
		  		if($_SESSION['mycach'][$q]!=""){
					if($_SESSION['mycach'][$q]==$_SESSION['cach_qtn'][$q]['answer'][0])
					$_SESSION['myscore']+=$allSchd['mark'][0];
				}		 			 
			}
			 
			# now saves any answer picked and scores 
		 if(isset($_POST['forward']) || isset($_POST['backward'])){		
		$con->updateTb("student_result",array($resTab_score=>$_SESSION['myscore'],$totTab_score=>($allSchd['mark'][0]*$allSchd['total_qtn'][0])),array('matricno'=>$_SESSION['exmUser'],'year'=> $allSchd['year'][0],'subjectcode'=>$allSchd['subjectcode'][0],'batchno'=>$allSchd['batchno'][0]));		    			
		}
		#
		   
	/////////////////////////////////////

	$max = $allSchd['total_qtn'][0]+1;
	$last=$max-1;
	$diff=1; 
	
	$_SESSION['CURRENT'] = $next=$prev;			
			
		$next=$_POST['next'];
		$prev= $_POST['previous'];
	
	if(isset($_POST['backward'])){
		$prev=($next=$_POST['previous'])-1;
		
		if($next==1){
		$prev=1;
				
		}
	}
	
	elseif(isset($_POST['forward'])){
		
	$next=($prev=$_POST['next'])+1;
		
	if($next==$max){
		$next=$prev;
		$prev=$next-1;	
	}	
	}
	else{
	$next=$prev=1;
	} 
	if(isset($_POST['first_btn'])){
		$prev=($next=$_POST['previous']=$diff);
	
	}
		///
			if(isset($_POST['last_btn'])){
			$next=($_POST['next']=$last);
			$prev=$_POST['next']-1;
		
	}
	# end of press button


	if($next==1){
		$bc='inv';
		$nc='vis';
	}

	if($next > $diff && $next < $last){
			
		$bc='vis';
		$nc='vis';
		
		}

	elseif($next==$last){
		$bc='vis';
		$nc='inv';
	}
	   
		# first and last button
	 	
		$qtn_info = "[  ".$next." of ".$last."  ]";

		$_SESSION['CURRENT'] = $next;		
	
	
	
?>
 

