<!-- ICI JE NE MET QUE DU PHP!!! -->
<?php
Header::set_title("Module  : Client");

include(CLASSES."Client.class.php");
include(INCLUDES."Session.class.php");

switch ( Form::get('action') ){	
	case 'valide':
		traitement();
		break;
	case 'newCompte':
		newCompte();
		break;
	case 'modifCompte':
		modifCompte();
		break;
	default:
		afficher();
		break;
}

function newCompte() {
	include('vueNewModifCompte.php');
}	

function modifCompte() {

	$Cli = Client::ChercherParLogin($_SESSION['user']->login);	
	include('vueNewModifCompte.php');
}

function traitement() {
	$newCli = new Client();
	$newCli->Creer(Form::get('logiN'),Form::get('mdp'),Form::get('nom'),Form::get('prenom'),Form::get('adresse'),Form::get('age'),0 ,'client'); 
	
	// si client n'existe pas déjà, on le crée.
	if (!Client::Existe($newCli->login)) {
		$newCli->Inserer();
	} else { // le client existe déjà, on modifie ses informations
		$newCli->Modifier();
	}
}

function afficher(){
	include('index.php');
}






