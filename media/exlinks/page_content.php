<?php if(isset($_POST['upload']))
{
	
	/* */
	
	$import_file = $_FILES['sheet']['name'];
					$import_file_tmp_name = $_FILES['sheet']['tmp_name'];
					$import_file_path = pathinfo($_FILES['sheet']['name']);
					$import_file_size = $_FILES['sheet']['size'];
					$import_file_ext = $import_file_path['extension'];
			
			if($import_file_size > (8*1024*1024)) {
				echo "<script >alert('file cannot be more than 8 MB ')</script>";	
			}
    
}

?>

 <!-- page content -->
            <div class="right_col" role="main">
                <div class="">
                  
                    <div class="clearfix"></div>

                    <div class="row tile_count">
                    
                    <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <div class="left"></div>
                        <div class="right">
                            <span class="count_top">Total Students </span>
                            <div class="count blue"><small><i class="fa fa-users"></i></small>&nbsp;<label id="totuser"></label> &nbsp; </div>
                             <span class="count_bottom"> <a href="contacts.php">View More </a></span>
                        </div>
                    </div>
                    <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <div class="left"></div>
                        <div class="right">
                            <span class="count_top">Active Users </span>
                            <div class="count green"><small><i class="fa fa-user"></i></small>&nbsp;<label id="actuser"></label> &nbsp;</div>
                           <span class="count_bottom"> <a href="#">View More </a></span>
                        </div>
                    </div>
					 
                    <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <div class="left"></div>
                        <div class="right">
                            <span class="count_top ">  Completed Papers </span>
                            <div class="count blue-sky"><small> <i class="fa fa-edit"></i></small> <label id="totcos"></label> </div>
                            <span class="count_bottom"> <a href="allquestion.php">View More </a></span>
                        </div>
                    </div>
					
					 <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <div class="left"></div>
                        <div class="right">
                            <span class="count_top"> New Question </span>
                            <a href="nquestion.php"> <div class="count skye"><i class="fa fa-edit "></i> <small>Go</small> </div></a>
                           <!-- <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> </span>--> 
                        </div>
                    </div>
					
                    <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <div class="left"></div>
                        <div class="right">
                            <span class="count_top"> Import Users </span>
                           <a href="newcontacts.php"> <div class="count green center"><i class="glyphicon glyphicon-import"> </i> <small>Go</small></div></a>
                             
                        </div>
                    </div>
                    <div class="animated flipInY col-md-2 col-sm-4 col-xs-4 tile_stats_count">
                        <div class="left"></div>
                        <div class="right">
                            <span class="count_top"> Exam Settings</span>
                           <a href="#">  <div class="count"> <i class="fa fa-wrench "></i> <small>Go</small> </div></a>
                            <!--<span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>--> 
                        </div>
                    </div>
					
                   
                    </div> <!-- /. row -->
               
               <div class="row">
               	
                	<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="dashboard_graph">
 
 							
					<div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2> Quick Guides <small> Basic Informations  </small></h2>
                                <ul class="nav navbar-right panel_toolbox">
                                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                    </li>
                                   
                                </ul>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="dashboard-widget-content">

                                    <ul class="list-unstyled timeline widget">
                                        <li>
                                            <div class="block">
                                                <div class="block_content">
                                                    <h2 class="title">
                                            About The CBT Application
                                        </h2>
                                                    <div class="byline">
                                                  <span> ... </span>     <!-- <span>13 hours ago</span> by <a>Jane Smith</a>-->
                                                    </div>
                                                    <p class="excerpt"> This Computer Based Test Application was developed to help Tertiary Institutions, Secondary and Primary School Organisations managed their students' performance and evaluations electronically in an optimistic and efficient method.</p> 
                        <p class="excerpt"> It has features for creating users, updating users, and also remove users..    </p>                       
                        <p class="excerpt"> You can as well create new questions, modify them or delete based on your specification, creating new questions supports addition of two to four pictures, and options for multi-choice answers  </p>
                        <p class="excerpt">In a situation where passages are needed for comprehensive reading, the application has the power to include passages to your questions . </p>
                        
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="block">
                                                <div class="block_content">
                                                    <h2 class="title">
                                            About Users | [Creating, Importing and Updating Users]...
                                        </h2>
                                                    <div class="byline">
                                                        <span>...</span>
                                                    </div>
                                                   <p class="excerpt"> This Computer Based Test Application was developed to help Tertiary Institutions, Secondary and Primary School Organisations managed their students' performance and evaluations electronically in an optimistic and efficient method.</p> 
                                                   
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="block">
                                                <div class="block_content">
                                                    <h2 class="title">
                                            How To Setup New Questions, and also updates existing Questions 
                                        </h2>
                                                    <div class="byline">
                                                        <span>13 hours ago</span> by <a>Isaac Mayowa</a>
                                                    </div>
                                                    p class="excerpt"> This Computer Based Test Application was developed to help Tertiary Institutions, Secondary and Primary School Organisations managed their students' performance and evaluations electronically in an optimistic and efficient method.</p> 
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
					
					
                        </div> <!--/. dashboard_graph-->
                    </div> <!--/. col-md-12-->
                        
               </div> <!--/. row-->
               
                <div class="clearfix"></div>
                
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
        </div>
		 
          
