<?php 

	class Database extends PDO {
		
		public function __construct(){ 
			parent::_construct('mysql:host=127.0.0.1; dbname=banksystem','root','');
		}
		
	}


?>