<?php

Header::set_title("Module: Gestion des promotions");

include(CLASSES."StatistiqueProduit.class.php");

				
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
	$tab=StatistiqueProduit::Lister();
	include('vue.php');
}

function editer(){
	$lr=Rayon::Lister();
	$p=StatistiqueProduit::ChercherParId(Form::get('id'));
	
	include('ajout.php');	
}

function trier(){
	$tab=StatistiqueProduit::Trier(Form::get('champ'),Form::get('type'));
	include('vue.php');
}

function rechercher(){
	$lr=Rayon::Lister();
	$tab=StatistiqueProduit::RechercheMultiple();
	include('vue.php');
}

function traitement(){

	$id=Form::get('id');
	$baremepromo=Form::get('baremepromo');
	$pointfidelite=Form::get('pointfidelite');
	if(empty($baremepromo)) $baremepromo=0;
	if(empty($pointfidelite)) $pointfidelite=0;
	
	$p=new StatistiqueProduit;
	$p->Creer(
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		$baremepromo,
		$pointfidelite,
		"",
		$id
	);
		$p->ModifierPromo();
		Site::message_info("Formulaire traité correctement",OK);
		Site::redirect("index.php?module=BaremePromo");		
}

?>
