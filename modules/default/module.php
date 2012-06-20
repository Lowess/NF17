<!-- ICI JE NE MET QUE DU PHP!!! -->
<?php
Header::set_title("Module  : par défaut");

include(CLASSES."Rayon.class.php");
include(INCLUDES."Session.class.php");

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
	$id=Form::get('id');
	if(isset($_SESSION['panier'][$id]))
		$_SESSION['panier'][$id]++;
	else
		$_SESSION['panier'][$id]=1;
		
	afficher();
}

?>
