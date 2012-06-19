<fieldset>
	<legend>Critères de recherche</legend>
		<form action='?module=Commande&action=recherche' id="recherche" method='post' class='form_recherche'>

		<label>Id Panier</label>
		<input id="rech_idPanier" name='rech_idPanier' type='text'>
	
		<label>Id Tournée</label>
		<input id="rech_idTournee" name='rech_idTournee' type='text'>
		
		<label>Etat</label>
		<select id='rech_etatCmd' name='rech_etatCmd'>
			<option value='0'>---------</option>
			<option value='en preparation'>En préparation</option>
			<option value='disponible'>Disponible</option>
			<option value='traitee'>Traitée</option>
		</select>
		
		<p class="endform">
			<input type="hidden" value=1 name="rech_etat">
			<a href='?module=Produit'><input type="reset" value="Réinitialiser" class="btn"></a>
			<input type="submit" value="Rechercher" class="btn">
		</p>
		</form>
</fieldset>

