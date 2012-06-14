<?php

 	
if ($_SERVER['SERVER_ADDR'] == '127.0.0.1') {
//données pour la connexion à la base de données local
    define("DB_HOST","127.0.0.1");
	define("DB_USER","supermarche");
	define("DB_PASS","supermarche");
	define("BASE","supermarche");

    //affiche toutes les erreurs et warnings PHP en local
    error_reporting(E_ALL);
} else {
	//données pour la connexion à la base de données en prod
	define("DB_HOST","");
	define("DB_USER","");
	define("DB_PASS","");
	define("BASE","");

    //affiche aucune erreur ou warning PHP en production
    error_reporting(0);
}


define('DEBUG',0);

define('CLASSES',dirname($_SERVER["SCRIPT_FILENAME"])."/classes/");
define('SCRIPTS',dirname($_SERVER["SCRIPT_FILENAME"])."/scripts/");

$_SESSION['GLOBAL_CATEGORIE']=array(	1 => "Produits laitiers et similaires",
										2 => "Matières grasses et huiles",
										3 => "Glaces de consommation",
										4 => "Fruits et légumes",
										5 => "Confiserie",
										6 => "Céréales et produits à base de céréales",
										7 => "Produits de boulangerie",
										8 => "Viande et produits carnés, volaille et gibier inclus",
										9 => "Poisson et produits de la pêche",
										10 => "Oeufs et produits à base d => oeufs",
										11 => "Édulcorants",
										12 => "Sels, épices, potages, sauces, salades",
										13 => "Aliments destinés à une alimentation particulière",
										14 => "Boissons",
										15 => "Autres"
								);

?>

