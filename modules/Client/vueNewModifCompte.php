<form  enctype="multipart/form-data" name="inscription" action="?module=Client&action=inscription" method="POST">
	<fieldset>
		
		<?php if (!isset($Cli) {
		?>
			<legend>Inscription</legend>
		<?php } else {
		?>
			<legend>Inscription</legend>
		<?php
		}	
		?>
			<label for="logiN">Nom de login :</label>
			<input name="logiN" type="text" id="logiN" value="<?php if (isset($Cli) echo $Cli->login_client;?>">
			
			<label for="mdp">Mot de passe :</label>
			<input name="mdp" type="text" id="mdp" value="<?php if (isset($Cli) echo $Cli->login_client;?>">
			
			<label for="nom">Nom :</label>
			<input name="nom" type="text" id="nom" value="<?php if (isset($Cli) echo $Cli->login_client;?>">
			
			<label for="prenom">Prénom :</label>
			<input name="prenom" type="text" id="prenom" value="<?php if (isset($Cli) echo $Cli->login_client;?>">
			
			<label for="adresse">Adresse :</label>
			<input name="adresse" type="text" id="adresse" value="<?php if (isset($Cli) echo $Cli->login_client;?>">
			
			<label for="age">Age :</label>
			<input name="age" type="text" id="age" value="<?php if (isset($Cli) echo $Cli->login_client;?>">
			
		<p>
			<div class="bloc_inscrip">
			<input  type="reset" name="reset" value="Reset"/>
			<input  type="submit" name="valider" value="Valider"/>	
			</div>
		</p>
		
	</fieldset>			
</form>	 
