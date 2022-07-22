<?php 

	if(!isset($_SESSION)) session_start();
	  
	// error_reporting(E_ALL ^ E_NOTICE);
	error_reporting(1);
	

	function readTime($ut){
	if($ut == 0 ){
	return  " 0 Sec";
	}
	
	else if($ut < 60 ){
	return secs($ut)." ";
	}
	
	else if($ut < 3600 ){
	return mins($ut)." ";
	}
	
	else if($ut < 86400 ){
	return hrs($ut)." ";
	}
	
	else if($ut < 604800 ){
	return days($ut)." ";
	}
	
	else if($ut <= 3155760000 ){
	return weeks($ut)." ";
	}
	
	}
	 
	///// seconds manager
	function secs($ut){
	$sec = $ut;
	
	if($sec ==0)
	 return "";
	
	if($sec ==1)
	 return $sec." Sec";
	
	
	if($sec >1)
	 return $sec." Secs";
	}
	
	 function mins($ut){

	$min = (int)(secs($ut)/60);
	$rems = (int)(secs($ut) % 60);
	
	if($min == 0 && $rems==0)
	 return " ";
	 
	 if($min == 0 && $rems==1)
	 return $rems." Sec ";
	
	if($min == 1 && $rems==0)
	 return $min." Min";
	 
	 if($min == 1 && $rems==1)
	 return $min." Min :  ".$rems." Sec";
	 
	 //////
	 
	 if($min == 0 && $rems >1)
	 return $rems." Sec ";
	
	if($min == 1 && $rems >1)
	 return $min." Min :  ".$rems." Secs";
	
	if($min > 1 && $rems==0)
	 return $min." Mins";
	 
	 if($min > 1 && $rems ==1)
	 return $min." Mins :  ".$rems." Sec";
	 
	 if($min > 1 && $rems >1)
	 return $min." Mins :  ".$rems." Secs";
	 
	 else 
	 return $min." Mins :  ".$rems." Sec";
	
	}	

		///// hours manager	
	function hrs($ut){
	$hr = (int)(mins($ut)/60);
	$remm = (int)(mins($ut) % 60);
	
	
	 
	 if($hr == 1 && $remm==0)
	 return $hr." hour ";	
	
	
	if($hr == 1 && $remm == 1)
	 return $hr." hour :  ".$remm." Min ";
	 
	
	if($hr == 1 && $remm > 1 )
	 return $hr." hour :  ".$remm." Mins";
	
	///// 
	
	if($hr > 1 && $remm === 0 )
	 return $hr." hours ";
	
	if($hr > 1 && $remm === 1 )
	 return $hr." hours :  ".$remm." Min ";
	 
	 if($hr > 1 && $remm > 1 )
	 return $hr." hours :  ".$remm." Mins ";
	}
	
	
