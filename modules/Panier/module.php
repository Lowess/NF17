<!-- ICI JE NE MET QUE DU PHP!!! -->
<?php
Header::set_title("Module  : par défaut");

include(CLASSES."Rayon.class.php");
include(INCLUDES."Session.class.php");

switch ( Form::get('action') ){	
	case 'valide':
		traitement();break;
	case 'inc':
		inc();break;
	case 'dec':
		dec();break;
	case 'supprimer':
		supprimer();break;
	
	default:
		afficher();break;
}

function afficher(){
	foreach($_SESSION['panier'] as $id=>$qte){
		$prod=Produit::ChercherParId($id);
		$prod->stock=$qte;
		$tab[]=$prod;
	}
	include('vue.php');
}

function inc(){
	$_SESSION['panier'][Form::get('id')]++;
	afficher();
}

function dec(){
	if($_SESSION['panier'][Form::get('id')] > 1)
		$_SESSION['panier'][Form::get('id')]--;
	afficher();
}

function supprimer(){
	unset($_SESSION['panier'][Form::get('id')]);
	afficher();
}

function traitement(){
	//tPanier
	$panier=new Panier();
	$panier->Creer($_SESSION['user']->login);
	Site::debug($panier);
	$insert=$panier->Enregistrer();
	//Trigger tCommande déclenché	
	
	//tContient
	$c=new Contient();
	foreach($_SESSION['panier'] as $id=>$qte){
		$prod=Produit::ChercherParId($id);
		$c->Creer($id,$insert,$qte,$prod->prixDeBase);
		Site::debug($c);
		$c->Enregistrer();
	}

	
}

?>
