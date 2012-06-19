<?php

Class Controller{

	public static $_content_="";

	function load_content(){
	
		
		//bufferisation de la sortie : mise en attente de l'affichage
		ob_start();

		//vérifie si un paramètre de module est passé, sinon : défaut
		$module= isset ($_GET['module']) ? $_GET['module'] : 'default';	
		
		//inclue le module en question
		if($module!='default' and file_exists("modules/$module/module.php"))
			require("modules/$module/module.php");
		else
			require("modules/default/module.php");
		
			

		//récupère l'affichage
		self::$_content_=ob_get_contents();


		//stoppe la bufferisation, efface le buffer
		ob_end_clean();
	}	
	
	
	function get_content(){
		echo self::$_content_;	
	}	

}

?>
