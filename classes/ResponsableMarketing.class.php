<?php

Class ResponsableMarketing {
	//Attributs
	public $login;
	public $mdp;
	public $type;
	
	public function Creer($login, $mdp, $type){
		$this->login=$login;
		$this->mdp=$mdp;
		$this->type=$type;
	}
	
	//Méthodes statiques
	public static function Connection($login, $pass) {
		// table tresponsablemarketing
		$sql = "SELECT * FROM tresponsablemarketing where login='$login' and mdp='$pass'";
		$res = DB::Sql($sql);
		$res2 = pg_fetch_assoc($res);
		
		// si login et mdp trouvés alors, il peut se connecter.
		if (isset($res2['login']) && isset($res2['mdp'])) {
			$c = new ResponsableMarketing($res2['login'],$res2['mdp']'responsableMarketing');
			$c->Creer();
			return $c;
		} else {
			return false;
		}	
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
		$sql="INSERT INTO ... VALUES (...)";
		$res=DB::Sql($sql);
		return mysql_insert_id();
	}

	function Modifier(){
		/*
		$sql="UPDATE ... SET ...
			WHERE ...='{$this->...}'";
		$res=DB::Sql($sql);	
		* */
	}		
};

?>
