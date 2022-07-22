<?php 

	error_reporting(1);
	require "dbTool.php";
	require "timecoder.php";
	
// to display exam users 
		if(isset($_POST['dspExamUser'])){ 
			$dbm = new DbTool(); 	
		$allUser = $dbm->getFields($dbm->select("users",array(''),array('logstatus')),array('sn','user_id','surname','firstname','midname','sex',
			'faculty','department','passport','phone','level','dob','day','month','year','email','password',
			'homeaddress','datereg','timereg','logtime','logdate','logstatus','pc_name','pc_ip')); 
		
			$allOnline = $dbm->getFields($dbm->select("users",array('logstatus'=>'lin'),array('logstatus')),array('sn','user_id'));
			$allExam = $dbm->getFields($dbm->select("users_result",array('currently'=>'on'),array('currently')),array('sn','user_id'));
	//

		?>
				 <thead>
                                            <tr class="headings">                                                
                                                <th> S/N </th>
                                                <th>Users </th>
												<th> Status</th> 
												<th>Name</th>
                                                <th>PC Name </th>
												<th> Exam Hall </th>												                                              
                                                <th> Paper </th>  
												<th> Time Left </th>   												
												<th> Signal </th> 
                                            </tr>
                                        </thead>
										  <tbody>
                                             <?php $sn = 0; 
									foreach($allUser['user_id'] as $uid ){ 
 									$examDetails = $dbm->getFields($dbm->select("users_result",
										array("user_id"=>$uid,"currently"=>"on")),array("user_id","currently","code","qtype","total_sec","sec_used","paper_signal"));
										$rem = ($examDetails['total_sec'][0]-$examDetails['sec_used'][0]);
										$cent = ($rem / $examDetails['total_sec'][0])*100;
									?>
                                            <tr class="odd pointer">                                               
                                                <td class=" "><?php echo $sn+1; ?> </td>
                                                <td class=" "><img class="img img-thumbnail img-responsive img-circle" 
												src="<?php echo "../media/user_imgs/".$allUser['passport'][$sn];?>" style="max-height:60px; max-width:80px;"  />  </td>
												
												<td class=" "> <button type="button" class="btn <?php echo ($allUser['logstatus'][$sn]=="lin")?"btn-success":"btn-warning"; ?> btn-round" title="  "> <?php echo ($allUser['logstatus'][$sn]=="lin")?"On":"Off"; ?>  </button></td>
												
												<td><?php echo $allUser['surname'][$sn]."&nbsp;".$allUser['firstname'][$sn]."<br/><b>".$uid."</b>";  ?>  </td>
												
												<td class=" "> <?php echo $allUser['pc_name'][$sn]."--";  ?>  </button> </td>
												
												<td class=" "> <button type="button" class="btn <?php echo ($examDetails['currently'][0]=="on")?"btn-success":"btn-warning"; ?> btn-round" title="  "> <?php echo ($examDetails['currently'][0]=="on")?"On":"Off"; ?>  </button></td>
												
												<td>
													 <?php echo $examDetails['code'][0]."&nbsp;".$examDetails['qtype'][0] ;?>
											   </td>
												
												<td class=" ">
													<p> <?php 
															 echo readTime($rem);   ?>  
														</p> <!--
													<div class="progress  right progress_sm ">
														<div class="<?php // $dbm->readColor($cent);?>  " role="progressbar" data-transitiongoal="<?php /// echo $cent;?>"></div>
													</div> -->
												 </td>
                                                 
												 <td>
												  <b>  <?php echo $examDetails['paper_signal'][0];?> </b>
											    </td>
                                                                                      
                                            </tr> 
                                            <?php $sn++; } ?>
                                      
                                        </tbody>
		<?php }
?>