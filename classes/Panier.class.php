<?php

Class Panier {
	//Attributs
	public $id;
	public $datePanier;
	public $login;
	
	//Méthodes statiques
	public function Creer($login, $datePanier=-1, $id=-1){
		$datePanier=date("Y M d H:i:s",time());
		$this->id=$id;
		$this->datePanier=$datePanier;
		$this->login=$login;
	}
	//Méthodes de classe publiques
	public function Enregistrer(){
		if($this->id==-1)
			return $this->id=$this->Inserer();			
		else
			return $this->Modifier();
	}

	public function Supprimer(){
		$sql="DELETE FROM ... WHERE id='{$this->id}'";
		$res=DB::Sql($sql);
		$this->id=0;
	}
	
	// Méthodes de classe privées
	function Inserer(){	
		$sql="INSERT INTO tPanier VALUES (";
		$sql.="nextval('seq_tPanier'),";
		$sql.="to_timestamp('{$this->datePanier}','DD Mon YYYY'),";
		$sql.="'{$this->login}')";
		$res=DB::Sql($sql);
		Site::debug($sql);
		
		$res=DB::Sql("SELECT currval('seq_tpanier') as val FROM tPanier");
		$cur=pg_fetch_assoc($res);	
		
		return $cur['val'];
	}

	function Modifier(){
		$sql="UPDATE ... SET ...
			WHERE ...=''";
		$res=DB::Sql($sql);	
		return $this->id;
	}		
};

?>
