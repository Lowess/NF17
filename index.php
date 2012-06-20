<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">	
<?php
header('Content-type:text/html; charset=utf-8');
ini_set('display_errors',1);

require("toolbox/header.php");
require("toolbox/frontcontroller.php");

require_once("includes/Params.ini.php");
require_once("includes/Autoload.php");


Header::set_title("Super marché numérique");
Header::set_favicon("template/default.png");
Controller::load_content();	

?>
<meta http-equiv="X-UA-Compatible" content="IE=7">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<?php echo '<title>'.Header::get_title().'</title>'; ?>
		<?php 
			echo '<link rel="icon" type="image/png" href="'.Header::get_favicon().'"/>'; 
			header('X-Frame-Options: GOFORIT'); 
		?>
		<!-- Css -->
		<link rel="stylesheet" type="text/css" href="css/style.css" />

		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	
	</head>
	<body>

		<div id='header'>
		<?php 
		// si c'est le client
		// le client ne voit aucun menu admistrateur
		if (!isset($_SESSION['user']) || (isset($_SESSION['user']) && $_SESSION['user']->type != 'client')) {
		?>
			<a href="?module=ResponsableMarketing">Accès Responsable Marketing</a><br />
			<a href="?module=ResponsableCatalogue">Accès Responsable Catalogue</a><br />
			<a href="?module=ResponsableLivraison">Accès Responsable Livraison</a><br />
		<?php
		}
		?>
		</div>

		<div id='menu'>
			
			<div id='login'>
				<!-- Espace connection -->
				<?php require_once('modules/Login/module.php');?>		
			</div>
			
			<?php 
			/* Afficher le menu en fonction du type personne */
			
			// si c'est le client
			// le client ne voit aucun menu admistrateur
			if (isset($_SESSION['user']) && $_SESSION['user']->type == 'client') {
			?>
				<div id='liens'>
					<a href="?module=Panier">Panier</a>
					<a href="?module=Client&action=modifCompte">Modification compte</a>
				</div>
			<?php
			} else {
                // responsable marketing
                if (isset($_SESSION['user']) && $_SESSION['user']->type == 'responsableMarketing') {
            ?>
                <div id='liens'>
                    Ceci est l'accès aux différents modules<br />
                    <a href="?module=StatistiqueClient">Statistique Client</a>
                    <a href="?module=PointFidelite">Gestion points de fidelité</a>
                    <a href="?module=BaremePromo">Gestion des Promotions</a>

                </div>
            <?php
                // responsable catalogue
                } else if( isset($_SESSION['user']) && $_SESSION['user']->type == 'responsableCatalogue') {
            ?>
                <div id='liens'>
                    Ceci est l'accès aux différents modules<br />
                    <a href="?module=Rayon">Rayon</a>
                    <a href="?module=Produit">Produits</a>
                </div>
            <?php
                // responsable livraison
                } else if (isset($_SESSION['user']) && $_SESSION['user']->type == 'responsableLivraison') {
            ?>
                <div id='liens'>
                    Ceci est l'accès aux différents modules<br /> 
                    <a href="?module=Commande">Commande</a>
                </div>
            <?php
                } else {
                // cas d'un visiteur
            ?>
                <div id='liens'>
                    <a href="?module=Client&action=newCompte">Inscription</a>
                </div>
            
            <?php
            }
            }
			?>
			
		</div>
		
		<?php
		// Vous êtes déconnecté / connecté 
			if(Site::messages())
				Site::liste_message();
		?>
		<div id='contenu'>
			<?php
				Controller::get_content();
			?>	
		</div>
		<?php
		// Vous êtes déconnecté / connecté 
			if(Site::messages())
				Site::liste_message();
		?>
	</body>				
</html>


