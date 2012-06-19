<?php
include(CLASSES."Livreur.class.php");

Class Realise {
	//Attributs
	public $idTournee;
	public $idLivreur;
	public $nbTourneeEffectue;
	//Méthodes statiques
	public function Creer($idTournee,$idLivreur,$nbTourneeEffectue){
		$this->idTournee=$idTournee;
		$this->idLivreur=$idLivreur;
		$this->nbTourneeEffectue=$nbTourneeEffectue;
	}
	
	//Méthodes de classe publiques
	public function Enregistrer(){
		if($this->id==-1)
			$this->id=$this->Inserer();			
		else
			$this->Modifier();
	}

	public function AfficherTournee($idTournee){
		$sql="SELECT Re.idtournee, Re.idlivreur";
		$sql.=" FROM tRealise Re";
		$sql.=" WHERE Re.idtournee=$idTournee";
		
		$tab=DB::SqlToArray($sql);
		$res=array();
		//Site::debug($sql);
		foreach($tab as $t){
			$p=new Realise();
			$p->Creer($t['idtournee'], $t['idlivreur'], Livreur::NombreTourneeEffectue($t['idlivreur']));
			
			$res[]=$p;
		}
		return $res;
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
