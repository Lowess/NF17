<?php

Class StatistiqueClient {
	//Attributs
	public $login;
	public $nom;
	public $prenom;
	public $adresse;
	public $age;
	public $pointfidelite;
	public $nombredepanierachete;
	public $prixmoyenpanier;
	//Méthodes statiques
	public function Creer($nom,$prenom,$adresse, $age, $pointfidelite, $nombredepanierachete, $prixmoyenpanier, $login=-1){
	
		$this->login=$login;
		$this->nom=$nom;
		$this->prenom=$prenom;
		$this->adresse=$adresse;
		$this->age=$age;
		$this->pointfidelite=$pointfidelite;
		$this->nombredepanierachete=$nombredepanierachete;
		$this->prixmoyenpanier=$prixmoyenpanier;	
	}
	
	public static function ChercherParId($login){
		$sql="SELECT * FROM vStatistiqueClient WHERE login=$login";
		$tab=DB::Sql($sql);
		$t=pg_fetch_assoc($tab);	
		$p=new StatistiqueClient();
		$p->Creer($t['nom'], $t['prenom'], $t['adresse'], $t['age'], $t['pointfidelite'], $t['nombredepanierachete'], $t['prixmoyenpanier'], $t['login']);
		
		return $p;
	}
	
	public static function Trier ($champ,$type)
	{		
		//On vérifie que les paramètre de trie attendu sont bien les bons
		if ($type=="ASC" or $type=="DESC")
			$sql=" ORDER BY \"$champ\" $type";
		return(self::Lister($sql));
	}

	public static function Lister($tri=""){
		$sql="SELECT * FROM vStatistiqueClient";
		$sql.=$tri;
		$tab=DB::SqlToArray($sql);
		$res=array();
		//Site::debug($sql);
		foreach($tab as $t){
			$p=new StatistiqueClient();
			$p->Creer($t['nom'], $t['prenom'], $t['adresse'], $t['age'], $t['pointfidelite'], $t['nombredepanierachete'], $t['prixmoyenpanier'], $t['login']);
			
			$res[]=$p;
		}
		return $res;
	}
	
	static function RechercheMultiple()
	{
		$nom=Form::get('rech_nom');
		
		if(isset($nom))
		{	
			$sql = "SELECT * FROM vStatistiqueClient";
			//Contient les conditions
			$conds=array();
			if(!empty($nom))
				$conds[]="vStatistiqueClient.nom LIKE '%$nom%'"; 
			
			//-------------------
			//Compose la requete dynamique
			foreach($conds as $c=>$condition)
				if($c==0)
					$sql=$sql." WHERE ".$condition;
				else	
					$sql=$sql." AND ".$condition;
			
			$tab=DB::SqlToArray($sql);
			$res=array();
			Site::debug($sql);
			foreach($tab as $t){
				$p=new StatistiqueClient();
				$p->Creer($t['nom'], $t['prenom'], $t['adresse'], $t['age'], $t['pointfidelite'], $t['nombredepanierachete'], $t['prixmoyenpanier'], $t['login']);
				
				$res[]=$p;
			}
			return $res;
		}
	}
	//Méthodes de classe publiques
	public function Enregistrer(){
		if($this->login!=-1)
			$this->Modifier();
	}

	public function Supprimer(){
		$sql="DELETE FROM tStatistiqueClient WHERE login='{$this->login}'";
		$res=DB::Sql($sql);
		$this->login=0;
	}
	

	function Modifier(){
		$sql="UPDATE tStatistiqueClient SET ";
		$sql.="nom='{$this->nom}',";
		$sql.="prenom=to_timestamp('{$this->prenom}','DD Mon YYYY'),";
		$sql.="adresse={$this->adresse},";
		$sql.="age={$this->age},";
		$sql.="pointfidelite='{$this->pointfidelite}',";
		$sql.="nombredepanierachete={$this->nombredepanierachete},";
		$sql.="prixmoyenpanier='{$this->prixmoyenpanier}' ";
		$sql.="WHERE login={$this->login}";
		Site::debug($sql);

		$res=DB::Sql($sql);	
	}		
};

?>
