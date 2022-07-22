<!-- top navigation -->
            <div class="top_nav">

                <div class="nav_menu">
                    <nav class="" role="navigation">
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>

                        <ul class="nav navbar-nav navbar-right">
                            <li class="">
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <img src="<?php echo "images/".($_SESSION['adminInfo']['passport'][0]==""?"user.png":$_SESSION['adminInfo']['passport'][0]);?>"
							alt="<?php echo $_SESSION['adminInfo']['passport'][0];?>" class="img-circle ">
							<?php echo $_SESSION['adminInfo']['surname'][0]."&nbsp;".$_SESSION['adminInfo']['firstname'][0]; ?>
                                    <span class=" fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu animated fadeInDown pull-right">
                                    <li><a href="javascript:;">  Profile</a>
                                    </li>
                                    <li><a href="logout/"> 
                                    	<i class="fa fa-sign-out pull-right"></i> Sign Out</a>
                                    </li>
                                </ul>
                            </li>

                           

                        </ul>
                    </nav>
                </div>

            </div>
            <!-- /top navigation -->