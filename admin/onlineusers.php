<?php 

	require "../media/php/access.php";
	// request bank informations 
	require "../media/php/instituteinfos.php";		
	
	require "../media/php/User.php"; 
	require "../media/php/timecoder.php";
	
	$admin = new User("admin");		
	if(!$admin->confirmLogin('adminUser')) $admin->logout('adminUser','../'); 
	 /*************************************************************************/	
	 $_SESSION['adminInfo'] = $adminInfo = $admin->getAll(array("user_id"=>$_SESSION['adminUser']));
	 
	
	require "../media/php/Course.php";
	
	$bi = new  Institute_info();
	
	$_SESSION['page_title'] = $bi->institutename; 
	
	 
	//
	if(isset($_POST['cosplus'])){
		if(isset($_SESSION['newCos'])) { unset($_SESSION['newCos']);}
		else { $_SESSION['newCos'] = true; }
	}
	 
	
	if(isset($_POST['canCos'])){
		unset($_SESSION['newCos']);
		
	} 
	
	// header("Refresh:2");
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
            <div class="right_col" role="main">
                <div class="">
                    <div class="page-title">
                        <div class="title_left"> <form method="post">
                            <h3> <i class="fa fa-users fa-fw"> </i> &nbsp; Online Users &nbsp; <button class="btn btn-round btn-info"  title="">  <?php echo count($allOnline['sn'] );?> </button> &nbsp; &nbsp; <small> Exam Hall </small> &nbsp; <button class="btn btn-round btn-primary"  title="">  <?php echo count($allExam['sn'] );?> </button>
                </h3>
                </form>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                              
                              <form method="post">
                                <div class="input-group">
                                   
                                    <input type="text" class="form-control" placeholder="Search for..." name="searchText" value="<?php echo $_POST['searchText']?>">
                                    <span class="input-group-btn">
                            		<button class="btn btn-default" type="submit" name="searchCourse">Go!</button>
                       				</span>
                                </div> 
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
					
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>List of Active and Offline Users    <small>Are as follows </small> </h2>                                    
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content"> 									
                                    
									<table id="examHallUsers" class="table table-striped table-bordered responsive-utilities jambo_table">
                                       
                                    </table>

									
								</div>
                            </div> <!--  /. x_panel-->
							  
                        </div> <!-- col-md-12 -->

                        <br />
                        <br />
                        <br />

                    </div>
                </div>
                
                  
                     <form method="post">
                        
                   <input type="hidden" name="cosmods" id="cosmods" value="" />
                     <input type="submit" name="subMods" id="subMods" value="submit mods " style="visibility:hidden;"/> <!-- keep other inputs -->
                                        </form>
                    <!-- footer content -->
                <footer>
                    <div class="">
                        <p class="pull-right">Hamdala Komputer Konsults. 2016 |
                            <span class="lead"> <i class="fa fa-paw"></i> HKK!</span>
                        </p>
                    </div>
                    <div class="clearfix"></div>
                </footer>
                <!-- /footer content -->
                    
                </div>
                <!-- /page content -->
            
		</div> <!-- /. main_container -->
	
	</div> <!-- /. container body -->
	 
    <script> 
	
			$(function(){
					
				// fetch examiners // dspExamUser
					fetchExmUsers();
	
						});
						
		  function fetchExmUsers(){
			  
				// alert('getting users now');
				var req = $.ajax({				
						url:"../media/php/exmUserDsp.php",
						method: "POST",
						data:
							{
								dspExamUser:"onlinesNoffline"				
							},
						beforeSend:  function(){
							// alert('sending info'); 
							}				
						});
				
						req.fail(function(e){
							alert(e.status+" Failed"); 
							 
							});
							
						req.done(function(msg){
							$("#examHallUsers").html(msg);
							// alert('working');
						});
			  
		  }
		  
	
	window.setInterval(fetchExmUsers,1000);
			
			 
	</script>
		
	<?php include "../media/links/foot_libraries.html"; ?>
	  	
        
            
     
</body>

</html>