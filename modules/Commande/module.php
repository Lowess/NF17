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
	case 'vueProduits':
		vueProduits();break;
	case 'vueLivreurs':
		vueLivreurs();break;
	
	default:
		afficher();break;
}



function afficher(){
	$tab=Commande::Lister();
	include('vue.php');
}


function ajouter(){
	include('ajout.php');
}

function editer(){
	$c=Commande::ChercherParId(Form::get('id'));
	include('ajout.php');	
}

function supprimer(){
	$c=Commande::ChercherParId(Form::get('id'));
	Site::debug($c);
	$c->Supprimer();
	
	Site::message_info("Formulaire traité correctement",OK);			
	Site::redirect("index.php?module=Commande#table");
}

function trier(){
	$tab=Commande::Trier(Form::get('champ'),Form::get('type'));
	include('vue.php');
}


function rechercher(){
	$tab=Commande::RechercheMultiple();
	include('vue.php');
}

function vueProduits(){
	$idPanier=Form::get('id');
	$tab=Contient::AfficherPanier($idPanier);
	include('vueProduits.php');
}

function vueLivreurs(){
	$idTournee=Form::get('id');
	$tab=Realise::AfficherTournee($idTournee);
	include('vueLivreurs.php');
}

function traitement(){

	$modif=Commande::ChercherParId(Form::get('idPanier'));
	
	$etat=Form::get('etat');
	
	if(	!empty($modif) &&
		!empty($etat)
	){
		
		$c=new Commande;
		$c->Creer(
			$modif->dateValidation,
			$etat,
			$modif->heureLivraison,
			$modif->lieuLivraison,
			$modif->idTournee,
			$modif->idPanier
		);
		Site::debug($c);
		$c->Enregistrer();
		Site::message_info("Formulaire traité correctement",OK);			
		Site::redirect("index.php?module=Commande");
	}
	else
		Site::message_info("Un des champs formulaire est vide",INFO);					
}

?>

