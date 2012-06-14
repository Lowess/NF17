<?php

Class Rayon {
	//Attributs
	public $theme;
	
	
	//Méthodes de classe publiques
	public function Creer($theme){
		$this->theme=$theme;
	}

	public function Enregistrer(){
		$this->id=$this->Inserer();			
	}

	public function Supprimer(){
		$sql="DELETE FROM tRayon WHERE theme='{$this->theme}'";
		$res=DB::Sql($sql);
		$this->theme='\0';
	}
		

	//Méthodes statiques
	static public function Lister(){
		$sql="SELECT * FROM tRayon";
		$tab=DB::SqlToArray($sql);
		$res=array();
		
		foreach($tab as $t){
			$r=new Rayon();
			$r->Creer($t['theme']);
			$res[]=$r;
		}
		return $res;
	}
	
	static public function ListerParRayon(){
		$rayons=self::Lister();
		$fres=array();
			
		foreach($rayons as $rayon => $r){
			
			$sql="SELECT * FROM tProduit WHERE idRayon='{$r->theme}'";
			$tab=DB::SqlToArray($sql);
			$res=array();
			
			foreach($tab as $t){
				$p=new Produit();
				$p->Creer($t['nom'], $t['dateperemption'], $t['prixdebase'], $t['stock'], $t['categorie'], $t['baremepromo'], $t['idrayon'], $t['id']);
				
				//Gére la date
				$e1=explode(" ",$p->datePeremption);
				$e2=explode("-",$e1[0]);
				$p->datePeremption=$e2[2]."/".$e2[1]."/".$e2[0];
				$res[]=$p;
			}
			$fres[$r->theme]=$res;
		}
		//Site::debug($fres);
		
		return $fres;
	}
	

	//Méthodes de classe privées	
	function Inserer(){	
		$sql="INSERT INTO tRayon VALUES (...)";
		$res=DB::Sql($sql);
		return mysql_insert_id();
	}

	function Modifier(){
		$sql="UPDATE tRayon SET ...";
		$res=DB::Sql($sql);	
	}
};

?>
