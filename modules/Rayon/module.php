<?php

Header::set_title("Module: Rayon");

include(CLASSES."Rayon.class.php");

switch ( Form::get('action') ){	
	case 'valide':
		traitement();break;
	case 'ajout':
		ajouter();break;
	case 'supprimer':
		supprimer();break;
	default:
		afficher();break;
}



function afficher(){
	$tab=Rayon::Lister();
	$tab2=Rayon::ListerParRayon();
	include('vue.php');
}


function ajouter(){
	include('ajout.php');
}


function supprimer(){
	$r=Rayon::ChercherParId(Form::get('id'));
	$r->Supprimer();
	Site::message_info("Formulaire traité correctement",OK);			
	Site::redirect("index.php?module=Rayon");
}

function traitement(){

	$theme=Form::get('theme');
	
	if(	!empty($theme) 	){
		$r=new Rayon;
		$r->Creer($theme);
		Site::debug($r);
		
		$r->Enregistrer();
		Site::message_info("Formulaire traité correctement",OK);			
		Site::redirect("index.php?module=Rayon");
	}
	else
		Site::message_info("Un des champs formulaire est vide",INFO);					
}


?>
