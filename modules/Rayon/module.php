<?php

Header::set_title("Module: Rayon");

include(CLASSES."Rayon.class.php");

switch ( Form::get('action') ){	
	case 'valide':
		ajouter();break;
	case 'editer':
		editer();break;
	case 'supprimer':
		supprimer();break;
	default:
		afficher();break;
}



function afficher(){
	$tab=Rayon::Lister();
	include('vue.php');
}


function ajouter(){
	
}

function editer(){
	
}

function supprimer(){
	
}


?>
