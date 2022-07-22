<?php 

	error_reporting(1);
	 
	 if(!isset($_SESSION)) session_start(); 
	
	
		class navigator{
				
				protected $variable; 
				protected $state;
				protected $tdir;
				protected $fdir;
			
			public function __construct($var, $state,$t_direction,$f_direction){
					
					$this->variable = $var;
					$this->state = $state;
					$this->tdir = $t_direction;
					$this->fdir = $f_direction;	
									
				}			
				
				
				public function run(){
					
					if(isset($_SESSION[$this->variable])&& $_SESSION[$this->variable]==$this->state) {
							// navigate to true dir
							header("Location:".$this->tdir);
						}	
						// when false	
						else header("Location:".$this->fdir);
						
				}
							
		}
		
?>