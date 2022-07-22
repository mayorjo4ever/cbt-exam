<?php 

	 
		 /****************************************************************************************/	
		 ######## CALCULATE USERSSCORES  ##############################################################
		###############################################################################################
			$dones = 0; $remains = 0;
			
			$_SESSION['unitScore']=0;	// one one question that is correct. 
			$_SESSION['totalmark'] = array_sum($_SESSION['myQtn']['marks']); 
			$_SESSION['myScore'] = array();
		
			#######################################################################################
			#######################################################################################
			for($q = 1; $q<=$_SESSION['tot_qtn']; $q++){
				
				########################
		  		if($_SESSION['picked1'.$q]!=""){
					$dones++;	
					#########################   mark choices question  ############################
					switch($_SESSION['myQtn']['optiontype'][($q-1)]) {
						case "choice":{
									if($_SESSION['picked1'.$q]== $_SESSION['myQtn']['answer'][($q-1)]){
							$_SESSION['myScore'][$q-1] = $_SESSION['myQtn']['marks'][($q-1)];
							$_SESSION['unitScore']++;
							} else $_SESSION['myScore'][$q-1] = 0; 
						} ################### end choices question #####################################
						break;
						
						case "typeIn":{
								$accuracy = similar_text(trim($_SESSION['picked1'.$q]),trim($_SESSION['myQtn']['typeAns'][($q-1)]),$cent);
							if($cent>= 80) 
							{
								$score = ($cent / 100) * $_SESSION['myQtn']['marks'][($q-1)];
								$_SESSION['myScore'][$q-1] = $score;  #$_SESSION['myQtn']['marks'][($q-1)];
								$_SESSION['unitScore']++;
							}
							else {
								$_SESSION['myScore'][$q-1] = 0; 
							}							 
						}
						break;
						
					}  ### end switch 
				 
				}		 						
			}	############################# end for loop ###########################################
			$remains = $_SESSION['tot_qtn'] - $dones;
			$_SESSION['percent_done'] = ($dones/$_SESSION['tot_qtn'])*100;
			$_SESSION['min_ans'] = round(0.30 * $_SESSION['tot_qtn']);
				
			##########################################################################################
	

?>