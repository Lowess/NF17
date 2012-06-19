<?php

Class Panier {
	//Attributs
	public $id;
	public $datePanier;
	public $login;
	
	//Méthodes statiques
	public function Creer($login, $datePanier=-1, $id=-1){
		$datePanier=date("Y-m-d");
		$this->id=$id;
		$this->datePanier=$idPanier;
		$this->login=$login;
	}
	//Méthodes de classe publiques
	public function Enregistrer(){
		if($this->id==-1)
			$this->id=$this->Inserer();			
		else
			$this->Modifier();
	}

	public function Supprimer(){
		$sql="DELETE FROM ... WHERE id='{$this->id}'";
		$res=DB::Sql($sql);
		$this->id=0;
	}
	
	// Méthodes de classe privées
	function Inserer(){	
		$sql="INSERT INTO tPanier VALUES (";
		$sql.="id=nextval('seq_tPanier'),";
		$sql.="datePanier=to_timestamp('{$this->datePanier}','DD Mon YYYY'),";
		$sql.="login='{$this->login}'";
		$res=DB::Sql($sql);
		return DB::Sql("curval('seq_tPanier')");
	}

	function Modifier(){
		$sql="UPDATE ... SET ...
			WHERE ...=''";
		$res=DB::Sql($sql);	
	}		
};

?>
