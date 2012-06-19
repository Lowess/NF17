<?php
 

class DB{
 
	public static $Base;
  
 	//tente la connexion sur le SGBD, en utilisant des constantes définies
	function Init()
	{
		$connectionString="host=".DB_HOST." port=5432 dbname=".BASE." user=".DB_USER." password=".DB_PASS;
		self::$Base=pg_connect($connectionString);
		if(pg_last_error()>0)
		{
			Site::message("Impossible d'ouvrir la base",ERREUR);
			Site::message(pg_error());
		}
	}

 	//equiv. pg_query, avec gestion d'erreur
	function Sql($requete)
	{
		if(!self::$Base)
			self::Init();
 
		@pg_query("SET NAMES UTF8");
		$resultat=@pg_query($requete);
 
		if(pg_last_error()>0)
			Site::message("Erreur".pg_error()."'",ERREUR);
		else
			return $resultat;
		return FALSE;
	}
	
	//retourne directement les enregistrements de la requte sous la forme d'un tableau asociatif
	function SqlToArray($requete)
	{
		$res=self::Sql($requete);
		$tab=array();
		while($row=pg_fetch_assoc($res))
		{
			$tab[]=str_replace("&quot;", "", $row);
		}
		return $tab;	
	}

	function ProtectData($data)
	{
		if(!self::$Base)
			self::Init();
		
		@pg_query("SET NAMES UTF8");
		//Strip_tags supprime toutes balise php et html
		//$resultat=@pg_real_escape_string(strip_tags($data));
		
		$resultat=@pg_real_escape_string(strip_tags($data));
 
		if(pg_last_error()>0)
			Site::message("Impossible d'executer la requète: '".pg_error()."'",ERREUR);
		else
			return $resultat;
		return FALSE;
	}
}
