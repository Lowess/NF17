<?php

Header::set_title("Module: Produit");

include(CLASSES."Produit.class.php");

				
switch ( Form::get('action') ){	
	case 'valide':
		traitement();break;
	case 'ajout':
		ajouter();break;
	case 'editer':
		editer();break;
	case 'supprimer':
		supprimer();break;
	case 'trie':
		trier();break;
	case 'recherche':
		rechercher();break;
	default:
		afficher();break;
}



function afficher(){
	$lr=Rayon::Lister();
	$tab=Produit::Lister();
	include('vue.php');
}


function ajouter(){
	$lr=Rayon::Lister();
	include('ajout.php');
}

function editer(){
	$lr=Rayon::Lister();
	$p=Produit::ChercherParId(Form::get('id'));
	
	include('ajout.php');	
}

function supprimer(){
	$p=Produit::ChercherParId(Form::get('id'));
	$p->Supprimer();
	
	Site::message_info("Formulaire traité correctement",OK);			
	Site::redirect("index.php?module=Produit");
}

function trier(){
	$tab=Produit::Trier(Form::get('champ'),Form::get('type'));
	include('vue.php');
}

function rechercher(){
	$lr=Rayon::Lister();
	$tab=Produit::RechercheMultiple();
	include('vue.php');
}

function traitement(){

	$id=Form::get('id');
	
	$nom=Form::get('nom');
	
	$prixDeBase=Form::get('prixDeBase');
	
	$date=explode("/",Form::get('datePeremption'));
	//Conversion date 12 Jun 2012
	$datePeremption=date("d M Y", mktime(0, 0, 0, $date[1], $date[0], $date[2]));
	
	$stock=Form::get('stock');
	
	$categorie=$_SESSION['GLOBAL_CATEGORIE'][Form::get('categorie')];
	
	$baremePromo=Form::get('baremePromo');
	if(empty($baremePromo)) $baremePromo=0;
	
	$idRayon=Form::get('idRayon');
	
	if(	!empty($nom) && 
		!empty($prixDeBase) && 
		!empty($datePeremption) &&
		!empty($datePeremption) &&
		!empty($stock) &&
		!empty($categorie) &&
		isset($baremePromo) &&
		!empty($idRayon)
	){
		if(empty($id)) $id=-1;
		
		$p=new Produit;
		$p->Creer(
			$nom,
			$datePeremption,
			$prixDeBase,
			$stock,
			$categorie,
			$baremePromo,
			$idRayon,
			$id
		);
		//ite::debug($p);
		$p->Enregistrer();
		Site::message_info("Formulaire traité correctement",OK);			
		//Site::redirect("index.php?module=Produit");
	}
	else
		Site::message_info("Un des champs formulaire est vide",INFO);			
		
}

?>
