<?php 

	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";		
	
	require "../media/php/User.php";	
	
	$admin = new User("admin");		
	if(!$admin->confirmLogin('adminUser')) $admin->logout('adminUser','login/'); 
	 /*************************************************************************/	
	 $_SESSION['adminInfo'] = $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	 
	$bi = new  Institute_info();
	
	$_SESSION['page_title'] = $bi->institutename; 
	
	
	$users = new User("users");	 
		$allUser = $users->getAll(array()); 
	//

	// when searching for students info 
	if(isset($_POST['searchuser'])){
		
		$searchText = strip_tags($_POST['searchText']); 
		
		$allUser = $users->searchUser(array('surname'=>$searchText,'firstname'=>$searchText,'midname'=>$searchText,'sex'=>$searchText,'email'=>$searchText,'faculty'=>$searchText,'department'=>$searchText,'dob'=>$searchText,'level'=>$searchText,'phone'=>$searchText,'user_id'=>$searchText));
				
	}
	
		## deleting selected checkboxes 
	
	if(isset($_POST['delUser'])){
		
		$dbm = new DbTool(); 
		
		$dels = count($_POST['userDel']);
		
		for($j=0; $j < $dels; $j++)
				{
					$dbm->deleteRow("users",array("sn"=>$_POST['userDel'][$j]));
				}
				//  deleted 
				// $_SESSION['delMsg'] = "$dels Users has been Deleted";
				 echo "<script> alert( '$dels Users has been Deleted')</script>";
				header("Refresh:1");

	}
	
?>
<!DOCTYPE html>
<html lang="en">

<head>
    
    <title> <?php ?></title>    
	
	<?php require "../media/links/top_libraries.html";?>

	<?php //  include "../media/php/FileReader.php";?>
	
</head>

<body class="nav-md">

    <div class="container body">

        <div class="main_container">
			
           <!-- left bar links -->
            
            <?php include "../media/links/leftbar.php"; ?>

            <?php include "../media/links/top_navigation.php";?>
	
			<?php # include "../media/links/page_content.php";?>
            
        	 <!-- page content -->
            <div class="right_col" role="main"> <form method="post">

                <div class="">
                    <div class="page-title">
                        <div class="title_left">
                            <h3> <i class="fa fa-users"></i> &nbsp; All Users  (<?php echo count($allUser['sn']);?>) &nbsp;  
							
							<?php if(count($allUser['sn'])>0){ ?>
								<small> <label class=""> Select All &nbsp; <input type="checkbox" onClick="selectAllUsers()" /> </label> </small> &nbsp; &nbsp; 
							<?php }?>
							
							 <button class="btn btn-danger btn-round" name="delUser" id="delUser"> <i>Delete Selected</i></button>
							  </h3>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search user..." name="searchText" id="searchText" value="<?php echo $_POST['searchText']; ?>">
                                    <span class="input-group-btn">
                                    <button class="btn btn-default" type="submit" name="searchuser" id="searchuser">Go!</button>
                       				</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="x_panel">
                                <div class="x_content">

                                    <div class="row">
