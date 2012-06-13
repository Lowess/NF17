<?php

Class Rayon {
	//Attributs
	public $theme;
	
	
	//Méthodes de classe publiques
	public function Creer($theme){
		$this->theme=$theme;
	}

	public function Enregistrer(){
		$this->id=$this->Inserer();			
	}

	public function Supprimer(){
		$sql="DELETE FROM tRayon WHERE theme='{$this->theme}'";
		$res=DB::Sql($sql);
		$this->theme='\0';
	}
		

	//Méthodes statiques
	static public function Lister(){
		$sql="SELECT * FROM tRayon";
		$tab=DB::SqlToArray($sql);
		$res=array();
		
		foreach($tab as $t){
			$r=new Rayon();
			$r->Creer($t['theme']);
			$res[]=$r;
		}
		return $res;
	}

	//Méthodes de classe privées	
	function Inserer(){	
		$sql="INSERT INTO tRayon VALUES (...)";
		$res=DB::Sql($sql);
		return mysql_insert_id();
	}

	function Modifier(){
		$sql="UPDATE tRayon SET ...";
		$res=DB::Sql($sql);	
	}
};

?>
