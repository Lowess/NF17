<?php

Class ResponsableCatalogue {
	//Attributs
	
	//Méthodes statiques
	public static function Connection($login, $pass) {
		// table tresponsablecatalogue
		$sql = "SELECT login, mdp FROM tresponsablecatalogue where login='$login' and mdp='$pass'";
		$res = DB::Sql($sql);
		$res2 = pg_fetch_assoc($res);
		
		// si login et mdp trouvés alors, il peut se connecter.
		if ($res2['login'] && $res2['mdp']) {
			return true;
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
			WHERE ...='{$this->}'";
		$res=DB::Sql($sql);	
		*/
	}		
};

?>
