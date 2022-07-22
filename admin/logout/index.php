<?php 

	require "../../media/php/User.php";	
	
	$admin = new User('admin');
	$admin->logout("adminUser","../../");


?>