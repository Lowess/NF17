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

?>

