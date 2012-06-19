<?php
 
define("ALERTE",1);
define("ERREUR",2);
define("OK",4);
define("INFO",8);

$_SESSION['PREV_URL']="";

if(isset($_SESSION['CUR_URL'])&&$_SESSION['PREV_URL']!=Form::get('module')) 
	$_SESSION['PREV_URL']=$_SESSION['CUR_URL'];

$_SESSION['CUR_URL']=Form::get('module');

	
class Site{
		/**
		* affiche la trace d'exécution courante
		*
		* $backtrace : retour d'un debug_backtrace lors de l'appel à debug
		* si NULL, inclus l'appel de debug dans la trace d'exécution
		*/
		function trace($backtrace)
		{
			$chaine='';
			if($backtrace)
				$trace=array_reverse($backtrace);
			else
				$trace=array_reverse(debug_backtrace());
			$fonction=NULL;
			$decalage='';
			foreach($trace as $appel)
			{
				$chaine.= $decalage.$appel['file'].', ligne '.$appel['line'];
				if($fonction)
				{
					$chaine.=" : $fonction()\n";
					$decalage="  ".$decalage;
				}
				else
				{
					$decalage="  +--";
					$chaine.= "\n";
				}
				$fonction=$appel['function'];
			}
			return $chaine;
		}


		//envoie un header de redirection au navigateur
		//et quitte le script
		function redirect($url)
		{
			header("Location: $url");
			exit();
		}
		
		function page_precedente()
		{	
			self::redirect("?module=".$_SESSION['PREV_URL']);
		}		
		
		 		 
		/*
		* affiche les éventuels messages d'infos stockés
		* et les supprime
		*/
		function liste_message()
		{

			if(empty($_SESSION["messages"]))
				return;
			
				
			foreach($_SESSION["messages"] as $message=>$type)
			{
				self::message($message,$type);
			}
			self::effacer_message_info();
		}
		 
		 
		/**
		* 
		*/
		function messages()
		{
			if(isset($_SESSION["messages"]))
				return true;
			else
				return false;
		}
		
		function message_info($message,$type=INFO)
		{
			$_SESSION["messages"][$message]=$type;
		}
		 
		/**
		* 
		*/
		function effacer_message_info()
		{
			unset($_SESSION["messages"]);
		}
		 
		
		
		/**
		* affiche un message de debug, avec la trace d'exécution
		*
		* $message : chaine, tableau, etc...
		*/
		function debug($message)
		{
			echo "<pre class='debug'>";
			echo "<b>";
			print_r($message);
			echo "</b>\n";
			echo self::trace(debug_backtrace()); 
			echo "</pre>";
		}
		 
		/**
		* affiche un message utilisateur
		*
		* $message : message affiché
		* $type : type du message (défaut INFO)
		*/
		function message($message, $type=INFO)
		{ 
			switch($type)
			{
				case INFO: 
					$class='info';
					$img='<img src="template/information.png"/>';
					break;
				case ERREUR: 
					$class='erreur';
					$img='<img src="template/error.png"/>';
					break;
				case OK: 
					$class='ok';
					$img='<img src="template/check.png"/>';
					break;
				case ALERTE: 
					$class='alerte';
					break;
				default:$class='info';
			}
		 
			print <<< ENDOFMESSAGE
		 
				<div id='zonemessage'>
					<p class='$class'>$img $message</p>
				</div>
		 
ENDOFMESSAGE;
		}
		
}
?>