//////////////////   ///// days manager	

	 function days($ut){
		
	$day = (int)(mins($ut/1440)); // 60 * 24hr * || 60
	
	$remh = (int)(mins($ut/60) %24);
	$remm = (int)(mins($ut)% 60);	
	
	
	if($day ==1 && $remh==0 && $remm==0 )
	return $day." day ";
	
	if($day ==1 && $remh==0 && $remm == 1)
	return $day." day :  ".$remm." Min";
	
	if($day ==1 && $remh==0 && $remm > 1)
	return $day." day :  ".$remm." Mins";
	
	if($day ==1 && $remh==1 && $remm == 0)
	return $day." day :  ".$remh." hour";
	
	if($day ==1 && $remh==1 && $remm == 1 )
	return $day." day :  ".$remh." hour :  ".$remm." Min";
	
	if($day ==1 && $remh==1 && $remm > 1 )
	return $day." day :  ".$remh." hour :  ".$remm." Mins";
	
	if($day ==1 && $remh >1 && $remm == 0 )
	return $day." day :  ".$remh." hours ";
	
	if($day ==1 && $remh >1 && $remm == 1 )
	return $day." day :  ".$remh." hours ".$remm." Min";
	
	if($day ==1 && $remh >1 && $remm > 1 )
	return $day." day :  ".$remh." hours ".$remm." Mins";
	
	
	//////
	
	if($day >1 && $remh==0 && $remm==0 )
	return $day." days ";
	
	if($day >1 && $remh==0 && $remm == 1 )
	return $day." days :  ".$remm." Min";
	
	if($day >1 && $remh==0 && $remm > 1 )
	return $day." days :  ".$remm." Mins";
	
	
	if($day >1 && $remh==1 && $remm == 0)
	return $day." days :  ".$remh." hour";
	
	if($day >1 && $remh==1 && $remm == 1)
	return $day." days :  ".$remh." hour";
	
	if($day >1 && $remh==1 && $remm > 1)
	return $day." days :  ".$remh." hour :  ".$remm." Mins";
	
	//////////
	
	if($day >1 && $remh>1 && $remm == 0 )
	return $day." days :  ".$remh." hours";
	
	if($day >1 && $remh>1 && $remm == 1 )
	return $day." days :  ".$remh." hours :  ".$remm." Min";
	
	if($day >1 && $remh >1 && $remm > 1 )
	return $day." days :  ".$remh." hours :  ".$remm." Mins ";
		
	// else return $day." days ".$remh." hours ".$remm." Mins";
	}
	
	
	///// weeks manager	
	 function weeks($ut){
	
	$week= (int)(mins($ut/10080)); 		// 7 * 24 * 60 * || 60
	$rday = (int)(mins($ut/1440)%7); 	// 24 * 60 * || 60
	$remh = (int)(mins($ut/60) % 24);
	$remm = (int)(mins($ut) % 60);
	
	
	// return $week . " week :  " .$rday." day :  ".$remh." hour :  ".$remm." min :  ".$rems." sec" ;
	
	/// a week plus Mins
	if($week ==1 && $rday == 0 && $remh==0 && $remm==0 )
	return $week." week";
	
	if($week ==1 && $rday == 0 && $remh==0 && $remm==1 )
	return $week." week :  ". $remm." Min ";
	
	if($week ==1 && $rday == 0 && $remh==0 && $remm >1 )
	return $week." week :  ". $remm." Mins ";
	
	
	////// a week plus hour plus Mins
	if($week ==1 && $rday == 0 && $remh==1 && $remm==0 )
	return $week." week :  ". $remh." hour ";
	
	if($week ==1 && $rday == 0 && $remh==1 && $remm==1 )
	return $week." week :  ". $remh." hour :  ".$remm." Min";
	
	if($week ==1 && $rday == 0 && $remh==1 && $remm >1 )
	return $week." week :  ". $remh." hour :  ".$remm." Mins";
	
	
	
	///// a week plus hours 
	if($week ==1 && $rday == 0 && $remh >1 && $remm ==0 )
	return $week." week :  ". $remh." hours ";
	
	if($week ==1 && $rday == 0 && $remh >1 && $remm ==1 )
	return $week." week :  ". $remh." hours :  ".$remm." Min";
	
	if($week ==1 && $rday == 0 && $remh >1 && $remm >1 )
	return $week." week :  ". $remh." hours :  ".$remm." Mins";
	
	
	//////// a week plus a day and Mins
	if($week ==1 && $rday == 1 && $remh ==0 && $remm ==0 )
	return $week." week :  ". $rday." day ";
	
	if($week ==1 && $rday == 1 && $remh ==0 && $remm ==1 )
	return $week." week :  ". $rday." day :  ".$remm." Min";
	
	if($week ==1 && $rday == 1 && $remh ==0 && $remm >1 )
	return $week." week :  ". $rday." day :  ".$remm." Mins";
	
	///////// a week plus a day and hour
	
	if($week ==1 && $rday == 1 && $remh ==1 && $remm == 0 )
	return $week." week :  ". $rday." day :  ".$remh." hour";
	
	if($week ==1 && $rday == 1 && $remh ==1 && $remm ==1 )
	return $week." week :  ". $rday." day :  ".$remh." hour :  ".$remm." Min";
	
	if($week ==1 && $rday == 1 && $remh ==1 && $remm >1 )
	return $week." week :  ". $rday." day :  ".$remh." hour :  ".$remm." Mins";
	
	
	////// a week plus a day and hours
	if($week ==1 && $rday == 1 && $remh >1 && $remm == 0 )
	return $week." week :  ". $rday." day :  ".$remh." hours";
	
	if($week ==1 && $rday == 1 && $remh >1 && $remm ==1 )
	return $week." week :  ". $rday." day :  ".$remh." hours :  ".$remm." Min";
	
	if($week ==1 && $rday == 1 && $remh >1 && $remm >1 )
	return $week." week :  ". $rday." day :  ".$remh." hour :  ".$remm." Mins";
	
	
	/////// a week plus days and Mins
	
	if($week ==1 && $rday > 1 && $remh==0 && $remm==0 )
	return $week." week :  ".$rday." days" ;
	
	if($week ==1 && $rday > 1 && $remh==0 && $remm==1 )
	return $week." week :  ".$rday." days :  ". $remm." Min";
	
	if($week ==1 && $rday > 1 && $remh==0 && $remm >1 )
	return $week." week :  ". $remm." Mins ";

	//// 
	
	if($week ==1 && $rday > 1 && $remh==1 && $remm==0 )
	return $week." week :  ".$rday." days". $remh." hour " ;
	
	if($week ==1 && $rday > 1 && $remh==1 && $remm==1 )
	return $week." week :  ".$rday." days :  ". $remh." hour". $remm." Min";
	
	if($week ==1 && $rday > 1 && $remh==1 && $remm >1 )
	return $week." week :  ".$rday." days :  ". $remh." hour ". $remm." Mins ";

	/////////	
	
	if($week ==1 && $rday > 1 && $remh >1 && $remm==0 )
	return $week." week :  ".$rday." days :  ". $remh." hours " ;
	
	if($week ==1 && $rday > 1 && $remh >1 && $remm==1 )
	return $week." week :  ".$rday." days :  ". $remh." hours". $remm." Min";
	
	if($week ==1 && $rday > 1 && $remh >1 && $remm >1 )
	return $week." week :  ".$rday." days :  ". $remh." hours ". $remm." Mins ";
	
	///////////////////////////////////////////////
	///////////////////////////////////////////////
	///////////////////////////////////////////////
	
	
	
	
	if($week >1 && $rday == 0 && $remh==0 && $remm==0 )
	return $week." weeks";
	
	if($week >1 && $rday == 0 && $remh==0 && $remm==1 )
	return $week." weeks :  ". $remm." Min ";
	
	if($week >1 && $rday == 0 && $remh==0 && $remm >1 )
	return $week." weeks :  ". $remm." Mins ";
	
	
	//////  weeks plus hour plus Mins
	if($week >1 && $rday == 0 && $remh==1 && $remm==0 )
	return $week." weeks :  ". $remh." hour ";
	
	if($week >1 && $rday == 0 && $remh==1 && $remm==1 )
	return $week." weeks :  ". $remh." hour :  ".$remm." Min";
	
	if($week >1 && $rday == 0 && $remh==1 && $remm >1 )
	return $week." weeks :  ". $remh." hour :  ".$remm." Mins";
	
	
	
	///// weeks plus hours 
	if($week >1 && $rday == 0 && $remh >1 && $remm ==0 )
	return $week." weeks :  ". $remh." hours ";
	
	if($week >1 && $rday == 0 && $remh >1 && $remm ==1 )
	return $week." weeks :  ". $remh." hours :  ".$remm." Min";
	
	if($week >1 && $rday == 0 && $remh >1 && $remm >1 )
	return $week." weeks :  ". $remh." hours :  ".$remm." Mins";
	
	
	////////  weeks plus a day and Mins
	if($week >1 && $rday == 1 && $remh ==0 && $remm ==0 )
	return $week." weeks :  ". $rday." day ";
	
	if($week >1 && $rday == 1 && $remh ==0 && $remm ==1 )
	return $week." weeks :  ". $rday." day :  ".$remm." Min";
	
	if($week >1 && $rday == 1 && $remh ==0 && $remm >1 )
	return $week." weeks :  ". $rday." day :  ".$remm." Mins";
	
	///////// weeks plus a day and hour
	
	if($week >1 && $rday == 1 && $remh ==1 && $remm == 0 )
	return $week." weeks :  ". $rday." day :  ".$remh." hour";
	
	if($week >1 && $rday == 1 && $remh ==1 && $remm ==1 )
	return $week." weeks :  ". $rday." day :  ".$remh." hour :  ".$remm." Min";
	
	if($week >1 && $rday == 1 && $remh ==1 && $remm >1 )
	return $week." weeks :  ". $rday." day :  ".$remh." hour :  ".$remm." Mins";
	
	
	////// a week plus a day and hours
	if($week >1 && $rday == 1 && $remh >1 && $remm == 0 )
	return $week." weeks :  ". $rday." day :  ".$remh." hours";
	
	if($week >1 && $rday == 1 && $remh >1 && $remm ==1 )
	return $week." weeks :  ". $rday." day :  ".$remh." hours :  ".$remm." Min";
	
	if($week >1 && $rday == 1 && $remh >1 && $remm >1 )
	return $week." weeks :  ". $rday." day :  ".$remh." hour :  ".$remm." Mins";
	
	
	/////// a week plus days and Mins
	
	if($week >1 && $rday > 1 && $remh==0 && $remm==0 )
	return $week." weeks :  ".$rday." days" ;
	
	if($week >1 && $rday > 1 && $remh==0 && $remm==1 )
	return $week." weeks :  ".$rday." days : ". $remm." Min";
	
	if($week >1 && $rday > 1 && $remh==0 && $remm >1 )
	return $week." weeks :  ". $remm." Mins ";

	//// 
	
	if($week >1 && $rday > 1 && $remh==1 && $remm==0 )
	return $week." weeks :  ".$rday." days". $remh." hour " ;
	
	if($week >1 && $rday > 1 && $remh==1 && $remm==1 )
	return $week." weeks :  ".$rday." days : ". $remh." hour :  ". $remm." Min";
	
	if($week >1 && $rday > 1 && $remh==1 && $remm >1 )
	return $week." weeks :  ".$rday." days : ". $remh." hour :  ". $remm." Mins ";

	/////////	
	
	if($week >1 && $rday > 1 && $remh >1 && $remm==0 )
	return $week." weeks :  ".$rday." days :  ". $remh." hours " ;
	
	if($week >1 && $rday > 1 && $remh >1 && $remm==1 )
	return $week." weeks :  ".$rday." days :  ". $remh." hours :  ". $remm." Min";
	
	if($week >1 && $rday > 1 && $remh >1 && $remm >1 )
	return $week." weeks :  ".$rday." days :  ". $remh." hours :  ". $remm." Mins ";
	
	////////////////////////////////////////////////////
	////////////////////////////////////////////////////
	////////////////////////////////////////////////////
	////////// 52 WEEKS PLUS //////////////////////////
	////////// 1 DAY PLUS  /////////////////////////////
	////////// 6 HOURS MAKES A YEAR ////////////////////
	////////////////////////////////////////////////////
	////////////////////////////////////////////////////

	}

	function checkTime($from , $to){
		
		$now = time(); 
		
		if($now < $from ){
			$leftTime = abs($from-$now); 
			
			if($leftTime > 3600 ) $sec = " : ".secs($leftTime%60); 
			
			return " Is About ".readTime(abs($leftTime)).$sec." To Start ";
		}
		
		if($now > $from && $now < $to){
			$past = abs($to-$now);
			
			if($past > 3600 ) $sec = " : ".secs($past%60); 
			
			return " Has Started And is: ".readTime(abs($past)).$sec." To End ";
		}
		
		if($now > $to){
			$past = abs($now-$to); 
			  if($past > 3600 ) $sec = " : ".secs($past%60); 
			return " Has Ended ".readTime(abs($past)).$sec." Ago ";
		}
		
	}
?>