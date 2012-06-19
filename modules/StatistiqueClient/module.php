<?php

Header::set_title("Module: Statistique Client");

include(CLASSES."StatistiqueClient.class.php");

				
switch ( Form::get('action') ){	
	case 'valide':
		traitement();break;
	case 'editer':
		editer();break;
	case 'trie':
		trier();break;
	case 'recherche':
		rechercher();break;
	default:
		afficher();break;
}



function afficher(){
	$lr=Rayon::Lister();
	$tab=StatistiqueClient::Lister();
	include('vue.php');
}

function editer(){
	$lr=Rayon::Lister();
	$p=StatistiqueClient::ChercherParLogin(Form::get('login'));
	
	include('ajout.php');	
}

function trier(){
	$tab=StatistiqueClient::Trier(Form::get('champ'),Form::get('type'));
	include('vue.php');
}

function rechercher(){
	$lr=Rayon::Lister();
	$tab=StatistiqueClient::RechercheMultiple();
	include('vue.php');
}

function traitement(){

	$login=Form::get('login');
	
	$nom=Form::get('nom');
	
	$prenom=Form::get('prenom');
	
	$date=Form::get('adresse');
	
	$age=Form::get('age');
	
	$pointfidelite=Form::get('pointfidelite');
	
	$nombredepanierachete=Form::get('nombredepanierachete');
	
	$prixmoyenpanier=Form::get('prixmoyenpanier');
	
	if(	!empty($nom) && 
		!empty($prenom) && 
		!empty($adresse) &&
		!empty($age) &&
		!empty($pointfidelite) &&
		isset($nombredepanierachete) &&
		!empty($prixmoyenpanier)
	){
		if(empty($login)) $login=-1;
		
		$p=new StatistiqueClient;
		$p->Creer(
			$nom,
			$adresse,
			$prenom,
			$age,
			$pointfidelite,
			$nombredepanierachete,
			$prixmoyenpanier,
			$login
		);
		//ite::debug($p);
		$p->Enregistrer();
		Site::message_info("Formulaire traité correctement",OK);			
		//Site::redirect("index.php?module=StatistiqueClient");
	}
	else
		Site::message_info("Un des champs formulaire est vide",INFO);			
		
}

?>
