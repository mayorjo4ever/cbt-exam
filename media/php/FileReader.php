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