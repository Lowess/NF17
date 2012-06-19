<!-- ICI JE NE MET QUE DU PHP!!! -->
<?php
Header::set_title("Module  : par défaut");

include(CLASSES."Rayon.class.php");

switch ( Form::get('action') ){	
	case 'ajout':
		ajouter();break;
	default:
		afficher();break;
}



function afficher(){
	$tab=Rayon::Lister();
	$tab2=Rayon::ListerParRayonVisiteur();
	include('default.php');
}


function ajouter(){
	Session::$panier[]=Form::get('id');
	Site::debug(Session::$panier);
	afficher();
}

?>
