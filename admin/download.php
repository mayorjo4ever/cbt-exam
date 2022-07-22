<?php 
 	
		error_reporting(1); 
			
			if(!isset($_SESSION))session_start();
		/// authenticate the downloader

		if(!isset($_SESSION['adminUser'])) {	
			$_SESSION['adminReqPg'] = $_SERVER['PHP_SELF'];			
			header("Location:login/");	
		}
		else{
			require "../media/php/connector.php";			 
			require "../media/Classes/PHPExcel.php";
			
			$dbm = new DbTool(); 
			 
			try{  	 
			////////////////////////////////////////
			//// trap request from browser
			///////////////////////////////////////////////////////////
			  

			 $fields = array('user_id','codegen','totalscore','percent','paper_signal','paperlogintime','paperlogouttime');
			  $fields_2  = array('user_id','codegen','totalscore','percent','paper_signal','paperlogintime','paperlogouttime','totalmark');
			  
			  
			 // $queries = array("codegen"=>$code,"year"=>$year); 		  
			 // $infos = explode("-",$_SESSION['resCond']);
			 $codes = explode("_",$_SESSION['resCond']['codegen']);
			 $myear = $_SESSION['resCond']['year'];
			 $cnt = count($codes); /// date == n-1
	 		 $dates = array_slice($codes,$cnt-2,1)[0];
			 $month = substr($dates,0,2);
			 $day = substr($dates,2); 
			 
			 $Result = $dbm->getFields($dbm->select("users_result",$_SESSION['resCond'],array("user_id")),$fields);	
			  $Result2 = $dbm->getFields($dbm->select("users_result",$_SESSION['resCond'],array("user_id")),$fields_2);	
			 $schoolInfos = $dbm->getFields($dbm->select("school_info",array()),array("name","shortname","logo","address","resortcode","motto"));		
			////////////////////////////////////////////////////////////////////////	
			////////excel header ////////////////////////

			$headings = array('S/N','REGISTRATION NO.','FULL NAME ','SCORE','PERCENTAGE','PAPER STATUS','TIME IN ', 'TIME OUT ');	 			
			// start PHPExcel object 
				  $menuheadings = "SUMMARY OF PAPER WRITTEN ON  : ". substr(date("r",mktime(0,0,0,$month,$day,$myear)),0,16);
						
			  $extName = $_SESSION['resCond']['codegen']."_result.xlsx";
			
			$objPhp = new PHPExcel();
			$objPhp->getProperties()->setCreator("HKKonsults")
				->setLastModifiedBy("Olanrewaju Babatunde")
				->setTitle("Office 2007 XLSX Test Document")							
				->setKeywords("office 2007 openxml php")
				->setCategory("Exam Result File");
			
			// WRITE SCHOOL INFORMATION
			$objPhp->getActiveSheet()->setCellValue('B2',$schoolInfos['name'][0]);
			$objPhp->getActiveSheet()->mergeCells('B2:J2'); //merge and write in the cell 	
			// 	WRITE PAPER INFORMATION 
			$objPhp->getActiveSheet()->mergeCells('B3:J3'); //merge and write in the cell 			
			$objPhp->getActiveSheet()->setCellValue('B3',$menuheadings);
		    $paperCode = "PAPER CODE : ".$_SESSION['resCond']['codegen'];
			$paperTitle = $dbm->resort($dbm->getFields($dbm->select("epanel",$_SESSION['resCond']),array('title','time')));	
			
			$objPhp->getActiveSheet()->setCellValue('B4','PAPER TITLE  :  '.$paperTitle['title'].'    '.$paperCode);
			$objPhp->getActiveSheet()->mergeCells('B4:J4'); //merge and write in the cell 			
			
			///////////////////////////////////////////////////////////////////////////////////////
			$objPhp->getActiveSheet()->getStyle('B2:J6')->getFont()->setBold(true);			
			// $objPhp->getActiveSheet()->getStyle('B6:J6')->getAlignment()->setWrapText(true);
			// $objPhp->getActiveSheet()->getStyle('B6:J6')->getFont()->setBold(true);
			
			$objPhp->getActiveSheet()->setTitle("SUMMARY OF RESULT");				
			$rowNo = 6; 
			$col = "B";
			 foreach($headings as $heads){
				$objPhp->getActiveSheet()->setCellValue($col.$rowNo,$heads); 
				$objPhp->getActiveSheet()->getColumnDimension($col)->setWidth(20); // auto adjust the width
				$col++;			
			}
				// loop through the result 
				$rowNo = 7; 
				$r = 0; $me = array();
				foreach($Result['user_id'] as $studs){ 	 
					$me[] = $studs;
					$col='C';	
					foreach($fields as $cell){
						$objPhp->getActiveSheet()->setCellValue($col.$rowNo,$Result[$cell][$r]);
						$objPhp->getActiveSheet()->getStyle($col.$rowNo)->getAlignment()->setWrapText(true);
						$col++;
					}
					///REWRITE THE SCORE 					
					$score = $Result2['totalscore'][$r]." / ".$Result2['totalmark'][$r];
					$objPhp->getActiveSheet()->setCellValue('E'.$rowNo,$score); 	// write the score proper
					$objPhp->getActiveSheet()->setCellValue('F'.$rowNo,$Result2['percent'][$r]." %"); 	// write the score proper
					$rowNo++;
						$r++;		 
				}
				
				/// give border 
				$styleArray = array('borders'=>array('allborders'=>array('style'=>PHPExcel_Style_Border::BORDER_THIN)));
				$objPhp->getActiveSheet()->getStyle('B6:I'.($rowNo-1))->applyFromArray($styleArray); 
				unset($styleArray);
				////////////////////////////////////////////////////////////////////////////////////////////////
				
				/// rewrite the students name 
				$rowNo = 7; $col='D';	$f = 0;
				foreach($me as $mid){
					$myInfo = $dbm->resort($dbm->getFields($dbm->select("users",array("user_id"=>$mid)),array('surname','firstname','midname')));
					$fname = strtoupper($myInfo['surname']).", ".$myInfo['firstname']." ".$myInfo['midname'];
					$objPhp->getActiveSheet()->setCellValue($col.$rowNo,$fname);
					$objPhp->getActiveSheet()->setCellValue('B'.$rowNo,$f+1); 	// write the serial numbers 
					
					$rowNo++; $f++;
				}
				
				/// freeze pane so that heading lines won't scroll 
				$objPhp->getActiveSheet()->freezePane('A2');
				// save an excell BIFF(XLS) file
			// $objWriter = PHPExcel_IOFactory::createWriter($objPhp,'Excel5');  // for xls file  
			$objWriter = PHPExcel_IOFactory::createWriter($objPhp,'Excel2007'); 
			// $objWriter = PHPExcel_IOFactory::createWriter($objPhp,'PDF');  // for pdf 
			header('Content-Type:application/vnd.ms-excel');
			header('Content-disposition:attachment;filename="'.$extName);
			header('Cache-Control:max-age=0');
			$objWriter->save('php://output');
			// $objWriter->save('MyExcel.xslx);
			exit();
				//
				
				
			} 		
			catch(Exception $e){
				throw  $e; 
				}
			
			}
				
			 // end of request token 
			////////////////////
			
			
			
			///////////downloading question//// 
			///////////////////////////////////
			if(isset($_REQUEST['samp'])){
			$filepath = "../scripts/files/";
			$fname = "question.xls";
				// http headers for excel downloads
				header("Pragma: public");
				header("Expires: 0");
				header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
				header("Cache-Control: public");
				header("Content-Description: File Transfer");
				header("Content-type: application/vnd.ms-excel");
				header("Content-Disposition: attachment; filename=$fname");
				header("Content-Transfer-Encoding: binary");
				header("Content-Length: ".filesize($filepath.$fname));
				ob_end_flush();
				@readfile($filepath.$fname);
			
			
			}
			// end of qtnsamp
			//////////////////////////////////////////////////////

		//end of else 

		?>