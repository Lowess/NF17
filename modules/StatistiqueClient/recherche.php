<fieldset>
	<legend>Critères de recherche</legend>
		<form action='?module=StatistiqueClient&action=recherche' id="recherche" method='post' class='form_recherche'>

		<label>Nom</label>
		<input id="rech_nom" name='rech_nom' type='text'>
	  
		<p class="endform">
			<input type="hidden" value=1 name="rech_etat">
			<a href='?module=StatistiqueClient'><input type="reset" value="Réinitialiser" class="btn"></a>
			<input type="submit" value="Rechercher" class="btn">
		</p>
		</form>
</fieldset>

