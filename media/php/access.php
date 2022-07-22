<?php 

	// control type of error displayed 
	error_reporting(1); // this disables E_Notice but give warnings
	/////////////////////////////
	
	/// auto start session if not yet started...
	if(!isset($_SESSION))session_start();
	/////////////
	
	//////////// check if admin user has logged in 

	if(!isset($_SESSION['user']) || $_SESSION['user']==""){
		// log the person out.  
	}
	
	?>