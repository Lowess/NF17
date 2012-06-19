<?php

Class Produit {
	//Attributs
	public $id;
	public $nom;
	public $datePeremption;
	public $prixDeBase;
	public $stock;
	public $categorie;
	public $baremePromo;
	public $idRayon;
	//Méthodes statiques
	public function Creer($nom,$datePeremption,$prixDeBase, $stock, $categorie, $baremePromo, $idRayon, $id=-1){
	
		$this->id=$id;
		$this->nom=$nom;
		$this->datePeremption=$datePeremption;
		$this->prixDeBase=$prixDeBase;
		$this->stock=$stock;
		$this->categorie=$categorie;
		$this->baremePromo=$baremePromo;
		$this->idRayon=$idRayon;
		
	}
	public static function ChercherParId($id){
		$sql="SELECT * FROM tProduit WHERE id=$id";
		$tab=DB::Sql($sql);
		$t=pg_fetch_assoc($tab);	
		$p=new Produit();
		$p->Creer($t['nom'], $t['dateperemption'], $t['prixdebase'], $t['stock'], $t['categorie'], $t['baremepromo'], $t['idrayon'], $t['id']);
	
		//Gére la date
		$e1=explode(" ",$p->datePeremption);
		$e2=explode("-",$e1[0]);
		$p->datePeremption=$e2[2]."/".$e2[1]."/".$e2[0];
		
		return $p;
	}
	
	public static function Trier ($champ,$type)
	{		
		//On vérifie que les paramètre de trie attendu sont bien les bons
		if ($type=="ASC" or $type=="DESC")
			$sql=" ORDER BY $champ $type";
		return(self::Lister($sql));
	}

	public static function Lister($tri=""){
		$sql="SELECT * FROM tProduit";
		$sql.=$tri;
		$tab=DB::SqlToArray($sql);
		$res=array();
		//Site::debug($sql);
		foreach($tab as $t){
			$p=new Produit();
			$p->Creer($t['nom'], $t['dateperemption'], $t['prixdebase'], $t['stock'], $t['categorie'], $t['baremepromo'], $t['idrayon'], $t['id']);
			
			//Gére la date
			$e1=explode(" ",$p->datePeremption);
			$e2=explode("-",$e1[0]);
			$p->datePeremption=$e2[2]."/".$e2[1]."/".$e2[0];
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
		
		$rayon=Form::get('rech_idRayon');
		
		if(isset($nom) OR isset($categorie) OR isset($rayon))
		{	
			$sql = "SELECT * FROM tProduit";
			//Contient les conditions
			$conds=array();
			if(!empty($nom))
				$conds[]="tProduit.nom LIKE '%$nom%'"; 
			if(!empty($categorie))
				$conds[]="tProduit.categorie = '$categorie'"; 
			if(!empty($rayon))
				$conds[]="tProduit.idRayon = '$rayon'"; 
			
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
				$p=new Produit();
				$p->Creer($t['nom'], $t['dateperemption'], $t['prixdebase'], $t['stock'], $t['categorie'], $t['baremepromo'], $t['idrayon'], $t['id']);
				
				//Gére la date
				$e1=explode(" ",$p->datePeremption);
				$e2=explode("-",$e1[0]);
				$p->datePeremption=$e2[2]."/".$e2[1]."/".$e2[0];
				$res[]=$p;
			}
			return $res;
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
		$sql="DELETE FROM tProduit WHERE id='{$this->id}'";
		$res=DB::Sql($sql);
		$this->id=0;
	}
	
	// Méthodes de classe privées
	function Inserer(){	
		$sql="INSERT INTO tProduit(id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo, idRayon) VALUES (";
		$sql.="nextval('seq_tProduit'),";
		$sql.="'{$this->nom}',";
		$sql.="to_timestamp('{$this->datePeremption}','DD Mon YYYY'),";
		$sql.="{$this->prixDeBase},";
		$sql.="{$this->stock},";
		$sql.="'{$this->categorie}',";
		$sql.="0,";
		//$sql.="{$this->baremePromo},";
		$sql.="'{$this->idRayon}')";
		Site::debug($sql);
		$res=DB::Sql($sql);
	}

	function Modifier(){
		$sql="UPDATE tProduit SET ";
		$sql.="nom='{$this->nom}',";
		$sql.="datePeremption=to_timestamp('{$this->datePeremption}','DD Mon YYYY'),";
		$sql.="prixDeBase={$this->prixDeBase},";
		$sql.="stock={$this->stock},";
		$sql.="categorie='{$this->categorie}',";
		//$sql.="baremePromo={$this->baremePromo},";
		$sql.="baremePromo={$this->baremePromo},";
		$sql.="idRayon='{$this->idRayon}' ";
		$sql.="WHERE id={$this->id}";
		Site::debug($sql);

		$res=DB::Sql($sql);	
	}		
};

?>
