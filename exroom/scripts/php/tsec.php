<?php
	if(!isset($_SESSION)) session_start();
	require "connect.php";
	include "group_coder.php";	
	
	switch($_SESSION['signal']){
	
	case 'normal':
	$fsec = mysql_query("select * from schedule where 
	mygroup='".group_conv($_SESSION['mygroup'])."'") or die(mysql_error());
	$ssec = mysql_fetch_assoc($fsec);	
	echo $ssec['total_sec'];
	
		break;
		
	case 'processing':	
	$fsec = mysql_query("select * from time_remind where user_id='".$_SESSION['regno']."' and subjcode='".$_SESSION['subjcode']."' 
	and type='".$_SESSION['qtntype']."' and semester='".$_SESSION['semester']."' 
	and year='".$_SESSION['year']."' and mygroup='".$_SESSION['cvg']."'") or die(mysql_error());
	
	$ssec = mysql_fetch_assoc($fsec);	
	$tot_sec = $ssec['tot_sec'];
	$sec_used = $ssec['sec_used'];
	$remsec = $tot_sec - $sec_used;
	echo $remsec;
	
	break;
		
		default:
		echo '0';
		break;
	}
	
?>