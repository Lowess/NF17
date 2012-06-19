<?php

Class Livreur {
	//Attributs
	
	//Méthodes statiques
	
	//Méthodes de classe publiques
	public function Enregistrer(){
		if($this->id==-1)
			$this->id=$this->Inserer();			
		else
			$this->Modifier();
	}
	
	public static function NombreTourneeEffectue($idLivreur){
		$sql="SELECT COUNT(*) as nb FROM tRealise WHERE idlivreur='$idLivreur'";
		$tab=DB::Sql($sql);
		$t=pg_fetch_assoc($tab);	
		return $t['nb'];
	}

	public function Supprimer(){
		$sql="DELETE FROM ... WHERE id='{$this->id}'";
		$res=DB::Sql($sql);
		$this->id=0;
	}
	
	// Méthodes de classe privées
	function Inserer(){	
		$sql="INSERT INTO ... VALUES (...)";
		$res=DB::Sql($sql);
		return mysql_insert_id();
	}

	function Modifier(){
		$sql="UPDATE ... SET ...
			WHERE ...=''";
		$res=DB::Sql($sql);	
	}		
};

?>
