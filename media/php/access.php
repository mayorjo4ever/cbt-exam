<?php 
	// control type of error displayed 
	error_reporting(E_ALL^E_NOTICE); 	
	/////////////////////////////
	
	/// auto start session if not yet started...
	if(!isset($_SESSION))session_start();
	/////////////
	
	//////////// check if admin user has logged in 

	if(!isset($_SESSION['user']) || $_SESSION['user']==""){
		// log the person out.  
	}
	
	?>