<form  enctype="multipart/form-data" name="inscription" action="?module=Client&action=valide" method="POST">
	<fieldset>
		
		<?php if (!isset($Cli)) {
		?>
			<legend>Inscription nouveau utilisateur</legend>
		<?php } else {
		?>
			<legend>Modification compte</legend>
		<?php
		}	
		?>
			<label for="logiN">Nom de login :</label>
			<input name="logiN" type="text" id="logiN" value="<?php if (isset($Cli)) echo $Cli->login; ?>">
			
			<label for="mdp">Mot de passe :</label>
			<input name="mdp" type="password" id="mdp" value="<?php if (isset($Cli)) echo $Cli->mdp;?>">
			
			<label for="nom">Nom :</label>
			<input name="nom" type="text" id="nom" value="<?php if (isset($Cli)) echo $Cli->nom;?>">
			
			<label for="prenom">Prénom :</label>
			<input name="prenom" type="text" id="prenom" value="<?php if (isset($Cli)) echo $Cli->prenom;?>">
			
			<label for="adresse">Adresse :</label>
			<input name="adresse" type="text" id="adresse" value="<?php if (isset($Cli)) echo $Cli->adresse;?>">
			
			<label for="age">Age :</label>
			<input name="age" type="text" id="age" value="<?php if (isset($Cli)) echo $Cli->age;?>">
			
		<p>
			<div class="bloc_inscrip">
			<input  type="reset" name="reset" value="Reset"/>
			<input  type="submit" name="valider" value="Valider"/>	
			</div>
		</p>
		
	</fieldset>			
</form>	 
