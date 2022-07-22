<?php

	if(!isset($_SESSION)) session_start();
	
	if(!isset($_SESSION['clock'])){
		$_SESSION['clock']=time();
		}
		
		$time_used=time()- $_SESSION['clock'];
		
		// echo $time_used;
		
		if(isset($_POST['msg'])) echo $time_used;
?>