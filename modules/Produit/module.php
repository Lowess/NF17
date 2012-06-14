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
	default:
		afficher();break;
}



function afficher(){
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

function traitement(){

$GLOBAL_CATEGORIE=array(	1 => "Produits laitiers et similaires",
							2 => "Matières grasses et huiles",
							3 => "Glaces de consommation",
							4 => "Fruits et légumes",
							5 => "Confiserie",
							6 => "Céréales et produits à base de céréales",
							7 => "Produits de boulangerie",
							8 => "Viande et produits carnés, volaille et gibier inclus",
							9 => "Poisson et produits de la pêche",
							10 => "Oeufs et produits à base d => oeufs",
							11 => "Édulcorants",
							12 => "Sels, épices, potages, sauces, salades",
							13 => "Aliments destinés à une alimentation particulière",
							14 => "Boissons",
							15 => "Autres"
					);
						
	$id=Form::get('id');
	
	$nom=Form::get('nom');
	
	$prixDeBase=Form::get('prixDeBase');
	
	$date=explode("/",Form::get('datePeremption'));
	//Conversion date 12 Jun 2012
	$datePeremption=date("d M Y", mktime(0, 0, 0, $date[1], $date[0], $date[2]));
	
	$stock=Form::get('stock');
	
	$categorie=$GLOBAL_CATEGORIE[Form::get('categorie')];
	
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
