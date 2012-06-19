<?php

switch(Form::get('action'))
{
	case 'Login':  
		login_traitement();
		break;
	case 'Deconnect' : 
		Session::fermer(); 
		Site::message_info("Vous êtes déconnecté");
		Site::redirect("index.php");
		break;
	default:

		if(Session::ouverte())
		{
			echo "<p><a href='?module=login&action=Deconnect'>Déconnexion</a></p>";
		}
		else
		{
print <<<ENDFORM
		<form action='?module=login&action=Login' method='post' class='login'>
			<input type='text' name='Login' title='Login de connexion'>
			<input type='password' name='Pass' title='Mot de passe'>
			<input type='submit' value='Connexion'>
		</form>
ENDFORM;
		}
}

function login_traitement()
{
	if(Site::messages())
		Site::liste_message();
		
	//$user=Client::Connection(DB::ProtectData(Form::get('Login')),DB::ProtectData(Form::get('Pass')));
	$user=true;
	
	if(false){
		Site::message_info("Mot de passe ou login invalide");
	}
	else
	{
		Session::ouvrir($user);
		Site::message_info("Vous êtes connecté");
		Site::redirect("index.php");
	}
}

?>
