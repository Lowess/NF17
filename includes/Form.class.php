<?php

Form::stocker();


class Form{
 
	/*
	* supprime les variables de formulaires stockées en SESSION
	*/
	function vider(){
		unset($_SESSION["var_formulaires"]);
	}
	 
	/*
	* stocke les variables GET POST dans la session
	* $tab = tableau de variables à stocker, par défaut : GET et POST
	*/
	function stocker($tab=NULL)
	{
		if($tab==NULL)
			$tab=$_REQUEST;
		$_SESSION["var_formulaires"]=$tab;
	}
	 
	/*
	* recupère une variable de formulaire
	* $variable : nom de la variable
	* retourne "" si la variable n'existe pas
	*/
	function get($variable){
		if(!empty($_SESSION['var_formulaires'][$variable]))
			return  htmlentities(($_SESSION['var_formulaires'][$variable]),ENT_QUOTES,'UTF-8');
		else
			return "";
	 
	 
	}
 
}
