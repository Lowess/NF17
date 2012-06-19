<?php

Class StatistiqueProduit {
	//Attributs
	public $id;
	public $nom;
	public $dateperemption;
	public $prixdebase;
	public $prixmoyen;
	public $stock;
	public $qtevendue;
	public $categorie;
	public $baremepromo;
	public $pointfidelite;
	public $idrayon;
	//Méthodes statiques
	public function Creer($nom,$dateperemption,$prixdebase, $prixmoyen, $stock, $qtevendue, $categorie, $baremepromo, $pointfidelite, $idrayon, $id=-1){
		$this->id=$id;
		$this->nom=$nom;
		$this->dateperemption=$dateperemption;
		$this->prixdebase=$prixdebase;
		$this->prixmoyen=$prixmoyen;
		$this->stock=$stock;
		$this->qtevendue=$qtevendue;
		$this->categorie=$categorie;
		$this->baremepromo=$baremepromo;
		$this->pointfidelite=$pointfidelite;
		$this->idrayon=$idrayon;
		
	}
	public static function ChercherParId($id){
		$sql="SELECT * FROM vStatistiqueProduit WHERE id=$id";
		$tab=DB::Sql($sql);
		$t=pg_fetch_assoc($tab);	
		$p=new StatistiqueProduit();
		$p->Creer($t['nom'], $t['dateperemption'], $t['prixdebase'], $t['prixmoyen'], $t['stock'], $t['qtevendue'], $t['categorie'], $t['baremepromo'], $t['pointfidelite'], $t['idrayon'], $t['id']);
	
		//Gére la date
		$e1=explode(" ",$p->dateperemption);
		$e2=explode("-",$e1[0]);
		$p->dateperemption=$e2[2]."/".$e2[1]."/".$e2[0];
		
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
		$sql="SELECT * FROM vStatistiqueProduit";
		$sql.=$tri;
		$tab=DB::SqlToArray($sql);
		$res=array();
		// Site::debug($sql);
		foreach($tab as $t){
			$p=new StatistiqueProduit();
			$p->Creer($t['nom'], $t['dateperemption'], $t['prixdebase'], $t['prixmoyen'], $t['stock'], $t['qtevendue'], $t['categorie'], $t['baremepromo'], $t['pointfidelite'], $t['idrayon'], $t['id']);
			
			//Gére la date
			$e1=explode(" ",$p->dateperemption);
			$e2=explode("-",$e1[0]);
			$p->dateperemption=$e2[2]."/".$e2[1]."/".$e2[0];
			$res[]=$p;
		}
		return $res;
	}
	
	static function RechercheMultiple()
	{
		$nom=Form::get('rech_nom');
		
		$index=Form::get('rech_categorie');
		if(!empty($index))
			$categorie=$_SESSION['GLOBAL_CATEGORIE'][$index];
		
		$rayon=Form::get('rech_idrayon');
		
		if(isset($nom) OR isset($categorie) OR isset($rayon))
		{	
			$sql = "SELECT * FROM vStatistiqueProduit";
			//Contient les conditions
			$conds=array();
			if(!empty($nom))
				$conds[]="vStatistiqueProduit.nom LIKE '%$nom%'"; 
			if(!empty($categorie))
				$conds[]="vStatistiqueProduit.categorie = '$categorie'"; 
			if(!empty($rayon))
				$conds[]="vStatistiqueProduit.idrayon = '$rayon'"; 
			
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
				$p=new StatistiqueProduit();
				$p->Creer($t['nom'], $t['dateperemption'], $t['prixdebase'], $t['prixmoyen'], $t['stock'], $t['qtevendue'], $t['categorie'], $t['baremepromo'], $t['pointfidelite'], $t['idrayon'], $t['id']);
				
				//Gére la date
				$e1=explode(" ",$p->dateperemption);
				$e2=explode("-",$e1[0]);
				$p->dateperemption=$e2[2]."/".$e2[1]."/".$e2[0];
				$res[]=$p;
			}
			return $res;
		}
	}
	//Méthodes de classe publiques
	public function Enregistrer(){
		if($this->id!=-1)
			$this->Modifier();
	}

	function ModifierPromo(){
		$sql="UPDATE tProduit SET ";
		$sql.="\"baremepromo\"={$this->baremepromo} ";
		$sql.="WHERE id={$this->id};";
		$res=DB::Sql($sql);
	}	
	function ModifierPointFidelite(){
		$sql="UPDATE tProduit SET ";
		$sql.="\"pointfidelite\"={$this->pointfidelite} ";
		$sql.="WHERE id={$this->id};";
		Site::debug($sql);
		$res=DB::Sql($sql);
	}		
};

?>
