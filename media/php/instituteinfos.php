<?php 
	
	require_once "dbTool.php";
	
	class Institute_info{
		 
		public $institutename, $shortname, $logo, $resortcode, $address;  		
		
		function __construct(){		
	//		connect to database 
			$dbcon = new DbTool();				
			$infos = $dbcon->getFields($dbcon->select("school_info",array()),array("name","shortname","logo","address","resortcode","motto"));
		//	assign names		
		$this->institutename = $infos['name'][0];
		$this->shortname  = $infos['shortname'][0];
		$this->logo  = $infos['logo'][0];
		$this->resortcode = $infos['resortcode'][0];
		$this->address =  $infos['address'][0];
		$this->motto =  $infos['motto'][0];
	 	}					
		
		
	}


?>