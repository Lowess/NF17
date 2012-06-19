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
			<a href="?module=ResponsableMarketing">Accès Responsable Marketing</a><br />
			<a href="?module=ResponsableCatalogue">Accès Responsable Catalogue</a><br />
			<a href="?module=ResponsableLivraison">Accès Responsable Livraison</a><br />
		</div>
		
		<div id='menu'>
			<div id='login'>
				<!-- Espace connection -->
				<?php require_once('modules/Login/module.php');?>		
				<?php 
					// afficher le menu en fonction du type personne
					// le client ne voit aucun menu admistrateur
					if (!isset($_SESSION['user']['client'])) {
						
					}
						
				?>
			</div>
			<div id='liens'>
				Ceci est l'accès aux différents modules<br />
				<a href="?module=Rayon">Rayon</a>
				<a href="?module=Produit">Produits</a>
				<a href="?module=Pannier">Pannier</a>
				<a href="?module=StatistiqueClient">Statistique Client</a>
				<a href="?module=PointFidelite">Gestion points de fidelité</a>
				<a href="?module=BaremePromo">Gestion des Promotions</a>
				<a href="?module=Livreur">Livreur</a>
				<a href="?module=Commande">Commande</a>
				<a href="">Pannier</a>
			</div>
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
	</body>				
</html>


