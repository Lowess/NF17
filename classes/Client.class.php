<?php

Class Client {
	
	//Attributs
	public $login;
	public $mdp;
	public $nom;
	public $prenom;
	public $adresse;
	public $age;
	public $pointFidelite;
	public $type;
	
	public function Creer($login, $mdp, $nom, $prenom, $adresse, $age, $pointFidelite, $type){
		$this->login=$login;
		$this->mdp=$mdp;
		$this->nom=$nom;
		$this->prenom=$prenom;
		$this->adresse=$adresse;
		$this->age=$age;
		$this->pointFidelite=$pointFidelite;
		$this->type=$type;
	}
	
	//Méthodes statiques
    public static function Connection($login, $pass) {
		// table tclient
		$sql = "SELECT * FROM tclient where login='$login' and mdp='$pass'";
		$res = DB::Sql($sql);
		$res2 = pg_fetch_assoc($res);
		
		// si login et mdp trouvés alors, il peut se connecter.
		if (isset($res2['login']) && isset($res2['mdp'])) {
			$c = new Client();
			$c->Creer($res2['login'],$res2['mdp'],$res2['nom'],$res2['prenom'],$res2['adresse'],$res2['age'],$res2['pointfidelite'],'client');
			return $c;
		} else {
			return false;
		}	
	}
	
	public static function ChercherParLogin($login) {
		$sql = "select * from tclient where login='$login'";
		$res = DB::Sql($sql);
		$res2 = pg_fetch_assoc($res);
		
		// si login et mdp trouvés alors, il peut se connecter.
		if (!empty($res2)) {
			$c = new Client();
			$c->Creer($res2['login'],$res2['mdp'],$res2['nom'],$res2['prenom'],$res2['adresse'],$res2['age'],$res2['adresse'],$res2['pointfidelite'],'client');
			return $c;
		} else {
			return false;
		}
	}
	
	public static function Existe($login) {
		$sql = "select count(*) as nb from tclient where login='$login'";
		$res = DB::Sql($sql);
		$res2 = pg_fetch_assoc($res);

		// si login trouvér.
		if ($res2['nb'] != 0) {
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
		$sql="INSERT INTO tclient VALUES ('{$this->login}','{$this->mdp}','{$this->nom}','{$this->prenom}','{$this->adresse}',{$this->age},{$this->pointFidelite})";
		$res=DB::Sql($sql);
	}

	function Modifier(){
		$sql="UPDATE ... SET ...
			WHERE ...=''";
		$res=DB::Sql($sql);	
	}		
};

?>