<script>
   	$(document).ready(function(e) {
        /* connct to database and check for active users, 
		* total users, courses and questions saved 
		*/
		// load it with ajax 
		makeupdates;
		//
	});
	
	
			function makeupdates(){		
		
			var request = 	$.ajax({
			url:			"../media/php/accessor.php",
			method:			"POST",
			data:			{ datainfo: "we need some users" },
			beforeSend: 	function(){ 
			 }			
			});
			
			request.fail(function(xhr,ajaxOptions,thrownError){
//				var res = $.parseJSON();
			//	alert('There are some errors '+xhr.status);	
			//	alert(thrownError);
				 status = false; 
							 
			});
			//
			request.done(function(msg){
				
				 var user = $.parseJSON(msg); 	
				  
				//  alert(user[0]+" by "+user[1]+" by "+user[2]+" by "+user[3]);
			 	$("#totuser").html(user[0]); 	// display on total users
				$("#actuser").html(user[1]);	// display on acive users
				$("#totcos").html(user[3]);		// display on total courses
				$("#totqtn").html(user[2]);		// display on total question
		    });

			} // end of make update
			
			function waits(){
			$("#totuser").html("loading"); 	// display on total users
				$("#actuser").html("loading");	// display on acive users
				$("#totcos").html("loading");		// display on total courses
				$("#totqtn").html("loading");		// display on total question
			}
			window.setInterval(makeupdates,500);
	
   </script>
 
		
        <?php 
/*
		require "../Classes/PHPExcel.php";
		require_once "../Classes/PHPExcel/IOFactory.php";
		*/
		class ExcelFileReader
		{
			protected $fileType;
			protected $filePath;
			protected $fileName;
			protected $objPHPExcel; 
			protected $datas;
			
			
			 function __construct(){
			
					$import_file = $_FILES['sheet']['name'];
					$import_file_tmp_name = $_FILES['sheet']['tmp_name'];
					$import_file_path = pathinfo($_FILES['sheet']['name']);
					$import_file_size = $_FILES['sheet']['size'];
					$import_file_ext = $import_file_path['extension'];
				
						
				/// do nothing until file is loaded 
				$this->filePath = null;
				$this->fileType = null;
				
			}
			
			///////////////////////////////////////////////
			///////////////////////////////////////////////
			
		
		public function read($uploadedFile){
			
			
			
			
			}
			
			//////////////////////////////////////
			/////////////////////////////////////
			
			
			public function write(){
			
				
				}
			
			function display(){
				
					return $this->datas;  //"[filename: ". $this->fileName." ]  [ type: ".$this->fileType." ]";	
			}
			
			
		}

?>