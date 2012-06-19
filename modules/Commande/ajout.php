<br /><a href='?module=Commande#table'><img src='template/retour.png' /> Retour à la liste des commandes</a> 

<fieldset class="clear">
	<legend>Formulaire d'ajout ou de modification d'une commande</legend>
	
	<form enctype="multipart/form-data" action='?module=Commande&action=valide' method='post' class='form_ajout'>
		
			<input type='hidden' id='idPanier' name='idPanier' value="<?php if(isset($c)) echo $c->idPanier; ?>">

			<!--
	    	<label>Id panier</label>
	    	<input type='text' id='idPanier' name='idPanier' disabled="disabled" value="<?php/* if(isset($c)) echo $c->idPanier; */?>">
	
			<label>Date de validation</label>
			<input type='text' id='dateValidation' name='dateValidation' disabled="disabled" value="<?php/* if(isset($c)) echo $c->dateValidation; */?>">
			<input type='hidden' id='dateValidation' name='dateValidation' disabled="disabled" value="<?php/* if(isset($c)) echo $c->dateValidation; */?>">
			-->
			
			<label>Etat</label>
			<select id='etat' name='etat'>
				<option value='en preparation' <?php if($c->etatCmd=='en preparation') echo "selected=selected"; ?> >En préparation</option>
				<option value='disponible' <?php if($c->etatCmd=='disponible') echo "selected=selected"; ?> >Disponible</option>
				<option value='traitee' <?php if($c->etatCmd=='traitee') echo "selected=selected"; ?> >Traitée</option>
			</select>
			<!--
			<label>Heure Livraison (ex 14:24:03) </label>
			<input type='text' id='heureLivraison' name='heureLivraison' disabled="disabled" value="<?php/* if(isset($c)) echo $c->heureLivraison; */?>">

			<label>Lieu livraison</label>
			<input type='text' id='lieuLivraison' name='lieuLivraison' disabled="disabled" value="<?php/* if(isset($c)) echo $c->lieuLivraison; */?>">
			
			<label>Id tournée</label>
			<input type='text' id='idTournee' name='idTournee' disabled="disabled" value="<?php/* if(isset($c)) echo $c->idTournee; */?>">
			-->
			<div class="endform">
				<a href="?module=Commande" style="text-decoration:none"><input type='reset' value='Annuler' class='valider'></a>
				<input class='valider' type='submit' value='Valider'>
			</div>
	</form>
</fieldset>


