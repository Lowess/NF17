<?php
session_set_cookie_params("0",dirname($_SERVER["SCRIPT_NAME"]));
session_start();
Session::restaurer();
 
class Session
{
 
	public static $user;
	public static $panier;
 
	function ouverte() {
		return (isset($_SESSION['user']) && isset($_SESSION['panier']));
	}
 
	function ouvrir($user, $panier=array())
	{
		$_SESSION['user']=$user;
		$_SESSION['panier']=$panier;
		self::restaurer();
	}
	function fermer()
	{
		unset($_SESSION['user']);
		unset($_SESSION['panier']);
	}
	
	function restaurer()
	{
		if(self::ouverte())
		{
			self::$user=$_SESSION['user'];	
			self::$panier=$_SESSION['panier'];	
		}
 
	}
	function info()
	{
		print (self::$user->login);
	}
}
?>
