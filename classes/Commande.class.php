<?php

Class Commande {
	//Attributs
	public $idPanier;
	public $dateValidation;
	public $etatCmd;
	public $heureLivraison;
	public $lieuLivraison;
	public $idTournee;
	
	//Méthodes statiques
	public function Creer($dateValidation,$etatCmd, $heureLivraison, $lieuLivraison, $idTournee, $idPanier=-1){
		$this->idPanier=$idPanier;
		$this->dateValidation=$dateValidation;
		$this->etatCmd=$etatCmd;
		$this->heureLivraison=$heureLivraison;
		$this->lieuLivraison=$lieuLivraison;
		$this->idTournee=$idTournee;
	}

	//Méthodes de classe publiques
	public function Enregistrer(){
		if($this->idPanier==-1)
			$this->id=$this->Inserer();			
		else
			$this->Modifier();
	}
	
	static function RechercheMultiple()
	{
		$idPanier=Form::get('rech_idPanier');
		$idTournee=Form::get('rech_idTournee');
		$etatCmd=Form::get('rech_etatCmd');
			
		if(isset($idPanier) OR isset($idTournee) OR isset($etatCmd))
		{	
			$sql = "SELECT * FROM tCommande";
			//Contient les conditions
			$conds=array();
			if(!empty($idPanier))
				$conds[]="tCommande.idpanier=$idPanier"; 
			if(!empty($idTournee))
				$conds[]="tCommande.idtournee=$idTournee"; 
			if(!empty($etatCmd))
				$conds[]="tCommande.etatcmd='$etatCmd'"; 
			
			//-------------------
			//Compose la requete dynamique
			foreach($conds as $c=>$condition)
				if($c==0)
					$sql=$sql." WHERE ".$condition;
				else	
					$sql=$sql." AND ".$condition;
			
			$tab=DB::SqlToArray($sql);
			$res=array();
			foreach($tab as $t){
				$c=new Commande();

				$c->Creer($t['datevalidation'], $t['etatcmd'], $t['heurelivraison'], $t['lieulivraison'], $t['idtournee'], $t['idpanier']);
				
				//Gére la date
				$e1=explode(" ",$c->dateValidation);
				$e2=explode("-",$e1[0]);
				$c->dateValidation=$e2[2]."/".$e2[1]."/".$e2[0];
			
				//Gére l'heure de livraison
				$h=explode(" ",$c->heureLivraison);
				$c->heureLivraison=$h[1];
				$res[]=$c;
			}
			return $res;
		}
	}
	
	
	public static function Trier ($champ,$type)
	{		
		//On vérifie que les paramètre de trie attendu sont bien les bons
		if ($type=="ASC" or $type=="DESC")
			$sql=" ORDER BY $champ $type";
		return(self::Lister($sql));
	}
	
	public static function ChercherParId($id){
		$sql="SELECT * FROM tCommande WHERE idpanier=$id";
		$tab=DB::Sql($sql);
		$t=pg_fetch_assoc($tab);	
		$c=new Commande();
	
		$c->Creer($t['datevalidation'], $t['etatcmd'], $t['heurelivraison'], $t['lieulivraison'], $t['idtournee'], $t['idpanier']);
		
		//Gére l'heure de livraison
		$h=explode(" ",$c->heureLivraison);
		$c->heureLivraison=$h[1];
		$res[]=$c;
		
		return $c;
	}
	
	public static function Lister($tri=""){
		$sql="SELECT * FROM tCommande";
		$sql.=$tri;
		$tab=DB::SqlToArray($sql);
		$res=array();
		foreach($tab as $t){
			$c=new Commande();

			$c->Creer($t['datevalidation'], $t['etatcmd'], $t['heurelivraison'], $t['lieulivraison'], $t['idtournee'], $t['idpanier']);
			
			//Gére la date
			$e1=explode(" ",$c->dateValidation);
			$e2=explode("-",$e1[0]);
			$c->dateValidation=$e2[2]."/".$e2[1]."/".$e2[0];
		
			//Gére l'heure de livraison
			if(!empty($c->heureLivraison)){
				$h=explode(" ",$c->heureLivraison);
				$c->heureLivraison=$h[1];
			}
			$res[]=$c;
		}
		return $res;
	}

	public function Supprimer(){
		$sql="DELETE FROM tCommande WHERE idpanier={$this->idPanier}";
		$res=DB::Sql($sql);
	}
	
	// Méthodes de classe privées
	function Inserer(){	
		$sql="INSERT INTO tCommande(idPanier, dateValidation, etatCmd, heureLivraison, lieuLivraison, idTournee) VALUES (";
		$sql.="{$this->idPanier},";
		$sql.="to_timestamp(now(),'DD Mon YYYY'),";
		$sql.="{$this->etatCmd},";
		$sql.="to_timestamp('{$this->heureLivraison}','HH24 MI SS'),";
		$sql.="'{$this->lieuLivraison}',";
		$sql.="{$this->idTournee})";
		$res=DB::Sql($sql);

	}

	function Modifier(){
		$sql="UPDATE tCommande SET ";
		//$sql.="datevalidation=to_timestamp(now(),'DD Mon YYYY'),";
		$sql.="etatcmd='{$this->etatCmd}' ";
		//$sql.="heurelivraison=to_timestamp('{$this->heureLivraison}','HH24 MI SS'),";
		//$sql.="lieulivraison='{$this->lieuLivraison}',";
		//$sql.="idtournee={$this->idTournee},";
		$sql.="WHERE idpanier={$this->idPanier}";
		
		$res=DB::Sql($sql);	
	}		
};

?>
