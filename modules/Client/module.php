<!-- ICI JE NE MET QUE DU PHP!!! -->
<?php
Header::set_title("Module  : Client");

include(CLASSES."Client.class.php");

switch ( Form::get('action') ){	
	case 'creationNouveauCompte':
		creationNouveauCompte();
		break;
	case 'inscription':
		inscription();
		break;
	case 'modifierCompte':
		modifierCompte();
		break;
	default:
		afficher();
		break;
}

function creationNouveauCompte() {
	include('vueNewModifCompte.php');
}

function inscription() {
	$newCli = Client::Creer(Form::get('logiN'),,Form::get('mdp'),Form::get('nom'),Form::get('prenom'),Form::get('adresse'),Form::get('age'),'client'); 
	$newCli->Enregistrer();
}	

function modifierCompte() {
	$Cli = Client::getParId(Form::get('id'));
	include('vueNewModifCompte.php');
}

function afficher(){
	include('index.php');
}






