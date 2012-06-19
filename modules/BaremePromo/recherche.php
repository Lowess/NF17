<fieldset>
	<legend>Critères de recherche</legend>
		<form action='?module=BaremePromo&action=recherche' id="recherche" method='post' class='form_recherche'>

		<label>Nom</label>
		<input id="rech_nom" name='rech_nom' type='text'>
	
		<label>Categorie</label>
		<select id='rech_categorie' name='rech_categorie'>
			<option value='0'>---------</option>
			<option value='1'>Produits laitiers et similaires</option>
			<option value='2'>Matières grasses et huiles</option>
			<option value='3'>Glaces de consommation</option>
			<option value='4'>Fruits et légumes</option>
			<option value='5'>Confiserie</option>
			<option value='6'>Céréales et produits à base de céréales</option>
			<option value='7'>Produits de boulangerie</option>
			<option value='8'>Viande et produits carnés, volaille et gibier inclus</option>
			<option value='9'>Poisson et produits de la pêche</option>
			<option value='10'>Oeufs et produits à base d'oeufs</option>
			<option value='11'>Édulcorants</option>
			<option value='12'>Sels, épices, potages, sauces, salades</option>
			<option value='13'>Aliments destinés à une alimentation particulière</option>
			<option value='14'>Boissons</option>
			<option value='15'>Autres</option>
		</select>
		
		
		<label>Rayon</label>
		<select id='rech_idRayon' name='rech_idRayon'>
			<?php
				foreach($lr as $l=>$r){
					echo"<option value='{$r->theme}'>{$r->theme}</option>";
				}
			?>
		</select>    
		<p class="endform">
			<input type="hidden" value=1 name="rech_etat">
			<a href='?module=BaremePromo'><input type="reset" value="Réinitialiser" class="btn"></a>
			<input type="submit" value="Rechercher" class="btn">
		</p>
		</form>
</fieldset>

