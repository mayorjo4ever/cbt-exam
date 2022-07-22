
	<div class="col-md-3 left_col">
	
                <div class="left_col scroll-view">

					<!-- bank logo and short name  -->
                    <div class="navbar nav_title" style="border: 0;">
                        <a href="index.php" class="site_title"><i class="fa fa-paw"></i> 
						<span><?php   echo $bi->shortname; ?></span></a>
                    </div>
					
                    <div class="clearfix"></div>                  

				   <!-- menu prile quick info -->
                    <div class="profile">
                        <div class="profile_pic">
                            <img src="../media/images/img.jpg" alt="..." class="img-circle profile_img">
                        </div>
                        <div class="profile_info">
                            <span>Welcome,</span>
                            <h2> Isaac Mayowa </h2>							
                        </div>
                    </div> <!-- /. profile -->
					
                    <!-- /menu prile quick info -->
					<br/><br/> <br/>
                   

				   <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <div class="menu_section">
                            <h3><hr/></h3>
                            <ul class="nav side-menu">
                                <li><a href="index.php"><i class="fa fa-home"></i> Home </a></li>
                                <li class="active"><a><i class="fa fa-user"></i> Users   <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="newcontacts.php"> <i class="glyphicon glyphicon-import"> </i> Import New Users.  </a>
                                        </li>
                                        <li><a href="contacts.php"> <i class="glyphicon glyphicon-user"></i>  View All Users.. </a>
                                        </li>   
                                        <li><a href="examstudents.php"> <i class="glyphicon glyphicon-user"></i>   Users in Exam Hall </a>
                                        </li>   
										<li><a href="userscourses.php"> <i class="fa fa-book"></i>   Users Course(s)  </a>
                                        </li>   										
                                         
									</ul>
                                </li>
                      <!--Course   menu     -->                       
                                 <li><a> <i class="fa fa-book fa-fw"></i> Courses Offer <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">                                         
                                        <li><a href="courses.php"> View / Create Courses  </a>
                                        </li>                                       
                                        </ul>
                                </li>
                          
                        <!-- /. Course  menu      -->
						
						<!--Question  menu   -->                       
						
						<li><a> <i class="fa fa-edit"></i> Questions <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="nquestion.php"> New Question </a>
                                        </li>
                                        <li><a href="allquestion.php">View All Question </a>
                                        </li>                                       
                                        </ul>
                                </li>
                          
                        <!-- Settings  menu   -->                       
								
								<li><a> <i class="fa fa-cogs"> </i> Settings <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">
                                        <li><a href="examsettings.php"> Exam Settings </a>
                                        </li>
                                        <li><a href="schoolsettings.php">  About School </a>
                                        </li>
                                        <li><a href="profiles.php">  Profile Settings </a>
                                        </ul>
                                </li> 
								
					 <!-- Report  menu     -->                       
                                 <li><a> <i class="fa fa-book fa-fw"></i> Reports <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu" style="display: none">                                         
                                        <li><a href="result.php"> <i class="fa fa-table"></i>  Print Attendance Sheet </a>
                                        </li> 
										<li><a href="result.php"> <i class="fa fa-book"></i>  View Result </a>
                                        </li> 										
                                        </ul>
                                </li>
                          
                        <!-- /. Report  menu      -->
					
								
                          
                            </ul>
                        </div>
                        
                    </div>
                    <!-- /sidebar menu -->

                    <!-- /menu footer buttons -->
                    <div class="sidebar-footer hidden-small">
                        <a href="examsettings.php" data-toggle="tooltip" data-placement="top" title="Settings">
                            <span class="fa fa-cogs" aria-hidden="true"></span>
                        </a>
                        
                        <a href="nquestion.php" data-toggle="tooltip" data-placement="top" title="View / Create Question">
                            <span class="fa fa-edit" aria-hidden="true"></span>
                        </a>
                        
                        <a  href="newcontacts.php" data-toggle="tooltip" data-placement="top" title="Import New  Users ">
                            <span class="glyphicon glyphicon-import" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Logout" href="../login/">
                            <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                        </a>
                    </div>
                    <!-- /menu footer buttons --> 
                </div>
            </div>