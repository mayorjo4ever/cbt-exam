<?php 
	
		if(!isset($_SESSION)) session_start();	 
		require "../scripts/php/dbActor.php";
		require "../scripts/php/timecoder.php";
				
		$con = new DbManager();
	
	 
	if(isset($_POST['wt']))
	{ 
		$cosSchedule = $con->getFields($con->selectAnd("student_course_reg",array('')),array('session','status','startime','endtime','start','stop'));		
		
		echo "Course Registration ".checkTime($cosSchedule['start'][0],$cosSchedule['stop'][0])." ]";
				 
	}
?>
 