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
                        <div class="title_left">
                            <h3> <i class="fa fa-sitemap fa-fw"> </i> &nbsp; Faculties   <small> And Departments </small>
                </h3>
                        </div>

                        <div class="title_right">
                            <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="Search for...">
                                    <span class="input-group-btn">
                            <button class="btn btn-default" type="button">Go!</button>
                        </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12"> 
							
                            <div class="x_panel">
                                <div class="x_title">
                                    <h2>Faculties </h2> <!--<small>Sessions</small>-->                                    
                                    <div class="clearfix"></div>
                                </div>
                                <div class="x_content"> 
									<div class="col-md-7 col-sm-7 col-xs-12"> 
                                    <table id="example" class="table table-striped responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" class="tableflat">
                                                </th>
                                                <th>Faculty  </th>
                                                <th>Sort Code </th>
                                                <th><i class="fa fa-edit fa-fw"></i> </th>
                                                <th> <i class="fa fa-send-o fa-fw"></i></th>
                                                  
                                            </tr>
                                        </thead>

                                        <tbody>
                                            <tr class="odd pointer">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="tableflat">
                                                </td>
                                                <td class=" ">Life Sciences </td>
                                                <td class=" ">4432</td>
                                                <td class=" "><button type="button" class="btn btn-success btn-sm" title="Modify Faculty"> edit</button></td>
                                                <td class=" "><button type="button" class="btn btn-info btn-sm" title=" View Departments "> view </button></td>
                                            </tr> 
											<tr class="odd pointer">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="tableflat">
                                                </td>
                                                <td class=" ">Life Sciences </td>
                                                <td class=" ">4432</td>
                                                <td class=" "><button type="button" class="btn btn-success btn-sm" title="Modify Faculty"> edit</button></td>
                                                <td class=" "><button type="button" class="btn btn-info btn-sm" title=" View Departments "> view </button></td>
                                            </tr> 
											<tr class="odd pointer">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="tableflat">
                                                </td>
                                                <td class=" ">Life Sciences </td>
                                                <td class=" ">4432</td>
                                                <td class=" "><button type="button" class="btn btn-success btn-sm" title="Modify Faculty"> edit</button></td>
                                                <td class=" "><button type="button" class="btn btn-info btn-sm" title=" View Departments "> view </button></td>
                                            </tr> <tr class="odd pointer">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="tableflat">
                                                </td>
                                                <td class=" ">Life Sciences </td>
                                                <td class=" ">4432</td>
                                                <td class=" "><button type="button" class="btn btn-success btn-sm" title="Modify Faculty"> edit</button></td>
                                                <td class=" "><button type="button" class="btn btn-info btn-sm" title=" View Departments "> view </button></td>
                                            </tr>  
                                            <tr class="odd pointer">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="tableflat">
                                                </td>
                                                <td class=" ">Life Sciences </td>
                                                <td class=" ">4432</td>
                                                <td class=" "><button type="button" class="btn btn-success btn-sm" title="Modify Faculty"> edit</button></td>
                                                <td class=" "><button type="button" class="btn btn-info btn-sm" title=" View Departments "> view </button></td>
                                            </tr> 										
                                        </tbody>
                                    </table>
									</div> <!-- /. col-sm 7 -->
									
									<div class="col-md-5 col-sm-5 col-xs-12"> 
                                    <table id="example" class="table table-striped responsive-utilities jambo_table">
                                        <thead>
                                            <tr class="headings">
                                                <th>
                                                    <input type="checkbox" class="tableflat">
                                                </th>
                                                <th>Department  </th>
                                                <th>Sort Code </th>
                                                <th><i class="fa fa-edit fa-fw"></i> </th>
                                                <th> <i class="fa fa-send-o fa-fw"></i></th> </tr>
                                        </thead>

                                        <tbody>
                                            <tr class="even pointer">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="tableflat">
                                                </td>
                                                <td class=" "> Physical Sciences</td>
                                                <td class=" "> 4052  </td>
                                                 <td class=" "><button type="button" class="btn btn-success"  title="Modify Faculty "><i class="fa fa-edit"></i> </button></td>
                                                <td class=" "><button type="button" class="btn btn-info" title=" View Departments "> <i class="fa fa-send"></i> </button></td>
                                                 
                                            </tr>
                                            <tr class="odd pointer">
                                                <td class="a-center ">
                                                    <input type="checkbox" class="tableflat">
                                                </td>
                                                <td class=" ">Life Sciences </td>
                                                <td class=" ">4432</td>
                                                <td class=" "><button type="button" class="btn btn-success" title="Modify Faculty "><i class="fa fa-edit"></i> </button></td>
                                                <td class=" "><button type="button" class="btn btn-info" title=" View Departments "> <i class="fa fa-send"></i> </button></td>
                                            </tr>                                          
                                        </tbody>
                                    </table>
									</div> <!-- /. col-sm 5 -->
								</div>
                            </div> <!--  /. x_panel-->
							  
                        </div> <!-- col-md-12 -->

                        <br />
                        <br />
                        <br />

                    </div>
                </div>
                    <!-- footer content -->
                <footer>
                    <div class="">
                        <p class="pull-right">Gentelella Alela! a Bootstrap 3 template by <a>Kimlabs</a>. |
                            <span class="lead"> <i class="fa fa-paw"></i> Gentelella Alela!</span>
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
				 		  
					 			
			});
					
	</script>
		
	<?php include "../media/links/foot_libraries.html"; ?>
	  	
        
            
     
</body>

</html>