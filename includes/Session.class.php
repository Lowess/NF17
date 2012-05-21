<?php
session_set_cookie_params("0",dirname($_SERVER["SCRIPT_NAME"]));
session_start();
Session::restaurer();
 
class Session
{
 
	public static $user;
 
	function ouverte()
	{
		return isset($_SESSION['user']);
	}
 
	function ouvrir($user)
	{
		$_SESSION['user']=$user;
		self::restaurer();
	}
	function fermer()
	{
		unset($_SESSION['user']);
	}
	function restaurer()
	{
		if(self::ouverte())
		{
			self::$user=$_SESSION['user'];	
		}
 
	}
	function info()
	{
		print (self::$user->login);
	}
}
?>
