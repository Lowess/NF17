<?php

Class Contient {
	//Attributs
	public $idProduit;
	public $idPanier;
	public $quantite;
	public $prixPublicUnitaire;
	
	//Méthodes statiques
	public function Creer($idProduit,$idPanier, $quantite, $prixPublicUnitaire){
		$this->idProduit=$idProduit;
		$this->idPanier=$idPanier;
		$this->quantite=$quantite;
		$this->prixPublicUnitaire=$prixPublicUnitaire;
	}
	
	public function AfficherPanier($idPanier){
		$sql="SELECT Pr.id, Pr.nom, Pr.dateperemption, Co.prixpublicunitaire, Co.quantite, Pr.categorie, Pr.baremepromo, Pr.idrayon";
		$sql.=" FROM tContient Co, tProduit Pr";
		$sql.=" WHERE Co.idproduit=Pr.id";
		$sql.=" AND Co.idpanier=$idPanier";
		$tab=DB::SqlToArray($sql);
		$res=array();
		//Site::debug($sql);
		foreach($tab as $t){
			$p=new Produit();
			$p->Creer($t['nom'], $t['dateperemption'], $t['prixpublicunitaire'], $t['quantite'], $t['categorie'], $t['baremepromo'], $t['idrayon'], $t['id']);
			
			//Gére la date
			$e1=explode(" ",$p->datePeremption);
			$e2=explode("-",$e1[0]);
			$p->datePeremption=$e2[2]."/".$e2[1]."/".$e2[0];
			$res[]=$p;
		}
		return $res;
	}
	
	//Méthodes de classe publiques
	public function Enregistrer(){
		//if($this->idProduit==-1)
			$this->id=$this->Inserer();			
		//else
		//	$this->Modifier();
	}

	public function Supprimer(){
		$sql="DELETE FROM tContient WHERE idproduit={$this->idProduit} AND idpanier={$this->idPanier}";
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
