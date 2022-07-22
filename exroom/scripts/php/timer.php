<?php 
	
		if(!isset($_SESSION)) session_start();
		  
		require "../../../media/php/dbTool.php";
	
		
	   
	   
	if(isset($_POST['updateWatch']))
	{ 
		$dbm = new DbTool();
	
	 if(!isset($_SESSION['time_start'])) $_SESSION['time_start'] = time();
	
		$_SESSION['time_used'] = (time() - $_SESSION['time_start']) + $_SESSION['init_sec_used'];
	
	/******************* update The result ***********************/
	 $dbm->updateTb("users_result",array("bus_stop"=>$_SESSION['qtnNo'],"sec_used"=>$_SESSION['time_used'],
	 "totalscore"=>$_SESSION['myScore'],"totalmark"=>$_SESSION['totalmark'],"percent"=>$_SESSION['percent']),
		array("user_id"=>$_SESSION['exmUser'],"year"=>$_SESSION['year'],"code"=>$_SESSION['code'],
	"qtype"=>$_SESSION['qtype']));
	/*************************************************************************************/
		
	 
	 	/**** notify if timeout *****/		 
		if($_SESSION['time_used'] >= $_SESSION['total_sec'])
	
		echo true;
		
		else echo false; 
 
	}
	
	// when the radio button is changed 
		if(isset($_POST['QChanged'])){ // question changed
			$dbm = new DbManager();			
			//
			$num = substr($_POST['name'],3); 			
			$_SESSION['picked'.$num] = $_POST['value'];
				
			$dbm->updateTb("qtn_remind",array("picked"=>$_SESSION['picked'.$num]),array("user_id"=>$dbm->encodeId($_SESSION['exmUser']),"sn"=>$_SESSION['myQtn']['sn'][($num-1)],"code_gen"=>$_SESSION['code_gen']));	
			 
			 
			
		}
	
?>