<div class="col-md-12 col-sm-12 col-xs-12" style="text-align:center;">
<?php # print_r($allUser); ?>
</div>                                    
										
                                        <div class="clearfix"></div>

								<!--	print all users -->
                                <?php $sn = 0; if(!is_null($allUser['user_id']))
									foreach($allUser['user_id'] as $uid ){  ?>
                                	<!-- start of profile -->
                                        <div class="col-md-4 col-sm-4 col-xs-6 animated fadeInDown">									
										  <div class="well profile_view">
                                                <div class="col-sm-12">
                                                    <h5 class="brief bold blue"> <?php echo strtoupper($uid);?></h5>
                                                    <div class="left col-xs-8">
                                                        <h4 style=" text-transform:capitalize;"> <?php echo   strtolower($allUser['surname'][$sn]." ".$allUser['firstname'][$sn]); ?> </h4>
                                                        <p><strong>Dept: </strong> <?php echo $allUser['department'][$sn];  ?> </p> 
                                                    </div>
                                                    <div class="right col-xs-4 text-center">
                                                      <a href="<?php echo "userprofile.php?mu=".md5($allUser['sn'][$sn])."_".crypt($allUser['surname'][$sn])."_".crypt($allUser['sn'][$sn]);?>" title="View Profile"> <img src="<?php  echo ($allUser['passport'][$sn]==""?"../media/user_imgs/user.png":"../media/user_imgs/".$allUser['passport'][$sn]); ?>"  width="90" height="90" class="img-circle image-responsive">  </a>                                                        
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 bottom text-center">                                                  
													
														<div class="col-xs-6 col-sm-6 navbar-right ">
															<input type="checkbox" class="userDel checkbox checkbox-inline icheckbox_flat-green" name="userDel[]" value="<?php echo $allUser['sn'][$sn]; ?>">														
														</div>
														
														<div class="col-xs-6 col-sm-6   navbar-left">
															<button type="button" class="btn btn-info btn-xs"> <i class="fa fa-signal">
                                                            </i> <span> Level : <?php echo $allUser['level'][$sn]?></span> </button> 
														</div>
                                                        
                                                </div>
                                            </div>
                                        </div> 	<!-- end of profile -->
									<?php $sn++; } // when user is not null

										else { ?>
											  <div class="col-md-6 col-sm-6 col-xs-6 animated fadeInUp">	
												<div class="well profile_view">
                                                <div class="col-sm-12">
                                                    <h5 class="brief bold blue"> Matric No.</h5>
                                                    <div class="left col-xs-8">
                                                        <h4 style=" text-transform:capitalize;"> <?php echo   "No user is available currently ";//strtolower($allUser['surname'][$sn]." ".$allUser['firstname'][$sn]); ?> </h4>
                                                        <p class="text-capitalize"><strong>Dept: </strong> <?php echo " No user is available currently";//$allUser['department'][$sn];  ?> </p> 
                                                    </div>
                                                    <div class="right col-xs-4 text-center">
                                                      <a href="<?php // echo "userprofile.php?mu=".md5($allUser['sn'][$sn])."_".crypt($allUser['surname'][$sn])."_".crypt($allUser['sn'][$sn]);?>" title="View Profile"> <img src="<?php  echo "../media/user_imgs/user.png"; #($allUser['passport'][$sn]==""?"../media/user_imgs/user.png":"../media/user_imgs/".$allUser['passport'][$sn]); ?>"  width="90" height="90" class="img-circle image-responsive">  </a>                                                        
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 bottom text-center">                                                  
													
														<div class="col-xs-6 col-sm-6 navbar-right ">
															<!-- <input type="checkbox" class="userDel checkbox checkbox-inline icheckbox_flat-green" name="userDel[]" value="<?php echo $allUser['sn'][$sn]; ?>">		-->												
														</div>
														
														<div class="col-xs-6 col-sm-6   navbar-left">
															<button type="button" class="btn btn-info btn-xs"> <i class="fa fa-signal">
                                                            </i> <span> Level : <?php  // echo $allUser['level'][$sn]?></span> </button> 
														</div>
                                                        
                                                </div>
                                            </div>
											  </div>
											
											
											
									<?php	} ?>
                                    	
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

			 </form>
            </div>
            <!-- /page content -->
			
		</div> <!-- /. main_container -->
	
	</div> <!-- /. container body -->
	 
	 
    <script> 
		$(function(){
				   
				$("button:submit").on("click",function(){					
						//  return validateLogin();					
						// alert('submitted');
						return true; 
					});  
	 
			/*******************************************/
					
		// toggle delete seletion button delSel 
		 	
			$('#delUser').hide('fast');
		/***************************************************/
		
			$('.userDel').on('click',function(){
			  tot = $('input[name="userDel[]"]:checked').length; 	
				// alert(tot);
				if(tot>0) $('#delUser').show('slow');
				else $('#delUser').hide('slow');
				
		});
		/**************************************************/
		$('#delUser').on('click',function(){
			
			return confirm(' do you want to delete all selected users ?');			
		});
			});
			
	/*******************************************/
	function selectAllUsers(){
		elem=document.getElementsByName("userDel[]");
		for(i=0; i< elem.length; i++){
		if(elem[i].type='checkbox') 
		elem[i].click()};		
		// 				
	}	
	</script>
		
     
	<?php include "../media/links/foot_libraries.html"; ?>
	   
        
     
</body>

</html>