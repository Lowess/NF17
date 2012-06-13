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
	//Méthodes statiques
	public function Creer($nom,$datePeremption,$prixDeBase, $stock, $categorie, $baremePromo, $id=-1){
	
		$this->id=$id;
		$this->nom=$nom;
		$this->datePeremption=$datePeremption;
		$this->prixDeBase=$prixDeBase;
		$this->stock=$stock;
		$this->categorie=$categorie;
		$this->baremePromo=$baremePromo;
		
	}
	
	public static function Lister(){
		$sql="SELECT * FROM tProduit";
		$tab=DB::SqlToArray($sql);
		$res=array();
		
		foreach($tab as $t){
			$p=new Produit();
			$p->Creer($t['nom'], $t['dateperemption'], $t['prixdebase'], $t['stock'], $t['categorie'], $t['baremepromo'], $t['id']);
			$res[]=$p;
		}
		return $res;
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
		$sql="INSERT INTO tProduit(id, nom, datePeremption, prixDeBase, stock, categorie, baremePromo) VALUES (";
		$sql.="nextval('seq_tProduit'),";
		$sql.="'{$this->nom}',";
		$sql.="to_timestamp('{$this->datePeremption}','DD Mon YYYY'),";
		$sql.="{$this->prixDeBase},";
		$sql.="{$this->stock},";
		$sql.="'{$this->categorie}',";
		$sql.="{$this->baremePromo})";
		//Site::debug($sql);
		$res=DB::Sql($sql);
	}

	function Modifier(){
		$sql="UPDATE tProduit SET";
		$sql.="nom='{$this->nom}',";
		$sql.="datePeremption='{$this->datePeremption}',";
		$sql.="prixDeBase='{$this->prixDeBase}',";
		$sql.="stock='{$this->stock}',";
		$sql.="categorie='{$this->categorie}',";
		$sql.="baremePromo='{$this->baremePromo}' ";
		$sql.="WHERE id='{$this->id}'";
		$res=DB::Sql($sql);	
	}		
};

?>
